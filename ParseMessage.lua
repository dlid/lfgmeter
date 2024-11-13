
 dungeons = {}
 dungeonAbbrevations = {}
local i = 1

dungeons[i] = {
    Id = "RFC",
    Name = "Ragefire Chasm",
    MinRLevel = 13,
    MaxRLevel = 18,
    MinLevel = 8,
    MaxLevel = 20
}
dungeonAbbrevations[i] = { "rfc", "ragefire", "ragefire chasm"}

i = i +1
dungeons[i] = {
    Id = "WC",
    Name = "Wailing Caverns",
    MinRLevel = 17,
    MaxRLevel = 24,
    MinLevel = 15,
    MaxLevel = 24
}
dungeonAbbrevations[i] = { "wc", "wailingcaverns", "wailing caverns"}

i = i +1
dungeons[i] = {
    Id = "VC",
    Name = "The Deadmines",
    MinRLevel = 18,
    MaxRLevel = 23,
    MinLevel = 10,
    MaxLevel = 25,
    NotIf = { "wing", "wings", "west", "east", "north", "south" }
}
dungeonAbbrevations[i] = { "dm", "vc", "deadmines"}

i = i +1
dungeons[i] = {
    Id = "SFK",
    Name = "Shadowfang Keep",
    MinRLevel = 22,
    MaxRLevel = 30,
    MinLevel = 14,
    MaxLevel = 30
}
dungeonAbbrevations[i] = { "sfk", "shadowfang"}

i = i +1
dungeons[i] = {
    Id = "BFD",
    Name = "Blackfathom Deeps",
    MinRLevel = 20,
    MaxRLevel = 30,
    MinLevel = 15,
    MaxLevel = 30
}
dungeonAbbrevations[i] = { "bfd"}

i = i +1
dungeons[i] = {
    Id = "STOCKADE",
    Name = "The Stockade",
    MinRLevel = 22,
    MaxRLevel = 30,
    MinLevel = 15,
    MaxLevel = 30
}
dungeonAbbrevations[i] = { "stockade", "stockades"}

i = i +1
dungeons[i] = {
    Id = "GNOMER",
    Name = "Gnomeregan",
    MinRLevel = 29,
    MaxRLevel = 38,
    MinLevel = 19,
    MaxLevel = 49
}
dungeonAbbrevations[i] = { "gnomer", "gnome", "gnomeregan"}

i = i +1
dungeons[i] = {
    Id = "RFK",
    Name = "Razorfen Kraul",
    MinRLevel = 30,
    MaxRLevel = 40,
    MinLevel = 20,
    MaxLevel = 40
}
dungeonAbbrevations[i] = { "rfk"}

i = i +1
dungeons[i] = {
    Id = "SMGY",
    Name = "Scarlet Monastery: Graveyard",
    MinRLevel = 26,
    MaxRLevel = 36,
    MinLevel = 20,
    MaxLevel = 36,
    ExtraAbbrevations = {
        ["sm"] = {"gy", "grave", "graveyard"}
    }
}
dungeonAbbrevations[i] = { "sm", "sm:gy" }

i = i +1
dungeons[i] = {
    Id = "SMLIB",
    Name = "Scarlet Monastery: Library",
    MinRLevel = 29,
    MaxRLevel = 39,
    MinLevel = 20,
    MaxLevel = 40,
    ExtraAbbrevations = {
        ["sm"] = {"lib", "library"}
    }
}
dungeonAbbrevations[i] = { "sm", "sm:lib" }

i = i +1
dungeons[i] = {
    Id = "SMARMS",
    Name = "Scarlet Monastery: Armory",
    MinRLevel = 32,
    MaxRLevel = 42,
    MinLevel = 20,
    MaxLevel = 44,
    ExtraAbbrevations = {
        ["sm"] = {"arm", "armory", "arms"}
    }
}
dungeonAbbrevations[i] = { "sm", "sm:arm", "sm:armory" }

i = i +1
dungeons[i] = {
    Id = "SMCATH",
    Name = "Scarlet Monastery: Cathedral",
    MinRLevel = 35,
    MaxRLevel = 45,
    MinLevel = 20,
    MaxLevel = 45,
    ExtraAbbrevations = {
        ["sm"] = {"cath", "cathedral", "cat"}
    }
}
dungeonAbbrevations[i] = { "sm", "sm:cath" }

