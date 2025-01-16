data:extend({
    {
        type = "autoplace-control",
        name = "ringworld_snapper_enemy_base",
        richness = false,
        order = "z-m-n",
        category = "enemy",
        can_be_disabled = true
    },
    {
        type = "noise-expression",
        name = "ringworld_snapper_enemy_base_spots",
        expression = "ringworld_danger_mask * ringworld_spot_noise{\z
            seed = 83749,\z
            count = 50,\z
            skip_offset = 0,\z
            region_size = 600 + 400 / control:ringworld_snapper_enemy_base:frequency,\z
            density = 1,\z
            radius = ringworld_spot_size * sqrt(control:ringworld_snapper_enemy_base:size),\z
            favorability = 1,\z
            max_y_bound = 34\z
        }"
    },
    {
        type = "noise-expression",
        name = "ringworld_snapper_enemy_base_probability",
        expression = "(control:ringworld_snapper_enemy_base:size > 0) * \z
                                min(aquilo_starting_mask, ringworld_snapper_enemy_base_spots) * 0.015"
    },
})

data.raw["unit-spawner"]["armoured-biter-spawner"].autoplace = {probability_expression = "ringworld_snapper_enemy_base_probability"}