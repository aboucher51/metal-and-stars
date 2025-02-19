data:extend(
{
  {
    type = "fluid",
    name = "gray-goo",
    icon = "__metal-and-stars-graphics__/graphics/icons/gray-goo.png",
    subgroup = "fluid",
    order = "b[new-fluid]-e[shipyard]-a[grey-goo]",
    default_temperature = -50,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    base_color = {125, 125, 125},
    flow_color = {125, 125, 125},
    auto_barrel = true
  },
  {
    type = "fluid",
    name = "mirandite-sludge",
    icon = "__metal-and-stars-graphics__/graphics/icons/mirandite-sludge.png",
    subgroup = "fluid",
    order = "b[new-fluid]-e[shipyard]-a[mirandite-sludge]",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    base_color = {61, 37, 61},
    flow_color = {61, 37, 61},
    auto_barrel = true
  },
  {
    type = "fluid",
    name = "dark-matter-fluid",
    icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-gas.png",
    subgroup = "fluid",
    order = "b[new-fluid]-e[shipyard]-a[dark-matter-fluid]",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    gas_temperature = 15,
    base_color = {182, 99, 255},
    flow_color = {182, 99, 255},
    auto_barrel = false
  },
  {
    type = "fluid",
    name = "crude-slush",
    icon = "__metal-and-stars-graphics__/graphics/icons/crude-slush.png",
    subgroup = "fluid",
    order = "b[new-fluid]-e[shipyard]-a[crude-slush]",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    base_color = {54, 63, 64},
    flow_color = {54, 63, 64},
    auto_barrel = true
  },
  {
    type = "fluid",
    name = "heavy-water",
    icon = "__metal-and-stars-graphics__/graphics/icons/heavy-water.png",
    subgroup = "fluid",
    order = "b[new-fluid]-e[shipyard]-a[heavy-water]",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    base_color = {0.36, 0.54, 0.66},
    flow_color = {0.36, 0.54, 0.66},
    auto_barrel = true
  },
  --/////refined liquid fuels
  {
    type = "fluid",
    name = "liquid-rocket-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/liquid-rocket-fuel.png",
    subgroup = "fluid",
    order = "a[fluid]-b[refined-fuel]-c[rocket-fuel]",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    fuel_value = "11MJ",
    base_color = {224, 165, 45},
    flow_color = {224, 165, 45},
    auto_barrel = false
  },
  {
    type = "fluid",
    name = "liquid-nuclear-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/liquid-nuclear-fuel.png",
    subgroup = "fluid",
    order = "a[fluid]-b[refined-fuel]-c[nuclear-fuel]",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    fuel_value = "133MJ",
    base_color = {0, 255, 47},
    flow_color = {0, 255, 47},
    auto_barrel = false
  },
  {
    type = "fluid",
    name = "liquid-dark-matter-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/liquid-dark-matter-fuel.png",
    subgroup = "fluid",
    order = "a[fluid]-b[refined-fuel]-c[dark-matter-fuel]",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    fuel_value = "72MJ",
    base_color = {187, 0, 255},
    flow_color = {187, 0, 255},
    auto_barrel = false
  },
})