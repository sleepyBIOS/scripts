-- Networking
-- note: this only works for games with client side kick system.

-- DEFINE HOOK.
local hook;

-- CREATE METAMETHOD.
hook = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
    -- UNPACK ARGS.
    local args = {...};
    -- NAMECALL METHOD.
    local ncm = getnamecallmethod();
    -- BYPASS.
    if ncm == "Kick" and Self == game.Players.LocalPlayer then
        print("bypassed.");
        return;
    end;

    -- RETURN.
    return hook(Self, ...);
end));