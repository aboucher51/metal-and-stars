-- Forces perpetual daylight and hides cloud shadows on the mod's always-day
-- surfaces: Neumann V ("shipyard") and Circa ("ringworld").
--
-- The planet prototypes set ["day-night-cycle"] = 0, but Factorio does not
-- honour a zero-length cycle (the minimum effective value is 1), so the surfaces
-- still ran a normal day/night cycle. We lock them to permanent day at runtime
-- instead. Cloud shadows are also hidden as these surfaces have no atmosphere.

local ALWAYS_DAY_SURFACES = {
    shipyard = true,  -- Neumann V
    ringworld = true, -- Circa
}

local function setup_surface(surface)
    if not ALWAYS_DAY_SURFACES[surface.name] then
        return
    end

    -- Only apply changes if they aren't already set to minimize state churn
    if not surface.always_day then
        surface.always_day = true
    end
    if surface.show_clouds then
        surface.show_clouds = false
    end
end

-- Iterates through all existing surfaces (used on init and config changed)
local function migrate_all_surfaces()
    for _, surface in pairs(game.surfaces) do
        setup_surface(surface)
    end
end

-- 1. Handles mid-game surface creation (e.g., when a player first visits the planet)
script.on_event(defines.events.on_surface_created, function(event)
    setup_surface(game.get_surface(event.surface_index))
end)

-- 2. Handles a brand-new save game initialization
script.on_init(function()
    migrate_all_surfaces()
end)

-- 3. Handles adding/updating the mod on an existing save game
script.on_configuration_changed(function(data)
    migrate_all_surfaces()
end)