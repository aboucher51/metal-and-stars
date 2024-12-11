local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")


local item_name = "microgravity-lab"

--technology
local technology_icon = "__planet-machina__/graphics/icons/particle-accelerator.png"
local technology_icon_size = 256
--item
local item_icon = "__planet-machina__/graphics/icons/particle-accelerator.png"
local item_icon_size = 64

local building_entity = 
{
  type = "lab",
  name = item_name,
  icon = "__base__/graphics/icons/lab.png",
  flags = {"placeable-player", "player-creation"},
  minable = {mining_time = 0.2, result = item_name},
  max_health = 150,
  corpse = "lab-remnants",
  dying_explosion = "lab-explosion",
  collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
  selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  damaged_trigger_effect = hit_effects.entity(),
  working_sound =
  {
    sound = { filename = "__base__/sound/lab.ogg", volume = 0.7, modifiers = { volume_multiplier("main-menu", 2.2), volume_multiplier("tips-and-tricks", 0.8) } },
    audible_distance_modifier = 0.7,
    fade_in_ticks = 4,
    fade_out_ticks = 20
  },
  impact_category = "glass",
  open_sound = { filename = "__base__/sound/open-close/lab-open.ogg", volume = 0.6 },
  close_sound = { filename = "__base__/sound/open-close/lab-close.ogg", volume = 0.6 },
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input"
  },
  energy_usage = "60kW",
  researching_speed = 1,
  inputs =
  {
    "automation-science-pack",
    "logistic-science-pack",
    "military-science-pack",
    "chemical-science-pack",
    "production-science-pack",
    "utility-science-pack",
    "space-science-pack"
  },
  module_slots = 2,
  icons_positioning =
  {
    {inventory_index = defines.inventory.lab_modules, shift = {0, 0.9}},
    {inventory_index = defines.inventory.lab_input, shift = {0, 0}, max_icons_per_row = 4, separation_multiplier = 1/1.1}
  },
  on_animation = {
    layers = {
      {
        filename = "__planet-machina__/graphics/entity/particle-accelerator/particle-accelerator-hr-shadow.png",
        priority = "high",
        width = 700,
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
            filename = "__planet-machina__/graphics/entity/particle-accelerator/particle-accelerator-hr-animation.png",
            width_in_frames = 8,
            height_in_frames = 8,
          }
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
            filename = "__planet-machina__/graphics/entity/particle-accelerator/particle-accelerator-hr-animation-emission.png",
            width_in_frames = 8,
            height_in_frames = 8,
          }
        },
      },
    }
  },
  off_animation = {
    layers = {
      {
        filename = "__planet-machina__/graphics/entity/particle-accelerator/particle-accelerator-hr-shadow.png",
        priority = "high",
        width = 700,
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
            filename = "__planet-machina__/graphics/entity/particle-accelerator/particle-accelerator-hr-animation.png",
            width_in_frames = 8,
            height_in_frames = 8,
          }
        },
      },
    }
  },
}

data:extend({
  {
    type = "technology",
    name = item_name.."research",
    icon = technology_icon,
    icon_size = technology_icon_size,
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
		icon = item_icon,
		icon_size = item_icon_size,
		subgroup = "production-machine",
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
})