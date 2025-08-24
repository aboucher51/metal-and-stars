
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local snow_sounds = sound_variations("__space-age__/sound/walking/snow", 10, 0.8, volume_multiplier("main-menu", 2.9))
local icy_snow_sounds = sound_variations("__space-age__/sound/walking/icy-snow", 10, 0.8, volume_multiplier("main-menu", 2.9))
local ice_sounds = sound_variations("__space-age__/sound/walking/ice", 10, 0.8, volume_multiplier("main-menu", 2.9))
local smooth_ice_sounds = sound_variations("__space-age__/sound/walking/smooth-ice", 9, 0.8)
local frozen_concrete_sounds = sound_variations("__space-age__/sound/walking/frozen-concrete", 11, 0.8)

local nix_absorption = { gravitons    = 0.000010 }

local snow_driving_sound =
{
  sound =
    {
      filename = "__space-age__/sound/driving/vehicle-surface-snow.ogg", volume = 0.8,
      advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}}
    },
    fade_ticks = 6,
}
local ice_driving_sound =
{
  sound =
    {
      filename = "__space-age__/sound/driving/vehicle-surface-ice.ogg", volume = 0.5,
      advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}}
    },
    fade_ticks = 6
}

local function material_background(picture, count)
  return
  {
    transition = tile_graphics.generic_masked_tile_transitions1,
    material_background =
    {
      picture = picture,
      count = count,
      scale = 0.5
    }
  }
end

local ice_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/ice-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = {
      filename = "__space-age__/graphics/terrain/water-transitions/ice-patch.png",
      scale = 0.5,
      width = 64,
      height = 64
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dry-dirt-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  }
}

local ice_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/ice-2.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}

local snow_map_color_low = {156, 166, 181}
local snow_map_color_high = {190, 194, 197}
local smooth_ice_vehicle_speed_modifier = 1
local ice_vehicle_speed_modifier = 1.4
local snow_vehicle_speed_modifier = 1.8
local aquilo_tile_offset_frozen = 50
local aquilo_tile_offset_thawed = 60

data:extend({
  {
    type = "tile",
    name = "snow-patchy-grass",
    subgroup = "aquilo-tiles",
    order = "b[natural]-i[ice]-a[snow]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "snow_patchy"},
    layer = aquilo_tile_offset_frozen + 5,
    variants = material_background("__metal-and-stars-graphics__/graphics/terrain/snow-patchy-grass-8x.png", 8),

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = snow_sounds,
    landing_steps_sound = tile_sounds.landing.snow,
    driving_sound = snow_driving_sound,
    map_color = snow_map_color_low,
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = nix_absorption,
    vehicle_friction_modifier = snow_vehicle_speed_modifier,
    thawed_variant = "blue-grass-2",
    decorative_removal_probability = 1,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "ice-rough-nix",
    order = "b[natural]-i[ice]-a[rough]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "ice_rough"},
    layer = aquilo_tile_offset_frozen + 1,
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/aquilo/ice-rough.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),
    subgroup = "aquilo-tiles",

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = ice_sounds,
    landing_steps_sound = tile_sounds.landing.ice,
    driving_sound = ice_driving_sound,
    map_color = {100, 135, 177},
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = nix_absorption,
    vehicle_friction_modifier = ice_vehicle_speed_modifier,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
  {
    type = "tile",
    name = "ice-smooth-nix",
    subgroup = "aquilo-tiles",
    order = "b[natural]-i[ice]-c[smooth]",
    --minable = {mining_time = 0.1, result = "iceblock"},
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "ice_smooth"},
    layer = aquilo_tile_offset_frozen,
    variants = material_background("__space-age__/graphics/terrain/aquilo/ice-smooth.png", 4),

    transitions = ice_transitions,
    transitions_between_transitions = ice_transitions_between_transitions,

    walking_sound = smooth_ice_sounds,
    landing_steps_sound = tile_sounds.landing.ice,
    driving_sound = ice_driving_sound,
    map_color = {100, 135, 177},
    scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
    absorptions_per_second = nix_absorption,
    vehicle_friction_modifier = smooth_ice_vehicle_speed_modifier,
    trigger_effect = tile_trigger_effects.grass_1_trigger_effect()
  },
})




