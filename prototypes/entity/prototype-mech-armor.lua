local item_sounds = require("__base__.prototypes.item_sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

-- Define a mod-prefixed equipment grid (MSMS = MetalStarsMechSuit) instead of
-- reusing the generic vanilla "medium-equipment-grid", whose shared name collides
-- with other mods that reference/modify the same grid. We deep-copy the vanilla
-- medium grid so width/height/equipment_categories stay identical, then rename it.
local msms_grid = table.deepcopy(data.raw["equipment-grid"]["medium-equipment-grid"])
msms_grid.name = "MSMS-grid"
msms_grid.localised_name = nil
msms_grid.localised_description = nil
data:extend({ msms_grid })

data:extend({
  {
    type = "armor",
    name = "prototype-mech-armor",
    icon = "__metal-and-stars-graphics__/graphics/icons/prototype-mech-armor.png",
    resistances =
    {
      {
        type = "physical",
        decrease = 10,
        percent = 30
      },
      {
        type = "acid",
        decrease = 0,
        percent = 70
      },
      {
        type = "explosion",
        decrease = 60,
        percent = 50
      },
      {
        type = "fire",
        decrease = 0,
        percent = 50
      }
    },
    subgroup = "armor",
    order = "ez[mech-armor]",
    factoriopedia_simulation = simulations.factoriopedia_mech_armor,
    inventory_move_sound = item_sounds.armor_large_inventory_move,
    pick_sound = item_sounds.armor_large_inventory_pickup,
    drop_sound = item_sounds.armor_large_inventory_move,
    stack_size = 1,
    infinite = true,
    equipment_grid = "MSMS-grid",
    inventory_size_bonus = 50,
    provides_flight = true,
    takeoff_sound = {filename = "__space-age__/sound/entity/mech-armor/mech-armor-takeoff.ogg", volume = 0.2, aggregation = {max_count = 2, remove = true, count_already_playing = true}},
    landing_sound = {filename = "__space-age__/sound/entity/mech-armor/mech-armor-land.ogg", volume = 0.3, aggregation = {max_count = 2, remove = true, count_already_playing = true}},
    flight_sound = {sound={filename = "__space-age__/sound/entity/mech-armor/mech-armor-flight.ogg", volume = 0.2}},
    steps_sound = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-steps-metallic", 5, 0.2),
    moving_sound = sound_variations("__space-age__/sound/entity/mech-armor/mech-armor-moves", 10, 0.4),
    collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
    drawing_box = {{-0.4, -2}, {0.4, 0}},
    open_sound = {filename =  "__base__/sound/armor-open.ogg", volume = 1},
    close_sound = {filename = "__base__/sound/armor-close.ogg", volume = 1},
    weight = 1*tons
  },
})