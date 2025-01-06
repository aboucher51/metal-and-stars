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
        icon = "__space-age__/graphics/icons/biolab.png",
        minable = {mining_time = 0.5, result = "biolab"},
        subgroup = "production-machine",
        order = "z-z[z-lab]",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        max_health = 350,
        impact_category = "organic",
        alert_icon_shift = util.by_pixel(0, -12),
        icon_draw_specification = {shift = {0, -0.3}},
        corpse = "biolab-remnants",
        dying_explosion = "biolab-explosion",
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
            property = "pressure",
            min = 1000,
            max = 1000
          }
        },
        damaged_trigger_effect = hit_effects.entity(),
        on_animation = {
          layers = {
            util.sprite_load("__space-age__/graphics/entity/biolab/biolab-anim",{
              frame_count = 32,
              scale = 0.5,
              animation_speed = 0.2,
            }),
            util.sprite_load("__space-age__/graphics/entity/biolab/biolab-lights",{
              frame_count = 32,
              draw_as_glow = true,
              blend_mode = "additive",
              scale = 0.5,
              animation_speed = 0.2,
            }),
            util.sprite_load("__space-age__/graphics/entity/biolab/biolab-shadow",{
              frame_count = 32,
              scale = 0.5,
              animation_speed = 0.2,
              draw_as_shadow = true,
            })
          }
        },
        off_animation = {
          layers = {
            util.sprite_load("__space-age__/graphics/entity/biolab/biolab-anim",{
              frame_count = 32,
              scale = 0.5,
              animation_speed = 0.2,
            }),
            util.sprite_load("__space-age__/graphics/entity/biolab/biolab-shadow",{
              frame_count = 32,
              scale = 0.5,
              animation_speed = 0.2,
              draw_as_shadow = true,
            })
          }
        },
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        working_sound =
        {
          sound = {filename = "__space-age__/sound/entity/biolab/biolab-loop.ogg", volume = 0.7},
          sound_accents =
          {
            {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-push", 3, 0.3)}, frame = 1, audible_distance_modifier = 0.6},
            {sound = {variations = sound_variations("__space-age__/sound/entity/biolab/biolab-beaker", 7, 0.8)}, frame = 1, audible_distance_modifier = 0.4},
            {sound = {variations = sound_variations("__space-age__/sound/entity/biolab/biolab-centrifuge", 4, 0.7)}, frame = 14, audible_distance_modifier = 0.3},
            {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-pull", 3, 0.3)}, frame = 17, audible_distance_modifier = 0.6},
          },
          max_sounds_per_type = 2,
        },
        researching_speed = 2,
        inputs =
        {
          "space-science-pack",
          "metallurgic-science-pack",
          "agricultural-science-pack",
          "electromagnetic-science-pack",
          "cryogenic-science-pack",
          "promethium-science-pack",
          "nanite-science-pack",
          "ring-science-pack",
          "anomaly-science-pack",
          "quantum-science-pack",
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
        type = "recipe",
        name = "microgravity-lab",
        energy_required = 10,
        ingredients =
        {
          {type = "item", name = "lab", amount = 1},
        },
        results = {{type="item", name="microgravity-lab", amount=1}},
        enabled = false
      },
      {
        type = "item",
        name = "microgravity-lab",
        icon = "__space-age__/graphics/icons/biolab.png",
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