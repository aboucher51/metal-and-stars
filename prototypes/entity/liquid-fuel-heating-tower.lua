require ("sound-util")
require ("circuit-connector-sprites")
require ("util")
require ("__space-age__.prototypes.entity.circuit-network")
require ("__space-age__.prototypes.entity.space-platform-hub-cockpit")

local hit_effects = require("__base__.prototypes.entity.hit-effects")

data:extend({
{
    type = "reactor",
    name = "liquid-fuel-heating-tower",
    icon  = "__metal-and-stars-graphics__/graphics/icons/liquid-fuel-heating-tower.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "liquid-fuel-heating-tower"},
    max_health = 500,
    forced_symmetry = "horizontal",
    corpse = "heating-tower-remnants",
    dying_explosion = "heating-tower-explosion",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 10
      }
    },
    consumption = "500MW",
    neighbour_bonus = 0,
    energy_source =
    {
      type = "fluid",
      burns_fluid = true,
      emissions_per_minute = {pollution = 50},
      effectivity = 3,
      fluid_usage_per_tick = .1,
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.9,
        maximum_intensity = 1
      },
      fluid_box = {
        production_type = "input",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 200,
        secondary_draw_orders = { north = -1 },
        pipe_connections = {
          { flow_direction="input", direction = defines.direction.north, position = {0, -1} },
          { flow_direction="input", direction = defines.direction.east,  position = {1, 0} },
          { flow_direction="input", direction = defines.direction.south, position = {0, 1} },
          { flow_direction="input", direction = defines.direction.west,  position = {-1, 0} }
        }
      },

    },
    collision_box = {{-1.25, -1.25}, {1.25, 1.25}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,

    picture =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-main", {
         scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-shadow", {
          scale = 0.5,
          draw_as_shadow = true
        })
      }
    },

    working_light_picture =
    {
      layers = {
        util.sprite_load("__metal-and-stars-graphics__/graphics/entity/heating-tower/heating-tower-working-fire", {
          frame_count = 24,
          scale = 0.5,
          blend_mode = "additive",
          draw_as_glow = true,
          animation_speed = 0.333
        }),
        util.sprite_load("__metal-and-stars-graphics__/graphics/entity/heating-tower/heating-tower-working-light", {
          frame_count = 1,
          repeat_count = 24,
          scale = 0.5,
          blend_mode = "additive",
          draw_as_glow = true
        })
      }
    },

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "5MJ",
      max_transfer = "10GW",
      minimum_glow_temperature = 50,
      --heat_range = 2,
      connections =
      {
        {
          position = {-1, -1},
          direction = defines.direction.north
        },
        {
          position = {1, -1},
          direction = defines.direction.east
        },
        {
          position = {1, 1},
          direction = defines.direction.south
        },
        {
          position = {-1, 1},
          direction = defines.direction.west
        },
      },

    heat_picture = apply_heat_pipe_glow(
      util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-glow", {
        scale = 0.5,
        blend_mode = "additive"
      }))
    },

    connection_patches_connected =
    {
      sheet = util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes", {
        scale = 0.5,
        variation_count = 4
      })
    },

    connection_patches_disconnected =
    {
      sheet = util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes-disconnected", {
        scale = 0.5,
        variation_count = 4
      })
    },

    heat_connection_patches_connected =
    {
      sheet = apply_heat_pipe_glow(
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes-heat", {
        scale = 0.5,
        variation_count = 4
      }))
    },

    heat_connection_patches_disconnected =
    {
      sheet = apply_heat_pipe_glow(
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes-heat-disconnected", {
        scale = 0.5,
        variation_count = 4
      }))
    },

    open_sound = {filename = "__base__/sound/open-close/nuclear-open.ogg", volume = 0.8},
    close_sound = {filename = "__base__/sound/open-close/nuclear-close.ogg", volume = 0.8},
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity//heating-tower/heating-tower-loop.ogg", volume = 0.5},
      max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    default_temperature_signal = {type = "virtual", name = "signal-T"},
    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["heating-tower"]
  },
})