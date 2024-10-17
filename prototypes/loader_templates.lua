-- base
local loader_templates = {
  [""] = {
    next_prefix = "fast-",
    tint = util.color("ffc340d1"),
    unlock_tech = "logistics",
    --prerequisite_techs = {"logistics"},
    recipe_data = {
      ingredients =
      {
        {type = "item", name = "underground-belt", amount = 1},
        {type = "item", name = "fast-inserter", amount = 6},
        {type = "item", name = "steel-plate", amount = 6},
      },
    }
  },
  ["fast-"] = {
    previous_prefix = "",
    next_prefix = "express-",
    tint = util.color("e31717d1"),
    unlock_tech = "logistics-2",
    --prerequisite_techs = {"logistics-2"},
    recipe_data = {
    ingredients =
      {
        {type = "item", name = "fast-underground-belt", amount = 1},
        {type = "item", name = "fast-inserter", amount = 4},
        {type = "item", name = "mdrn-loader", amount = 1},
      },
    }
  },
  -- TODO: Consider requiring lube for express
  --       Lube is already required for the underground belt
  ["express-"] = {
    previous_prefix = "fast-",
    tint = util.color("43c0fad1"),
    unlock_tech = "logistics-3",
    --prerequisite_techs = {"logistics-2"},
    recipe_data = {
      category = "crafting-with-fluid",
      ingredients =
      {
        {type = "item", name = "express-underground-belt", amount = 1},
        {type = "item", name = "bulk-inserter", amount = 2},
        {type = "item", name = "fast-mdrn-loader", amount = 1},
      },
    }
  }
}

-- space-age
if data.raw["transport-belt"]["turbo-transport-belt"] then
  loader_templates["turbo-"] = {
    previous_prefix = "express-",
    tint = util.color("b1cf57d1"),
    unlock_tech = "turbo-transport-belt",
    --prerequisite_techs = {"turbo-transport-belt"},
    recipe_data = {
      category = "metallurgy",
      surface_conditions = data.raw["transport-belt"]["turbo-transport-belt"].surface_conditions,
      ingredients =
      {
        {type = "item", name = "turbo-underground-belt", amount = 1},
        {type = "item", name = "bulk-inserter", amount = 6},
        {type = "item", name = "express-mdrn-loader", amount = 1},
      },
    }
  }
  loader_templates["express-"].next_prefix = "turbo-"
  loader_templates["express-"].recipe_data.category = "crafting-with-fluid-or-metallurgy"
end

return loader_templates