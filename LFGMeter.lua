if not LFGMeterDb then
    LFGMeterDb = {}
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGOUT")

frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "HaveWeMet" then
        if not LFGMeterDb['loadCount'] then
            LFGMeterDb['loadCount'] = 0
        end       
        LFGMeterDb['loadCount'] = LFGMeterDb['loadCount'] + 1

    elseif event == "PLAYER_LOGOUT" then
            -- Save the time at which the character logs out
            -- HaveWeMetLastSeen = time()
    end
end)

print("LFGMeter successfully loaded!")

local mainFrame = CreateFrame("ScrollingMessageFrame", "LFGMeterMainFrame", UIParent, "BasicFrameTemplateWithInset")
mainFrame:SetSize(250, 350)
mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
mainFrame.TitleBg:SetHeight(30)
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("TOPLEFT", mainFrame.TitleBg, "TOPLEFT", 5, -3)
mainFrame.title:SetText("LFGMeter")

mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetResizable(true)

-- mainFrame:SetMinResize(259,200)
-- mainFrame:SetMaxResize(800,500)
mainFrame:SetScript("OnDragStart", function(self)
	self:StartMoving()
end)
mainFrame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
end)

mainFrame:SetScript("OnShow", function()
        PlaySound(808)
end)

mainFrame:SetScript("OnHide", function()
        PlaySound(808)
end)

local br = CreateFrame("Button", nil, mainFrame)
br:EnableMouse(true)
br:SetPoint("BOTTOMRIGHT")
br:SetSize(16,16)
br:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
br:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
br:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
br:SetScript("OnMouseDown", function(self)
	self:GetParent():StartSizing("BOTTOMRIGHT") 
end)
br:SetScript("OnMouseUp", function(self)
	self:GetParent():StopMovingOrSizing("BOTTOMRIGHT")
end)


SLASH_LFGMETER1 = "/lfgmeter"
SLASH_LFGMETER2 = "/lfgmt"
SlashCmdList["LFGMETER"] = function(command)
    if (command) then 
        ParseMessage(command)
    else
        if mainFrame:IsShown() then
            mainFrame:Hide()
        else
            mainFrame:Show()
        end
    end

    -- C_FriendList.SendWho('Nyckelben')
    
    -- local ct = C_FriendList.GetNumWhoResults()
    -- print(ct)
    -- if (ct > 0) then
    --     local nfo = C_FriendList.GetWhoInfo(0)
    --         print( nfo.fullName .. " - " .. nfo.level)
    --     end
    
end



-- SLASH_LFGMETER2 = "/lfgmt"
-- SlashCmdList["LFGMETER_TEST"] = function(message)
--     ParseMessage(message)
-- end

mainFrame.playerName = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
--mainFrame.playerName:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, -35)
--mainFrame.playerName:SetText("Character: " .. UnitName("player") .. " (Level " .. UnitLevel("player") .. ")")


local lfgList = {}
local uiItems = {}

-- local abbrs = {}
-- abbrs['WC'] = dungeons.WailingCaverns;

local eventListenerFrame = CreateFrame("Frame", "MyAddonEventListenerFrame")

