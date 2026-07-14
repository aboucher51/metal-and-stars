-- Lignumis compatibility: grow Lignum (Lignumis) trees on the left/west side of Circa.
--
-- Circa (the "ringworld" planet) is split down the middle: the LEFT side (x < 0) is the
-- overgrown / undergrowth biome, the RIGHT side (x > 0) is the desert. We reuse the existing
-- "ringworld_left_mask" noise expression (defined in ringworld_tiles.lua) so the trees only
-- appear in the overgrown danger zone on the left side, matching the thematic undergrowth there.
--
-- IMPORTANT: in Lignumis the wood tree is a PLANT prototype at data.raw.plant["tree-plant"]
-- (type "plant"), NOT a data.raw["tree"]. We must not mutate that shared prototype in place,
-- because it is the same object used to generate trees on the Lignumis planet itself; editing
-- its autoplace would also alter Lignumis. Instead we table.deepcopy it into a brand new plant
-- prototype with a distinct name ("circa-lignum-tree"), give the COPY a Circa-specific autoplace,
-- and data:extend it. The original Lignumis tree-plant is left untouched.
--
-- NOTE / UNCERTAINTY: the Circa autoplace below mirrors the in-mod precedent for placing entities
-- on the undergrowth biome (see prototypes/entity/resources.lua "ringworld-detritus": a bare
-- probability_expression + tile_restriction registered under autoplace_settings.entity). We reuse
-- "ringworld_left_mask" and restrict to the four undergrowth tiles so the trees only spawn on the
-- left overgrowth. We deliberately do NOT use a "trees" autoplace_control because ringworld's
-- map_gen (ringworld_map_gen.lua) only defines ringworld_* controls and has no "trees" control;
-- referencing a missing control would be invalid. If the exact density/look needs tuning, adjust
-- the probability multiplier or tile_restriction below.

if mods["lignumis"] then
    if data.raw.planet and data.raw.planet.ringworld and data.raw.plant then
        local source_tree = data.raw.plant["tree-plant"]
        local ringworld_planet = data.raw.planet.ringworld
        local ringworld_map_settings = ringworld_planet.map_gen_settings

        -- Confirm the Lignumis tree-plant exists and that ringworld exposes the expected
        -- autoplace_settings.entity table and the ringworld_left_mask noise expression. If any of
        -- these is absent, do nothing (clean no-op, no crash).
        local left_mask_present = false
        if data.raw["noise-expression"] and data.raw["noise-expression"]["ringworld_left_mask"] then
            left_mask_present = true
        end

        if source_tree
            and ringworld_map_settings
            and ringworld_map_settings.autoplace_settings
            and ringworld_map_settings.autoplace_settings.entity
            and ringworld_map_settings.autoplace_settings.entity.settings
            and left_mask_present
        then
            local circa_tree_name = "circa-lignum-tree"

            -- Only create the copy once (guard against double data:extend if this file is required
            -- more than once during the data stage).
            if not data.raw.plant[circa_tree_name] then
                local circa_tree = table.deepcopy(source_tree)
                circa_tree.name = circa_tree_name

                -- Some prototypes carry a minable result / autoplace control referencing the
                -- original; clear the control so we do not depend on a (non-existent on Circa)
                -- "trees" autoplace_control, and give the copy a Circa-specific autoplace that
                -- mirrors the in-mod undergrowth placement pattern.
                circa_tree.autoplace =
                {
                    order = "a[tree]-b[forest]-a[lignumis]",
                    -- ringworld_left_mask = (x < 0) * ringworld_danger_mask (ringworld_tiles.lua).
                    probability_expression = "ringworld_left_mask * 0.4",
                    richness_expression = "ringworld_left_mask",
                    -- Restrict to Circa's left-side overgrowth tiles so the trees grow in the
                    -- undergrowth biome (these tiles are defined in ringworld_tiles.lua).
                    tile_restriction =
                    {
                        "undergrowth-thin",
                        "undergrowth-thin-dark",
                        "undergrowth-thick",
                        "undergrowth-thick-dark",
                    },
                }

                data:extend({ circa_tree })
            end

            -- Register the NEW Circa tree (not the shared Lignumis tree) in Circa's autoplace
            -- settings so it actually generates there. Plants register under the "entity" category.
            ringworld_map_settings.autoplace_settings.entity.settings[circa_tree_name] = {}
        end
    end
end
