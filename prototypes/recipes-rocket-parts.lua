
data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
data.raw.recipe["rocket-part"].order = "b[rocket-part]-a[vanilla]"

data:extend({
    {
        type = "recipe",
        name = "nano-rocket-part",
        energy_required = 3,
        enabled = false,
        hide_from_player_crafting = true,
        category = "rocket-building",
        order = "b[rocket-part]-ab[nano]",
        ingredients =
        {
            {type = "item", name = "nanites", amount = 10},
        },
        results = {{type="item", name="rocket-part", amount=1}},
        allow_productivity = true,
        auto_recycle = false,
        surface_conditions =
        {
          {
            property = "gravity",
            min = 1,
            max = 2
          }
        },
    },
    {
        type = "recipe",
        name = "ring-rocket-part",
        energy_required = 3,
        enabled = false,
        hide_from_player_crafting = true,
        category = "rocket-building",
        order = "b[rocket-part]-ac[ring]",
        ingredients =
        {
            {type = "item", name = "nanites", amount = 1},
            {type = "item", name = "processing-unit", amount = 2},
            {type = "item", name = "multilayer-insulation", amount = 1},
            {type = "item", name = "rocket-fuel", amount = 2}
        },
        results = {{type="item", name="rocket-part", amount=2}},
        allow_productivity = true,
        auto_recycle = false,
    },
    {
        type = "recipe",
        name = "anomalous-rocket-part",
        energy_required = 3,
        enabled = false,
        hide_from_player_crafting = true,
        category = "rocket-building",
        order = "b[rocket-part]-ac[anomalous]",
        ingredients =
        {
            {type = "item", name = "nanites", amount = 1},
            {type = "item", name = "processing-unit", amount = 2},
            {type = "item", name = "low-density-structure", amount = 2},
            {type = "item", name = "dark-matter-fuel", amount = 1}
        },
        results = {{type="item", name="rocket-part", amount=2}},
        allow_productivity = true,
        auto_recycle = false,
    },
})