-- Back-migration: apply perpetual daylight and hide cloud shadows on surfaces
-- that already existed before scripts/shipyard-surface.lua handled them on
-- creation. New surfaces are handled by on_surface_created; this covers saves
-- where Neumann V ("shipyard") or Circa ("ringworld") were already generated.
for _, surface in pairs(game.surfaces) do
	if surface.valid and (surface.name == "shipyard" or surface.name == "ringworld") then
		surface.always_day = true
		surface.show_clouds = false
	end
end
