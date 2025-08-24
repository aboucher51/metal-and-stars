local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local asset_graphics = require("__metal-and-stars__.prototypes.entity.quantum-stabilizer-visuals")
local meld = require("meld")

local item_name = "ms-quantum-stabilizer"

local building_entity = 
{
  type = "assembling-machine",
  name = item_name,
  crafting_categories = {"quantum"},
  icon = asset_graphics.icons.item_icon,
  icon_size = asset_graphics.icons.item_icon_size,
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 2.5, result = item_name},
  max_health = 300,
  corpse = "big-remnants",
  dying_explosion = "medium-explosion",
  damaged_trigger_effect = hit_effects.entity(),
  --map_color = ei_data.colors.assembler,
  energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 1, gravitons = 10 },
  },
  effect_receiver = { base_effect = { productivity = 0.5 }},
  module_slots = 4,
  icon_draw_specification = {scale = 2, shift = {0, -0.3}},
  icons_positioning =
  {
    {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, 1.25}}
  },
  allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
  module_specification = {module_slots = 2},
  crafting_speed = 4,
  resource_categories = {"basic-solid"},
  energy_usage = "1W",
  resource_searching_radius = 7,
  circuit_wire_max_distance = default_circuit_wire_max_distance,
  forced_symmetry = "horizontal",
  working_sound =
  {
      sound = {filename = "__base__/sound/electric-mining-drill.ogg", volume = 0.8},
      apparent_volume = 0.1,
  },
  vehicle_impact_sound = sounds.generic_impact,
  open_sound = sounds.machine_open,
  close_sound = sounds.machine_close,
}

data:extend({
  meld.meld(building_entity, asset_graphics.entity_data)
})