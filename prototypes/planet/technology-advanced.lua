data:extend({
    {
        type = "technology",
        name = "overclock-module",
        icon = "__metal-and-stars-graphics__/graphics/technology/pollution-module-1.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "overclock-module"
          }
        },
        prerequisites = {"modules"},
        unit =
        {
          count = 50,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
          time = 30
        },
        upgrade = true
      },
      {
        type = "technology",
        name = "overclock-module-2",
        icon = "__metal-and-stars-graphics__/graphics/technology/pollution-module-2.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "overclock-module-2"
          }
        },
        prerequisites = {"overclock-module", "space-science-pack"},
        unit =
        {
          count = 200,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"space-science-pack", 1}
          },
          time = 30
        },
        upgrade = true
      },
      {
        type = "technology",
        name = "overclock-module-3",
        icon = "__metal-and-stars-graphics__/graphics/technology/pollution-module-3.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "overclock-module-3"
          }
        },
        prerequisites = {"overclock-module-2", "anomaly-science-pack"},
        unit =
        {
          count = 300,
          ingredients =
          {
            {"space-science-pack", 1},
            {"nanite-science-pack", 1},
            {"anomaly-science-pack", 1}
          },
          time = 60
        },
        upgrade = true
    },
    {
        type = "technology",
        name = "prototype-mech-armor",
        icon = "__metal-and-stars-graphics__/graphics/technology/prototype-mech-armor.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "prototype-mech-armor"
          }
        },
        prerequisites = {"power-armor", "rocket-fuel", "overclock-module-2", "productivity-module-2"},
        unit =
        {
          count = 500,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1}
          },
          time = 30
        }
    },
    {
        type = "technology",
        name = "nanite-rocket-construction",
        icon = "__metal-and-stars-graphics__/graphics/technology/nanite-rocket-construction.png",
        icon_size = 256,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "nano-rocket-part"
            },
        },
        prerequisites = {"nanite-science-pack"},
        unit =
        {
            count = 1000,
            ingredients =
            {
              {"space-science-pack", 1},
              {"nanite-science-pack", 1},
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "insulated-rocket-body",
        icon = "__metal-and-stars-graphics__/graphics/technology/insulated-rocket-body.png",
        icon_size = 256,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "ring-rocket-part"
            },
        },
        prerequisites = {"nanite-rocket-construction", "ring-science-pack"},
        unit =
        {
            count = 1000,
            ingredients =
            {
              {"space-science-pack", 1},
              {"nanite-science-pack", 1},
              {"ring-science-pack", 1},
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "superdense-rocket-fuel",
        icon = "__metal-and-stars-graphics__/graphics/technology/superdense-rocket-fuel.png",
        icon_size = 256,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "anomalous-rocket-part"
            },
        },
        prerequisites = {"nanite-rocket-construction","dark-matter-fuel"},
        unit =
        {
            count = 1000,
            ingredients =
            {
              {"space-science-pack", 1},
              {"nanite-science-pack", 1},
              {"anomaly-science-pack", 1},
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "pyrolysis",
        icon = "__metal-and-stars-graphics__/graphics/technology/pyrolysis.png",
        icon_size = 256,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "pyrolytic-charcoal"
            },
            {
              type = "unlock-recipe",
              recipe = "pyrolytic-carbon"
            },
        },
        prerequisites = {"anomaly-science-pack"},
        unit =
        {
            count = 1000,
            ingredients =
            {
              {"space-science-pack", 1},
              {"nanite-science-pack", 1},
              {"anomaly-science-pack", 1},
            },
            time = 60
        }
    },
  {
    type = "technology",
    name = "alternative-asteroid-processing",
    icon = "__metal-and-stars-graphics__/graphics/technology/alternative-asteroid-processing.png",
    icon_size = 256,
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "carbonic-asteroid-refined-crushing"
        },
        {
            type = "unlock-recipe",
            recipe = "sloppy-asteroid-smelting"
        },
    },
    prerequisites = {"anomaly-science-pack"},
    unit =
    {
        count = 1000,
        ingredients =
        {
          {"space-science-pack", 1},
          {"nanite-science-pack", 1},
          {"anomaly-science-pack", 1},
        },
        time = 60
    }
 },
 {
    type = "technology",
    name = "precursor-machines",
    icon = "__metal-and-stars-graphics__/graphics/technology/precursor-machines.png",
    icon_size = 256,
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "microgravity-assembler"
        },
        {
            type = "unlock-recipe",
            recipe = "neumann-conduit"
        },
    },
    prerequisites = {"anomaly-science-pack", "ring-science-pack", "quantum-science-pack", "high-speed-processor"},
    unit =
    {
        count = 1000,
        ingredients =
        {
          {"space-science-pack", 1},
          {"nanite-science-pack", 1},
          {"anomaly-science-pack", 1},
          {"ring-science-pack", 1},
          {"quantum-science-pack", 1},
        },
        time = 60
    }
 },
 {
    type = "technology",
    name = "high-speed-processor",
    icon = "__metal-and-stars-graphics__/graphics/technology/high-speed-processor.png",
    icon_size = 256,
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "high-speed-processor"
        },
    },
    prerequisites = {"ring-science-pack", "quantum-science-pack", "gold-wired-electronics"},
    unit =
    {
        count = 1000,
        ingredients =
        {
          {"space-science-pack", 1},
          {"nanite-science-pack", 1},
          {"ring-science-pack", 1},
          {"quantum-science-pack", 1},
        },
        time = 60
    }
 },
 {
    type = "technology",
    name = "quantum-ore-conversion-1",
    icon = "__metal-and-stars-graphics__/graphics/technology/quantum-ore-conversion-1.png",
    icon_size = 256,
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "iron-ore-from-stone"
        },
        {
            type = "unlock-recipe",
            recipe = "copper-ore-from-iron-ore"
        },
        {
            type = "unlock-recipe",
            recipe = "stone-from-copper-ore"
        },
    },
    prerequisites = {"quantum-science-pack"},
    unit =
    {
        count = 1000,
        ingredients =
        {
          {"space-science-pack", 1},
          {"nanite-science-pack", 1},
          {"quantum-science-pack", 1},
        },
        time = 60
    }
 },
 {
    type = "technology",
    name = "dark-matter-fuel",
    icon = "__metal-and-stars-graphics__/graphics/technology/dark-matter-fuel.png",
    icon_size = 256,
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "dark-matter-fuel"
        },
        {
          type = "unlock-recipe",
          recipe = "liquid-dark-matter-fuel"
        },
        {
          type = "unlock-recipe",
          recipe = "empty-liquid-dark-matter-fuel"
        },
        {
          type = "unlock-recipe",
          recipe = "canister-liquid-dark-matter-fuel"
        },
    },
    prerequisites = {"anomaly-science-pack"},
    unit =
    {
        count = 1000,
        ingredients =
        {
          {"space-science-pack", 1},
          {"nanite-science-pack", 1},
          {"anomaly-science-pack", 1},
        },
        time = 60
    }
 },
 {
    type = "technology",
    name = "dark-matter-reactor-fuel",
    icon = "__metal-and-stars-graphics__/graphics/technology/dark-matter-fuel-cell.png",
    icon_size = 256,
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "dark-matter-fuel-cell"
        },
    },
    prerequisites = {"dark-matter-fuel", "nuclear-power"},
    unit =
    {
        count = 1000,
        ingredients =
        {
          {"space-science-pack", 1},
          {"nanite-science-pack", 1},
          {"anomaly-science-pack", 1},
        },
        time = 60
    }
 },
 --scaffold
 {
  type = "technology",
  name = "gauss-rockets",
  icon = "__metal-and-stars-graphics__/graphics/technology/gauss-rockets.png",
  icon_size = 256,
  effects =
  {
      {
          type = "unlock-recipe",
          recipe = "gauss-rocket"
      },
      {
        type = "unlock-recipe",
        recipe = "gauss-rocket-casting"
    },
  },
  prerequisites = {"quantum-science-pack", "rocketry", "neodymium-processing"},
  unit =
  {
      count = 1000,
      ingredients =
      {
        {"space-science-pack", 1},
        {"nanite-science-pack", 1},
        {"quantum-science-pack", 1},
      },
      time = 60
  }
},
{
  type = "technology",
  name = "antimatter-robots",
  icon = "__metal-and-stars-graphics__/graphics/technology/antimatter-robots.png",
  icon_size = 256,
  effects =
  {
      {
          type = "unlock-recipe",
          recipe = "antimatter-construction-robot"
      },
      {
        type = "unlock-recipe",
        recipe = "antimatter-logistic-robot"
    },
  },
  prerequisites = {"anomaly-science-pack", "antimatter-catalyst", "robotics"},
  unit =
  {
      count = 1000,
      ingredients =
      {
        {"space-science-pack", 1},
        {"nanite-science-pack", 1},
        {"anomaly-science-pack", 1},
      },
      time = 60
  }
},
{
  type = "technology",
  name = "thorium-ammo",
  icon = "__metal-and-stars-graphics__/graphics/technology/thorium-ammo.png",
  icon_size = 256,
  effects =
  {
      {
          type = "unlock-recipe",
          recipe = "thorium-rounds-magazine"
      },
      {
        type = "unlock-recipe",
        recipe = "thorium-cannon-shell"
    },
  },
  prerequisites = {"quantum-science-pack", "uranium-ammo"},
  unit =
  {
      count = 1000,
      ingredients =
      {
        {"space-science-pack", 1},
        {"nanite-science-pack", 1},
        {"quantum-science-pack", 1},
      },
      time = 60
  }
},
{
  type = "technology",
  name = "thorium-enrichment",
  icon = "__metal-and-stars-graphics__/graphics/technology/thorium-enrichment.png",
  icon_size = 256,
  effects =
  {
      {
          type = "unlock-recipe",
          recipe = "thorium-enrichment-process"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-fuel-cell-233"
    },
  },
  prerequisites = {"quantum-science-pack", "kovarex-enrichment-process", "nuclear-power"},
  unit =
  {
      count = 1000,
      ingredients =
      {
        {"space-science-pack", 1},
        {"nanite-science-pack", 1},
        {"quantum-science-pack", 1},
      },
      time = 60
  }
},

  --Bioculture
  {
    type = "technology",
    name = "mechanical-bioculture",
    icon = "__metal-and-stars-graphics-2__/graphics/technology/pathogen-lab-icon-big.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "microculture-vat"
      },
    },
    prerequisites = {"ring-science-pack"},
    unit =
    {
        count = 250,
        ingredients =
        {
            {"space-science-pack", 1},
            {"nanite-science-pack", 1},
            {"ring-science-pack", 1},
        },
        time = 60
    }
  },
  {
    type = "technology",
    name = "advanced-bioculture",
    icon = "__metal-and-stars-graphics-2__/graphics/technology/bacteria-cultivation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "algae-bacteria"
      },
      {
        type = "unlock-recipe",
        recipe = "radio-bacteria"
      },
      {
        type = "unlock-recipe",
        recipe = "thermo-bacteria"
      },
      {
        type = "unlock-recipe",
        recipe = "petro-bacteria"
      },
      {
        type = "unlock-recipe",
        recipe = "algae-bacteria-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "ammoniac-bacteria-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "petro-bacteria-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "radio-bacteria-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "thermo-bacteria-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "thermo-bacteria-fermentation"
      },
    },
    prerequisites = {"mechanical-bioculture", "agricultural-science-pack"},
    unit =
    {
        count = 500,
        ingredients =
        {
            {"space-science-pack", 1},
            {"nanite-science-pack", 1},
            {"ring-science-pack", 1},
            {"agricultural-science-pack", 1},
        },
        time = 60
    }
  },
    
})