i = i +1
dungeons[i] = {
    Id = "SM",
    Name = "Scarlet Monastery",
    MinRLevel = 35,
    MaxRLevel = 45,
    MinLevel = 20,
    MaxLevel = 45,
    NotIf = {"cath", "arm", "arms", "armory", "cathedral", "library", "lib", "graveyard", "gy", "grave"}
}
dungeonAbbrevations[i] = { "sm", "scarlet monestary" }

i = i +1
dungeons[i] = {
    Id = "RFD",
    Name = "Razorfen Downs",
    MinRLevel = 40,
    MaxRLevel = 50,
    MinLevel = 28,
    MaxLevel = 50
}
dungeonAbbrevations[i] = { "rfd", "razorfen down", "razorfen downs" }

i = i +1
dungeons[i] = {
    Id = "ULDA",
    Name = "Uldaman",
    MinRLevel = 42,
    MaxRLevel = 52,
    MinLevel = 35,
    MaxLevel = 55
}
dungeonAbbrevations[i] = { "ulda", "uldaman", "uldman" }

i = i +1
dungeons[i] = {
    Id = "ZF",
    Name = "Zul'Farrak",
    MinRLevel = 44,
    MaxRLevel = 54,
    MinLevel = 44,
    MaxLevel = 54
}
dungeonAbbrevations[i] = {  "zf", "zulfarrak", "zulfarak"}

i = i +1
dungeons[i] = {
    Id = "MARA",
    Name = "Maraudon",
    MinRLevel = 44,
    MaxRLevel = 55,
    MinLevel = 35,
    MaxLevel = 60
}
dungeonAbbrevations[i] = {  "mara", "maraudon"}

i = i +1
dungeons[i] = {
    Id = "ST",
    Name = "The Temple of Atal'Hakkar",
    Alias = "The sunken temple",
    MinRLevel = 52,
    MaxRLevel = 58,
    MinLevel = 40,
    MaxLevel = 60,
    NotIf = { "%d:%d%d [stST]"  }
}
dungeonAbbrevations[i] = {  "sunken temple", "the sunken template", "temple", "ST"}


i = i +1
dungeons[i] = {
    Id = "BRD",
    Name = "Blackrock Depths",
    MinRLevel = 52,
    MaxRLevel = 60,
    MinLevel = 40,
    MaxLevel = 60,
    ExtraAbbrevations = {
        ["blackrock"] = {"depth", "depths"}
    } 
}
dungeonAbbrevations[i] = {  "brd", "blackrock", "blackrock depths"}

i = i +1
dungeons[i] = {
    Id = "DM",
    Name = "Dire Maul",
    MinRLevel = 54,
    MaxRLevel = 60,
    MinLevel = 52,
    MaxLevel = 60
}
dungeonAbbrevations[i] = {  "dm", "diremaul", "dire maul", "dmt"}

i = i +1
dungeons[i] = {
    Id = "LBRS",
    Name = "Lower Blackrock Spire",
    MinRLevel = 55,
    MaxRLevel = 60,
    MinLevel = 44,
    MaxLevel = 60
}
dungeonAbbrevations[i] = {  "lbrs", "lower blackrock spire", "lower black", "lower blackrock"}

i = i +1
dungeons[i] = {
    Id = "UBRS",
    Name = "Upper Blackrock Spire",
    MinRLevel = 56,
    MaxRLevel = 60,
    MinLevel = 48,
    MaxLevel = 60
}
dungeonAbbrevations[i] = {  "ubrs", "upper blackrock spire", "upper black", "upper blackrock"}

i = i +1
dungeons[i] = {
    Id = "SCHOLO",
    Name = "Scholomance",
    MinRLevel = 58,
    MaxRLevel = 60,
    MinLevel = 48,
    MaxLevel = 60
}
dungeonAbbrevations[i] = {  "scholo", "scholomance"}

i = i +1
dungeons[i] = {
    Id = "STRAT",
    Name = "Stratholme",
    MinRLevel = 58,
    MaxRLevel = 60,
    MinLevel = 48,
    MaxLevel = 60
}
dungeonAbbrevations[i] = {  "stratholme", "strat"}

i = i +1
dungeons[i] = {
    Id = "DFC",
    Name = "Demon Fall Canyon",
    MinRLevel = 58,
    MaxRLevel = 60,
    MinLevel = 48,
    MaxLevel = 60
}
dungeonAbbrevations[i] = {  "dfc", "demonfall", "demon fall", "demon fall canyon"}

i = i +1
dungeons[i] = {
    Id = "ZG",
    Name = "Zul'Gurub",
    MinRLevel = 60,
    MaxRLevel = 60,
    MinLevel = 60,
    MaxLevel = 60
}
dungeonAbbrevations[i] = {  "zg", "zulgurub", "zul gurub"}

