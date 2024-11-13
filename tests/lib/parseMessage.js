const luainjs = require('lua-in-js')
const path = require('path');
const fs = require('fs');
const { argv0, argv } = require('process');
const { unescape } = require('querystring');

const luaEnv = luainjs.createEnv({
    fileExists: (ad) => {
        return fs.existsSync(path.join(__dirname, ad));
    },
    loadFile: (ad) => {
        return fs.readFileSync(path.join(__dirname, ad)).toString();
    }
})

// lfg string argv[1]
let lfgMessage = "";
if (argv.length > 1) {
    lfgMessage = argv[2]
}


luaEnv.parseFile('../../_urlencode.lua').exec()
luaEnv.parseFile('../../ParseMessage.lua').exec()

/**
 * Attempt to parse the chat message to get matching dungeons
 * Will call lua method
 * @param {string} message 
 * @returns 
 */
function parseMessage(message) {

    // Will call parseMessage and then "serialize" matches and dungeons into querystrings
    // Then we use javascript to parse them into json objects
    const luaScript = luaEnv.parse(`
        local ja = ParseMessage('${message}', nil)
        
        local result = ""

        local dungeonIndexes = {}

        for _, xa in pairs (ja) do
            local qline = ""
            for b, c in pairs (xa) do
                if (c) then
                    qline = qline .. "&" .. urlencode(b) .. "=" .. urlencode(tostring(c))
                end
            end

            if (xa.dungeonIndex) then
                table.insert(dungeonIndexes, xa.dungeonIndex)
            end
            if (qline) then
                result = result .. "match|" .. qline .. '\\n'
            end
        end

        for _, dungeonIndex in pairs (dungeonIndexes) do
            local dungeon = "dungeon|dungeonIndex=" .. tostring(dungeonIndex)

            dungeon = dungeon .. "&name=" .. urlencode(dungeons[dungeonIndex].Name)
            dungeon = dungeon .. "&minRLevel=" .. urlencode(tostring(dungeons[dungeonIndex].MinRLevel))
            dungeon = dungeon .. "&minRLevel=" .. urlencode(tostring(dungeons[dungeonIndex].MinRLevel))
            dungeon = dungeon .. "&id=" .. urlencode(tostring(dungeons[dungeonIndex].Id))
            dungeon = dungeon .. "&minLevel=" .. urlencode(tostring(dungeons[dungeonIndex].MinLevel))
            dungeon = dungeon .. "&maxLevel=" .. urlencode(tostring(dungeons[dungeonIndex].MaxLevel))

            --print(dungeon)
            result = result .. dungeon .. "\\n"
        end

        return result
    `)
    const returnValue = luaScript.exec()
    // console.log(returnValue);

    let o = {
        dungeons: [],
        matches: []
    }
    returnValue.split('\n').forEach(line => {

        const pa = line.split('|', 2)

        if (pa[0] == 'match') {
            o.matches.push(extractQuerystringValues(pa[1]));
        } else if (pa[0] == 'dungeon') {
            o.dungeons.push(extractQuerystringValues(pa[1]));
        }


    })

    return o;
}

function extractQuerystringValues(querystring) {
    if (!querystring || querystring.indexOf('=') === -1) {
        return {};
    }

    const keyValueCollection = querystring.split('&');
    const queryStringObject = {};
    keyValueCollection.forEach(keyValueString => {
        const keyAndValue = keyValueString.split('=', 2);
        if (keyAndValue.length > 1) {
        const val = keyAndValue.length > 1 ? decodeURIComponent(keyAndValue[1].replace(/\+/g, ' ')) : null
        queryStringObject[keyAndValue[0]] = val;
        }
    });
    return queryStringObject;
}

module.exports = parseMessage;
