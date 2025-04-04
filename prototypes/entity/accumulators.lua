local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")


-- data:extend({
--     {
--         type = "item",
--         name = "accumulator-mk2",
--         icon = "__base__/graphics/icons/accumulator.png",
--         subgroup = "energy",
--         order = "e[accumulator]-a[accumulator]",
--         inventory_move_sound = item_sounds.electric_large_inventory_move,
--         pick_sound = item_sounds.electric_large_inventory_pickup,
--         drop_sound = item_sounds.electric_large_inventory_move,
--         place_result = "accumulator",
--         stack_size = 50
--       },
--       {
--         type = "item",
--         name = "accumulator-mk3",
--         icon = "__base__/graphics/icons/accumulator.png",
--         subgroup = "energy",
--         order = "e[accumulator]-a[accumulator]",
--         inventory_move_sound = item_sounds.electric_large_inventory_move,
--         pick_sound = item_sounds.electric_large_inventory_pickup,
--         drop_sound = item_sounds.electric_large_inventory_move,
--         place_result = "accumulator",
--         stack_size = 50
--       },
--       {
--         type = "accumulator",
--         name = "accumulator-mk2",
--         icon = "__base__/graphics/icons/accumulator.png",
--         flags = {"placeable-neutral", "player-creation"},
--         minable = {mining_time = 0.1, result = "accumulator"},
--         fast_replaceable_group = "accumulator",
--         max_health = 150,
--         corpse = "accumulator-remnants",
--         dying_explosion = "accumulator-explosion",
--         collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
--         selection_box = {{-1, -1}, {1, 1}},
--         damaged_trigger_effect = hit_effects.entity(),
--         drawing_box_vertical_extension = 0.5,
--         energy_source =
--         {
--           type = "electric",
--           buffer_capacity = "10MJ",
--           usage_priority = "tertiary",
--           input_flow_limit = "600kW",
--           output_flow_limit = "600kW"
--         },
--         chargable_graphics =
--         {
--           picture = accumulator_picture(),
--           charge_animation = accumulator_charge(),
--           charge_cooldown = 30,
--           discharge_animation = accumulator_discharge(),
--           discharge_cooldown = 60
--           --discharge_light = {intensity = 0.7, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
--         },
--         water_reflection = accumulator_reflection(),
--         impact_category = "metal",
--         open_sound = sounds.electric_large_open,
--         close_sound = sounds.electric_large_close,
--         working_sound =
--         {
--           main_sounds =
--           {
--             {
--               sound = {filename = "__base__/sound/accumulator-working.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44)},
--               match_volume_to_activity = true,
--               activity_to_volume_modifiers = {offset = 2, inverted = true},
--               fade_in_ticks = 4,
--               fade_out_ticks = 20
--             },
--             {
--               sound = {filename = "__base__/sound/accumulator-discharging.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44)},
--               match_volume_to_activity = true,
--               activity_to_volume_modifiers = {offset = 1},
--               fade_in_ticks = 4,
--               fade_out_ticks = 20
--             }
--           },
--           idle_sound = {filename = "__base__/sound/accumulator-idle.ogg", volume = 0.35},
--           max_sounds_per_type = 3,
--           audible_distance_modifier = 0.5
--         },
    
--         circuit_connector = circuit_connector_definitions["accumulator"],
--         circuit_wire_max_distance = default_circuit_wire_max_distance,
    
--         default_output_signal = {type = "virtual", name = "signal-A"}
--       },
--       {
--         type = "accumulator",
--         name = "accumulator-mk3",
--         icon = "__base__/graphics/icons/accumulator.png",
--         flags = {"placeable-neutral", "player-creation"},
--         minable = {mining_time = 0.1, result = "accumulator"},
--         fast_replaceable_group = "accumulator",
--         max_health = 150,
--         corpse = "accumulator-remnants",
--         dying_explosion = "accumulator-explosion",
--         collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
--         selection_box = {{-1, -1}, {1, 1}},
--         damaged_trigger_effect = hit_effects.entity(),
--         drawing_box_vertical_extension = 0.5,
--         energy_source =
--         {
--           type = "electric",
--           buffer_capacity = "20MJ",
--           usage_priority = "tertiary",
--           input_flow_limit = "1200kW",
--           output_flow_limit = "1200kW"
--         },
--         chargable_graphics =
--         {
--           picture = accumulator_picture(),
--           charge_animation = accumulator_charge(),
--           charge_cooldown = 30,
--           discharge_animation = accumulator_discharge(),
--           discharge_cooldown = 60
--           --discharge_light = {intensity = 0.7, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
--         },
--         water_reflection = accumulator_reflection(),
--         impact_category = "metal",
--         open_sound = sounds.electric_large_open,
--         close_sound = sounds.electric_large_close,
--         working_sound =
--         {
--           main_sounds =
--           {
--             {
--               sound = {filename = "__base__/sound/accumulator-working.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44)},
--               match_volume_to_activity = true,
--               activity_to_volume_modifiers = {offset = 2, inverted = true},
--               fade_in_ticks = 4,
--               fade_out_ticks = 20
--             },
--             {
--               sound = {filename = "__base__/sound/accumulator-discharging.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44)},
--               match_volume_to_activity = true,
--               activity_to_volume_modifiers = {offset = 1},
--               fade_in_ticks = 4,
--               fade_out_ticks = 20
--             }
--           },
--           idle_sound = {filename = "__base__/sound/accumulator-idle.ogg", volume = 0.35},
--           max_sounds_per_type = 3,
--           audible_distance_modifier = 0.5
--         },
    
--         circuit_connector = circuit_connector_definitions["accumulator"],
--         circuit_wire_max_distance = default_circuit_wire_max_distance,
    
--         default_output_signal = {type = "virtual", name = "signal-A"}
--       },
--       {
--         type = "recipe",
--         name = "accumulator-mk2",
--         energy_required = 15,
--         category = "electronics-or-assembling",
--         enabled = false,
--         ingredients =
--         {
--           {type = "item", name = "accumulator", amount = 4},
--           {type = "item", name = "holmium-plate", amount = 2},
--           {type = "item", name = "neodymium-plate", amount = 1},
--         },
--         results = {{type="item", name="accumulator-mk2", amount=1}}
--       },
--       {
--         type = "recipe",
--         name = "accumulator-mk3",
--         energy_required = 20,
--         category = "electronics-or-assembling",
--         enabled = false,
--         ingredients =
--         {
--           {type = "item", name = "accumulator-mk2", amount = 4},
--           {type = "item", name = "supercapacitor", amount = 4},
--           {type = "item", name = "superconductor", amount = 4},
--           {type = "item", name = "lithium-plate", amount = 1},
--         },
--         results = {{type="item", name="accumulator-mk3", amount=1}}
--       },
-- })