i = i +1
dungeons[i] = {
    Id = "MC",
    Name = "The Molten Core",
    MinRLevel = 60,
    MaxRLevel = 60,
    MinLevel = 60,
    MaxLevel = 60
}
dungeonAbbrevations[i] = {  "mc", "molten core", "motlen core", "moltencore"}

--ubs

function Test()
    return 55
end

function ParseMessage(message, playerGuid)

    local matches = {}
    local mindex =1

    --print('[lfgmeter] message:' .. message)

    local alreadyAddedDungeons = ""

    for i, abbrs in ipairs(dungeonAbbrevations) do
        for j, abbr in ipairs(abbrs) do

            local matchIndex = IsMatch(message, abbr)
            if (matchIndex == true) then
                
                local isMatch = true
                local byExtraMatch = nil
                
                if (dungeons[i].ExtraAbbrevations) then
                    for k, abbre in pairs(dungeons[i].ExtraAbbrevations) do
                        if (k == abbr) then
                            isMatch = false
                            for l, abbrex in ipairs(abbre) do
                                if (IsMatch(message:lower(), abbrex)) then
                                    if (isMatch == false) then 
                                        -- print('EXTRA MACTCH ' .. abbrex)
                                        byExtraMatch = abbrex
                                        isMatch = true
                                    end
                                end
                            end
                        end
                    end
                end

                if (dungeons[i].NotIf) then
                    for l, abbrex in ipairs(dungeons[i].NotIf) do
                        if (string.find(message:lower(), abbrex) ~= nil) then
                            isMatch = false
                        end
                        -- if (IsMatch(message, abbrex)) then
                        --     if (isMatch == false) then 
                        --         -- print('EXTRA MACTCH ' .. abbrex)
                        --         byExtraMatch = abbrex
                        --         isMatch = true
                        --     end
                        -- end
                    end
                end

                if (isMatch) then

                    if (not string.find(alreadyAddedDungeons, "[".. tostring(i) .."]")) then
                        local playerName = ""
                        local playerClass = ""
                        if (playerGuid) then
                            local localizedClass, englishClass, localizedRace, englishRace, sex, name, realm = GetPlayerInfoByGUID(playerGuid)
                            player = "[" .. name .. " "..englishClass.."]"
                            playerName = name
                            playerClass = class
                        end
    
                        matches[mindex] = {
                            playerName = playerName,
                            playerClass = playerClass,
                            dungeon = dungeons[i].Name,
                            dungeonIndex = i,
                            dungeonId = dungeons[i].Id
                        }
                        mindex = mindex + 1
                        alreadyAddedDungeons = alreadyAddedDungeons .. "[".. tostring(i) .."]"
                    end

                   

                    --print("[lfgmeter] ".. player .. "\124cff00ff00" .. dungeons[i].Name .. "\124r " .. string.sub(message, 0, 50) .. "..");
                end

                -- local charBefore = "";
                -- local charAfter = "";
                -- -- Check if this was a single word-ish
                -- if matchIndex > 0 then
                --     charBefore = string.sub(message, matchIndex - 1, matchIndex - 1)
                -- end
                -- if matchIndex < strlen(message) then
                --     charAfter = string.sub(message, matchIndex + strlen(abbr), matchIndex + strlen(abbr))
                -- end
                -- print(" beforechar " .. charBefore .. " - " .. tostring(IsAlphaNumerical(charBefore)));
                -- print(" afterchar " .. charAfter .. " - " .. tostring(IsAlphaNumerical(charAfter)));

                -- if this is a match

            end

            --print ("abbr " .. tostring(i) .. "," .. tostring(j) .. " - " .. abbr)
        end
    end

    return matches

end


function IsMatch(haystack, needle) 
    local fullStringMatch = "^" .. needle:lower() .. "$"
    local startOfStringMatch = "^" .. needle:lower() .. "[^%w]"
   local mama = "%W" .. needle:lower() .. "$"
   local mama2 = "%W" .. needle:lower() .. "%W"
    
    if (string.find(haystack:lower(), fullStringMatch) ~= nil) then
       return true
    end
    
    if (string.find(haystack:lower(), startOfStringMatch) ~= nil) then
       return true
    end
    
    if (string.find(haystack:lower(), mama) ~= nil) then
       return true
    end
    
    if (string.find(haystack:lower(), mama2) ~= nil) then
       return true
    end

   return false
end