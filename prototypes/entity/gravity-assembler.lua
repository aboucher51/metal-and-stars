local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local asset_graphics = require("__metal-and-stars__.prototypes.entity.gravity-assembler-visuals")
local meld = require("meld")

local item_name = "microgravity-assembler"

local building_entity = 
{
  type = "assembling-machine",
  name = item_name,
  icon = asset_graphics.icons.item_icon,
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 0.2, result = item_name},
  max_health = 300,
  corpse = "assembling-machine-1-remnants",
  dying_explosion = "assembling-machine-1-explosion",
  icon_draw_specification = {shift = {0, -0.3}},
  surface_conditions =
  {
    {
      property = "gravity",
      min = 0,
      max = 2
    }
  },
  module_slots = 3,
  resistances =
  {
    {
      type = "fire",
      percent = 70
    }
  },
  collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  fluid_boxes_off_when_no_fluid_recipe = true,
  fluid_boxes =
  {
    {
      production_type = "input",
      pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
      pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
      pipe_covers = pipecoverspictures(),
      volume = 200,
      secondary_draw_orders = { north = -1 },
      pipe_connections = {{ flow_direction="input", direction = defines.direction.west, position = {-2, 1} }}
    },
    {
      production_type = "input",
      pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
      pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
      pipe_covers = pipecoverspictures(),
      volume = 200,
      secondary_draw_orders = { north = -1 },
      pipe_connections = {{ flow_direction="input", direction = defines.direction.east, position = {2, -1} }}
    },
    {
      production_type = "output",
      pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
      pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
      pipe_covers = pipecoverspictures(),
      volume = 100,
      secondary_draw_orders = { north = -1 },
      pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {1, 2} }}
    },
    {
      production_type = "output",
      pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
      pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
      pipe_covers = pipecoverspictures(),
      volume = 100,
      secondary_draw_orders = { north = -1 },
      pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1, -2} }}
    }
  },
  damaged_trigger_effect = hit_effects.entity(),
  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
  circuit_connector = circuit_connector_definitions["assembling-machine"],
  alert_icon_shift = util.by_pixel(0, -12),
  crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", "nanotech"},
  crafting_speed = 3,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 4 }
  },
  autoplace = {
    order = "a[landscape]-c[rock]-a[huge]",
    probability_expression = "shipyard_crafting_machine_noise"
  },
  energy_usage = "75kW",
  forced_symmetry = "horizontal",
  open_sound = sounds.machine_open,
  close_sound = sounds.machine_close,
  allowed_effects = {"speed", "consumption", "pollution", "productivity", "quality" },
  effect_receiver = {uses_module_effects = true, uses_beacon_effects = true, uses_surface_effects = true},
  impact_category = "metal",
  working_sound =
  {
    sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5 },
    audible_distance_modifier = 0.5,
    fade_in_ticks = 4,
    fade_out_ticks = 20
  }
  
}

data:extend({
  meld.meld(building_entity, asset_graphics.entity_data)
})