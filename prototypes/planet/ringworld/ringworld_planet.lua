local ringworld_map_gen = require("__metal-and-stars__.prototypes.planet.ringworld.ringworld_map_gen")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local meld = require("meld")

local machina = {
    type = "planet",
    name = "ringworld",
    icon = "__metal-and-stars-graphics__/graphics/icons/ringworld-icon.png",
    starmap_icon = "__metal-and-stars-graphics__/graphics/icons/ringworld-starmap.png",
    starmap_icon_size = 512,
    map_gen_settings = meld.overwrite(ringworld_map_gen()),
    gravity_pull = 10,
    distance = 20,
    orientation = 0.50,
    magnitude = 1.0,
    label_orientation = 0.15,
    order = "e[machina]",
    subgroup = "planets",
    pollutant_type = nil,
    solar_power_in_space = 120,
    surface_properties =
    {
        ["day-night-cycle"] = 1,
        ["magnetic-field"] = 0,
        pressure = 1000,
        ["solar-power"] = 300,
        temperature = 293,
        gravity = 10
    },
    surface_render_parameters =
    {
        -- day_night_cycle_color_lookup = {
        --     {0, "identity"},
        -- }
    },
    ticks_between_player_effects = 2
}

machina = meld(table.deepcopy(data.raw["planet"]["nauvis"]), machina)

data:extend({
    machina,
})
