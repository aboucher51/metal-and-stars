data:extend({
  --//// Fuel Recipes
  {
    type = "recipe",
    name = "liquid-rocket-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/liquid-rocket-fuel.png",
    energy_required = 5,
    enabled = false,
    category = "chemistry",
    subgroup = "liquid-fuel",
    ingredients =
    {
      {type = "item", name = "solid-fuel", amount = 10},
      {type = "fluid", name = "light-oil", amount = 10}
    },
    results = {{type="fluid", name="liquid-rocket-fuel", amount=10}},
    crafting_machine_tint =
    {
      primary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
      secondary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "liquid-nuclear-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/liquid-nuclear-fuel.png",
    energy_required = 5,
    enabled = false,
    category = "chemistry",
    subgroup = "liquid-fuel",
    ingredients =
    {
      {type = "item", name = "uranium-235", amount = 1},
      {type = "fluid", name = "liquid-rocket-fuel", amount = 10}
    },
    results = {{type="fluid", name="liquid-nuclear-fuel", amount=10}},
    crafting_machine_tint =
    {
      primary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
      secondary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "liquid-dark-matter-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/liquid-dark-matter-fuel.png",
    energy_required = 5,
    enabled = false,
    category = "compression",
    subgroup = "liquid-fuel",
    ingredients =
    {
      {type = "fluid", name = "dark-matter-fluid", amount = 5},
      {type = "fluid", name = "liquid-rocket-fuel", amount = 5}
    },
    results = {{type="fluid", name="liquid-dark-matter-fuel", amount=10}},
    crafting_machine_tint =
    {
      primary = {r = 222, g = 0, b = 255, a = 1.000},
      secondary = {r = 143, g = 0, b = 255, a = 1.000},
    },
    allow_productivity = true
  },
  --//// unbottling Recipes
  {
    type = "recipe",
    name = "empty-liquid-rocket-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/liquid-rocket-fuel.png",
    energy_required = .04,
    enabled = false,
    category = "crafting-with-fluid",
    subgroup = "empty-barrel",
    ingredients =
    {
      {type = "item", name = "rocket-fuel", amount = 1},
    },
    results = {{type="fluid", name="liquid-rocket-fuel", amount=10}},
    crafting_machine_tint =
    {
      primary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
      secondary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
    },
    allow_productivity = false,
    maximum_productivity = 0
  },
  {
    type = "recipe",
    name = "empty-liquid-nuclear-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/liquid-nuclear-fuel.png",
    energy_required = .04,
    enabled = false,
    category = "crafting-with-fluid",
    subgroup = "empty-barrel",
    ingredients =
    {
      {type = "item", name = "nuclear-fuel", amount = 1},
    },
    results = {{type="fluid", name="liquid-nuclear-fuel", amount=10}},
    crafting_machine_tint =
    {
      primary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
      secondary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
    },
    allow_productivity = false,
    maximum_productivity = 0
  },
  {
    type = "recipe",
    name = "empty-liquid-dark-matter-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/liquid-dark-matter-fuel.png",
    energy_required = .04,
    enabled = false,
    category = "crafting-with-fluid",
    subgroup = "empty-barrel",
    ingredients =
    {
      {type = "item", name = "dark-matter-fuel", amount = 1}
    },
    results = {{type="fluid", name="liquid-dark-matter-fuel", amount=10}},
    crafting_machine_tint =
    {
      primary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
      secondary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
    },
    allow_productivity = false,
    maximum_productivity = 0
  },
    --//// canister Recipes
    {
      type = "recipe",
      name = "canister-liquid-rocket-fuel",
      icon = "__metal-and-stars-graphics__/graphics/icons/liquid-rocket-fuel.png",
      energy_required = .04,
      enabled = false,
      category = "crafting-with-fluid",
      subgroup = "fill-barrel",
      ingredients =
      {
        {type = "fluid", name = "liquid-rocket-fuel", amount = 10},
      },
      results = {{type="item", name="rocket-fuel", amount=1}},
      crafting_machine_tint =
      {
        primary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
        secondary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
      },
      allow_productivity = false,
      maximum_productivity = 0
    },
    {
      type = "recipe",
      name = "canister-liquid-nuclear-fuel",
      icon = "__metal-and-stars-graphics__/graphics/icons/liquid-nuclear-fuel.png",
      energy_required = .04,
      enabled = false,
      category = "crafting-with-fluid",
      subgroup = "fill-barrel",
      ingredients =
      {
        {type = "fluid", name = "liquid-nuclear-fuel", amount = 10},
      },
      results = {{type="item", name="nuclear-fuel", amount=1}},
      crafting_machine_tint =
      {
        primary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
        secondary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
      },
      allow_productivity = false,
      maximum_productivity = 0
    },
    {
      type = "recipe",
      name = "canister-liquid-dark-matter-fuel",
      icon = "__metal-and-stars-graphics__/graphics/icons/liquid-dark-matter-fuel.png",
      energy_required = .04,
      enabled = false,
      category = "crafting-with-fluid",
      subgroup = "fill-barrel",
      ingredients =
      {
        {type = "fluid", name = "liquid-dark-matter-fuel", amount = 10}
      },
      results = {{type="item", name="dark-matter-fuel", amount=1}},
      crafting_machine_tint =
      {
        primary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
        secondary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
      },
      allow_productivity = false,
      maximum_productivity = 0
    },
})