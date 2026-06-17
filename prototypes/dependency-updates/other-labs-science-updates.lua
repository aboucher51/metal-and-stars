-- Optional compatibility: when enabled, add the Metal & Stars science packs to
-- labs added by other mods, so those labs can research M&S technologies.
--
-- Base-game labs ("lab", "biolab") and the M&S microgravity lab are skipped:
-- the microgravity lab already receives the M&S packs in lab-science-updates.lua,
-- and the base labs are intentionally left untouched.

if settings.startup["is-science-packs-other-labs-enabled"]
    and settings.startup["is-science-packs-other-labs-enabled"].value == true then

    -- Helper function to find the index of a value in a table
    local function tableIndexOf(t, value)
        for i, v in ipairs(t) do
            if v == value then
                return i
            end
        end
        return nil
    end

    -- M&S science pack item names to inject into other mods' labs
    local mas_science_packs = {
        "nanite-science-pack",
        "ring-science-pack",
        "anomaly-science-pack",
        "quantum-science-pack",
    }

    -- Labs we should NOT touch: base-game labs and the M&S microgravity lab
    -- (the microgravity lab is handled by lab-science-updates.lua).
    local skip_labs = {
        ["lab"] = true,
        ["biolab"] = true,
        ["microgravity-lab"] = true,
    }

    for lab_name, lab in pairs(data.raw["lab"]) do
        if not skip_labs[lab_name] and lab.inputs then
            for _, pack in ipairs(mas_science_packs) do
                if not tableIndexOf(lab.inputs, pack) then
                    table.insert(lab.inputs, pack)
                end
            end
        end
    end
end
