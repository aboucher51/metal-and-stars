local nix_map_gen = require("__metal-and-stars__.prototypes.planet.nix.nix_map_gen")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local meld = require("meld")

local machina = {
    type = "planet",
    name = "nix",
    icon = "__metal-and-stars-graphics__/graphics/icons/nix-icon.png",
    starmap_icon = "__metal-and-stars-graphics__/graphics/icons/nix-starmap.png",
    starmap_icon_size = 512,
    map_gen_settings = meld.overwrite(nix_map_gen()),
    gravity_pull = 10,
    distance = 30,
    orientation = 0.380,
    magnitude = 1.0,
    label_orientation = 0.15,
    order = "e[machina]",
    subgroup = "planets",
    pollutant_type = "gravitons",
    enemy_base_radius = "nix_enemy_base_radius",
    enemy_base_frequency = "nix_enemy_base_frequency",
    solar_power_in_space = 60,
    entities_require_heating = settings.startup["is-nix-frozen-enabled"].value,
    surface_properties =
    {
        ["day-night-cycle"] = 2*hour,
        ["magnetic-field"] = 15,
        pressure = 1666,
        ["solar-power"] = 10,
        temperature = 258,
        gravity = 15,
    },
    surface_render_parameters =
    {
        day_night_cycle_color_lookup = {
            {0, "identity"},
            {0.025, "__core__/graphics/color_luts/lut-sunset.png"},
            {0.050, "__metal-and-stars-graphics__/graphics/lut/lut-nix-night.png"},
            {0.35, "__metal-and-stars-graphics__/graphics/lut/lut-nix-night.png"},
            {0.45, "__metal-and-stars-graphics__/graphics/lut/lut-dark-night.png"},
            {0.55, "__metal-and-stars-graphics__/graphics/lut/lut-dark-night.png"},
            {0.65, "__metal-and-stars-graphics__/graphics/lut/lut-nix-night.png"},
            {0.950, "__metal-and-stars-graphics__/graphics/lut/lut-nix-night.png"},
            {0.975, "__core__/graphics/color_luts/lut-dawn.png"},
            
        }
    },
    ticks_between_player_effects = 2
}

machina = meld(table.deepcopy(data.raw["planet"]["aquilo"]), machina)

data:extend({
    machina,
    {
        type = "noise-expression",
        name = "nix_enemy_base_radius",
        expression = "sqrt(control:nix_enemy_base:size) * (15 + 4 * enemy_base_intensity)"
      },
      {
        type = "noise-expression",
        name = "nix_enemy_base_frequency",
        -- bases_per_km2 = 10 + 3 * enemy_base_intensity
        expression = "(0.00002 + 0.000006 * enemy_base_intensity) * control:nix_enemy_base:frequency"
      },
      {
        type = "noise-expression",
        name = "nix_spawner",
        expression = "max(0.02 * gleba_starting_enemies, 0.02 * gleba_starting_enemies_safe, min(0.02, enemy_autoplace_base(0, 8)), min(0.001, gleba_fertile_spots_coastal * 5000 - gleba_biome_mask_green * 25000)) * gleba_above_deep_water_mask"
      },
})
