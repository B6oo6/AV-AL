repeat wait() until game:IsLoaded()

if not _G.Settings then
	game.StarterGui:SetCore("SendNotification", {
		Title = "No settings were added",
		Text = "Anti-Lock = C || Aim-Viewer = P - Target = V" ,
     		Duration = "10",
 })
_G.Settings = {
        AimViewer = {
            ["Keybind"] = "p", -- keybind to turn on aim-viewer // default "p"
            ["Color"] = Color3.fromRGB(255,0,0), -- color of the beam // default 255,0,0 / red
            ["Target"] = 'v', -- choose target // aim at him with ur mouse // default "v"
    },
        AntiLock = {
            ["Keybind"] = "c", -- keybind to turn on anti-lock // default "c"
            ["X"] = 33, -- position X (settings for antilock) // default "33"
            ["Y"] = 33, -- position Y (settings for antilock) // default "33"
            ["Z"] = 33, -- position Z (settings for antilock) // default "33"
        }
    }
end

local Settings = _G.Settings
local rs = game:GetService("RunService")
local localPlayer = game.Players.LocalPlayer
local mouse = localPlayer:GetMouse()
local target;



function getgun()
 for i,v in pairs(target.Character:GetChildren()) do
     if v and (v:FindFirstChild('Default') or v:FindFirstChild('Handle') )then
         return v
     end
 end
end

function sendnotifi(message)


 game.StarterGui:SetCore("SendNotification", {
     Title =  'Aim-Viewer';
     Text = message;
     Duration = "1";
 })

 end


function get_closet()
 local a = math.huge
 local b;



 for i, v in pairs(game.Players:GetPlayers()) do
     if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") and  v.Character:FindFirstChild("HumanoidRootPart")  then
         local c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
         local d = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(c.X, c.Y)).Magnitude

         if a > d then
             b = v
             a = d
         end
     end
 end

 return b
end

_G.enable = false
_G.method = "MousePos"

mouse.KeyDown:Connect(function(z)
 if z == Settings.AimViewer.Keybind then
     if _G.enable == false then
         _G.enable = true
         sendnotifi("Enabled")
     elseif _G.enable == true then
         _G.enable = false 
         sendnotifi("Disabled")
     end
 end
end)

mouse.KeyDown:Connect(function(z)
 if z == Settings.AimViewer.Target then
     target = get_closet()
     sendnotifi("targeting: "..tostring(target.Name))
 end
end)

local a=Instance.new("Beam")a.Segments=1;a.Width0=0.2;a.Width1=0.2;a.Color=ColorSequence.new(Settings.AimViewer.Color)a.FaceCamera=true;local b=Instance.new("Attachment")local c=Instance.new("Attachment")a.Attachment0=b;a.Attachment1=c;a.Parent=workspace.Terrain;b.Parent=workspace.Terrain;c.Parent=workspace.Terrain

task.spawn(function()
 rs.RenderStepped:Connect(function()

 local character = localPlayer.Character
     if not character then
     a.Enabled = false
     return
 end






 if _G.enable  and getgun() and target.Character:FindFirstChild("BodyEffects") and target.Character:FindFirstChild("Head")  then
     a.Enabled = true
     b.Position =  target.Character:FindFirstChild("Head").Position
     c.Position = target.Character.BodyEffects[_G.method].Value ---edit this if some random ass game got some weird ass other name :palingface
 else
     a.Enabled = false
 end

 end)
end)


getgenv().tog = false

game:GetService("RunService").Heartbeat:Connect(function()
        if getgenv().tog then
                local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(Settings.AntiLock.X, Settings.AntiLock.Y, Settings.AntiLock.Z)
                game:GetService("RunService").RenderStepped:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
        end
end)

game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(keyPressed)
        if keyPressed == string.lower(Settings.AntiLock.Keybind) then
                pcall(function()
                        if getgenv().tog == false then
                                getgenv().tog = true
                                game.StarterGui:SetCore("SendNotification", {
                                        Title = "Anti-Lock",
                                        Text = "Enabled" })
                        elseif getgenv().tog == true then
                                getgenv().tog = false
                                game.StarterGui:SetCore("SendNotification", {
                                        Title = "Anti-Lock",
                                        Text = "Disabled" })
                        end
                end)
        end
end)
hookfunction(game.Players.LocalPlayer.IsInGroup, function() return true end)
