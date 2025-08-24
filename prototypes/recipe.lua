data:extend({
  {
    type = "recipe",
    name = "quantum-shard-a",
    category = "quantum",
    subgroup = "quantum-processing",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "quantite-a", amount = 1},
      {type = "item", name = "holmium-plate", amount = 1}
    },
    results = {{type="item", name="quantum-shard-a", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "quantum-shard-b",
    category = "quantum",
    subgroup = "quantum-processing",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "quantite-b", amount = 1},
      {type = "item", name = "neodymium-plate", amount = 1}
    },
    results = {{type="item", name="quantum-shard-b", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "quantum-shard-c",
    category = "quantum",
    subgroup = "quantum-processing",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "quantite-c", amount = 1},
      {type = "item", name = "lithium-plate", amount = 1}
    },
    results = {{type="item", name="quantum-shard-c", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "volatile-quantum-science-pack",
    enabled = false,
    category = "quantum",
    subgroup = "quantum-processing",
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "quantum-shard-a", amount = 1},
      {type = "item", name = "quantum-shard-b", amount = 1},
      {type = "item", name = "quantum-shard-c", amount = 1}
    },
    results = {{type="item", name="volatile-quantum-science-pack", amount=1}},
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.0, b = 0.0, a = 1.000},
      secondary = {r = 1.000, g = 0.0, b = 0.0, a = 1.000},
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "inert-science-pack-salvage",
    enabled = false,
    category = "quantum",
    subgroup = "quantum-processing",
    icons = {
        {
          icon = "__quality__/graphics/icons/recycling.png"
        },
        {
          icon = "__metal-and-stars-graphics__/graphics/icons/inert-quantum-science.png",
          scale = 0.4
        },
        {
          icon = "__quality__/graphics/icons/recycling-top.png"
        }
      },
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "inert-quantum-science-pack", amount = 1, ignored_by_stats = 1},
    },
    results = {
      {type = "item", name = "quantum-shard-a", amount = 1, probability = 0.1, ignored_by_stats = 1},
      {type = "item", name = "quantum-shard-b", amount = 1, probability = 0.1, ignored_by_stats = 1},
      {type = "item", name = "quantum-shard-c", amount = 1, probability = 0.1, ignored_by_stats = 1},
    },
  },
  {
    type = "recipe",
    name = "quantum-science-pack",
    enabled = false,
    category = "quantum",
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "unstable-quantum-science-pack", amount = 1},
      {type = "item", name = "inert-quantum-science-pack", amount = 1}
    },
    results = {{type="item", name="quantum-science-pack", amount=2}},
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.0, b = 0.0, a = 1.000},
      secondary = {r = 1.000, g = 0.0, b = 0.0, a = 1.000},
    },
    allow_productivity = true
  },

  {
    type = "recipe",
    name = "thorium-enrichment-process",
    energy_required = 60,
    enabled = false,
    category = "centrifuging",
    icon = "__metal-and-stars-graphics__/graphics/icons/thorium-enrichment-process.png",
    subgroup = "uranium-processing",
    order = "b[uranium-products]-c[thorium-enrichment-process]",
    ingredients =
    {
      {type = "item", name = "thorium", amount = 5},
      {type = "item", name = "quantite-a", amount = 20, ignored_by_stats = 20}
    },
    results =
    {
      {type = "item", name = "quantite-b", amount = 20, ignored_by_stats = 20, ignored_by_productivity = 20},
      {type = "item", name = "uranium-233", amount = 5}
    },
    main_product = "uranium-233",
    auto_recycle = false,
    allow_productivity = true,
    allow_quality = false -- catalyst would be also bumped on quality
  },

  {
    type = "recipe",
    name = "uranium-fuel-cell-233",
    energy_required = 60,
    enabled = false,
    category = "centrifuging",
    icon = "__base__/graphics/icons/uranium-fuel-cell.png",
    subgroup = "uranium-processing",
    order = "b[uranium-products]-c[thorium-enrichment-process]",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1},
      {type = "item", name = "uranium-233", amount = 5}
    },
    results =
    {
      {type = "item", name = "uranium-fuel-cell", amount = 1}
    },
    auto_recycle = false,
    allow_productivity = true,
  },

  {
    type = "recipe",
    name = "mirandite-sludge",
    energy_required = 3,
    enabled = false,
    category = "chemistry",
    icon = "__metal-and-stars-graphics__/graphics/icons/mirandite-sludge.png",
    subgroup = "mirandus-processes",
    order = "b[uranium-products]-c[thorium-enrichment-process]",
    ingredients =
    {
      {type = "item", name = "mirandite-asteroid-chunk", amount = 2},
      {type = "fluid", name = "water", amount = 90, ignored_by_stats = 90}
    },
    results =
    {
      {type = "fluid", name = "mirandite-sludge", amount = 100}
    },
    main_product = "mirandite-sludge",
    auto_recycle = false,
    allow_productivity = true,
  },


  {
    type = "recipe",
    name = "mirandite-processing",
    energy_required = 2,
    category = "crafting-with-fluid-or-metallurgy",
    ingredients = {{type = "fluid", name = "mirandite-sludge", amount = 100}},
    
    icon = "__metal-and-stars-graphics__/graphics/icons/mirandite-asteroid-chunk.png",
    subgroup = "mirandus-processes",
    order = "a[uranium-processing]-a[uranium-processing]",
    results =
    {
      {type = "fluid", name = "water", amount = 30, ignored_by_stats = 30, ignored_by_productivity = 30},
      {
        type = "item",
        name = "quantite-a",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "quantite-b",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "quantite-c",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "thorium",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "holmium-ore",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "neodymium-ore",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "lithium",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "iron-ore",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "copper-ore",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "stone",
        probability = 0.1,
        amount = 1
      },
      {
        type = "item",
        name = "calcite",
        probability = 0.1,
        amount = 1
      },
    },
    allow_productivity = true,
    auto_recycle = false,
    enabled = false
  },
  --/////////////////////////////////////////////////   NIX RECIPES
  {
    type = "recipe",
    name = "crude-slush-processing",
    icon = "__metal-and-stars-graphics__/graphics/icons/crude-slush.png",
    category = "oil-processing",
    subgroup = "nix-processes",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = .5,
    ingredients = {
      {type = "fluid", name = "crude-slush", amount = 12},
    },
    results = {
      {type="fluid", name="crude-oil", amount=10},
      {type="item", name="ice", amount=1}
    },
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "dark-matter-compression",
    icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-chunk-1.png",
    category = "compression",
    subgroup = "nix-processes",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {
      {type = "fluid", name = "dark-matter-fluid", amount = 10},
    },
    results = {
      {type="item", name="dark-matter-chunk", amount=1},
      {type="item", name="antimatter", amount=1, probability=.001}
    },
    crafting_machine_tint =
    {
      primary = {r = 222, g = 0, b = 255, a = 1.000},
      secondary = {r = 143, g = 0, b = 255, a = 1.000},
    },
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "dark-matter-crystal",
    icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-crystal.png",
    category = "compression",
    subgroup = "nix-processes",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "dark-matter-chunk", amount = 30},
      {type = "item", name = "diamond", amount = 1},
    },
    results = {{type="item", name="dark-matter-crystal", amount=1}},
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 222, g = 0, b = 255, a = 1.000},
      secondary = {r = 143, g = 0, b = 255, a = 1.000},
    },
    enabled = false
  },
  {
    type = "recipe",
    name = "dry-concrete",
    icon = "__base__/graphics/icons/concrete.png",
    subgroup = "terrain",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "stone-brick", amount = 5},
      {type = "item", name = "iron-ore", amount = 1},
    },
    results = {{type="item", name="concrete", amount=5}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "dark-matter-fuel",
    icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-fuel.png",
    category = "chemistry",
    subgroup = "nix-processes",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "dark-matter-chunk", amount = 1},
      {type = "item", name = "rocket-fuel", amount = 1},
    },
    crafting_machine_tint =
    {
      primary = {r = 222, g = 0, b = 255, a = 1.000},
      secondary = {r = 143, g = 0, b = 255, a = 1.000},
    },
    results = {{type="item", name="dark-matter-fuel", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "dark-matter-fuel-cell",
    icon = "__metal-and-stars-graphics__/graphics/icons/dark-matter-fuel-cell.png",
    category = "chemistry",
    subgroup = "nix-processes",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "dark-matter-chunk", amount = 5},
      {type = "item", name = "iron-plate", amount = 10},
    },
    crafting_machine_tint =
    {
      primary = {r = 222, g = 0, b = 255, a = 1.000},
      secondary = {r = 143, g = 0, b = 255, a = 1.000},
    },
    results = {{type="item", name="dark-matter-fuel-cell", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "pyrolytic-charcoal",
    icon = "__base__/graphics/icons/coal-1.png",
    category = "chemistry",
    subgroup = "nix-processes",
    order = "c[pyrolysis]-b[coal]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "wood", amount = 1},
    },
    results = {{type="item", name="coal", amount=2}},
    allow_productivity = true,
    auto_recycle = false,
    enabled = false
  },
  {
    type = "recipe",
    name = "pyrolytic-carbon",
    icon = "__space-age__/graphics/icons/carbon.png",
    category = "chemistry",
    subgroup = "nix-processes",
    order = "c[pyrolysis]-b[carbon]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "wood", amount = 1},
    },
    results = {{type="item", name="carbon", amount=1}},
    allow_productivity = true,
    auto_recycle = false,
    enabled = false
  },
  {
    type = "recipe",
    name = "manufactured-diamond",
    icon = "__metal-and-stars-graphics__/graphics/icons/diamond.png",
    category = "compression",
    subgroup = "nix-processes",
    order = "c[lithium]-b[lithium-plate]",
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "coal", amount = 100},
    },
    results = {{type="item", name="diamond", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "ice-compression",
    icon = "__metal-and-stars-graphics__/graphics/icons/dense-ice-cube.png",
    category = "compression",
    subgroup = "nix-processes",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "fluid", name = "dark-matter-fluid", amount = 5},
      {type = "item", name = "ice", amount = 50},
    },
    crafting_machine_tint =
    {
      primary = {r = 0, g = 242, b = 255, a = 1.000},
      secondary = {r = 0, g = 175, b = 255, a = 1.000},
    },
    results = {{type="item", name="ice-xv", amount=1}},
    allow_productivity = true,
    auto_recycle = false,
    enabled = false
  },
  {
    type = "recipe",
    name = "dense-stone-brick",
    icon = "__metal-and-stars-graphics__/graphics/icons/dense-stone-brick.png",
    category = "compression",
    subgroup = "nix-processes",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "fluid", name = "dark-matter-fluid", amount = 5},
      {type = "item", name = "stone-brick", amount = 50},
      {type = "item", name = "diamond", amount = 1},
    },
    results = {{type="item", name="dense-stone-brick", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "anomaly-science-pack",
    icon = "__metal-and-stars-graphics__/graphics/icons/anomaly-science-pack.png",
    enabled = false,
    category = "compression",
    energy_required = 15,
    ingredients =
    {
      {type = "item", name = "dark-matter-crystal", amount = 10},
      {type = "item", name = "ice-xv", amount = 5},
      {type = "item", name = "dense-stone-brick", amount = 10},
    },
    results = {
      {type="item", name="anomaly-science-pack", amount=2}
    },
    crafting_machine_tint =
    {
      primary = {r = 222, g = 0, b = 255, a = 1.000},
      secondary = {r = 143, g = 0, b = 255, a = 1.000},
    },
    auto_recycle = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "catalyzed-anomaly-science-pack",
    icon = "__metal-and-stars-graphics__/graphics/icons/anomaly-science-pack-catalyzed.png",
    enabled = false,
    category = "compression",
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "dark-matter-crystal", amount = 2},
      {type = "item", name = "ice-xv", amount = 2},
      {type = "item", name = "dense-stone-brick", amount = 2},
      {type = "item", name = "antimatter", amount = 1}
    },
    results = {
      {type="item", name = "antimatter", amount = 1, ignored_by_productivity = 1, ignored_by_stats = 1},
      {type="item", name="anomaly-science-pack", amount=2}
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.0, b = 0.0, a = 1.000},
      secondary = {r = 1.000, g = 0.0, b = 0.0, a = 1.000},
    },
    main_product = "anomaly-science-pack",
    auto_recycle = false,
    allow_productivity = true,
    allow_quality = false -- catalyst would be also bumped on quality
  },
  -- SHIPYARD RECIPES
  {
    type = "recipe",
    name = "nanites",
    icon = "__metal-and-stars-graphics__/graphics/icons/nanites.png",
    category = "nanotech",
    subgroup = "shipyard-processes",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "fluid", name = "gray-goo", amount = 50},
    },
    results = {
      {type="item", name="nanites", amount=50},
      {type="fluid", name="lubricant", amount=1}
    },
    auto_recycle = false,
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "nanothruster",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/nano-thruster.png",
    category = "nanotech",
    subgroup = "space-nanites",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "nanites", amount = 150},
    },
    results = {
      {type="item", name="thruster", amount=1}
    },
    auto_recycle = false,
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "nanograbber",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/nano-asteroid-collector.png",
    category = "nanotech",
    subgroup = "space-nanites",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "nanites", amount = 150},
    },
    results = {
      {type="item", name="asteroid-collector", amount=1}
    },
    auto_recycle = false,
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "nanocrusher",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/nano-crusher.png",
    category = "nanotech",
    subgroup = "space-nanites",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "nanites", amount = 150},
    },
    results = {
      {type="item", name="crusher", amount=1}
    },
    auto_recycle = false,
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "space-chest-ms",
    enabled = false,
    category = "nanotech",
    subgroup = "space-nanites",
    order = "c[lithium]-bz[lithium-plate]",
    energy_required = 20,
    ingredients = {
      {type = "item", name = "nanites", amount = 20},
      {type = "item", name = "iron-chest", amount = 1},
    },
    results = {{type="item", name="space-chest-ms", amount=1}}
  },
  {
    type = "recipe",
    name = "nanite-science-pack",
    enabled = false,
    category = "nanotech",
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "nanites", amount = 10},
      {type = "item", name = "thruster", amount = 1},
      {type = "item", name = "space-platform-starter-pack", amount = 1},
    },
    results = {{type="item", name="nanite-science-pack", amount=2}},
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.0, b = 0.0, a = 1.000},
      secondary = {r = 1.000, g = 0.0, b = 0.0, a = 1.000},
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "nanite-platform-foundation",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/nano-space-platform-foundation.png",
    category = "nanotech",
    subgroup = "space-nanites",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "gray-goo", amount = 50},
    },
    results = {{type="item", name="space-platform-foundation", amount=1}},
    auto_recycle = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "nanite-cargo-bay",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/nano-cargo-bay.png",
    category = "nanotech",
    subgroup = "space-nanites",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "gray-goo", amount = 100},
    },
    results = {{type="item", name="cargo-bay", amount=1}},
    auto_recycle = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "nanite-platform-starter-pack",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/nano-space-platform-hub.png",
    energy_required = 20,
    category = "nanotech",
    subgroup = "space-nanites",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "space-platform-foundation", amount = 50},
      {type = "item", name = "nanites", amount = 40},
    },
    results = {{type="item", name="space-platform-starter-pack", amount=1}},
    auto_recycle = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "carbonic-asteroid-refined-crushing",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/carbonic-asteroid-refined-crushing.png",
    category = "crushing",
    subgroup="space-crushing",
    order = "b-a-b",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "carbonic-asteroid-chunk", amount = 1},
    },
    energy_required = 2,
    results =
    {
      {type = "item", name = "coal", amount = 4},
      {type = "item", name = "stone", amount = 3},
      {type = "item", name = "uranium-238", amount = 1, probability = 0.1}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "sloppy-asteroid-smelting",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/sloppy-asteroid-smelting.png",
    category = "metallurgy",
    subgroup= "space-crushing",
    order = "b-a-a",
    auto_recycle = false,
    enabled = false,
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    ingredients =
    {
      {type = "item", name = "metallic-asteroid-chunk", amount = 1},
    },
    energy_required = 2,
    results =
    {
      {type = "item", name = "stone", amount = 20},
      {type = "fluid", name = "molten-iron", amount = 10, probability = 0.5},
      {type = "fluid", name = "molten-copper", amount = 10, probability = 0.5}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  -- RINGWORLD RECIPES
  {
    type = "recipe",
    name = "heavy-water-processing",
    icon = "__metal-and-stars-graphics__/graphics/icons/heavy-water.png",
    category = "chemistry",
    subgroup = "ringworld-processes",
    order = "b-a-a",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "heavy-water", amount = 10},
    },
    energy_required = .5,
    results =
    {
      {type = "fluid", name = "water", amount = 10, ignored_by_productivity = 10},
      {type = "item", name = "iron-ore", amount = 1, probability = 0.5},
      {type = "item", name = "copper-ore", amount = 1, probability = 0.5}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "gold-foil",
    icon = "__metal-and-stars-graphics__/graphics/icons/gold-foil-1.png",
    subgroup = "ringworld-processes",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "gold-plate", amount = 1},
    },
    results = {{type="item", name="gold-foil", amount=10}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "multilayer-insulation",
    icon = "__metal-and-stars-graphics__/graphics/icons/multilayer-insulation.png",
    subgroup = "ringworld-processes",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "gold-foil", amount = 18},
      {type = "item", name = "plastic-bar", amount = 1},
    },
    results = {{type="item", name="multilayer-insulation", amount=3}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "aspheric-lens",
    category = "crafting-with-fluid",
    icon = "__metal-and-stars-graphics__/graphics/icons/glass-lens.png",
    subgroup = "ringworld-processes",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "glass-plate", amount = 1},
      {type = "item", name = "silica-sand", amount = 2},
      {type = "fluid", name = "lubricant", amount = 5},
    },
    results = {
      {type = "item", name = "aspheric-lens", amount = 1},
      {type = "item", name = "glass-billet", amount_min = 2, amount_max = 3, ignored_by_productivity = 3},
    },
    allow_productivity = true,
    auto_recycle = false,
    enabled = false
  },
  {
    type = "recipe",
    name = "process-bitumen",
    category = "oil-processing",
    icon = "__metal-and-stars-graphics__/graphics/icons/tar-1.png",
    subgroup = "ringworld-processes",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "bitumen", amount = 10},
    },
    results =
    {
      {type = "fluid", name = "crude-oil", amount = 30},
      {type = "item", name = "bone-fragments", amount = 1, probability = 0.3},
      {type = "item", name = "coal", amount = 1, probability = 0.2},
    },
    allow_productivity = true,
    auto_recycle = false,
    enabled = false
  },
  {
    type = "recipe",
    name = "bone-to-calcite",
    category = "smelting",
    icon = "__metal-and-stars-graphics__/graphics/icons/bone-fragments-1.png",
    subgroup = "ringworld-processes",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "bone-fragments", amount = 10},
    },
    results = {{type="item", name="calcite", amount=1}},
    allow_productivity = true,
    auto_recycle = false,
    enabled = false
  },
  {
    type = "recipe",
    name = "ring-science-pack",
    category = "crafting-with-fluid",
    icon = "__metal-and-stars-graphics__/graphics/icons/ring-science-pack.png",
    energy_required = 5,
    ingredients = {
      {type = "item", name = "aspheric-lens", amount = 10},
      {type = "item", name = "multilayer-insulation", amount = 10},
      {type = "fluid", name = "heavy-water", amount = 10},
    },
    results = {
      {type="item", name="ring-science-pack", amount=1},
      {type="fluid", name="water", amount=10, ignored_by_productivity = 10},
    },
    main_product = "ring-science-pack",
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "high-speed-processor",
    category = "electronics-or-assembling",
    icon = "__metal-and-stars-graphics__/graphics/icons/high-speed-processor.png",
    subgroup = "ringworld-processes",
    order = "c[lithium]-b[lithium-plate]",
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "gold-cable", amount = 6},
      {type = "item", name = "quantum-shard-c", amount = 1},
    },
    results = {{type="item", name="high-speed-processor", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
    type = "recipe",
    name = "overclock-module",
    enabled = false,
    category = "electronics",
    icon = "__metal-and-stars-graphics__/graphics/icons/pollution-module-1.png",
    ingredients =
    {
      {type = "item", name = "advanced-circuit", amount = 5},
      {type = "item", name = "electronic-circuit", amount = 5}
    },
    energy_required = 15,
    results = {{type="item", name="overclock-module", amount=1}}
  },
  {
    type = "recipe",
    name = "overclock-module-2",
    enabled = false,
    category = "electronics",
    icon = "__metal-and-stars-graphics__/graphics/icons/pollution-module-2.png",
    ingredients =
    {
      {type = "item", name = "overclock-module", amount = 4},
      {type = "item", name = "advanced-circuit", amount = 5},
      {type = "item", name = "processing-unit", amount = 5}
    },
    energy_required = 30,
    results = {{type="item", name="overclock-module-2", amount=1}}
  },
  {
    type = "recipe",
    name = "overclock-module-3",
    enabled = false,
    category = "electronics",
    icon = "__metal-and-stars-graphics__/graphics/icons/pollution-module-3.png",
    ingredients =
    {
      {type = "item", name = "overclock-module-2", amount = 4},
      {type = "item", name = "advanced-circuit", amount = 5},
      {type = "item", name = "processing-unit", amount = 5},
      {type = "item", name = "dark-matter-crystal", amount = 1}
    },
    energy_required = 60,
    results = {{type="item", name="overclock-module-3", amount=1}}
  },
  {
    type = "recipe",
    name = "prototype-mech-armor",
    category = "crafting-with-fluid",
    icon = "__metal-and-stars-graphics__/graphics/icons/prototype-mech-armor.png",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {type = "item", name = "productivity-module-2", amount = 25},
      {type = "item", name = "overclock-module-2", amount = 25},
      {type = "item", name = "processing-unit", amount = 60},
      {type = "item", name = "low-density-structure", amount = 30},
      {type = "fluid", name = "liquid-rocket-fuel", amount = 400}
    },
    results = {{type="item", name="prototype-mech-armor", amount=1}},
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "antimatter-construction-robot",
    icon = "__metal-and-stars-graphics__/graphics/icons/antimatter-construction-robot.png",
    enabled = false,
    ingredients =
    {
        {type="item", name="construction-robot", amount=1},
        {type="item", name="antimatter", amount=1},
    },
    results = {{type="item", name="antimatter-construction-robot", amount=1}}
  },
  {
      type = "recipe",
      name = "antimatter-logistic-robot",
      icon = "__metal-and-stars-graphics__/graphics/icons/antimatter-logistic-robot.png",
      enabled = false,
      ingredients =
      {
          {type="item", name="logistic-robot", amount=1},
          {type="item", name="antimatter", amount=1},
      },
      results = {{type="item", name="antimatter-logistic-robot", amount=1}}
  },
  --//////////////machines
  {
    type = "recipe",
    name = "liquid-fuel-heating-tower",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "flamethrower", amount = 1},
      {type = "item", name = "heat-pipe", amount = 5},
      {type = "item", name = "storage-tank", amount = 2},
      {type = "item", name = "pipe", amount = 6},
    },
    results = {{type="item", name="liquid-fuel-heating-tower", amount=1}},
    allow_productivity = true,
    enabled = false
  },
  {
		type = "recipe",
		name = "barometric-vice",
		enabled = false,
    category = "crafting-with-fluid",
    icon = "__metal-and-stars-graphics__/graphics/icons/chemical-stager.png",
    energy_required = 10,
		ingredients = {
      {type = "item", name = "stone-brick", amount = 20},
      {type = "item", name = "small-lamp", amount = 3},
      {type = "item", name = "steel-plate", amount = 40},
      {type = "fluid", name = "dark-matter-fluid", amount = 10},
		},
    allow_productivity = true,
		results = {{type="item", name="barometric-vice", amount=1}}
	},
  {
		type = "recipe",
		name = "microculture-vat",
		enabled = false,
    category = "crafting-with-fluid",
    icon = "__metal-and-stars-graphics-2__/graphics/icons/pathogen-lab.png",
    energy_required = 10,
		ingredients = {
      {type = "item", name = "glass-plate", amount = 24},
      {type = "item", name = "bone-fragments", amount = 8},
      {type = "item", name = "steel-plate", amount = 65},
      {type = "fluid", name = "water", amount = 5000},
		},
    allow_productivity = true,
		results = {{type="item", name="microculture-vat", amount=1}}
	},
  {
		type = "recipe",
		name = "ms-quantum-stabilizer",
    icon = "__metal-and-stars-graphics__/graphics/icons/quantum-stabilizer.png",
		enabled = false,
    category = "nanotech",
    energy_required = 10,
		ingredients = {
      {type = "item", name = "mirandite-asteroid-chunk", amount = 3},
      {type = "item", name = "nanites", amount = 100},
      {type = "item", name = "neumann-conduit", amount = 1},
		},
    allow_productivity = true,
		results = {{type="item", name="ms-quantum-stabilizer", amount=1}}
	},
  {
		type = "recipe",
		name = "microgravity-assembler",
    icon = "__metal-and-stars-graphics__/graphics/icons/gravity-assembler.png",
		enabled = false,
    energy_required = 10,
		ingredients = {
      {type = "item", name = "nanites", amount = 200},
      {type = "item", name = "high-speed-processor", amount = 4},
      {type = "item", name = "logistic-robot", amount = 5},
		},
    allow_productivity = true,
		results = {{type="item", name="microgravity-assembler", amount=1}}
	},
  {
		type = "recipe",
		name = "neumann-conduit",
    subgroup = "shipyard-processes",
    icon = "__metal-and-stars-graphics__/graphics/icons/conduit.png",
		enabled = false,
    energy_required = 10,
		ingredients = {
      {type = "item", name = "dark-matter-crystal", amount = 20},
      {type = "item", name = "quantum-shard-c", amount = 20},
		},
    allow_productivity = true,
		results = {{type="item", name="neumann-conduit", amount=1}}
	},
  {
    type = "recipe",
    name = "microgravity-lab",
    energy_required = 10,
    ingredients = 
    {
      {type = "item", name = "nanites", amount = 1000},
    },
    results = {{type="item", name="microgravity-lab", amount=1}},
    enabled = false
  },
})