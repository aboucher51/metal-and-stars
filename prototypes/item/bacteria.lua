local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
{
    type = "item",
    name = "algae-bacteria",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/algae-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/algae-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/algae-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/algae-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/algae-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[bioculture]-c[algae-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "nauvis",
    weight = 1 * kg,
    spoil_ticks = 10 * minute,
    spoil_result = "calcite"
  },
  {
    type = "item",
    name = "ammoniac-bacteria",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/ammoniac-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/ammoniac-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/ammoniac-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/ammoniac-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/ammoniac-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[bioculture]-c[ammoniac-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "nix",
    weight = 1 * kg,
    spoil_ticks = 20 * minute,
    spoil_result = "ice"
  },
  {
    type = "item",
    name = "petro-bacteria",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/petro-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/petro-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/petro-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/petro-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/petro-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[bioculture]-c[petro-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "fulgora",
    weight = 1 * kg,
    spoil_ticks = 5 * minute,
    spoil_result = "sulfur"
  },
  {
    type = "item",
    name = "radio-bacteria",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/radio-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/radio-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/radio-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/radio-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/radio-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[bioculture]-c[radio-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "nauvis",
    weight = 1 * kg,
    spoil_ticks = 1 * minute,
    spoil_result = "uranium-238"
  },
  {
    type = "item",
    name = "thermo-bacteria",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/thermo-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/thermo-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/thermo-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/thermo-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__metal-and-stars-graphics-2__/graphics/icons/thermo-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "agriculture-processes",
    order = "b[bioculture]-c[thermo-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "vulcanus",
    weight = 1 * kg,
    spoil_ticks = 20 * minute,
    spoil_result = "stone"
  },

  {
    type = "recipe",
    name = "thermo-bacteria-cultivation",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/thermo-bacteria-cultivation.png",
    category = "organic",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b[cultivation]-c[thermo]",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    allow_decomposition = false,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "thermo-bacteria", amount = 2},
      {type = "fluid", name = "lava", amount = 15},
    },
    results =
    {
      {type = "item", name = "thermo-bacteria", amount = 7},
      {
        type = "item",
        name = "iron-ore",
        probability = 0.2,
        amount = 1
      },
      {
        type = "item",
        name = "copper-ore",
        probability = 0.2,
        amount = 1
      },
      {
        type = "item",
        name = "stone",
        probability = 0.2,
        amount = 1
      },
    },
    crafting_machine_tint =
    {
      primary = {r = 255, g = 94, b = 0, a = 1.000},
      secondary = {r = 255, g = 94, b = 0, a = 1.000},
    },
    auto_recycle = false,
    show_amount_in_title = false
  },

  {
    type = "recipe",
    name = "thermo-bacteria-fermentation",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/thermo-bacteria-cultivation.png",
    category = "organic",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b[cultivation]-c[thermo]",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    allow_decomposition = false,
    energy_required = 4,
    surface_conditions =
    {
      {
        property = "temperature",
        min = 330
      }
    },
    ingredients =
    {
      {type = "item", name = "thermo-bacteria", amount = 3},
      {type = "fluid", name = "lava", amount = 15},
    },
    results =
    {
      {type = "fluid", name = "crude-oil", amount = 10},
      {type = "fluid", name = "water", amount = 1},
      {type = "item", name = "calcite", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 255, g = 56, b = 0, a = 1.000},
      secondary = {r = 255, g = 56, b = 0, a = 1.000},
    },
    auto_recycle = false,
    show_amount_in_title = false
  },

  {
    type = "recipe",
    name = "radio-bacteria-cultivation",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/radio-bacteria-cultivation.png",
    category = "organic",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b[cultivation]-c[radio]",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    allow_decomposition = false,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "radio-bacteria", amount = 4},
      {type = "item", name = "uranium-238", amount = 40},
    },
    results =
    {
      {type = "item", name = "radio-bacteria", amount = 49},
      {type = "item", name = "uranium-235", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 106, g = 255, b = 0, a = 1.000},
      secondary = {r = 143, g = 0, b = 255, a = 1.000},
    },
    auto_recycle = false,
    show_amount_in_title = false
  },

  {
    type = "recipe",
    name = "petro-bacteria-cultivation",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/petro-bacteria-cultivation.png",
    category = "organic",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b[cultivation]-c[petro]",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    allow_decomposition = false,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "petro-bacteria", amount = 50},
      {type = "item", name = "battery", amount = 100},
      {type = "fluid", name = "heavy-oil", amount = 5000},
    },
    results =
    {
      {type = "item", name = "petro-bacteria", amount = 300},
      {type = "item", name = "iron-plate", amount = 100},
      {type = "fluid", name = "water", amount = 5000},
    },
    crafting_machine_tint =
    {
      primary = {r = 255, g = 221, b = 0, a = 1.000},
      secondary = {r = 255, g = 221, b = 0, a = 1.000},
    },
    auto_recycle = false,
    show_amount_in_title = false
  },
  
  {
    type = "recipe",
    name = "ammoniac-bacteria-cultivation",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/ammoniac-bacteria-cultivation.png",
    category = "organic",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b[cultivation]-c[ammoniac]",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    allow_decomposition = false,
    energy_required = 4,
    surface_conditions =
    {
      {
        property = "temperature",
        max = 265
      }
    },
    ingredients =
    {
      {type = "item", name = "ammoniac-bacteria", amount = 9},
      {type = "fluid", name = "water", amount = 100}
    },
    results =
    {
      {type = "item", name = "ammoniac-bacteria", amount = 14},
      {type = "fluid", name = "fluoroketone-cold", amount = 100}
    },
    crafting_machine_tint =
    {
      primary = {r = 0, g = 255, b = 255, a = 1.000},
      secondary = {r = 0, g = 255, b = 255, a = 1.000},
    },
    auto_recycle = false,
    show_amount_in_title = false
  },

  {
    type = "recipe",
    name = "algae-bacteria-cultivation",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/algae-bacteria-cultivation.png",
    category = "organic",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b[cultivation]-c[algae]",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    allow_decomposition = false,
    energy_required = 4,
    surface_conditions =
    {
      {
        property = "temperature",
        min = 260,
        max = 300
      }
    },
    ingredients =
    {
      {type = "item", name = "algae-bacteria", amount = 14},
      {type = "item", name = "nutrients", amount = 4},
    },
    results =
    {
      {type = "item", name = "algae-bacteria", amount = 22},
      {type = "item", name = "bioflux", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 3, g = 168, b = 0, a = 1.000},
      secondary = {r = 3, g = 168, b = 0, a = 1.000},
    },
    auto_recycle = false,
    show_amount_in_title = false
  },

--Initial bootstrapping

  {
    type = "recipe",
    name = "algae-bacteria",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/algae-bacteria.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-a[bacteria]-c[algae]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "raw-fish", amount = 1},
    },
    results =
    {
      {type = "item", name = "algae-bacteria", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 3, g = 168, b = 0, a = 1.000},
      secondary = {r = 3, g = 168, b = 0, a = 1.000},
    },
    auto_recycle = false,
  },

  {
    type = "recipe",
    name = "petro-bacteria",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/petro-bacteria.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-a[bacteria]-c[petro]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "bitumen", amount = 1},
    },
    results =
    {
      {type = "item", name = "petro-bacteria", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 255, g = 221, b = 0, a = 1.000},
      secondary = {r = 255, g = 221, b = 0, a = 1.000},
    },
    auto_recycle = false,
  },

  {
    type = "recipe",
    name = "thermo-bacteria",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/thermo-bacteria.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-a[bacteria]-c[thermo]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    surface_conditions =
    {
      {
        property = "temperature",
        min = 330
      }
    },
    ingredients =
    {
      {type = "item", name = "carbon", amount = 1},
    },
    results =
    {
      {type = "item", name = "thermo-bacteria", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 255, g = 56, b = 0, a = 1.000},
      secondary = {r = 255, g = 56, b = 0, a = 1.000},
    },
    auto_recycle = false,
  },

  {
    type = "recipe",
    name = "radio-bacteria",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/radio-bacteria.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-a[bacteria]-c[radio]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "uranium-235", amount = 1},
    },
    results =
    {
      {type = "item", name = "radio-bacteria", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 106, g = 255, b = 0, a = 1.000},
      secondary = {r = 143, g = 0, b = 255, a = 1.000},
    },
    auto_recycle = false,
  },

})