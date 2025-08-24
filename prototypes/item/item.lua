local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local meld = require("meld")

local function instrument_sound(filename)
  return
  {
    filename = "__base__/sound/programmable-speaker/"..filename..".ogg",
    volume = .1,
    aggregation = {max_count = 1, remove = true},
  }
end

data:extend({
    {
      type = "module",
      name = "overclock-module",
      localised_description = {"item-description.overclock-module"},
      icon = "__metal-and-stars-graphics__/graphics/icons/pollution-module-1.png",
      subgroup = "module",
      color_hint = { text = "P" },
      category = "overclock",
      tier = 1,
      order = "c[overclock]-a[overclock-module-1]",
      inventory_move_sound = item_sounds.module_inventory_move,
      pick_sound = item_sounds.module_inventory_pickup,
      drop_sound = item_sounds.module_inventory_move,
      stack_size = 50,
      weight = 20 * kg,
      effect =
      {
        productivity = 0.04,
        consumption = 0.8,
      }
    },
    {
      type = "module",
      name = "overclock-module-2",
      localised_description = {"item-description.overclock-module"},
      icon = "__metal-and-stars-graphics__/graphics/icons/pollution-module-2.png",
      subgroup = "module",
      color_hint = { text = "P" },
      category = "overclock",
      tier = 2,
      order = "c[overclock]-b[overclock-module-2]",
      inventory_move_sound = item_sounds.module_inventory_move,
      pick_sound = item_sounds.module_inventory_pickup,
      drop_sound = item_sounds.module_inventory_move,
      stack_size = 50,
      weight = 20 * kg,
      effect =
      {
        productivity = 0.06,
        consumption = 1.2,
      }
    },
    {
      type = "module",
      name = "overclock-module-3",
      localised_description = {"item-description.overclock-module"},
      icon = "__metal-and-stars-graphics__/graphics/icons/pollution-module-3.png",
      subgroup = "module",
      color_hint = { text = "P" },
      category = "overclock",
      tier = 3,
      order = "c[overclock]-c[overclock-module-3]",
      inventory_move_sound = item_sounds.module_inventory_move,
      pick_sound = item_sounds.module_inventory_pickup,
      drop_sound = item_sounds.module_inventory_move,
      stack_size = 50,
      weight = 20 * kg,
      default_import_location = "nix",
      effect =
      {
        productivity = 0.1,
        consumption = 1.6,
      }
    },
    {
      type = "item",
      name = "mirandite-asteroid-chunk",
      icon = "__metal-and-stars-graphics__/graphics/icons/mirandite-asteroid-chunk.png",
      subgroup = "space-material",
      order = "b[mirandite]-e[chunk]",
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      stack_size = 1,
      weight = 100 * kg,
    },
    {
      type = "item",
      name = "thorium",
      icon = "__metal-and-stars-graphics__/graphics/icons/thorium.png",
      subgroup = "uranium-processing",
      order = "a[uranium-processing]-c[uranium-238]",
      inventory_move_sound = item_sounds.nuclear_inventory_move,
      pick_sound = item_sounds.nuclear_inventory_pickup,
      drop_sound = item_sounds.nuclear_inventory_move,
      stack_size = 100,
      weight = 50*kg
    },
    {
      type = "item",
      name = "uranium-233",
      icon = "__metal-and-stars-graphics__/graphics/icons/uranium-233.png",
      pictures =
      {
        layers =
        {
          {
            size = 64,
            filename = "__metal-and-stars-graphics__/graphics/icons/uranium-233.png",
            scale = 0.5,
            mipmap_count = 4
          },
          {
            draw_as_light = true,
            blend_mode = "additive",
            size = 64,
            filename = "__metal-and-stars-graphics__/graphics/icons/uranium-233.png",
            scale = 0.5,
            tint = {0.3, 0.3, 0.3, 0.3}
          }
        }
      },
      subgroup = "uranium-processing",
      order = "a[uranium-processing]-c[uranium-233]",
      inventory_move_sound = item_sounds.nuclear_inventory_move,
      pick_sound = item_sounds.nuclear_inventory_pickup,
      drop_sound = item_sounds.nuclear_inventory_move,
      stack_size = 100,
      weight = 50*kg
    },
    {
      type = "item",
      name = "empty-fuel-canister",
      icon = "__metal-and-stars-graphics__/graphics/icons/empty-fuel-canister.png",
      subgroup = "nix-processes",
      order = "j[ice]",
      inventory_move_sound = space_age_item_sounds.ice_inventory_move,
      pick_sound = space_age_item_sounds.ice_inventory_pickup,
      drop_sound = space_age_item_sounds.ice_inventory_move,
      stack_size = 50,
      weight = 1 * kg,
      random_tint_color = item_tints.ice_blue
    },
    -- OSTENDUS ITEMS
    {
        type = "item",
        name = "quantite-a",
        icon = "__metal-and-stars-graphics__/graphics/icons/quantite.png",
        pictures =
        {
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite-1.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite-2.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite-3.png", scale = 0.5, mipmap_count = 4}
        },
        subgroup = "quantum-processing",
        order = "d[quantum]-a",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        spoil_ticks = 1 * minute,
        spoil_result = "quantite-b",
        weight = 2 * kg
      },
      {
        type = "item",
        name = "quantite-b",
        icon = "__metal-and-stars-graphics__/graphics/icons/quantite.png",
        pictures =
        {
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite-1.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite-2.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite-3.png", scale = 0.5, mipmap_count = 4}
        },
        subgroup = "quantum-processing",
        order = "d[quantum]-a",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        spoil_ticks = 1 * minute,
        spoil_result = "quantite-c",
        weight = 2 * kg
      },
      {
        type = "item",
        name = "quantite-c",
        icon = "__metal-and-stars-graphics__/graphics/icons/quantite.png",
        pictures =
        {
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite-1.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite-2.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/quantite-3.png", scale = 0.5, mipmap_count = 4}
        },
        subgroup = "quantum-processing",
        order = "d[quantum]-a",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        spoil_ticks = 1 * minute,
        spoil_result = "quantite-a",
        weight = 2 * kg
      },


      {
        type = "item",
        name = "quantum-shard-a",
        icon = "__metal-and-stars-graphics__/graphics/icons/material-crystal.png",
        pictures =
        {
          layers =
          {
            {
              size = 64,
              filename = "__metal-and-stars-graphics__/graphics/icons/material-crystal.png",
              scale = 0.5,
              mipmap_count = 4
            },
            {
              draw_as_light = true,
              blend_mode = "additive",
              size = 64,
              filename = "__metal-and-stars-graphics__/graphics/icons/material-crystal-glow.png",
              scale = 0.5,
              tint = {0.3, 0.0, 0.0, .3}
            }
          }
        },
        subgroup = "quantum-processing",
        order = "d[quantum]-a",
        inventory_move_sound = instrument_sound("celesta-28"),
        pick_sound = instrument_sound("celesta-30"),
        drop_sound = instrument_sound("celesta-28"),
        stack_size = 50,
        spoil_ticks = .5 * minute,
        spoil_result = "quantum-shard-b",
        weight = 2 * kg
      },
      {
        type = "item",
        name = "quantum-shard-b",
        icon = "__metal-and-stars-graphics__/graphics/icons/material-crystal-1.png",
        pictures =
        {
          layers =
          {
            {
              size = 64,
              filename = "__metal-and-stars-graphics__/graphics/icons/material-crystal-1.png",
              scale = 0.5,
              mipmap_count = 4
            },
            {
              draw_as_light = true,
              blend_mode = "additive",
              size = 64,
              filename = "__metal-and-stars-graphics__/graphics/icons/material-crystal-1-glow.png",
              scale = 0.5,
              tint = {0.3, 0.0, 0.3, .3}
            }
          }
        },
        subgroup = "quantum-processing",
        order = "d[quantum]-b",
        inventory_move_sound = instrument_sound("celesta-30"),
        pick_sound = instrument_sound("celesta-32"),
        drop_sound = instrument_sound("celesta-30"),
        stack_size = 50,
        spoil_ticks = .5 * minute,
        spoil_result = "quantum-shard-c",
        weight = 2 * kg
      },
      {
        type = "item",
        name = "quantum-shard-c",
        icon = "__metal-and-stars-graphics__/graphics/icons/material-crystal-2.png",
        pictures =
        {
          layers =
          {
            {
              size = 64,
              filename = "__metal-and-stars-graphics__/graphics/icons/material-crystal-2.png",
              scale = 0.5,
              mipmap_count = 4
            },
            {
              draw_as_light = true,
              blend_mode = "additive",
              size = 64,
              filename = "__metal-and-stars-graphics__/graphics/icons/material-crystal-2-glow.png",
              scale = 0.5,
              tint = {0, 0, 0.3, .3}
            }
          }
        },
        subgroup = "quantum-processing",
        order = "d[quantum]-c",
        inventory_move_sound = instrument_sound("celesta-32"),
        pick_sound = instrument_sound("celesta-34"),
        drop_sound = instrument_sound("celesta-32"),
        stack_size = 50,
        spoil_ticks = .5 * minute,
        spoil_result = "quantum-shard-a",
        weight = 0.5 * kg
      },

      {
        type = "tool",
        name = "quantum-science-pack",
        localised_description = {"item-description.science-pack"},
        icon = "__metal-and-stars-graphics__/graphics/icons/quantum-science-pack.png",
        subgroup = "science-pack",
        color_hint = { text = "L" },
        order = "b[quantum-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        weight = 1 * kg,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        random_tint_color = item_tints.bluish_science
      },

      {
        type = "item",
        name = "volatile-quantum-science-pack",
        icon = "__metal-and-stars-graphics__/graphics/icons/volatile-quantum-science.png",
        subgroup = "quantum-processing",
        color_hint = { text = "L" },
        order = "b[quantum-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        spoil_ticks = .5 * minute,
        spoil_result = "unstable-quantum-science-pack",
        weight = 1 * kg,
        durability = 1,
        random_tint_color = item_tints.bluish_science
      },
      {
        type = "item",
        name = "unstable-quantum-science-pack",
        icon = "__metal-and-stars-graphics__/graphics/icons/unstable-quantum-science.png",
        subgroup = "quantum-processing",
        color_hint = { text = "L" },
        order = "b[quantum-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        spoil_ticks = .5 * minute,
        spoil_result = "inert-quantum-science-pack",
        weight = 1 * kg,
        durability = 1,
        random_tint_color = item_tints.bluish_science
      },
      {
        type = "item",
        name = "inert-quantum-science-pack",
        icon = "__metal-and-stars-graphics__/graphics/icons/inert-quantum-science.png",
        subgroup = "quantum-processing",
        color_hint = { text = "L" },
        order = "b[quantum-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        weight = 1 * kg,
        durability = 1,
        random_tint_color = item_tints.bluish_science
      },
      --NIX ITEMS
      {
        type = "item",
        name = "ice-xv",
        icon = "__metal-and-stars-graphics__/graphics/icons/dense-ice-cube.png",
        subgroup = "nix-processes",
        order = "j[ice]",
        inventory_move_sound = space_age_item_sounds.ice_inventory_move,
        pick_sound = space_age_item_sounds.ice_inventory_pickup,
        drop_sound = space_age_item_sounds.ice_inventory_move,
        stack_size = 50,
        spoil_ticks = 7 * second,
        spoil_result = "ice",
        weight = 1 * kg,
        default_import_location = "nix",
        random_tint_color = item_tints.ice_blue
      },
      {
        type = "item",
        name = "dense-stone-brick",
        icon = "__metal-and-stars-graphics__/graphics/icons/dense-stone-brick.png",
        subgroup = "nix-processes",
        order = "j[ice]",
        inventory_move_sound = space_age_item_sounds.ice_inventory_move,
        pick_sound = space_age_item_sounds.ice_inventory_pickup,
        drop_sound = space_age_item_sounds.ice_inventory_move,
        stack_size = 50,
        weight = 1 * kg,
        default_import_location = "nix",
        random_tint_color = item_tints.ice_blue
      },
      {
        type = "item",
        name = "antimatter",
        icon = "__metal-and-stars-graphics__/graphics/icons/antimatter.png",
        subgroup = "nix-processes",
        order = "j[ice]",
        inventory_move_sound = space_age_item_sounds.ice_inventory_move,
        pick_sound = space_age_item_sounds.ice_inventory_pickup,
        drop_sound = space_age_item_sounds.ice_inventory_move,
        stack_size = 50,
        weight = 1 * kg,
        default_import_location = "nix",
        random_tint_color = item_tints.ice_blue
      },
      {
        type = "item",
        name = "dark-matter-chunk",
        icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-chunk-1.png",
        pictures =
        {
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-chunk-1.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-chunk-1-emission.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-chunk-2.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-chunk-2-emission.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-chunk-3.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-chunk-3-emission.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
        },
        subgroup = "nix-processes",
        order = "j[ice]",
        inventory_move_sound = space_age_item_sounds.ice_inventory_move,
        pick_sound = space_age_item_sounds.ice_inventory_pickup,
        drop_sound = space_age_item_sounds.ice_inventory_move,
        stack_size = 50,
        weight = 1 * kg,
        default_import_location = "nix",
        random_tint_color = item_tints.ice_blue
      },
      {
        type = "item",
        name = "dark-matter-compressed",
        icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-compressed-1.png",
        pictures =
        {
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-compressed-1.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-compressed-1-emission.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-compressed-2.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-compressed-2-emission.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-compressed-3.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-compressed-3-emission.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
        },
        subgroup = "nix-processes",
        order = "j[ice]",
        inventory_move_sound = space_age_item_sounds.ice_inventory_move,
        pick_sound = space_age_item_sounds.ice_inventory_pickup,
        drop_sound = space_age_item_sounds.ice_inventory_move,
        stack_size = 50,
        weight = 1 * kg,
        default_import_location = "nix",
        random_tint_color = item_tints.ice_blue
      },
      {
        type = "item",
        name = "diamond",
        icon = "__metal-and-stars-graphics__/graphics/icons/diamond.png",
        subgroup = "nix-processes",
        order = "j[ice]",
        inventory_move_sound = space_age_item_sounds.ice_inventory_move,
        pick_sound = space_age_item_sounds.ice_inventory_pickup,
        drop_sound = space_age_item_sounds.ice_inventory_move,
        stack_size = 50,
        weight = 1 * kg,
        default_import_location = "nix",
        random_tint_color = item_tints.ice_blue
      },
      {
        type = "item",
        name = "dark-matter-crystal",
        icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-crystal.png",
        subgroup = "nix-processes",
        order = "j[ice]",
        inventory_move_sound = space_age_item_sounds.ice_inventory_move,
        pick_sound = space_age_item_sounds.ice_inventory_pickup,
        drop_sound = space_age_item_sounds.ice_inventory_move,
        stack_size = 50,
        weight = 1 * kg,
        default_import_location = "nix",
        random_tint_color = item_tints.ice_blue
      },
      {
        type = "item",
        name = "liquid-fuel-heating-tower",
        icon = "__metal-and-stars-graphics__/graphics/icons/liquid-fuel-heating-tower.png",
        subgroup = "environmental-protection",
        order = "c[liquid-fuel-heating-tower]",
        inventory_move_sound = item_sounds.steam_inventory_move,
        pick_sound = item_sounds.steam_inventory_pickup,
        drop_sound = item_sounds.steam_inventory_move,
        place_result = "liquid-fuel-heating-tower",
        stack_size = 20,
        default_import_location = "nix",
        weight = 100*kg
      },
      {
        type = "tool",
        name = "anomaly-science-pack",
        localised_description = {"item-description.science-pack"},
        icon = "__metal-and-stars-graphics__/graphics/icons/anomaly-science-pack.png",
        subgroup = "science-pack",
        color_hint = { text = "L" },
        order = "b[quantum-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        weight = 1 * kg,
        default_import_location = "nix",
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        random_tint_color = item_tints.bluish_science
      },
      {
        type = "item",
        name = "dark-matter-fuel-cell",
        icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-fuel-cell.png",
        pictures =
        {
          layers =
          {
            {
              size = 64,
              filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-fuel-cell.png",
              scale = 0.5,
              mipmap_count = 4
            },
            {
              draw_as_light = true,
              size = 64,
              filename = "__base__/graphics/icons/uranium-fuel-cell-light.png",
              scale = 0.5
            }
          }
        },
        subgroup = "nix-processes",
        order = "b[uranium-products]-a[uranium-fuel-cell]",
        inventory_move_sound = item_sounds.nuclear_inventory_move,
        pick_sound = item_sounds.nuclear_inventory_pickup,
        drop_sound = item_sounds.nuclear_inventory_move,
        fuel_category = "nuclear",
        burnt_result = "depleted-fuel-cell",
        fuel_value = "4GJ",
        stack_size = 50,
        default_import_location = "nix",
        weight = 100*kg
      },
      {
        type = "item",
        name = "depleted-fuel-cell",
        icon = "__metal-and-stars-graphics__/graphics/icons/empty-fuel-cell.png",
        subgroup = "nix-processes",
        order = "b[uranium-products]-b[depleted-uranium-fuel-cell]",
        inventory_move_sound = item_sounds.nuclear_inventory_move,
        pick_sound = item_sounds.nuclear_inventory_pickup,
        drop_sound = item_sounds.nuclear_inventory_move,
        stack_size = 50,
        default_import_location = "nix",
        weight = 100*kg
      },
      {
        type = "item",
        name = "dark-matter-fuel",
        icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-fuel.png",
        pictures =
        {
          layers =
          {
            {
              size = 64,
              filename = "__metal-and-stars-graphics__/graphics/icons/dark-matter-fuel.png",
              scale = 0.5,
              mipmap_count = 4
            },
            {
              draw_as_light = true,
              size = 64,
              filename = "__base__/graphics/icons/nuclear-fuel-light.png",
              scale = 0.5
            }
          }
        },
        fuel_category = "chemical",
        fuel_value = "655MJ",
        fuel_acceleration_multiplier = 2,
        fuel_top_speed_multiplier = 1.4,
        -- fuel_glow_color = {r = 0.1, g = 1, b = 0.1},
        subgroup = "nix-processes",
        order = "r[uranium-processing]-e[nuclear-fuel]",
        inventory_move_sound = item_sounds.fuel_cell_inventory_move,
        pick_sound = item_sounds.fuel_cell_inventory_pickup,
        drop_sound = item_sounds.fuel_cell_inventory_move,
        stack_size = 20,
        default_import_location = "nix",
        weight = 100*kg
      },
      -- SHIPYARD ITEMS
      {
        type = "item",
        name = "nanites",
        icon = "__metal-and-stars-graphics__/graphics/icons/nanites.png",
        pictures =
        {
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/nanites.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/nanites-glow.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/nanites-2.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/nanites-2-glow.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/nanites-3.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/nanites-3-glow.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
        },
        subgroup = "shipyard-processes",
        order = "d[quantum]-a",
        inventory_move_sound = instrument_sound("celesta-28"),
        pick_sound = instrument_sound("celesta-30"),
        drop_sound = instrument_sound("celesta-28"),
        stack_size = 50,
        default_import_location = "shipyard",
        weight = 2 * kg
      },
      {
        type = "tool",
        name = "nanite-science-pack",
        localised_description = {"item-description.science-pack"},
        icon = "__metal-and-stars-graphics__/graphics/icons/nanite-science-pack.png",
        pictures =
        {
          {
            layers =
            {
              {
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/nanite-science-pack.png",
                scale = 0.5,
                mipmap_count = 4
              },
              {
                draw_as_light = true,
                blend_mode = "additive",
                size = 64,
                filename = "__metal-and-stars-graphics__/graphics/icons/nanite-science-emission.png",
                scale = 0.5,
                tint = {0.3, 0.0, 0.0, .3}
              }
            }
          },
        },
        subgroup = "science-pack",
        color_hint = { text = "L" },
        order = "b[nanite-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        weight = 1 * kg,
        default_import_location = "shipyard",
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        random_tint_color = item_tints.bluish_science
      },
      --ringworld items
      {
        type = "item",
        name = "multilayer-insulation",
        icon = "__metal-and-stars-graphics__/graphics/icons/multilayer-insulation.png",
        subgroup = "ringworld-processes",
        order = "a[basic-intermediates]-c[gold-cable]",
        inventory_move_sound = item_sounds.wire_inventory_move,
        pick_sound = item_sounds.wire_inventory_pickup,
        drop_sound = item_sounds.wire_inventory_move,
        stack_size = 200,
        weight = 0.25 * kg,
        default_import_location = "ringworld",
        ingredient_to_weight_coefficient = 0.25
      },
      {
        type = "item",
        name = "gold-foil",
        icon = "__metal-and-stars-graphics__/graphics/icons/gold-foil-1.png",
        pictures =
        {
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/gold-foil-1.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/gold-foil-2.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/gold-foil-3.png", scale = 0.5, mipmap_count = 4},
        },
        subgroup = "ringworld-processes",
        order = "a[basic-intermediates]-c[gold-cable]",
        inventory_move_sound = item_sounds.wire_inventory_move,
        pick_sound = item_sounds.wire_inventory_pickup,
        drop_sound = item_sounds.wire_inventory_move,
        stack_size = 200,
        weight = 0.25 * kg,
        default_import_location = "ringworld",
        ingredient_to_weight_coefficient = 0.25
      },
      {
        type = "item",
        name = "aspheric-lens",
        icon = "__metal-and-stars-graphics__/graphics/icons/glass-lens.png",
        subgroup = "ringworld-processes",
        order = "a[basic-intermediates]-c[gold-cable]",
        inventory_move_sound = item_sounds.wire_inventory_move,
        pick_sound = item_sounds.wire_inventory_pickup,
        drop_sound = item_sounds.wire_inventory_move,
        stack_size = 200,
        weight = 0.25 * kg,
        default_import_location = "ringworld",
        ingredient_to_weight_coefficient = 0.25
      },
      {
        type = "item",
        name = "high-speed-processor",
        icon = "__metal-and-stars-graphics__/graphics/icons/high-speed-processor.png",
        subgroup = "ringworld-processes",
        order = "a[basic-intermediates]-c[gold-cable]",
        inventory_move_sound = item_sounds.wire_inventory_move,
        pick_sound = item_sounds.wire_inventory_pickup,
        drop_sound = item_sounds.wire_inventory_move,
        stack_size = 200,
        weight = 0.25 * kg,
        default_import_location = "ringworld",
        ingredient_to_weight_coefficient = 0.25
      },
      {
        type = "item",
        name = "optical-resonator",
        icon = "__metal-and-stars-graphics__/graphics/icons/optical-resonator.png",
        subgroup = "ringworld-processes",
        order = "a[basic-intermediates]-c[gold-cable]",
        inventory_move_sound = item_sounds.wire_inventory_move,
        pick_sound = item_sounds.wire_inventory_pickup,
        drop_sound = item_sounds.wire_inventory_move,
        stack_size = 200,
        weight = 0.25 * kg,
        default_import_location = "ringworld",
        ingredient_to_weight_coefficient = 0.25
      },
      {
        type = "item",
        name = "bone-fragments",
        icon = "__metal-and-stars-graphics__/graphics/icons/bone-fragments-1.png",
        pictures =
        {
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/bone-fragments-1.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/bone-fragments-2.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/bone-fragments-3.png", scale = 0.5, mipmap_count = 4},
        },
        subgroup = "ringworld-processes",
        order = "a[basic-intermediates]-c[gold-cable]",
        inventory_move_sound = item_sounds.wire_inventory_move,
        pick_sound = item_sounds.wire_inventory_pickup,
        drop_sound = item_sounds.wire_inventory_move,
        stack_size = 200,
        weight = 0.25 * kg,
        default_import_location = "ringworld",
        ingredient_to_weight_coefficient = 0.25
      },
      {
        type = "item",
        name = "bitumen",
        icon = "__metal-and-stars-graphics__/graphics/icons/tar-1.png",
        pictures =
        {
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/tar-1.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/tar-2.png", scale = 0.5, mipmap_count = 4},
          {size = 64, filename = "__metal-and-stars-graphics__/graphics/icons/tar-3.png", scale = 0.5, mipmap_count = 4},
        },
        subgroup = "ringworld-processes",
        order = "a[basic-intermediates]-c[gold-cable]",
        inventory_move_sound = item_sounds.wire_inventory_move,
        pick_sound = item_sounds.wire_inventory_pickup,
        drop_sound = item_sounds.wire_inventory_move,
        stack_size = 200,
        weight = 0.25 * kg,
        default_import_location = "ringworld",
        ingredient_to_weight_coefficient = 0.25
      },
      {
        type = "tool",
        name = "ring-science-pack",
        localised_description = {"item-description.science-pack"},
        icon = "__metal-and-stars-graphics__/graphics/icons/ring-science-pack.png",
        subgroup = "science-pack",
        color_hint = { text = "L" },
        order = "b[ring-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        weight = 1 * kg,
        default_import_location = "ringworld",
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        random_tint_color = item_tints.bluish_science
      },
      {
        type = "item",
        name = "antimatter-construction-robot",
        icon = "__metal-and-stars-graphics__/graphics/icons/antimatter-construction-robot.png",
        subgroup = "logistic-network",
        order = "a[robot]-cb[construction-robot]-c[uranium]",
        place_result = "antimatter-construction-robot",
        icon_size = 64,
        default_import_location = "nix",
        stack_size = 50
    },
    {
          type = "item",
          name = "antimatter-logistic-robot",
          icon = "__metal-and-stars-graphics__/graphics/icons/antimatter-logistic-robot.png",
          subgroup = "logistic-network",
          order = "a[robot]-ca[logistic-robot]-c[uranium]",
          place_result = "antimatter-logistic-robot",
          icon_size = 64,
          default_import_location = "nix",
          stack_size = 50
      },
      {
        type = "item",
        name = "barometric-vice",
        icon = "__metal-and-stars-graphics__/graphics/icons/chemical-stager.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d[hurricane]",
        place_result = "barometric-vice",
        default_import_location = "nix",
        stack_size = 10,
      },
      {
        type = "item",
        name = "microculture-vat",
        icon = "__metal-and-stars-graphics-2__/graphics/icons/pathogen-lab.png",
        icon_size = 64,
        subgroup = "agriculture",
        order = "d[hurricane]",
        place_result = "microculture-vat",
        default_import_location = "ringworld",
        stack_size = 10,
      },
      {
        type = "item",
        name = "ms-quantum-stabilizer",
        icon = "__metal-and-stars-graphics__/graphics/icons/quantum-stabilizer.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d[hurricane]",
        place_result = "ms-quantum-stabilizer",
        stack_size = 10,
      },
      {
        type = "item",
        name = "microgravity-assembler",
        icon = "__metal-and-stars-graphics__/graphics/icons/gravity-assembler.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d[hurricane]",
        place_result = "microgravity-assembler",
        default_import_location = "shipyard",
        stack_size = 10,
      },
      {
        type = "item",
        name = "neumann-conduit",
        icon = "__metal-and-stars-graphics__/graphics/icons/conduit.png",
        icon_size = 64,
        subgroup = "energy",
        order = "d[hurricane]",
        place_result = "neumann-conduit",
        default_import_location = "ringworld",
        stack_size = 10,
      },
      {
        type = "item",
        name = "space-chest-ms",
        icon = "__metal-and-stars-graphics__/graphics/icons/space-chest.png",
        subgroup = "storage",
        order = "a[items]-bc[space-chest]",
        inventory_move_sound = item_sounds.metal_chest_inventory_move,
        pick_sound = item_sounds.metal_chest_inventory_pickup,
        drop_sound = item_sounds.metal_chest_inventory_move,
        place_result = "space-chest-ms",
        default_import_location = "shipyard",
        stack_size = 50,
      },
})