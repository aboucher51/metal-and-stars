data:extend({
    {
        type = "technology",
        name = "planet-discovery-shipyard",
        icons = util.technology_icon_constant_planet("__metal-and-stars-graphics__/graphics/technology/shipyard-tech.png"),
        icon_size = 256,
        essential = true,
        effects =
        {
            {
                type = "unlock-space-location",
                space_location = "calidus-senestella-gate-calidus",
                use_icon_overlay_constant = true
            },
            {
                type = "unlock-space-location",
                space_location = "calidus-senestella-gate-senestella",
                use_icon_overlay_constant = true
            },
            {
                type = "unlock-space-location",
                space_location = "shipyard",
                use_icon_overlay_constant = true
            },
        },
        prerequisites = { "space-platform-thruster" },
        unit =
        {
            count = 1000,
            ingredients =
            {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1},
              {"chemical-science-pack", 1},
              {"space-science-pack", 1}
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "basic-low-gravity-assembly",
        icon = "__metal-and-stars-graphics__/graphics/technology/gravity-assembler-grabber.png",
        icon_size = 256,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "nanograbber"
            },
        },
        prerequisites = {"planet-discovery-shipyard"},
        research_trigger =
        {
          type = "mine-entity",
          entity = "microgravity-assembler"
        }
    },
    {
        type = "technology",
        name = "platform-power-pylons",
        icon = "__metal-and-stars-graphics__/graphics/technology/conduit-crusher.png",
        icon_size = 256,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "nanocrusher"
            },
        },
        prerequisites = {"planet-discovery-shipyard"},
        research_trigger =
        {
          type = "mine-entity",
          entity = "neumann-conduit"
        }
    },
    {
        type = "technology",
        name = "nanite-extraction",
        icon = "__metal-and-stars-graphics__/graphics/technology/nanite-extraction.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "nanites"
          },
        },
        prerequisites = {"planet-discovery-shipyard"},
        research_trigger =
        {
          type = "craft-fluid",
          fluid = "gray-goo"
        }
    },
    {
        type = "technology",
        name = "nanite-platform-assembly",
        icon = "__metal-and-stars-graphics__/graphics/technology/nanite-platform-assembly.png",
        icon_size = 256,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "nanothruster"
            },
            {
                type = "unlock-recipe",
                recipe = "nanite-platform-foundation"
            },
            {
                type = "unlock-recipe",
                recipe = "nanite-platform-starter-pack"
            },
            {
              type = "unlock-recipe",
              recipe = "nanite-cargo-bay"
          },
            {
              type = "unlock-recipe",
              recipe = "space-chest-ms"
            },
        },
        prerequisites = {"nanite-extraction"},
        research_trigger =
        {
          type = "craft-item",
          item = "nanites"
        }
    },
    {
        type = "technology",
        name = "nanite-science-pack",
        icon = "__metal-and-stars-graphics__/graphics/technology/nanite-science-pack.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "nanite-science-pack"
          },
          {
            type = "unlock-recipe",
            recipe = "microgravity-lab"
          },
        },
        prerequisites = {"nanite-platform-assembly"},
        research_trigger =
        {
            type = "craft-item",
            item = "nanites",
            count = 100
        }
    },
    --////////////////////////////////////////////// nix
    {
        type = "technology",
        name = "planet-discovery-nix",
        icons = util.technology_icon_constant_planet("__metal-and-stars-graphics__/graphics/technology/nix-tech.png"),
        icon_size = 256,
        essential = true,
        effects =
        {
            {
                type = "unlock-space-location",
                space_location = "nix",
                use_icon_overlay_constant = true
            },
        },
        prerequisites = { "nanite-science-pack" },
        unit =
        {
            count = 1000,
            ingredients =
            {
              {"space-science-pack", 1},
              {"nanite-science-pack", 1}
            },
            time = 60
        }
    },
    {
      type = "technology",
      name = "nix-heating-tower",
      icon = "__space-age__/graphics/technology/heating-tower.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "dry-concrete"
        },
        {
          type = "unlock-recipe",
          recipe = "heating-tower"
        },
        {
          type = "unlock-recipe",
          recipe = "heat-pipe"
        },
        {
          type = "unlock-recipe",
          recipe = "heat-exchanger"
        },
        {
          type = "unlock-recipe",
          recipe = "steam-turbine"
        }
      },
      prerequisites = {"planet-discovery-nix"},
      research_trigger =
      {
        type = "mine-entity",
        entity = "coal-stone-ore"
      }
    },
    {
        type = "technology",
        name = "crude-slush-processing",
        icon = "__metal-and-stars-graphics__/graphics/technology/crude-slush-processing.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "crude-slush-processing"
          },
          {
            type = "unlock-recipe",
            recipe = "ice-compression"
          },
          {
            type = "unlock-recipe",
            recipe = "liquid-fuel-heating-tower"
          },
        },
        prerequisites = {"nix-heating-tower"},
        research_trigger =
        {
          type = "craft-item",
          item = "heating-tower"
        }
    },
    {
      type = "technology",
      name = "high-pressure-manufacturing",
      icon = "__metal-and-stars-graphics__/graphics/technology/high-pressure-manufacturing.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "barometric-vice"
        },
        {
          type = "unlock-recipe",
          recipe = "manufactured-diamond"
        },
        {
          type = "unlock-recipe",
          recipe = "dense-stone-brick"
        },
      },
      prerequisites = {"crude-slush-processing"},
      research_trigger =
      {
        type = "mine-entity",
        entity = "crude-slush"
      }
    },
    {
      type = "technology",
      name = "dark-matter-processing",
      icon = "__metal-and-stars-graphics__/graphics/technology/dark-matter-processing.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "dark-matter-compression"
        },
      },
      prerequisites = {"high-pressure-manufacturing"},
      research_trigger =
      {
        type = "mine-entity",
        entity = "dark-matter-vent"
      }
    },
    {
        type = "technology",
        name = "antimatter-catalyst",
        icon = "__metal-and-stars-graphics__/graphics/technology/antimatter.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "catalyzed-anomaly-science-pack"
          },
        },
        prerequisites = {"dark-matter-processing"},
        research_trigger =
        {
          type = "craft-item",
          item = "antimatter"
        }
    },
    {
      type = "technology",
      name = "dark-matter-crystal",
      icon = "__metal-and-stars-graphics__/graphics/technology/dark-matter-crystal.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "dark-matter-crystal"
        },
      },
      prerequisites = {"dark-matter-processing", "high-pressure-manufacturing"},
      research_trigger =
      {
        type = "craft-item",
        item = "diamond"
      }
    },
    {
        type = "technology",
        name = "anomaly-science-pack",
        icon = "__metal-and-stars-graphics__/graphics/technology/anomaly-science-pack.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "anomaly-science-pack"
          },
        },
        prerequisites = {"crude-slush-processing", "dark-matter-crystal"},
        unit =
        {
            count = 10,
            ingredients =
            {
                {"space-science-pack", 1},
                {"nanite-science-pack", 1},
            },
            time = 60
        }
    },
    --//////////////////////////// ringworld
    {
        type = "technology",
        name = "planet-discovery-ringworld",
        icons = util.technology_icon_constant_planet("__metal-and-stars-graphics__/graphics/technology/ringworld-tech.png"),
        icon_size = 256,
        essential = true,
        effects =
        {
            {
                type = "unlock-space-location",
                space_location = "ringworld",
                use_icon_overlay_constant = true
            },
        },
        prerequisites = { "nanite-science-pack" },
        unit =
        {
            count = 1000,
            ingredients =
            {
                {"space-science-pack", 1},
                {"nanite-science-pack", 1}
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "bitumen-processing",
        icon = "__metal-and-stars-graphics__/graphics/technology/bitumen-processing.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "process-bitumen"
          },
          {
            type = "unlock-recipe",
            recipe = "bone-to-calcite"
          },
        },
        prerequisites = {"planet-discovery-ringworld"},
        research_trigger =
        {
          type = "mine-entity",
          entity = "ringworld-detritus"
        }
    },
    {
        type = "technology",
        name = "heavy-water-processing",
        icon = "__metal-and-stars-graphics__/graphics/technology/heavy-water-processing.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "heavy-water-processing"
          },
        },
        prerequisites = {"planet-discovery-ringworld"},
        research_trigger =
        {
          type = "mine-entity",
          entity = "heavy-water-vent"
        }
    },
    {
        type = "technology",
        name = "basic-glass-processing",
        icon = "__metal-and-stars-graphics__/graphics/technology/glass-processing.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "glass-plate"
          },
        },
        prerequisites = {"planet-discovery-ringworld"},
        research_trigger =
        {
          type = "mine-entity",
          entity = "gold-sands"
        }
    },
    {
        type = "technology",
        name = "lenscrafting",
        icon = "__metal-and-stars-graphics__/graphics/technology/lenscrafting.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "aspheric-lens"
          },
        },
        prerequisites = {"basic-glass-processing"},
        research_trigger =
        {
          type = "craft-item",
          item = "glass-plate"
        }
    },
    {
        type = "technology",
        name = "glass-recycling",
        icon = "__metal-and-stars-graphics__/graphics/technology/glass-recycling.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "glass-billet-reuse"
          },
          {
            type = "unlock-recipe",
            recipe = "molten-glass"
          },
          {
            type = "unlock-recipe",
            recipe = "casting-glass-plate"
          },
        },
        prerequisites = {"basic-glass-processing"},
        unit =
        {
            count = 500,
            ingredients =
            {
                {"space-science-pack", 1},
                {"nanite-science-pack", 1},
                {"ring-science-pack", 1}
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "gold-processing",
        icon = "__metal-and-stars-graphics__/graphics/technology/gold-processing.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "gold-plate"
          },
          {
            type = "unlock-recipe",
            recipe = "molten-gold"
          },
          {
            type = "unlock-recipe",
            recipe = "casting-gold-plate"
          },
        },
        prerequisites = {"planet-discovery-ringworld"},
        research_trigger =
        {
          type = "mine-entity",
          entity = "gold-sands"
        }
    },
    {
        type = "technology",
        name = "advanced-insulative-material",
        icon = "__metal-and-stars-graphics__/graphics/technology/multilayer-insulation.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "gold-foil"
          },
          {
            type = "unlock-recipe",
            recipe = "multilayer-insulation"
          },
        },
        prerequisites = {"gold-processing"},
        research_trigger =
        {
            type = "craft-item",
            item = "gold-plate"
        }
    },
    {
        type = "technology",
        name = "ring-science-pack",
        icon = "__metal-and-stars-graphics__/graphics/technology/ring-science-pack.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "ring-science-pack"
          },
        },
        prerequisites = {"advanced-insulative-material", "lenscrafting", "heavy-water-processing"},
        unit =
        {
            count = 10,
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
        name = "gold-wired-electronics",
        icon = "__metal-and-stars-graphics__/graphics/technology/gold-wired-electronics.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "gold-cable"
          },
          {
            type = "unlock-recipe",
            recipe = "casting-gold-cable"
          },
        },
        prerequisites = {"ring-science-pack","gold-processing"},
        unit =
        {
            count = 500,
            ingredients =
            {
                {"space-science-pack", 1},
                {"nanite-science-pack", 1},
                {"ring-science-pack", 1}
            },
            time = 60
        }
    },
    --//////////////////////////// mirandus
    {
        type = "technology",
        name = "planet-discovery-mirandus",
        icons = util.technology_icon_constant_planet("__metal-and-stars-graphics__/graphics/technology/mirandus-tech.png"),
        icon_size = 256,
        essential = true,
        effects =
        {
            {
                type = "unlock-space-location",
                space_location = "mirandus-a",
                use_icon_overlay_constant = true
            },
            {
                type = "unlock-recipe",
                recipe = "mirandite-sludge"
            },
        },
        prerequisites = { "nanite-science-pack" },
        unit =
        {
            count = 1000,
            ingredients =
            {
                {"space-science-pack", 1},
                {"nanite-science-pack", 1}
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "mirandite-processing",
        icon = "__metal-and-stars-graphics__/graphics/technology/mirandite-processing.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "mirandite-processing"
          },
          {
            type = "unlock-recipe",
            recipe = "lithium-plate",
          },
        },
        prerequisites = {"planet-discovery-mirandus"},
        research_trigger =
        {
          type = "craft-fluid",
          fluid = "mirandite-sludge"
        }
    },
    {
        type = "technology",
        name = "neodymium-processing",
        icon = "__metal-and-stars-graphics__/graphics/technology/neodymium-processing.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "neodymium-plate"
          },
          {
            type = "unlock-recipe",
            recipe = "neodymium-alloy-plate"
          },
        },
        prerequisites = {"mirandite-processing"},
        research_trigger =
        {
          type = "craft-item",
          item = "neodymium-ore"
        }
    },
    {
        type = "technology",
        name = "quantum-stabilization",
        icon = "__metal-and-stars-graphics__/graphics/technology/quantum-stabilizer.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "ms-quantum-stabilizer"
          },
          {
            type = "unlock-recipe",
            recipe = "quantum-shard-a"
          },
          {
            type = "unlock-recipe",
            recipe = "quantum-shard-b"
          },
          {
            type = "unlock-recipe",
            recipe = "quantum-shard-c"
          },
        },
        prerequisites = {"mirandite-processing"},
        research_trigger =
        {
          type = "craft-item",
          item = "quantite-a"
        }
    },
    {
        type = "technology",
        name = "quantum-science-pack",
        icon = "__metal-and-stars-graphics__/graphics/technology/quantum-science-pack.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "volatile-quantum-science-pack"
          },
          {
            type = "unlock-recipe",
            recipe = "quantum-science-pack"
          },
          {
            type = "unlock-recipe",
            recipe = "inert-science-pack-salvage"
          },
        },
        prerequisites = {"quantum-stabilization"},
        unit =
        {
            count = 10,
            ingredients =
            {
                {"space-science-pack", 1},
                {"nanite-science-pack", 1},
            },
            time = 60
        }
    },
    
})
