local make_unit_melee_ammo_type = function(damage_value)
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
            type = "damage",
            damage = { amount = damage_value , type = "physical"}
          }
        }
      }
    }
  end
local function jellyfish_animation(tint1)
    return
    {
      layers = {
          {
              filename = "__metal-and-stars-graphics__/graphics/entity/robot-enemies/construction-bot_animation.png",
              priority = "high",
              line_length = 16,
              width = 256,
              height = 256,
              scale = 0.5,
              frame_count = 1,
              shift = {0.0, -0.0},
              direction_count = 16,
          },
          {
              filename = "__metal-and-stars-graphics__/graphics/entity/robot-enemies/construction-bot_emission.png",
              priority = "high",
              line_length = 16,
              width = 256,
              height = 256,
              scale = 0.5,
              frame_count = 1,
              shift = {0.0, -0.0},
              direction_count = 16,
              draw_as_glow = true,
              blend_mode = "additive",
          },
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/robot-enemies/construction-bot_shadows.png",
            priority = "high",
            line_length = 16,
            width = 256,
            height = 256,
            scale = 0.5,
            frame_count = 1,
            shift = util.by_pixel(25.5, 39),
            direction_count = 16,
            draw_as_shadow = true,
        },
      }
    }
  end

data:extend({
    {
      type = "unit",
      name = "hostile-construction-bot",
      icon = "__base__/graphics/icons/small-biter.png",
      flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
      max_health = 15,
      order = "b-b-a",
      subgroup="enemies",
      healing_per_tick = 0.01,
      collision_box = {{0, 0}, {0, 0}},
      selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
      attack_parameters =
      {
        type = "beam",
        cooldown = 40,
        range = 24,
        range_mode = "center-to-bounding-box",
        source_direction_count = 64,
        source_offset = {0, -3.423489 / 4},
        damage_modifier = 2,
        ammo_category = "metal-and-stars-hostile-bot-laser",
        ammo_type =
        {
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "beam",
              beam = "laser-beam",
              max_length = 24,
              duration = 40,
              source_offset = {0, -1.31439 }
            }
          }
        },
        animation = jellyfish_animation({200, 225, 255})
      },
      vision_distance = 30,
      movement_speed = 0.2,
      distance_per_frame = 0.1,
      absorptions_to_join_attack = {pollution = 10},
      distraction_cooldown = 300,
      -- corpse = "small-biter-corpse",
      dying_explosion = "construction-robot-explosion",
    --   dying_sound =  make_biter_dying_sounds(1.0),
    --   working_sound =  make_biter_calls(0.7),
      run_animation = jellyfish_animation({200, 225, 255})
    },
  --JELLYFISH SPAWNER
  {
    type = "unit-spawner",
    name = "robot-spawner",
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
    -- damaged_trigger_effect = hit_effects.flying_robot(),
    impact_category = "organic",
    -- in ticks per 1 pu
    absorptions_per_second = { pollution = { absolute = 20, proportional = 0.01 } },
    -- corpse = "biter-spawner-corpse",
    -- dying_explosion = "biter-spawner-die",
    max_count_of_owned_units = 7,
    max_friends_around_to_spawn = 5,
    graphics_set =
    {
      animations =
      {
        layers = {
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/robot-enemies/spawner.png",
            priority = "high",
            frame_count = 1,
            repeat_count = 1,
            width = 536,
            height = 497,
            scale = 0.5,
            shift = util.by_pixel( 42, -30),
          }
        },
      }
    },

    result_units = {
      {"hostile-construction-bot", {{0.0, 0.3}, {0.6, 0.0}}},
    },
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace = {probability_expression = "ringworld_robot_enemy_base_probability", force = "ringworld_robots"},
    call_for_help_radius = 50,
    time_to_capture = 60 * 20,
  },

})