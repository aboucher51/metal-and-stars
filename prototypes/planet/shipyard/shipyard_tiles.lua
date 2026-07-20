local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__base__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local lava_to_out_of_map_transition = space_age_tiles_util.lava_to_out_of_map_transition
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local space_platform_tile_animations = require("__space-age__/prototypes/tile/platform-tile-animations")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition

local empty_space_destroyed_item_trigger =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    source_effects =
    {
      type = "create-trivial-smoke",
      smoke_name = "light-smoke",
      offset_deviation = {{-0.1, -0.1}, {0.1, 0.1}},
      starting_frame_deviation = 5
    }
  }
}

data:extend
{
      {
        type = "noise-expression",
        name = "shipyard_starting_tile",
        expression = "(x>-25)*(x<25)*(y>-25)*(y<25)"
      },
      {
        type = "noise-expression",
        name = "shipyard_starting_machine",
        expression = "(x==20)*(y==20)"
      },
      {
        type = "noise-expression",
        name = "shipyard_starting_conduit",
        expression = "(x==-20)*(y==-20)"
      },
      {
        type = "noise-expression",
        name = "shipyard_starting_goo",
        expression = "(x==20)*(y==-20)"
      },
      {
        type = "noise-expression",
        name = "shipyard_tiles_mask",
        expression = "((x-65)%115<100) * ((y-65)%115<100)"
      },
      {
        type = "noise-expression",
        name = "shipyard_destruction_mask",
        expression = [[
          1 - multioctave_noise{
              x = x,
              y = y,
              persistence = 0.5,
              seed0 = map_seed,
              seed1 = 12387,
              octaves = 2,
              input_scale = 1/8,
              output_scale = 1
          }
      ]]
      },
      {
        type = "noise-expression",
        name = "shipyard_valid_mask",
        expression = "(shipyard_tiles_mask * shipyard_destruction_mask) - shipyard_starting_tile"
      },
      {
        type = "noise-expression",
        name = "shipyard_invalid_mask",
        expression = "1 - shipyard_valid_mask"
      },
      {
        type = "noise-expression",
        name = "grey_goo_noise",
        expression = "(vulcanus_sulfuric_acid_region_patchy*shipyard_valid_mask) - shipyard_starting_tile"
      },
      {
        type = "noise-expression",
        name = "shipyard_crafting_machine_noise",
        expression = "max((((x%80==0)*(y%50==0)) * shipyard_valid_mask), shipyard_starting_machine)"
      },
      {
        type = "noise-expression",
        name = "shipyard_conduit_noise",
        expression = "max((((x%60==0)*(y%90==0)) * shipyard_valid_mask), shipyard_starting_conduit)"
      },
      {
        type = "tile-effect",
        name = "space",
        shader = "space",
        space = {}
      },
      {
        name = "empty-space-shipyard",
        type = "tile",
        order = "z[other]-b[empty-space]",
        subgroup = "special-tiles",
        collision_mask =
        {
          layers=
          {
            ground_tile=true,
            water_tile=true,
            empty_space=true,
            resource=true,
            floor=true,
            item=true,
            object=true,
            player=true,
            doodad=true
          },
        },
        layer_group = "zero",
        layer = 0,
        destroys_dropped_items = true,
        default_destroyed_dropped_item_trigger = empty_space_destroyed_item_trigger,
        effect = "space",
        effect_color = {0.5, 0.507, 0},
        effect_color_secondary = { 0, 68, 25 },
        particle_tints =
        {
          primary = {0, 0, 0, 0},
          secondary = {0, 0, 0, 0},
        },
        variants =
        {
          main =
          {
            {
              picture = "__space-age__/graphics/terrain/empty-space.png",
              count = 1,
              size = 1
            }
          },
          empty_transitions = true
        },
        map_color = {0, 0, 0},
        absorptions_per_second = tile_pollution.out_of_map,
        autoplace = {probability_expression = .5},
        default_cover_tile = "space-platform-foundation"
      },
      {
        type = "tile",
        name = "space-platform-foundation-shipyard",
        order = "a[shipyard]-d[utility]-b[space-platform-foundation]",
        subgroup = "artificial-tiles",
        autoplace = {probability_expression = "max((shipyard_tiles_mask * shipyard_destruction_mask), shipyard_starting_tile)"},
        minable = {mining_time = 0.5, result = "space-platform-foundation"},
        mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg", volume = 0.8}, -- sound?
        is_foundation = true,
        allows_being_covered = false,
        max_health = 50,
        weight = 200,
        collision_mask = tile_collision_masks.ground(),
        layer = 15,
        dying_explosion = "space-platform-foundation-explosion",
        trigger_effect = tile_trigger_effects.landfill_trigger_effect(),
    
        bound_decoratives =
        {
          "space-platform-decorative-pipes-2x1",
          "space-platform-decorative-pipes-1x2",
          "space-platform-decorative-pipes-1x1",
          "space-platform-decorative-4x4",
          "space-platform-decorative-2x2",
          "space-platform-decorative-1x1",
          "space-platform-decorative-tiny",
        },
    
        build_animations = space_platform_tile_animations.top_animation,
        build_animations_background = space_platform_tile_animations.animation,
        built_animation_frame = 32,
    
        sprite_usage_surface = "space",
        variants =
        {
          main =
          {
            {
              picture = "__space-age__/graphics/terrain/space-platform/space-platform-1x1.png",
              count = 16,
              size = 1,
              scale = 0.5
            },
            {
              picture = "__space-age__/graphics/terrain/space-platform/space-platform-2x2.png",
              count = 16,
              size = 2,
              probability = 0.75,
              scale = 0.5
            },
          },
          transition =
          {
            --background_layer_offset = 1,
            --background_layer_group = "zero",
            --offset_background_layer_by_tile_layer = true,
            draw_background_layer_under_tiles = true,
            --outer_corner_variations_in_group = 8,
            side_variations_in_group = 16,
            double_side_variations_in_group = 4,
    
            overlay_layout =
            {
              inner_corner =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-inner-corner.png",
                count = 16,
                scale = 0.5
              },
              outer_corner =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-outer-corner.png",
                count = 16,
                scale = 0.5
              },
              side =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-side.png",
                count = 32,
                scale = 0.5
              },
              double_side =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-double-side.png",
                count = 8,
                scale = 0.5
              },
              u_transition =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u.png",
                count = 4,
                scale = 0.5
              },
              o_transition =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-o.png",
                count = 1,
                scale = 0.5
              }
            },
            background_layout =
            {
              inner_corner =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-inner-corner-background.png",
                count = 16,
                scale = 0.5,
                tile_height = 8
              },
              outer_corner =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-outer-corner-background.png",
                count = 16,
                scale = 0.5,
                tile_height = 8
              },
              side =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-side-background.png",
                count = 32,
                scale = 0.5,
                tile_height = 8
              },
              double_side =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-double-side-background.png",
                count = 8,
                scale = 0.5,
                tile_height = 8
              },
              u_transition =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u-background.png",
                count = 4,
                scale = 0.5,
                tile_height = 8
              },
              o_transition = nil
            },
            mask_layout =
            {
              inner_corner =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-inner-corner-mask.png",
                count = 16,
                scale = 0.5
              },
              outer_corner =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-outer-corner-mask.png",
                count = 16,
                scale = 0.5
              },
              side =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-side-mask.png",
                count = 32,
                scale = 0.5
              },
              double_side =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-double-side-mask.png",
                count = 8,
                scale = 0.5
              },
              u_transition =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u-mask.png",
                count = 4,
                scale = 0.5
              },
              o_transition =
              {
                spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-o-mask.png",
                count = 1,
                scale = 0.5
              }
            }
          },
    
          -- material_background =
          -- {
          --   picture = "__space-age__/graphics/terrain/space-platform/space-platform.png",
          --   count = 8,
          --   scale = 0.5
          -- }
        },
    
        walking_sound = concrete_sounds,
        build_sound = space_platform_tile_build_sounds,
        map_color = {63, 61, 59},
        scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000}
      },
  ----- Gray Goo
  {
    name = "gray-goo-tile",
    type = "tile",
    order = "a[oil]-b[deep]",
    subgroup = "fulgora-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "grey_goo_noise"},
    layer = 3,
    layer_group = "water",
    map_color = { 49*1.15, 31*1.15, 35*1.15},
    walking_speed_modifier = 0.5,
    vehicle_friction_modifier = 10,
    default_cover_tile = "foundation",
    absorptions_per_second = tile_pollution.water,
    fluid = "gray-goo",
    effect = "gray-goo-effect",
    effect_color = { 204,204,204 }, --brown
    effect_color_secondary = { 170,170,170 }, --dark gray
    particle_tints = tile_graphics.fulgora_oil_ocean_particle_tints,
    sprite_usage_surface = "fulgora",
    variants = tile_variations_template_with_transitions(
      "__metal-and-stars-graphics__/graphics/terrain/gray-goo-ocean.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions),
    transitions_between_transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions_between_transitions),
    walking_sound = sound_variations("__space-age__/sound/walking/oil-deep", 10, 0.35, volume_multiplier("main-menu", 2.9)),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/oil-gloop", 10, 0.15),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 15
    },
    landing_steps_sound = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 2.9)),
    trigger_effect = tile_trigger_effects.water_trigger_effect(),
  },
  ----- Gray Goo effect
  {
    type = "tile-effect",
    name = "gray-goo-effect",
    shader = "water",
    water =
    {
      shader_variation = "oil",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/oilNoise.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/oil-ocean-deep-shader.png",
          width = 512 * 4,
          height = 512 * 2
        },
        --gradient map for thin film effect
        {
          filename = "__metal-and-stars-graphics__/graphics/terrain/gray-goo-gradient.png",
          width = 512,
          height = 32
        },
        --specular highligts
        {
          filename = "__metal-and-stars-graphics__/graphics/terrain/gray-goo-spec.png",
          width = 512 * 4,
          height = 512 * 2
        },
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      specular_lightness = { 3, 3, 3 },
      foam_color = {140,60,60}, -- #4e3838ff,
      foam_color_multiplier = 0.1,

      animation_speed = 1.500,
      animation_scale = {3, 3},

      dark_threshold = {2.000, 2.000},
      reflection_threshold = {5.00, 5.00},
      specular_threshold = {0.000, 0.000},
      tick_scale = 1.000,

      near_zoom = 0.063,
      far_zoom = 0.063,
    }
  }
}
