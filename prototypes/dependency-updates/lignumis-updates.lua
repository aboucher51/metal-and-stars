-- Lignumis compatibility: grow Lignum (Lignumis) trees on the left/west side of Circa.
--
-- Circa (the "ringworld" planet) is split down the middle: the LEFT side (x < 0) is the
-- overgrown / undergrowth biome, the RIGHT side (x > 0) is the desert. We reuse the existing
-- "ringworld_left_mask" noise expression so the trees only appear in the danger zone on the
-- left side, matching the thematic overgrowth there.
--
-- NOTE / UNCERTAINTY: the internal name of the Lignumis tree entity is not 100% confirmed from
-- the mod source, so we probe a list of candidate names and only act if one actually exists.
-- This keeps the change safe (no crash, no-op) if the assumed name is wrong. If Circa shows no
-- Lignum trees in-game, update "candidate_tree_names" below with the correct entity name.

if mods["lignumis"] then
    if data.raw.planet and data.raw.planet.ringworld then
        local ringworld_map_settings = data.raw.planet.ringworld.map_gen_settings

        -- Candidate internal names for the Lignumis wood tree entity, most-likely first.
        local candidate_tree_names =
        {
            "wood-tree",
            "lignumis-tree",
            "tree-lignumis",
            "lignum-tree",
        }

        local trees = data.raw["tree"] or {}

        for _, tree_name in ipairs(candidate_tree_names) do
            local tree = trees[tree_name]
            if tree then
                -- Place the tree only on the left/west side of Circa, in the danger zone.
                -- ringworld_left_mask = (x < 0) * ringworld_danger_mask, defined in ringworld_tiles.lua.
                tree.autoplace =
                {
                    control = "trees",
                    order = "a[tree]-b[forest]-a[lignumis]",
                    probability_expression = "ringworld_left_mask * 0.4",
                    richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)",
                }

                -- Register the tree in Circa's autoplace settings so it actually generates there.
                ringworld_map_settings.autoplace_settings.entity.settings[tree_name] = {}
            end
        end
    end
end
