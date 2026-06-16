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
	if not surface or not surface.valid then return end
	if not ALWAYS_DAY_SURFACES[surface.name] then return end

	surface.always_day = true
	surface.show_clouds = false
end

script.on_event(defines.events.on_surface_created, function(event)
	setup_surface(game.get_surface(event.surface_index))
end)
