local sounds = require("__base__.prototypes.entity.sounds")
local resource_autoplace = require("resource-autoplace")

resource_autoplace.initialize_patch_set("mirandite", true)

local stone_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-stone.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}
local oil_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-oil.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}

  data:extend({
      {
        type = "resource",
        name = "iron-copper-ore",
        icon = "__metal-and-stars-graphics__/graphics/icons/autoplace-icons/copper-iron-icon.png",
        flags = {"placeable-neutral"},
        order="a-b-".."b",
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          -- mining_particle = "mirandite" .. "-particle",
          mining_time = 1,
          results =
          {
            {
              type = "item",
              name = "iron-ore",
              probability = 0.4,
              amount = 1
            },
            {
              type = "item",
              name = "copper-ore",
              probability = 0.6,
              amount = 1
            }
          },
        },
        category = "basic-solid",
        subgroup = "raw-resource",
        walking_sound = sounds.ore,
        driving_sound = stone_driving_sound,
        collision_mask = nil,
        collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
        {
          name = "nix_copper_iron_ore",
          order = "a-b-".."b",
          base_density = 100,
          -- base_spots_per_km = autoplace_parameters.base_spots_per_km2,
          has_starting_area_placement = true,
          regular_rq_factor_multiplier = 1.10,
          starting_rq_factor_multiplier = 1.5,
          random_spot_size_minimum = .1,
          random_spot_size_maximum = .2,
          candidate_spot_count = 22,
          -- tile_restriction = autoplace_parameters.tile_restriction
        },
        stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/ores/mixed-metal.png",
            priority = "extra-high",
            size = 128,
            frame_count = 8,
            variation_count = 8,
            scale = 0.5
          }
        },
        map_color = {0.803, 0.388, 0.215},
        mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
        -- factoriopedia_simulation = resource_parameters.factoriopedia_simulation
      },
      {
        type = "resource",
        name = "coal-stone-ore",
        icon = "__metal-and-stars-graphics__/graphics/icons/autoplace-icons/coal-stone-icon.png",
        flags = {"placeable-neutral"},
        order="a-b-".."b",
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          -- mining_particle = "mirandite" .. "-particle",
          mining_time = 1,
          results =
          {
            {
              type = "item",
              name = "stone",
              probability = 0.5,
              amount = 1
            },
            {
              type = "item",
              name = "coal",
              probability = 0.5,
              amount = 1
            }
          },
        },
        category = "basic-solid",
        subgroup = "raw-resource",
        walking_sound = sounds.ore,
        driving_sound = stone_driving_sound,
        collision_mask = nil,
        collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
        {
          name = "nix_coal_stone_ore",
          order = "a-b-".."b",
          base_density = 100,
          -- base_spots_per_km = autoplace_parameters.base_spots_per_km2,
          has_starting_area_placement = true,
          regular_rq_factor_multiplier = 1.10,
          starting_rq_factor_multiplier = 1.5,
          random_spot_size_minimum = .1,
          random_spot_size_maximum = .2,
          candidate_spot_count = 22,
          -- tile_restriction = autoplace_parameters.tile_restriction
        },
        stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/ores/mixed-mineral.png",
            priority = "extra-high",
            size = 128,
            frame_count = 8,
            variation_count = 8,
            scale = 0.5
          }
        },
        map_color = {0.690, 0.611, 0.427},
        mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
        -- factoriopedia_simulation = resource_parameters.factoriopedia_simulation
      },
      {
        type = "resource",
        name = "dark-matter-vent",
        icon = "__metal-and-stars-graphics__/graphics/icons/autoplace-icons/dark-matter-vent.png",
        flags = {"placeable-neutral"},
        category = "basic-fluid",
        subgroup = "mineable-fluids",
        order="b",
        infinite = true,
        highlight = true,
        minimum = 20000,
        normal = 100000,
        infinite_depletion_amount = 10,
        resource_patch_search_radius = 16,
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          mining_time = 1,
          results =
          {
            {
              type = "fluid",
              name = "dark-matter-fluid",
              amount_min = 1,
              amount_max = 1,
              probability = 1
            }
          }
        },
        walking_sound = sounds.oil,
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
        {
          name = "nix_dark_matter",
          order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
          base_density = 8.2,
          base_spots_per_km2 = 1.8,
          random_probability = 1/48,
          random_spot_size_minimum = 1,
          random_spot_size_maximum = 1, -- don't randomize spot size
          additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
          has_starting_area_placement = true,
          regular_rq_factor_multiplier = 1
        },
        stage_counts = {0},
        stages =
        {
          layers =
          {
            {
                filename = "__metal-and-stars-graphics__/graphics/entity/geysers/geyser-vent-snow.png",
                priority = "extra-high",
                frame_count = 4,
                scale = 0.5,
                width = 194,
                height = 136,
                shift = util.by_pixel( -0.5, -3.0),
                line_length = 4,  
            },
            {
              filename = "__metal-and-stars-graphics__/graphics/entity/geysers/geyser-vent-emission-purple.png",
              priority = "extra-high",
              frame_count = 4,
              scale = 0.5,
              width = 194,
              height = 136,
              shift = util.by_pixel( -0.5, -3.0),
              line_length = 4,  
              draw_as_glow = true,
              blend_mode = "additive"
            },
          }
        },
        draw_stateless_visualisation_under_building = false,
        stateless_visualisation =
        {
          {
            count = 1,
            render_layer = "smoke",
            animation = {
              filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-inner.png",
              frame_count = 47,
              line_length = 16,
              width = 40,
              height = 84,
              animation_speed = 0.5,
              shift = util.by_pixel(0, 24 -78),
              scale = 1.5,
              tint = util.multiply_color({r=0, g=0.9, b=1}, 0.1)
            }
          }
        },
        map_color = {28, 0, 28},
        map_grid = false,
        --created_effect = create_tiles("snow-patchy")
      },
      {
        type = "resource",
        name = "crude-slush",
        icon = "__base__/graphics/icons/crude-oil-resource.png",
        flags = {"placeable-neutral"},
        category = "basic-fluid",
        subgroup = "mineable-fluids",
        order="a-b-a",
        infinite = true,
        highlight = true,
        minimum = 60000,
        normal = 300000,
        infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          mining_time = 1,
          results =
          {
            {
              type = "fluid",
              name = "crude-slush",
              amount_min = 10,
              amount_max = 50,
              probability = 1
            }
          }
        },
        walking_sound = sounds.oil,
        driving_sound = oil_driving_sound,
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
        {
          name = "nix_crude_slush",
          order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
          base_density = 8.2,
          base_spots_per_km2 = 1.8,
          random_probability = 1/48,
          random_spot_size_minimum = 1,
          random_spot_size_maximum = 1, -- don't randomize spot size
          additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
          has_starting_area_placement = true,
          regular_rq_factor_multiplier = 1
        },
        stage_counts = {0},
        stages =
        {
          layers = {
            util.sprite_load("__base__/graphics/entity/crude-oil/crude-oil",
            {
              priority = "extra-high",
              scale = 0.5,
              variation_count = 1,
              frame_count = 4,
            }),
            util.sprite_load("__metal-and-stars-graphics__/graphics/entity/geysers/crude-slush-ice",
            {
              priority = "extra-high",
              scale = 0.5,
              variation_count = 1,
              frame_count = 4,
              draw_as_glow = true,
            }),
          }
        },
        draw_stateless_visualisation_under_building = false,
        map_color = {0.78, 0.2, 0.77},
        map_grid = false
      },
      {
        type = "resource",
        name = "heavy-water-vent",
        icon = "__metal-and-stars-graphics__/graphics/icons/autoplace-icons/heavy-water-vent.png",
        flags = {"placeable-neutral"},
        category = "basic-fluid",
        subgroup = "mineable-fluids",
        order="a-b-a",
        infinite = true,
        highlight = true,
        minimum = 20000,
        normal = 100000,
        infinite_depletion_amount = 10,
        resource_patch_search_radius = 16,
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          mining_time = 1,
          results =
          {
            {
              type = "fluid",
              name = "heavy-water",
              amount_min = 10,
              amount_max = 10,
              probability = 1
            }
          }
        },
        walking_sound = sounds.oil,
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace =
        {
          order="a[resources]-a[heavy-water]",
          probability_expression = 'ringworld_heavy_water_probability',
          tile_restriction = {"undergrowth-thin", "undergrowth-thin-dark", "undergrowth-thick", "undergrowth-thick-dark"},
          richness_expression = "ringworld_heavy_water_richness"
        },
        stage_counts = {0},
        stages =
        {
          layers =
          {
            {
                filename = "__metal-and-stars-graphics__/graphics/entity/geysers/geyser-vent-sandstone.png",
                priority = "extra-high",
                frame_count = 4,
                scale = 0.5,
                width = 194,
                height = 136,
                shift = util.by_pixel( -0.5, -3.0),
                line_length = 4,  
            },
          }
        },
        draw_stateless_visualisation_under_building = false,
        stateless_visualisation =
        {
          {
            count = 1,
            render_layer = "decorative",
            animation = util.sprite_load("__metal-and-stars-graphics__/graphics/entity/geysers/boiling-water-animation",
            {
              priority = "extra-high",
              scale = 0.5,
              frame_count = 32,
              shift = util.by_pixel( -0.5, -3.0),
              animation_speed = 0.2,
              blend_mode = "additive",
            })
          },
        },
        map_color = {0.0, 0.8, 1.0},
        map_grid = false,
        --created_effect = create_tiles("snow-patchy")
      },
      {
        type = "resource",
        name = "gold-sands",
        icon = "__metal-and-stars-graphics__/graphics/icons/autoplace-icons/gold-sand-icon.png",
        flags = {"placeable-neutral"},
        order="a-b-a",
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          mining_time = 1,
          fluid_amount = 10,
          required_fluid = "water",
          results =
          {
            {
              type = "item",
              name = "gold-ore",
              probability = 0.2,
              amount = 1
            },
            {
              type = "item",
              name = "silica-sand",
              probability = 0.8,
              amount = 1
            }
          },
        },
        category = "basic-solid",
        subgroup = "raw-resource",
        walking_sound = sounds.ore,
        driving_sound = stone_driving_sound,
        collision_mask = nil,
        collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace =
        {
          probability_expression = 'ringworld_gold',
          tile_restriction = {"sand-1-ringworld", "sand-2-ringworld"},
          richness_expression = "ringworld_gold_richness"
        },
        stage_counts = {15000, 2000},
        stages =
        {
          sheet =
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/ores/gold-ore.png",
            priority = "extra-high",
            size = 128,
            frame_count = 8,
            variation_count = 2,
            scale = 0.5
          }
        },
        map_color = {1, 0.85, 0},
        mining_visualisation_tint = {r = 1, g = 0.85, b = 0, a = 1.000},
        -- factoriopedia_simulation = resource_parameters.factoriopedia_simulation
      },
      {
        type = "resource",
        name = "military-scrap",
        icon = "__metal-and-stars-graphics__/graphics/icons/autoplace-icons/military-scrap-icon.png",
        flags = {"placeable-neutral"},
        order="a-b-a",
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          -- mining_particle = "mirandite" .. "-particle",
          mining_time = 1,
          results =
          {
            {
              type = "item",
              name = "copper-plate",
              probability = 0.25,
              amount = 1
            },
            {
              type = "item",
              name = "stone",
              probability = 0.5,
              amount = 1
            },
            {
              type = "item",
              name = "stone-wall",
              probability = 0.3,
              amount = 1
            },
            {
              type = "item",
              name = "tank",
              probability = 0.001,
              amount = 1
            },
            {
              type = "item",
              name = "tesla-ammo",
              probability = 0.03,
              amount = 1
            },
            {
              type = "item",
              name = "solar-panel-equipment",
              probability = 0.05,
              amount = 1
            },
            {
              type = "item",
              name = "toolbelt-equipment",
              probability = 0.02,
              amount = 1
            },
            {
              type = "item",
              name = "rail",
              probability = 0.1,
              amount = 1
            },
            {
              type = "item",
              name = "rocket-launcher",
              probability = 0.05,
              amount = 1
            },
            {
              type = "item",
              name = "piercing-rounds-magazine",
              probability = 0.1,
              amount = 1
            },
          },
        },
        category = "basic-solid",
        subgroup = "raw-resource",
        walking_sound = sounds.ore,
        driving_sound = stone_driving_sound,
        collision_mask = nil,
        collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace =
        {
          probability_expression = 'ringworld_weaponry',
          tile_restriction = {"sand-1-ringworld", "sand-2-ringworld"},
          richness_expression = "ringworld_weaponry_richness"
        },
        stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/ores/military-scrap.png",
            priority = "extra-high",
            size = 128,
            frame_count = 8,
            variation_count = 8,
            scale = 0.5
          }
        },
        map_color = {0.11, 0.4, 0.3},
        mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
        -- factoriopedia_simulation = resource_parameters.factoriopedia_simulation
      },
      {
        type = "resource",
        name = "ringworld-detritus",
        icon = "__metal-and-stars-graphics__/graphics/icons/autoplace-icons/detritus-icon.png",
        flags = {"placeable-neutral"},
        order="a-b-a",
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          -- mining_particle = "mirandite" .. "-particle",
          mining_time = 1,
          results =
          {
            {
              type = "item",
              name = "bitumen",
              probability = 1,
              amount = 1
            },
          },
          {
            {
              type = "item",
              name = "iron-ore",
              probability = 0.2,
              amount = 1
            },
          },
        },
        category = "basic-solid",
        subgroup = "raw-resource",
        walking_sound = sounds.ore,
        driving_sound = stone_driving_sound,
        collision_mask = nil,
        collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace =
        {
          probability_expression = 'ringworld_detritus',
          tile_restriction = {"undergrowth-thin", "undergrowth-thin-dark", "undergrowth-thick", "undergrowth-thick-dark"},
          richness_expression = "ringworld_detritus_richness"
        },
        stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
            filename = "__metal-and-stars-graphics__/graphics/entity/ores/detritus.png",
            priority = "extra-high",
            size = 128,
            frame_count = 8,
            variation_count = 8,
            scale = 0.5
          }
        },
        map_color = {0.3, 0.05, 0.05},
        mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
        -- factoriopedia_simulation = resource_parameters.factoriopedia_simulation
      },
  })