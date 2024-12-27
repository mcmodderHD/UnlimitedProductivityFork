--allow productivity modules in beacons
if settings.startup["up-allow-beacon"].value then
  if settings.startup["allow-quality-in-beacons"].value then
    data.raw.beacon.beacon.allowed_effects = {"consumption", "speed", "pollution","productivity","quality"}
  else
    data.raw.beacon.beacon.allowed_effects = {"consumption", "speed", "pollution","productivity"}
  end
elseif settings.startup["allow-quality-in-beacons"].value then
  data.raw.beacon.beacon.allowed_effects = {"consumption", "speed", "pollution","quality"}
end

--allow productivity modules in modded beacons
if settings.startup["up-allow-all-beacons"].value then
  for name,beacon in pairs(data.raw.beacon) do
    if name~="beacon" then --only update non-standard beacons
      if settings.startup["allow-quality-in-all-beacons"].value then
        beacon.allowed_effects = {"consumption", "speed", "pollution","productivity", "quality"}
      else
        beacon.allowed_effects = {"consumption", "speed", "pollution","productivity"}
      end
    end
  end
elseif settings.startup["allow-quality-in-all-beacons"].value then
  beacon.allowed_effects = {"consumption", "speed", "pollution", "quality"}
end

-- Remove Productivity Restrictions

if settings.startup["up-remove-all-restrictions"].value then
  for recipe_name, recipe in pairs(data.raw.recipe) do
    recipe.allow_productivity = true
    recipe.allow_quality = true
  end
end

for recipe_name, recipe in pairs(data.raw.recipe) do
  if recipe.allow_productivity == true then
    recipe.maximum_productivity = settings.startup["maximum-productivity"].value
  end
end

local categories = {
  assembler = "assembling-machine",
  furnace = "furnace",
  drill = "mining-drill",
  lab = "lab",
  rocketsilo = "rocket-silo"
}

for name,category in pairs(categories) do
  if settings.startup["up-allow-"..name] and settings.startup["up-allow-"..name].value then
    for _,entity in pairs(data.raw[category]) do
      entity.allowed_effects = {"consumption", "speed", "pollution","productivity", "quality"}
    end
  end
end

-- Beacon Customize Settings

if(settings.startup["up-beacon-module-count"].value ~= 0)          then data.raw["beacon"]["beacon"].module_slots                                     = settings.startup["up-beacon-module-count"].value           end
if(settings.startup["up-beacon-range"].value ~=0)                  then data.raw["beacon"]["beacon"].supply_area_distance                             = settings.startup["up-beacon-range"].value                  end
if(settings.startup["distribution-effectivity-quality"].value ~=0) then data.raw["beacon"]["beacon"].distribution_effectivity_bonus_per_quality_level = settings.startup["distribution-effectivity-quality"].value end
if(settings.startup["distribution-effectivity"].value ~=0)         then data.raw["beacon"]["beacon"].distribution_effectivity                         = settings.startup["distribution-effectivity"].value         end

local beacons = table.deepcopy(data.raw.beacon)
local qualities = table.deepcopy(data.raw["quality"])

for base_name, base_prototype in pairs(beacons) do
  for quality_name, quality_prototype in pairs(qualities) do
    local beacon = table.deepcopy(base_prototype)

    --if(settings.startup["beacon-quality-module-slots"].value ~=0) then
    --  beacon.module_slots = beacon.module_slots + (quality_prototype.level * settings.startup["beacon-quality-module-slots"].value)
    --end
    --if(settings.startup["beacon-quality-range"].value ~=0) then
    --  local range
    --  if (settings.startup["up-beacon-range"].value ~= 0) then range = settings.startup["up-beacon-range"].value
    --  else range = 3 end
    --  range = range + (quality_prototype.level * settings.startup["beacon-quality-range"].value)
    --  if (range > 64) then range = 64 end
    --  beacon.supply_area_distance = range
    --end

    local slots = beacon.module_slots

    if (slots > 2 and slots <= 5) then beacon.icons_positioning = {
      {inventory_index = defines.inventory.beacon_modules, shift = {0, 0}, multi_row_initial_height_modifier = 0.0, max_icons_per_row = 5}
    } elseif (slots > 5 and slots <= 10) then beacon.icons_positioning = {
      {inventory_index = defines.inventory.beacon_modules, shift = {0, 0}, multi_row_initial_height_modifier = -0.3, max_icons_per_row = 5}
    } elseif (slots > 10 and slots <= 15) then beacon.icons_positioning = {
      {inventory_index = defines.inventory.beacon_modules, shift = {0, 0}, multi_row_initial_height_modifier = -0.6, max_icons_per_row = 5}
    } elseif (slots > 15 and slots <= 20) then beacon.icons_positioning = {
      {inventory_index = defines.inventory.beacon_modules, shift = {0, 0}, multi_row_initial_height_modifier = -0.9, max_icons_per_row = 5}
    } elseif (slots > 20) then beacon.icons_positioning = {
      {inventory_index = defines.inventory.beacon_modules, shift = {0, 0}, multi_row_initial_height_modifier = -1.2, max_icons_per_row = 5}
    } end
    data:extend{beacon}
  end
end