local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local asset_graphics = require("__planet-machina__.prototypes.entity.chemical-stager-visuals")
local meld = require("meld")

local item_name = "barometric-vice"

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
  resistances =
  {
    {
      type = "fire",
      percent = 70
    }
  },
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
      pipe_connections = {{ flow_direction="input-output", direction = defines.direction.west, position = {-2.88, 1} }}
    },
    {
      production_type = "input",
      pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
      pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
      pipe_covers = pipecoverspictures(),
      volume = 200,
      secondary_draw_orders = { north = -1 },
      pipe_connections = {{ flow_direction="input-output", direction = defines.direction.east, position = {2.88, -1} }}
    },
    {
      production_type = "output",
      pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
      pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
      pipe_covers = pipecoverspictures(),
      volume = 100,
      secondary_draw_orders = { north = -1 },
      pipe_connections = {{ flow_direction="input-output", direction = defines.direction.south, position = {1, 2.88} }}
    },
    {
      production_type = "output",
      pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
      pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
      pipe_covers = pipecoverspictures(),
      volume = 100,
      secondary_draw_orders = { north = -1 },
      pipe_connections = {{ flow_direction="input-output", direction = defines.direction.north, position = {-1, -2.88} }}
    }
  },
  damaged_trigger_effect = hit_effects.entity(),
  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
  circuit_connector = circuit_connector_definitions["assembling-machine"],
  alert_icon_shift = util.by_pixel(0, -12),
  crafting_categories = {"compression"},
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
  open_sound = sounds.machine_open,
  close_sound = sounds.machine_close,
  allowed_effects = {"speed", "consumption", "pollution"},
  effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
  impact_category = "metal",
  working_sound =
  {
    sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5 },
    audible_distance_modifier = 0.5,
    fade_in_ticks = 4,
    fade_out_ticks = 20
  },
  collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
  selection_box = {{-3.0, -3.0}, {3.0, 3.0}},

  circuit_wire_connection_points = circuit_connector_definitions["electric-mining-drill"].points,
  circuit_connector_sprites = circuit_connector_definitions["electric-mining-drill"].sprites,

  graphics_set = {
      circuit_connector_layer = "object",
          circuit_connector_secondary_draw_order = { north = 14, east = 30, south = 30, west = 30 },
      animation = {
        layers = {
          {
            filename = "__planet-machina__/graphics/entity/chemical-stager/chemical-stager-hr-shadow.png",
            priority = "high",
            width = 800,
            height = 600,
            frame_count = 1,
            repeat_count = 60,
            animation_speed = 0.5,
            --shift = {2 + 3/32, 1 + 22/32},
            draw_as_shadow = true,
            scale = 0.5,
          },
          {
            priority = "high",
            width = 400,
            height = 400,
            frame_count = 60,
            animation_speed = 0.5,
            --shift = {0, -8/32},
            scale = 0.5,
            stripes =
            {
              {
                filename = "__planet-machina__/graphics/entity/chemical-stager/chemical-stager-hr-animation-1.png",
                width_in_frames = 8,
                height_in_frames = 8,
              },
            },
          },
          {
            priority = "high",
            width = 400,
            height = 400,
            frame_count = 60,
            animation_speed = 0.5,
            --shift = {0, -8/32},
            scale = 0.5,
            draw_as_glow = true,
            blend_mode = "additive",
            stripes =
            {
              {
                filename = "__planet-machina__/graphics/entity/chemical-stager/chemical-stager-hr-emission-1.png",
                width_in_frames = 8,
                height_in_frames = 8,
              },
            },
          },
        }
      },
    }
  
}

data:extend({
  {
    type = "technology",
    name = item_name.."research",
    icon = asset_graphics.icons.technology_icon,
    icon_size = asset_graphics.icons.technology_icon_size,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = item_name
      }
    },
    prerequisites = {"rocket-silo"},
    research_trigger = {type = "create-space-platform"}
  },
  {
		type = "item",
		name = item_name,
		icon = asset_graphics.icons.item_icon,
		icon_size = asset_graphics.icons.item_icon_size,
		subgroup = "extraction-machine",
		order = "d[hurricane]",
		place_result = item_name,
		stack_size = 10,
	},
  {
		type = "recipe",
		name = item_name,
		enabled = false,
    energy_required = 10,
		ingredients = {
      {type = "item", name = "jellynut", amount = 1},
		},
		results = {{type="item", name=item_name, amount=1}}
	},
  building_entity
  --meld.meld(building_entity, asset_graphics.entity_data)
})