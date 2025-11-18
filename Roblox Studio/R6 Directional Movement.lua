local Time, TorsoXRotation, TorsoZRotation, LegRotation = 0.25, 5, 15, 10

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid")

local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Torso = Character:WaitForChild("Torso")
local RootJoint = HumanoidRootPart:WaitForChild("RootJoint")
local LeftHipJoint = Torso:WaitForChild("Left Hip")
local RightHipJoint = Torso:WaitForChild("Right Hip")

local Force = nil
local Direction = nil
local RightDot = 0
local LookDot = 0

local RootJointC0 = RootJoint.C0
local LeftHipJointC0 = LeftHipJoint.C0
local RightHipJointC0 = RightHipJoint.C0

local TI =  TweenInfo.new(Time, Enum.EasingStyle.Sine)
RunService.RenderStepped:Connect(function()
	Force = HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)
	if Force.Magnitude > 0.001 then
		Direction = Force.Unit
		RightDot = HumanoidRootPart.CFrame.RightVector:Dot(Direction)
		LookDot = HumanoidRootPart.CFrame.LookVector:Dot(Direction)
	else
		RightDot = 0
		LookDot = 0
	end

	TweenService:Create(RootJoint, TI, {C0 = RootJoint.C0:Lerp(RootJointC0 * CFrame.Angles(math.rad(LookDot * TorsoZRotation), math.rad(-RightDot * TorsoXRotation), 0), 0.5)}):Play()
	TweenService:Create(LeftHipJoint, TI, {C0 = LeftHipJoint.C0:Lerp(LeftHipJointC0 * CFrame.Angles(math.rad(RightDot * LegRotation), 0, 0), 0.5)}):Play()
	TweenService:Create(RightHipJoint, TI, {C0 = RightHipJoint.C0:Lerp(RightHipJointC0 * CFrame.Angles(math.rad(-RightDot * LegRotation), 0, 0), 0.5)}):Play()
end)
