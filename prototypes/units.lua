require ("__base__.prototypes.entity.enemy-constants")
require ("__base__.prototypes.entity.biter-animations")
require ("__base__.prototypes.entity.spitter-animations")
require ("__base__.prototypes.entity.spawner-animation")

local biter_ai_settings = require ("__base__.prototypes.entity.biter-ai-settings")
local machina_enemy_autoplace = require ("__metal-and-stars__.prototypes.entity.machina-enemy-autoplace-utils")
local sounds = require ("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

local make_unit_melee_ammo_type_explode = function(damage_value)
  return
  {
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects = 
        {
          {
            type = "damage",
            damage = { amount = damage_value , type = "physical"}
          },
          {
            type = "create-explosion",
            entity_name = "void-explosion"
          }
        }
    }
  }
}
end
local function jellyfish_animation(tint1)
  return
  {
    filename = "__metal-and-stars-graphics__/graphics/entity/jellyfish-small/jellyfish-4.png",
    priority = "high",
    width = 128,
    height = 128,
    frame_count = 1,
    repeat_count = 1,
    animation_speed = 0.5,
    draw_as_glow = true,
    blend_mode = "additive",
    scale = 0.5,
    tint = tint1
  }
end

data:extend({
    {
      type = "unit",
      name = "glowing-jellyfish",
      icon = "__base__/graphics/icons/small-biter.png",
      flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
      max_health = 15,
      order = "b-b-a",
      subgroup="enemies",
      healing_per_tick = 0.01,
      selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
      collision_box = nil,
      collision_mask = {
         layers = {}
      },
      attack_parameters =
      {
        type = "projectile",
        range = 0.5,
        cooldown = 35,
        ammo_category = "melee",
        ammo_type = make_unit_melee_ammo_type_explode(6),
        -- sound = make_biter_roars(0.5),
        animation = jellyfish_animation({200, 225, 255})
      },
      vision_distance = 30,
      movement_speed = 0.2,
      distance_per_frame = 0.1,
      absorptions_to_join_attack = {gravitons = 10},
      distraction_cooldown = 300,
      -- corpse = "small-biter-corpse",
      dying_explosion = "void-explosion",
    --   dying_sound =  make_biter_dying_sounds(1.0),
    --   working_sound =  make_biter_calls(0.7),
      run_animation = jellyfish_animation({200, 225, 255})
    },
  --JELLYFISH SPAWNER
  {
    type = "unit-spawner",
    name = "jellyfish-spawner",
    icon = "__base__/graphics/icons/biter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-d-a",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
    working_sound =
    {
      sound = { filename = "__base__/sound/creatures/spawner.ogg", volume = 0.6, modifiers = volume_multiplier("main-menu", 0.7) },
      max_sounds_per_type = 3
    },
    dying_sound =
    {
      variations = sound_variations("__base__/sound/creatures/spawner-death", 5, 0.7, volume_multiplier("main-menu", 0.55) ),
      aggregation = { max_count = 2, remove = true, count_already_playing = true }
    },
    healing_per_tick = 0.02,
    collision_box = {{-2.0, -2.0}, {2.0, 2.0}},
    map_generator_bounding_box = {{-3.7, -3.2}, {3.7, 3.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.biter(),
    impact_category = "organic",
    -- in ticks per 1 pu
    absorptions_per_second = { gravitons = { absolute = 200, proportional = 0.01 } },
    -- corpse = "biter-spawner-corpse",
    -- dying_explosion = "biter-spawner-die",
    max_count_of_owned_units = 15,
    max_friends_around_to_spawn = 5,
    graphics_set =
    {
      animations =
      {
        layers = {
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/jellyfish-small/spawner/jelly-grape-emission.png",
            priority = "high",
            frame_count = 1,
            repeat_count = 1,
            width = 162,
            height = 130,
            draw_as_glow = true,
            blend_mode = "additive"
          }
        },
      }
    },

    result_units = {
      {"glowing-jellyfish", {{0.0, 0.3}, {0.6, 0.0}}},
    },
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {60, 60},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace = machina_enemy_autoplace.nix_spawner_autoplace("nix_spawner", "b[enemy]-c[spawner]-b[small]"),
    call_for_help_radius = 50,
    time_to_capture = 60 * 20,
  },
    {
    type = "explosion",
    name = "transport-belt-explosion",
    icon = "__base__/graphics/icons/transport-belt.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-a-a",
    height = 0,
    animations = util.empty_sprite (),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "transport-belt-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "transport-belt-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "transport-belt-wooden-splinter-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.016,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "transport-belt-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.32,
            initial_vertical_speed = 0.041,
            initial_vertical_speed_deviation = 0.042,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "void-explosion",
    localised_name = {"entity-name.explosion"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
    },
    order = "a-a-a",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations =   
    {
      {
        filename = "__metal-and-stars-graphics__/graphics/entity/jellyfish-small/void-explosion.png",
        draw_as_glow = true,
        blend_mode = "additive",
        priority = "high",
        line_length = 7,
        width = 180,
        height = 180,
        frame_count = 14,
        animation_speed = 1.5,
        shift = util.by_pixel(2,0),
        scale = 0.5,
        usage = "explosion"
      },
    },
    -- smoke = "smoke-fast",
    -- smoke_count = 2,
    -- smoke_slow_down_factor = 1,
    sound = sounds.small_explosion
  },
})


  