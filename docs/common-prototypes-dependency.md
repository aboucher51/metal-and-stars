# Investigation: reducing/scrapping the `common-prototypes` dependency

Tracking issue: #33

`info.json` declares `"common-prototypes >= 0.0.4"`. This document enumerates
exactly what Metal and Stars uses from that mod and lays out a vendoring plan,
so a future change can drop (or shrink) the dependency without breaking the
build.

## What `common-prototypes` actually provides

`common-prototypes` is a small data-stage-only library ("A library to
synchronize common materials from various mods"). Its `data.lua` loads four
files that `data:extend` the following prototypes:

### Items (`prototypes/item.lua`)
- `gold-ore`
- `gold-plate`
- `gold-cable`
- `silica-sand`
- `glass-plate`
- `glass-billet`
- `neodymium-ore`
- `neodymium-plate`

### Fluids (`prototypes/fluid.lua`)
- `molten-gold`
- `molten-glass`

### Recipes (`prototypes/recipe.lua`)
- `gold-plate`, `molten-gold`, `gold-cable`, `casting-gold-cable`,
  `casting-gold-plate`, `glass-plate`, `glass-billet-reuse`, `molten-glass`,
  `casting-glass-plate`, `neodymium-plate`, `neodymium-alloy-plate`

### Recycling recipes (`prototypes/recycling-recipes.lua`)
- `glass-plate-recycling`

All icons in those prototypes point at the **`__common-prototypes-graphics__`**
mod (e.g. `__common-prototypes-graphics__/icons/items/gold-ore-1.png`).

## How Metal and Stars uses these

Metal and Stars never `require`s any `__common-prototypes__` Lua file. It only
**references the prototypes by name** during its own data stage, relying on
load order (the dependency) to guarantee they exist first. Concrete usages:

| File | Reference |
|------|-----------|
| `prototypes/item/item.lua` | references the shared item names |
| `prototypes/fluid.lua` | references `molten-gold` / `molten-glass` |
| `prototypes/recipe.lua:28` | `neodymium-plate` ingredient |
| `prototypes/recipe.lua:236` | `neodymium-ore` |
| `prototypes/recipe.lua:783` | `gold-plate` ingredient |
| `prototypes/recipe.lua:813-819` | `glass-plate`, `silica-sand`, `glass-billet` |
| `prototypes/recipe.lua:891` | `gold-cable` ingredient |
| `prototypes/recipe.lua:1025` | `glass-plate` ingredient |
| `prototypes/recycling.lua:28` | `glass-billet` |
| `prototypes/ammos.lua:47,131` | `neodymium-plate` ingredient |
| `prototypes/entity/resources.lua:424,430` | `gold-ore`, `silica-sand` resource autoplace |
| `prototypes/planet/technology-basic.lua` / `technology-infinite.lua` | unlock these recipes |
| `prototypes/entity/accumulators.lua:169` | commented-out `neodymium-plate` (NYI) |
| `locale/*/locale.cfg` | display names for the shared materials |

So the dependency surface is: **8 items, 2 fluids, 12 recipes** plus their
locale strings and (critically) their **icon graphics**.

## Why this is NOT a clean "just inline it" change

Two blockers make a naive vendor unsafe:

1. **Graphics dependency leaks through.** Every vendored prototype references
   `__common-prototypes-graphics__/...` icons. Metal and Stars does **not**
   depend on `common-prototypes-graphics` (only on `metal-and-stars-graphics`
   and `metal-and-stars-graphics-2`). Copying the Lua without the icons would
   produce missing-icon / load errors. Fully removing `common-prototypes`
   therefore requires either:
   - adding a `common-prototypes-graphics` dependency (only partially reduces
     the surface — trades one dep for another), **or**
   - copying the needed icon PNGs into a Metal and Stars graphics pack and
     repointing the icon paths.

2. **Shared-material collision risk.** The whole point of `common-prototypes`
   is to *synchronize* these materials so multiple mods agree on a single
   `gold-plate`, `molten-gold`, etc. If another loaded mod also depends on
   `common-prototypes` and Metal and Stars re-`data:extend`s the same names,
   Factorio will crash on duplicate prototype definitions. Vendoring is only
   safe if Metal and Stars is the *only* consumer, or if it guards every
   definition with `if not data.raw[...][name] then ... end`.

Because of (1) and (2), this is filed as an **investigation** rather than a
finished vendor.

## Recommended path forward

Pick one of:

### Option A — Keep the dependency (lowest risk)
Leave `common-prototypes >= 0.0.4` as-is. It is small, data-stage-only, and
authored by the same author (`5forSilver`). The "breakage when that mod
changes" risk is mitigated by the `>= 0.0.4` floor and shared authorship.

### Option B — Vendor defensively (medium effort, recommended if dropping)
1. Copy the four prototype files into
   `prototypes/common/{item,fluid,recipe,recycling-recipes}.lua`.
2. Wrap every definition so it is only added when absent, e.g.
   ```lua
   local function extend_if_absent(protos)
     local filtered = {}
     for _, p in ipairs(protos) do
       if not (data.raw[p.type] and data.raw[p.type][p.name]) then
         table.insert(filtered, p)
       end
     end
     data:extend(filtered)
   end
   ```
   This keeps Metal and Stars compatible with other mods that still pull in
   `common-prototypes`.
3. Resolve graphics: copy the referenced icons into `metal-and-stars-graphics`
   (or `-2`) and repoint paths, OR add `? common-prototypes-graphics` and keep
   the `__common-prototypes-graphics__` paths.
4. `require` the new files early in `data.lua` (before `fluid`, `item.item`,
   and `recipe`) so the names exist when referenced.
5. Remove `"common-prototypes >= 0.0.4"` from `info.json` (keep the graphics
   dep if chosen in step 3).

### Option C — Optional dependency
Change `"common-prototypes >= 0.0.4"` to `"? common-prototypes >= 0.0.4"` and
vendor defensively (Option B step 2) as a fallback. This lets the shared
library win when present, and Metal and Stars supply the prototypes otherwise.

## How to verify in-game
- Load Metal and Stars with **only** its required deps and confirm no
  "unknown item/fluid/recipe" or missing-icon errors for the names above.
- Load it **alongside** another mod that also depends on `common-prototypes`
  and confirm no "duplicate prototype" crash (this is the collision test for
  Options B/C).
- Spot-check that `gold-ore`/`silica-sand` still autoplace on the relevant
  planets and that the casting/smelting recipes still unlock from the basic
  and infinite technologies.

No production prototypes were changed by this PR; it only documents the
dependency so the vendor can be done safely in a follow-up.