eventListenerFrame:RegisterEvent("CHAT_MSG_GUILD")
eventListenerFrame:RegisterEvent("CHAT_MSG_OFFICER")
eventListenerFrame:RegisterEvent("CHAT_MSG_PARTY")
eventListenerFrame:RegisterEvent("CHAT_MSG_RAID_LEADER")
eventListenerFrame:RegisterEvent("CHAT_MSG_RAID")
eventListenerFrame:RegisterEvent("CHAT_MSG_WHISPER")
eventListenerFrame:RegisterEvent("CHAT_MSG_BN_WHISPER")
eventListenerFrame:RegisterEvent("CHAT_MSG_CHANNEL")
eventListenerFrame:RegisterEvent("CHAT_MSG_SAY")
eventListenerFrame:SetScript("OnEvent", function(self, event, ...)
    local args = { ... }
    if not LFGMeterDb['loadCount'] then
        LFGMeterDb['loadCount'] = 1
    else
        LFGMeterDb['loadCount'] = LFGMeterDb['loadCount'] + 1
    end

    local localizedClass, englishClass, localizedRace, englishRace, sex, name, realm = GetPlayerInfoByGUID(args[12])

    local channel = args[4]
    local name = args[5]
local message = args [1]

i, j = string.find(message, 'LF[MG] ')
    if (not i ~= nil) then
        
        local matches = ParseMessage(message,args[12])
        -- print("lfg" .. Tablelength(dungeons))
        if (table.getn(matches) == 1) then

            if (not lfgList[matches[1].playerName]) then
               -- print('new')
                lfgList[matches[1].playerName] = {
                    dungeon = matches[1].dungeon,
                    playerClass = matches[1].playerClass,
                    playerName = matches[1].playerName,
                    messageCount = 1,
                    dungeonIndex = matches[1].dungeonIndex,
                    difficulty = GetDungeonDifficulty(dungeons[matches[1].dungeonIndex]),
                    firstMessage = time(),
                    lastMessage = time()
                }
            else
                if (lfgList[matches[1].playerName].dungeon == matches[1].dungeon) then
                    lfgList[matches[1].playerName].messageCount = lfgList[matches[1].playerName].messageCount + 1
                    lfgList[matches[1].playerName].lastMessage = time()
                else
                    lfgList[matches[1].playerName].messageCount = 1
                    lfgList[matches[1].playerName].dungeon = matches[1].dungeon
                    lfgList[matches[1].playerName].firstMessage = time()
                    lfgList[matches[1].playerName].lastMessage = time()

                end
            end

            lfgList[matches[1].playerName].message = message

            local soso = {}

            for xa in pairs (lfgList) do
                --print(">>" .. xa .. "[".. lfgList[xa].messageCount .."] " .. lfgList[xa].dungeon )
                table.insert(soso, lfgList[xa])
             end


            --  for key, val in pairs (soso) do
            --     print("yyyy ", key, soso[key].playerName)
            --  end

            

            table.sort(soso, function (pipe1, pipe2)
                if (pipe1.difficulty < pipe2.difficulty) then
                    return true
                elseif (pipe1.difficulty > pipe2.difficulty) then
                    return false
                end

                local ago1 = time() - pipe1.lastMessage
                local ago2 = time() - pipe2.lastMessage

                return ago1 < ago2
            end)

            --print("AHA " .. matches[1].playerName .. " - " .. lfgList[matches[1].playerName].dungeon .. " - " .. lfgList[matches[1].playerName].messageCount .. ": " .. message)
            local top = -35

            if (Tablelength(uiItems) > 0) then
               -- print("REMOVE OLD ITEMS")
                for xa in pairs (uiItems) do
--                    print('remove', xa, uiItems[xa]:SetText("."))
                    uiItems[xa]:SetText(".")
                    uiItems[xa]:Hide()
                end

            end

            local uii = 1
            local max = 10

            for _, xa in pairs (soso) do

                local item = nil
                if (uiItems[uii]) then
                    item = uiItems[uii]
                else
                    item = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                    item:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, top  )
                    uiItems[uii] = item
                end

                local defaultAlpha = 1
                local dimAfter = 120
                local shadowAfter = 260
                local hideAfter = 300

                if (dungeons[xa.dungeonIndex].difficulty == 2) then
                    defaultAlpha = 0.8
                    dimAfter = 30
                    shadowAfter = 60
                end

                
                local ago = time() - xa.lastMessage


                top = top + (item:GetHeight() * -1) - 2

                if (ago > 100) then
                    item:Hide()
                end 

                --local item = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                --item:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, top  )
                --item:SetText(xa.playerName)
                
                local l = "\124cffffff00" .. "|Hplayer:"..xa.playerName.."-"..realm.."|h[" .. xa.playerName .. "]|h\124r"


                item:SetText( tostring(ago) .. " - [" .. xa.playerName .. "] " .. ColorByLevelRange(dungeons[xa.dungeonIndex], xa.dungeon) .. ": " .. string.sub(xa.message, 1, 25))
                item:SetScript("OnMouseDown", function (self, button)
                    if button=='LeftButton' then
                        DEFAULT_CHAT_FRAME:AddMessage(l .. " " .. xa.message);
                        DEFAULT_CHAT_FRAME:AddMessage(" └ Dungeon: " .. ColorByLevelRange(dungeons[xa.dungeonIndex], xa.dungeon) .. " ("..dungeons[xa.dungeonIndex].MinRLevel.."-"..dungeons[xa.dungeonIndex].MaxRLevel .. ")");
                    end --├─
                end)

             

                if (ago > shadowAfter) then
                    item:SetAlpha(0.5)
                elseif (ago > dimAfter) then
                    item:SetAlpha(0.75)
                else
                    item:SetAlpha(defaultAlpha)
                end
                
                item:Show()

              --  table.delete(xa)
