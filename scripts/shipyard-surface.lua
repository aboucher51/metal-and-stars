script.on_event(defines.events.on_surface_created, function(event)
	local surface = game.get_surface(event.surface_index)
	if not surface or not surface.valid then return end
	if surface.name ~= "shipyard" then return end

	surface.freeze_daytime = true
	surface.show_clouds = false
end)
