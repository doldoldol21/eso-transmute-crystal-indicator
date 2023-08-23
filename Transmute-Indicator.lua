FooAddon = {}
FooAddon.name = "Transmute Indicator"

function FooAddon.Initialize()
    FooAddon.inCombat = IsUnitInCombat("player")
    EVENT_MANAGER:RegisterForEvent(FooAddon.name, EVENT_PLAYER_COMBAT_STATE, FooAddon.OnPlayerCombatState)

end

function FooAddon.OnAddOnLoaded(event, addonName)
    if addonName == FooAddon.name then
        FooAddon.Initialize()
        EVENT_MANAGER:UnregisterForEvent(FooAddon.name, EVENT_ADD_ON_LOADED)
    end
end

function FooAddon.OnPlayerCombatState(event, inCombat)
    if inCombat ~= FooAddon.inCombat then
        FooAddon.inCombat = inCombat
        if inCombat then
            d("Entering combat.")
        else
            d("Exiting combat.")
        end

        TransmuteIndicator:SetHidden(not inCombat)
    end
end

EVENT_MANAGER:RegisterForEvent(FooAddon.name, EVENT_ADD_ON_LOADED, FooAddon.OnAddOnLoaded)
