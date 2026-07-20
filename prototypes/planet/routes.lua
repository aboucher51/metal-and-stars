local asteroid_util = require("__metal-and-stars__.prototypes.planet.asteroid-spawn-definitions")

data:extend({
    --first define the stargates
    {
        type = "space-location",
        name = "calidus-senestella-gate-calidus", --calidus is the name of the base-game star system, coined by Space Exploration
        icon = "__space-age__/graphics/icons/solar-system-edge.png",    
        order = "f[solar-system-edge]",      
        subgroup = "planets",      
        draw_orbit = false,
        gravity_pull = -10,      
        distance = 20,
        orientation = 0.28,
        magnitude = 1.0,
        label_orientation = 0.15,
        solar_power_in_space = 150,
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(
            asteroid_util.nauvis_senestellagate,
            0.9 
        )
    },
    {
        type = "space-location", 
        name = "calidus-senestella-gate-senestella", 
        icon = "__metal-and-stars-graphics-2__/graphics/icons/edge-icon.png",
        order = "f[solar-system-edge]",      
        subgroup = "planets",   
        draw_orbit = false,    
        gravity_pull = -10,       
        distance = 29,     
        orientation = 0,      
        magnitude = 1.0,      
        label_orientation = 0.15,   
        solar_power_in_space = 150,
        asteroid_spawn_influence = 1,      
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(
            asteroid_util.calidusgate_shipyard,
            0.1 
        )
    },


    --Routes below here
    {
        type = "space-connection",  
        name = "calidus-senestella-gate-connection",  
        subgroup = "planet-connections",  
        icon = "__metal-and-stars-graphics-2__/graphics/icons/edge-icon.png",  
        from = "calidus-senestella-gate-senestella",  
        to = "calidus-senestella-gate-calidus",  
        order = "h",  
        length = 500,  
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_senestellagate)
    },
    {
        type = "space-connection",  
        name = "gate-senestella-nauvis",  
        subgroup = "planet-connections",  
        icon = "__metal-and-stars-graphics-2__/graphics/icons/edge-icon.png",  
        from = "nauvis",
        to = "calidus-senestella-gate-calidus",
        order = "h",
        length = 10000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_senestellagate)
    },
    {
        type = "space-connection",  
        name = "gate-senestella-fulgora",  
        subgroup = "planet-connections",  
        icon = "__metal-and-stars-graphics-2__/graphics/icons/edge-icon.png",  
        from = "calidus-senestella-gate-calidus",  
        to = "fulgora",  
        order = "h",  
        length = 10000,  
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_fulgora)
    },

    --note: mirandus routes are handled in the mirandus file
    {
        type = "space-connection",
        name = "gate-calidus-shipyard",
        subgroup = "planet-connections",
        from = "calidus-senestella-gate-senestella",
        to = "shipyard",
        order = "b",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.calidusgate_shipyard)
    },
    {
        type = "space-connection",
        name = "shipyard-ringworld",
        subgroup = "planet-connections",
        from = "shipyard",
        to = "ringworld",
        order = "b",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
    },
    {
        type = "space-connection",
        name = "shipyard-nix",
        subgroup = "planet-connections",
        from = "shipyard",
        to = "nix",
        order = "b",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
    },
})