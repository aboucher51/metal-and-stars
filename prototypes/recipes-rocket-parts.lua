
data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
data.raw.recipe["rocket-part"].order = "b[rocket-part]-a[vanilla]"

-- PlanetsLib 1.13.1+ integration.
-- PlanetsLib added the "Planetslib-planet-lock-rocket-silos" mod-data prototype, which
-- controls whether vanilla-style rocket silos have their recipe locked when placed
-- (PlanetsLib's runtime handler calls entity.set_recipe(...) + recipe_locked = true).
-- For surfaces not explicitly listed, PlanetsLib uses the "default" entry, which defaults
-- to `true`. That locking prevents Metal and Stars' alternative, player-selectable
-- rocket-part recipes (nano/ring/anomalous, gated by tech + surface_conditions) from being
-- chosen in a silo.
-- Per PlanetsLib's own guidance ("Mods that add new optional rocket part recipes should set
-- the default to false."), we flip the global default lock to false so silos placed on
-- M&S (and other) surfaces remain unlocked and let the player pick the appropriate recipe.
-- Guarded so the mod still loads against PlanetsLib < 1.13.1 (where the prototype is absent).
do
    local lock_silo_data = data.raw["mod-data"] and data.raw["mod-data"]["Planetslib-planet-lock-rocket-silos"]
    if lock_silo_data and lock_silo_data.data then
        lock_silo_data.data.default = false
    end
end

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