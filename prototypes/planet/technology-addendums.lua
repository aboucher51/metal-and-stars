

if data.raw["technology"]["rocket-fuel"] ~= nil then
    table.insert(data.raw["technology"]["rocket-fuel"].effects,   {type = "unlock-recipe", recipe = "liquid-rocket-fuel"})
    table.insert(data.raw["technology"]["rocket-fuel"].effects,   {type = "unlock-recipe", recipe = "canister-liquid-rocket-fuel"})
    table.insert(data.raw["technology"]["rocket-fuel"].effects,   {type = "unlock-recipe", recipe = "empty-liquid-rocket-fuel"})
end
if data.raw["technology"]["rocket-fuel-productivity"] then
    table.insert(data.raw.technology["rocket-fuel-productivity"].effects, { type = "change-recipe-productivity", recipe = "liquid-rocket-fuel", change = 0.1 })
end

if data.raw["technology"]["rocket-part-productivity"] then
    table.insert(data.raw.technology["rocket-part-productivity"].effects, { type = "change-recipe-productivity", recipe = "nano-rocket-part", change = 0.1 })
    table.insert(data.raw.technology["rocket-part-productivity"].effects, { type = "change-recipe-productivity", recipe = "ring-rocket-part", change = 0.1 })
    table.insert(data.raw.technology["rocket-part-productivity"].effects, { type = "change-recipe-productivity", recipe = "anomalous-rocket-part", change = 0.1 })
end

if data.raw["technology"]["kovarex-enrichment-process"] ~= nil then
    table.insert(data.raw["technology"]["kovarex-enrichment-process"].effects,   {type = "unlock-recipe", recipe = "liquid-nuclear-fuel"})
    table.insert(data.raw["technology"]["kovarex-enrichment-process"].effects,   {type = "unlock-recipe", recipe = "canister-liquid-nuclear-fuel"})
    table.insert(data.raw["technology"]["kovarex-enrichment-process"].effects,   {type = "unlock-recipe", recipe = "empty-liquid-nuclear-fuel"})
end

if data.raw["technology"]["asteroid-productivity"] ~= nil then
    table.insert(data.raw["technology"]["asteroid-productivity"].effects, {type = "change-recipe-productivity", recipe = "mirandite-sludge", change = 0.1})
    table.insert(data.raw["technology"]["asteroid-productivity"].effects, {type = "change-recipe-productivity", recipe = "carbonic-asteroid-refined-crushing", change = 0.1})
    table.insert(data.raw["technology"]["asteroid-productivity"].effects, {type = "change-recipe-productivity", recipe = "sloppy-asteroid-smelting", change = 0.1})

end

if data.raw["fluid"]["crude-oil"] ~= nil then
    data.raw["fluid"]["crude-oil"].fuel_value = "1MJ"end
if data.raw["fluid"]["light-oil"] ~= nil then
    data.raw["fluid"]["light-oil"].fuel_value = "600kJ"
end
if data.raw["fluid"]["heavy-oil"] ~= nil then
    data.raw["fluid"]["heavy-oil"].fuel_value = "400kJ"
end

if data.raw["assembling-machine"]["crusher"] ~= nil then
    PlanetsLib.relax_surface_conditions(data.raw["assembling-machine"]["crusher"], {property = "gravity", max = 2})
end