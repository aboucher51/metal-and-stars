if mods["enemyracemanager"] then
   -- Only confine the Enemy Race Manager variant of the armoured biter spawner to
   -- Circa when the "armoured-biters-circa-only" startup setting is enabled. When it
   -- is disabled we leave its default autoplace intact so it can spawn on Nauvis /
   -- other planets.
   if settings.startup["armoured-biters-circa-only"].value then
      data.raw["unit-spawner"]["enemy--armoured-biter-spawner--1"].autoplace = {probability_expression ="ringworld_snapper_enemy_base_probability", force = "ringworld_snappers"}
   end

   local ringworld_map_settings = data.raw.planet.ringworld.map_gen_settings
   ringworld_map_settings.autoplace_settings.entity.settings["armoured-biter-spawner"] = nil
   ringworld_map_settings.autoplace_settings.entity.settings["enemy--armoured-biter-spawner--1"] = {}
end