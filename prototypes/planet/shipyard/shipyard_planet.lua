local shipyard_map_gen = require("__metal-and-stars__.prototypes.planet.shipyard.shipyard_map_gen")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local meld = require("meld")

local machina = {
    type = "planet",
    name = "shipyard",
    icon = "__metal-and-stars-graphics__/graphics/icons/shipyard-icon.png",
    starmap_icon = "__metal-and-stars-graphics__/graphics/icons/shipyard-starmap.png",
    starmap_icon_size = 512,
    map_gen_settings = meld.overwrite(shipyard_map_gen()),
    gravity_pull = 10,
    distance = 20,
    orientation = 0.380,
    magnitude = 1.0,
    label_orientation = 0.15,
    order = "e[machina]",
    subgroup = "planets",
    pollutant_type = nil,
    solar_power_in_space = 200,
    surface_properties =
    {
        ["day-night-cycle"] = 0,
        ["magnetic-field"] = 0,
        pressure = 200,
        ["solar-power"] = 200,
        ["local-electricity-grid"] = 300,
        temperature = 268,
        gravity = 2
    },
    surface_render_parameters =
    {
    },
    ticks_between_player_effects = 2
}

machina = meld(table.deepcopy(data.raw["planet"]["nauvis"]), machina)

data:extend({
    {
        type = "surface-property",
        name = "local-electricity-grid",
        default_value = 0
    },
    machina,
})
