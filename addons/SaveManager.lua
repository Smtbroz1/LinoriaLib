local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()


local Window = Library:CreateWindow({
    Title = '🐬 SMT|AUTOREJOIN 🌻 ',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main Menu'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)



MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

ThemeManager:SetLibrary(Library)

SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings() 



SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

SaveManager:BuildConfigSection(Tabs['UI Settings']) 

ThemeManager:ApplyToTab(Tabs['UI Settings'])



local RightGroupBox = Tabs.Main:AddRightGroupbox('Other Function')

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('AUTOREJOIN') -- Creating LeftGroupBox
 LeftGroupBox:AddInput('MyTextbox', { -- Adding input box
    Default = '',
    Numeric = false, -- only allows non-numeric input
    Finished = false, -- only calls callback when enter is pressed
    Text = 'Paste jobid',
})

Options.MyTextbox:OnChanged(function()
    print('Text updated. New text:', Options.MyTextbox.Value)
end)

local jobid = tostring(game.JobId)
LeftGroupBox:AddButton('GetJobID', function()  -- Adding a button
setclipboard(game.JobId)
end)



LeftGroupBox:AddToggle('MyToggle', {
    Text = 'autojoin',
    Default = true, -- Default value (true / false)

})





spawn(function()
    while wait do
local TeleportService = game:GetService("TeleportService")
local jobidmain = tostring(game.JobId)
local TargetID = tostring(Options.MyTextbox.Value)
if Toggles.MyToggle.Value == true then do
                    pcall(function()
                        wait(0.3)
                        if game:GetService("Players").LocalPlayer.AlreadyInLobby.Name == "AlreadyInLobby"then
                        if jobidmain ~= TargetID then
                        TeleportService:TeleportToPlaceInstance(8304191830, TargetID)
                        _G.hoppserv = false
                        end
                        end
                    end)
end
end
end
end)

     LeftGroupBox:AddToggle('Autoleave', {
     Text = 'Auto Leave',
     Default = false,
     function(state)
         
         end
})

    spawn(function()
        while wait do
        pcall(function()
        wait(0.5)
	    while wait() do
        if Toggles.Autoleave.Value == true then
        local CheckEnd = game:GetService("Workspace")["_DATA"].GameFinished

                         if CheckEnd.Value == true then do
                            wait(4)
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.teleport_back_to_lobby:InvokeServer()
                         end
                         end
                     end
                 end
             end)
        end
     end)

RightGroupBox:AddToggle('AutoDelete', {
    Text = 'DeleteObject',
    Default = false,
    
})

RightGroupBox:AddInput('friname',{
    Default = '',
    Text = 'yourfriend'
})

RightGroupBox:AddToggle('FRIjoin',{
    Default = false,
    Text = 'AUTO JOINFRIEND'
})

getgenv().door = "_lobbytemplateportal29","_lobbytemplateportal30","_lobbytemplateportal31","_lobbytemplateportal32","_lobbytemplateportal33","_lobbytemplateportal34","_lobbytemplateportal35","_lobbytemplateportal36","_lobbytemplateportal37","_lobbytemplateportal38"
,"_lobbytemplateportal39"


spawn(function()
        while wait do
            pcall(function()
            wait(0.5)
    if Toggles.FRIjoin.Value == true then do
        wait(0.5)
if tostring(game:GetService("Workspace")["_PORTALS"].Lobbies[getgenv().door].Players.Value.Value) == tostring(Options.friname.Value) then
    for i, v in pairs(game:GetService("Workspace")["_PORTALS"].Lobbies:GetDescendants()) do
        if v.Name == "FriendsOnly" and v.Value == true then

local args = {
    [1] = tostring(v.Parent.Name)
}

game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))
wait(0.5)

end
end
end
end
end
end)
end
end)
            



spawn(function()

if Toggles.AutoDelete.Value == true then do
                    while wait do 
                        wait(0.5)
                        print("objectdoing")
                        pcall(function()
                        wait (0.5)
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do --path of the thing
                          if v.Name == "_map" then --filter by name
                    for a,b in pairs(v:GetChildren()) do
                           b:Destroy() --delete the b(the selected parts)
                                end
                            end
                        end
                    end)
                    end
            
end
        else
            Toggles.AutoDelete.Value = false
        end
    end)

Toggles.AutoDelete:OnChanged(function()

end)

Toggles.Autoleave:OnChanged(function()

end)
 
 SaveManager:LoadAutoloadConfig()

