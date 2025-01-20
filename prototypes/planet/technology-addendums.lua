

if data.raw["technology"]["rocket-fuel"] ~= nil then
    table.insert(data.raw["technology"]["rocket-fuel"].effects,   {type = "unlock-recipe", recipe = "liquid-rocket-fuel"})
    table.insert(data.raw["technology"]["rocket-fuel"].effects,   {type = "unlock-recipe", recipe = "canister-liquid-rocket-fuel"})
    table.insert(data.raw["technology"]["rocket-fuel"].effects,   {type = "unlock-recipe", recipe = "empty-liquid-rocket-fuel"})
end

if data.raw["technology"]["kovarex-enrichment-process"] ~= nil then
    table.insert(data.raw["technology"]["kovarex-enrichment-process"].effects,   {type = "unlock-recipe", recipe = "liquid-nuclear-fuel"})
    table.insert(data.raw["technology"]["kovarex-enrichment-process"].effects,   {type = "unlock-recipe", recipe = "canister-liquid-nuclear-fuel"})
    table.insert(data.raw["technology"]["kovarex-enrichment-process"].effects,   {type = "unlock-recipe", recipe = "empty-liquid-nuclear-fuel"})
end

if data.raw["technology"]["asteroid-productivity"] ~= nil then
    table.insert(data.raw["technology"]["asteroid-productivity"].effects, {type = "change-recipe-productivity", recipe = "mirandite-sludge", change = 0.1})
end

if data.raw["fluid"]["crude-oil"] ~= nil then
    data.raw["fluid"]["crude-oil"].fuel_value = "1MJ"end
if data.raw["fluid"]["light-oil"] ~= nil then
    data.raw["fluid"]["light-oil"].fuel_value = "600kJ"
end
if data.raw["fluid"]["heavy-oil"] ~= nil then
    data.raw["fluid"]["heavy-oil"].fuel_value = "400kJ"
end


