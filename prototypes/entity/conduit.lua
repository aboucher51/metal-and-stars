local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local meld = require("meld")

local item_name = "neumann-conduit"

local technology_icon = "__metal-and-stars-graphics__/graphics/icons/conduit.png"
local technology_icon_size = 256
--item
local item_icon = "__metal-and-stars-graphics__/graphics/icons/conduit.png"
local item_icon_size = 64

local building_entity = 
{
  type = "electric-energy-interface",
  name = "neumann-conduit",
  icon = item_icon,
  icon_size = item_icon_size,
  flags = {"placeable-neutral", "player-creation"},
  alert_when_damaged = true,
  hidden = true,
  energy_source =
  {
  type = "electric",
  buffer_capacity = "1MJ",
  usage_priority = "primary-output"
  },
  autoplace = {
    order = "a[landscape]-c[rock]-a[huge]",
    probability_expression = "shipyard_conduit_noise"
  },
  surface_conditions =
  {
    {
      property = "local-electricity-grid",
      min = 1
    }
  },
  energy_production = "150GW",
  energy_usage = "0kW",
  enable_inventory_bar = false,
  minable = {mining_time = 0.1, result = "neumann-conduit"},
  max_health = 150,
  corpse = "medium-remnants",
  subgroup = "other",
  damaged_trigger_effect = hit_effects.entity(),
  drawing_box_vertical_extension = 0.5,
  collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  gui_mode = "none",
  continuous_animation = true,
  allow_copy_paste = true,
  open_sound = sounds.machine_open,
  close_sound = sounds.machine_close,
  impact_category = "glass",
  animation = {
    layers = {
      {
        filename = "__metal-and-stars-graphics__/graphics/entity/conduit/conduit-hr-shadow.png",
        priority = "high",
        width = 600,
        height = 400,
        frame_count = 1,
        repeat_count = 60,
        animation_speed = 0.5,
        --shift = {2 + 3/32, 1 + 22/32},
        draw_as_shadow = true,
        scale = 0.5,
      },
      {
        priority = "high",
        width = 200,
        height = 290,
        frame_count = 60,
        animation_speed = 0.5,
        --shift = {0, -8/32},
        scale = 0.5,
        stripes =
        {
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/conduit/conduit-hr-animation.png",
            width_in_frames = 8,
            height_in_frames = 8,
          }
        },
      },
      {
        priority = "high",
        width = 200,
        height = 290,
        frame_count = 60,
        animation_speed = 0.5,
        --shift = {0, -8/32},
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
        stripes =
        {
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/conduit/conduit-hr-animation-emission.png",
            width_in_frames = 8,
            height_in_frames = 8,
          }
        },
      },
    }
  },
    
}

data:extend({
  building_entity
})