--                print( tostring(xa.difficulty) .. "/" .. tostring(ago) .. "  [" .. xa.playerName .. "] | " .. " " ..  ColorByLevelRange(dungeons[xa.dungeonIndex], xa.dungeon)  .. ": " .. string.sub(xa.message, 0, 25) )

                uii = uii + 1

                if (uii == max) then
                    break
                end

                    
                

                --mainFrame.playerName:SetText("Character: " .. UnitName("player") .. " (Level " .. UnitLevel("player") .. ")\nost")
             --   top = top - 15
             end
            -- table.sort(lfgList, SortingFunction)

            
        end

       -- mainFrame.playerName:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, -35)
       -- mainFrame.playerName:SetText("Character: " .. UnitName("player") .. " (Level " .. UnitLevel("player") .. ")")

        

    end

    local unitLevel = UnitLevel(args[12])

	--mainFrame.playerName:SetText(localizedClass  .. tostring(unitLevel) .. " " .. tostring(LFGMeterDb['loadCount']) .. " (Level " .. message  .. ")")
end)



function Tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
 end


function GetDungeonDifficulty(dungeon)
    local diffMinR = UnitLevel("player") - dungeon.MinRLevel
    local diffMaxR = UnitLevel("player") - dungeon.MaxRLevel

    local ccolor = GetQuestDifficultyColor(dungeon.MinRLevel)

    if (ccolor.r == 0.25 and ccolor.g == 0.75 and ccolor.b == 0.25) then
        return 0 -- green
    elseif (ccolor.r == 1 and ccolor.g == 1 and ccolor.b == 0) then
        return 1 -- yelllow
    elseif (ccolor.r == 1 and ccolor.g == 0.1 and ccolor.b == 0.1) then
        return 2 --red
    elseif (ccolor.r == 0.5 and ccolor.g == 0.5 and ccolor.b == 0.5) then
        return -1
    end

    return -5 -- unknown
end

local function RGBToHex(r, g, b)
	r = r <= 255 and r >= 0 and r or 0
	g = g <= 255 and g >= 0 and g or 0
	b = b <= 255 and b >= 0 and b or 0
	return string.format("%02x%02x%02x", r, g, b)
end

function ColorByLevelRange(dungeon, text)

    local diffMinR = UnitLevel("player") - dungeon.MinRLevel
    local colorCode = ""
    local ccolor = GetQuestDifficultyColor(dungeon.MinRLevel)

--    print("C", ccolor.r, ccolor.g, ccolor.b)
    -- green 0.25  0.75   0.25

    -- trivial - 0.5 0.5 0.5
    -- red 1 0.1 0.1 == super hard
    -- 1 1 0 - yellow. Doable

    local hexColor = RGBToHex(ccolor.r * 255, ccolor.g * 255, ccolor.b * 255)

    colorCode = "\124cff" .. hexColor

    return colorCode .. text .. "\124r\124cffffffff"

end

--LFM "COIN RUN" [Stratholme+Scholo]
--LFG Heal SM

