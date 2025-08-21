-- Lechevalier999 may be the next Albert Einstein.....
game.Players.PlayerAdded:Connect(function(plr : Player)
	plr.CharacterAdded:Connect(function(char : Model)
		local hrp : BasePart = char:FindFirstChild("HumanoidRootPart");
		hrp:SetNetworkOwner(nil); -- OMG OMG FULLY SERVERSIDE 💯💯💯💯
	end);
end);
