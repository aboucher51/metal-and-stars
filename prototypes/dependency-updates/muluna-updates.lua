if mods["planet-muluna"] then
    if data.raw["recipe"]["rocket-part-muluna"] ~= nil then
        data.raw["recipe"]["rocket-part-muluna"].localised_name = nil
    end

    if data.raw["recipe"]["thruster-fuel-from-rocket-fuel"] ~= nil then
        table.insert(data.raw["technology"]["space-fuel-productivity"].effects,   {type = "change-recipe-productivity", recipe = "thruster-fuel-from-rocket-fuel", change = 0.1})
    end

    -- Compatibility: Muluna (prototypes/technology/dependencies-updates.lua) re-gates the
    -- "space-science-pack" technology behind a chain of Muluna-internal prerequisites:
    --   muluna-alice-propellant, muluna-steam-crusher, wood-gas-processing
    -- and swaps the prerequisite "space-platform" -> "muluna-alice-propellant".
    -- That chain (the "Advanced Space Research" path) effectively requires significant
    -- Muluna surface progression before space science can be produced, which conflicts
    -- with Metal and Stars letting players leave Nauvis and reach the new solar system
    -- immediately. Re-point the technology back at the early "space-platform" prerequisite
    -- so space science is researchable as soon as a space platform is available.
    local space_science = data.raw["technology"]["space-science-pack"]
    if space_science ~= nil and space_science.prerequisites ~= nil then
        -- Drop the deep Muluna prerequisites that gate space science late.
        local muluna_gates = {
            ["muluna-alice-propellant"] = true,
            ["muluna-steam-crusher"] = true,
            ["wood-gas-processing"] = true,
        }
        local filtered = {}
        local has_space_platform = false
        for _, prereq in pairs(space_science.prerequisites) do
            if not muluna_gates[prereq] then
                table.insert(filtered, prereq)
                if prereq == "space-platform" then
                    has_space_platform = true
                end
            end
        end
        -- Ensure the early "space-platform" prerequisite is present (Muluna replaces it
        -- with "muluna-alice-propellant", which we removed above).
        if not has_space_platform and data.raw["technology"]["space-platform"] ~= nil then
            table.insert(filtered, "space-platform")
        end
        space_science.prerequisites = filtered

        -- Muluna swaps space-science-pack's normal unit cost for a build-entity
        -- research_trigger (tied to a Muluna-internal entity such as muluna-steam-crusher),
        -- which can only be satisfied after the Muluna chain. Since space science no longer
        -- depends on that chain, clear any Muluna-style research_trigger and ensure the
        -- technology has a normal unit-based cost so it is researchable early. We do this
        -- independently of the specific trigger entity/recipe name so the fix still applies
        -- if Muluna renames the entity or uses a different trigger type. (A technology may
        -- have either a research_trigger or a unit, not both, so we set the unit only after
        -- removing the trigger.)
        if space_science.research_trigger ~= nil then
            space_science.research_trigger = nil
        end
        if space_science.unit == nil then
            space_science.unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                },
                time = 60,
            }
        end
    end

end
