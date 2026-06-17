-- Krastorio 2 / Krastorio 2 Spaced Out compatibility fixes
--
-- Bug (issue #40): With Krastorio 2 active, K2 replaces the vanilla solid
-- "nuclear-fuel" recipe with a much cheaper one (essentially rocket-fuel based,
-- without the vanilla U-235 cost). Metal and Stars' "empty-liquid-nuclear-fuel"
-- recipe then turns 1 solid nuclear-fuel into 10 liquid-nuclear-fuel (133MJ each
-- = 1330MJ). Combined with K2's cheap nuclear-fuel this lets players generate
-- near-free nuclear fuel/energy from rocket fuel with no uranium input.
--
-- Fix: when K2 is present, restore an explicit U-235 cost to the unbottling
-- recipe so converting solid nuclear fuel into the high-energy liquid form again
-- requires proper nuclear inputs, matching the intended (vanilla) balance of the
-- "liquid-nuclear-fuel" production recipe (which already costs U-235).
if mods["Krastorio2"] or mods["Krastorio2-spaced-out"] then
    local empty_recipe = data.raw["recipe"]["empty-liquid-nuclear-fuel"]
    if empty_recipe ~= nil and empty_recipe.ingredients ~= nil and data.raw["item"]["uranium-235"] ~= nil then
        local has_u235 = false
        for _, ingredient in pairs(empty_recipe.ingredients) do
            if ingredient.name == "uranium-235" then
                has_u235 = true
                break
            end
        end
        if not has_u235 then
            table.insert(empty_recipe.ingredients, {type = "item", name = "uranium-235", amount = 1})
        end
    end
end
