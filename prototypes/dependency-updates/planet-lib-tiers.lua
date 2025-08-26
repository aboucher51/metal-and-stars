if mods["PlanetsLibTiers"] then

  local new_planet_tiers = {
    nix = 3,
    ringworld = 3,
    shipyard = 2,
  }

  for name, tier in pairs(new_planet_tiers) do
    data.raw["mod-data"]["PlanetsLib-tierlist"].data.planet[name] = tier
  end

  local new_space_locations = {
    ["calidus-senestella-gate-senestella"] = 1.1,
    ["calidus-senestella-gate-calidus"] = 1.2,
    mirandus = 4,
  }

  for name, tier in pairs(new_space_locations) do
    data.raw["mod-data"]["PlanetsLib-tierlist"].data["space-location"][name] = tier
  end

end