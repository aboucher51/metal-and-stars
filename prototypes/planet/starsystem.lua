local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:extend({
  {
      type = "space-location",
      name = "redstar",
      starmap_icon = "__metal-and-stars-graphics-2__/graphics/starmap/senestella-ring.png",
      starmap_icon_size = 919,
      orbit = {
          parent = {
              type = "space-location",
              name = "star",
          },
          distance = 150,
          orientation = 0.35,
      },
      sprite_only = true,
      magnitude = 29,
  },
})  


PlanetsLib:update({ 
        {
            type = "space-location",
            name = "calidus-senestella-gate-senestella",
            orbit = {
                parent = {
                    type = "space-location",
                    name = "redstar",
                },
                distance = 40,
                orientation = 0.89,

            }
        }
    })

local shipyard = data.raw["planet"]["shipyard"]
if shipyard then
  shipyard.starmap_icon = "__space-age__/graphics/icons/space-platform-foundation.png"  
  shipyard.starmap_icon_size = 64  
        PlanetsLib:update({
            {
                type = "planet",
                name = "shipyard",
                icon = "__space-age__/graphics/icons/space-platform-foundation.png",  
                icon_size = 64,  
                orbit = {
                    parent = {
                        type = "space-location",
                        name = "redstar",
                    },
                    distance = 31,  --164
                    orientation = 0.88, --0.133
                    sprite = {
                        type = "sprite",
                        filename = "__metal-and-stars-graphics-2__/graphics/starmap/orbits/orbit_mirandus.png",
                        size = 4096,
                    },
                }
            }
        })
    if mods["visible-planets"] then
      vp_override_planet_sprite("shipyard", "__metal-and-stars-graphics-2__/graphics/starmap/visible-planets/shipyard-visibleplanet.png", 1024)
    end 
else
        log("shipyard planet data not found.")
end

local nix = data.raw["planet"]["nix"]
if nix then
        PlanetsLib:update({
            {
                type = "planet",
                name = "nix",
                orbit = {
                    parent = {
                        type = "space-location",
                        name = "redstar",
                    },
                    distance = 38,  --164
                    orientation = 0.8, --0.133
                    sprite = {
                        type = "sprite",
                        filename = "__metal-and-stars-graphics-2__/graphics/starmap/orbits/orbit_nix.png",
                        size = 4096,
                    },
                }
            }
        })
else
        log("nix planet data not found.")
end


local mirandus = data.raw["space-location"]["mirandus-a"]
if mirandus then
        PlanetsLib:update({
            {
                type = "space-location",
                name = "mirandus-a",
                orbit = {
                    parent = {
                        type = "space-location",
                        name = "redstar",
                    },
                    distance = 25,  --164
                    orientation = 0.75, --0.133
                    sprite = {
                        type = "sprite",
                        filename = "__metal-and-stars-graphics-2__/graphics/starmap/orbits/orbit_shipyard.png",
                        size = 4096,
                    },
                }
            }
        })

else
        log("mirandus-a data not found.")
end


local ringworld = data.raw["planet"]["ringworld"]
ringworld.starmap_icon = "__metal-and-stars-graphics-2__/graphics/icons/ringworld-icon.png"  
ringworld.starmap_icon_size = 64
ringworld.icon = "__metal-and-stars-graphics-2__/graphics/icons/ringworld-icon.png"  
ringworld.icon_size = 64
if ringworld then
        PlanetsLib:update({
            {
                type = "planet",
                name = "ringworld",
                orbit = {
                    parent = {
                        type = "space-location",
                        name = "redstar",
                    },
                    distance = 11,  --164
                    orientation = 0.84, --0.133
                }
            }
        })

data.raw["planet"]["ringworld"].draw_orbit = false

    if mods["visible-planets"] then
        vp_override_planet_sprite("ringworld", "__metal-and-stars-graphics-2__/graphics/starmap/visible-planets/ringworld-visibleplanet.png", 1000)
        vp_override_planet_scale("ringworld", 2.0)
    end 
else
        log("ringworld planet data not found.")
end