local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
        type = "lab",
        name = "microgravity-lab",
        icon = "__metal-and-stars-graphics__/graphics/icons/particle-accelerator.png",
        minable = {mining_time = 0.5, result = "microgravity-lab"},
        subgroup = "production-machine",
        order = "z-z[z-lab]",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        max_health = 350,
        impact_category = "metal",
        alert_icon_shift = util.by_pixel(0, -12),
        icon_draw_specification = {shift = {0, -0.3}},
        corpse = "lab-remnants",
        dying_explosion = "lab-explosion",
        resistances =
        {
          {
            type = "fire",
            percent = 70
          }
        },
        surface_conditions =
        {
          {
            property = "gravity",
            min = 0,
            max = 2
          }
        },
        damaged_trigger_effect = hit_effects.entity(),
        on_animation = {
          layers = {
            {
              filename = "__metal-and-stars-graphics__/graphics/entity/particle-accelerator/particle-accelerator-hr-shadow.png",
              priority = "high",
              width = 700,
              height = 600,
              frame_count = 1,
              repeat_count = 60,
              animation_speed = 0.5,
              --shift = {2 + 3/32, 1 + 22/32},
              draw_as_shadow = true,
              scale = 0.4,
            },
            {
              priority = "high",
              width = 400,
              height = 400,
              frame_count = 60,
              animation_speed = 0.5,
              --shift = {0, -8/32},
              scale = 0.4,
              stripes =
              {
                {
                  filename = "__metal-and-stars-graphics__/graphics/entity/particle-accelerator/particle-accelerator-hr-animation.png",
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
              scale = 0.4,
              draw_as_glow = true,
              blend_mode = "additive",
              stripes =
              {
                {
                  filename = "__metal-and-stars-graphics__/graphics/entity/particle-accelerator/particle-accelerator-hr-animation-emission.png",
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
              filename = "__metal-and-stars-graphics__/graphics/entity/particle-accelerator/particle-accelerator-hr-shadow.png",
              priority = "high",
              width = 700,
              height = 600,
              frame_count = 1,
              repeat_count = 60,
              animation_speed = 0.5,
              --shift = {2 + 3/32, 1 + 22/32},
              draw_as_shadow = true,
              scale = 0.4,
            },
            {
              priority = "high",
              width = 400,
              height = 400,
              frame_count = 60,
              animation_speed = 0.5,
              --shift = {0, -8/32},
              scale = 0.4,
              stripes =
              {
                {
                  filename = "__metal-and-stars-graphics__/graphics/entity/particle-accelerator/particle-accelerator-hr-animation.png",
                  width_in_frames = 8,
                  height_in_frames = 8,
                }
              },
            },
          }
        },
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        working_sound =
        {
          sound = { filename = "__base__/sound/lab.ogg", volume = 0.7, modifiers = { volume_multiplier("main-menu", 2.2), volume_multiplier("tips-and-tricks", 0.8) } },
          audible_distance_modifier = 0.7,
          fade_in_ticks = 4,
          fade_out_ticks = 20
        },
        researching_speed = 2,
        inputs =
        {

        },
        science_pack_drain_rate_percent = 50,
        energy_source =
        {
          type = "electric",
          usage_priority = "secondary-input",
          emissions_per_minute = { pollution = 8 }
        },
        energy_usage = "300kW",
        module_slots = 4,
        allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
        icons_positioning =
        {
          {inventory_index = defines.inventory.lab_modules, shift = {0, 1.6}},
          {inventory_index = defines.inventory.lab_input, shift = {0, 0.4}, max_icons_per_row = 6, separation_multiplier = 1/1.1}
        }
      },
      {
        type = "item",
        name = "microgravity-lab",
        icon = "__metal-and-stars-graphics__/graphics/icons/particle-accelerator.png",
        subgroup = "production-machine",
        order = "z[z-microgravity-lab]",
        inventory_move_sound = item_sounds.mechanical_inventory_move,
        pick_sound = item_sounds.mechanical_inventory_pickup,
        drop_sound = item_sounds.mechanical_inventory_move,
        place_result = "microgravity-lab",
        stack_size = 5,
        weight = 1000 * kg
      },
})