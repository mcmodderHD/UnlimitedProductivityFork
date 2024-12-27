data:extend({
	{
		type = "bool-setting",
		name = "up-allow-beacon",
		setting_type = "startup",
		default_value = true,
		order = "a"
	},
	{
		type = "bool-setting",
		name = "up-allow-all-beacons",
		setting_type = "startup",
		default_value = true,
		order = "b1"
	},
	{
        type = "bool-setting",
        name = "allow-quality-in-beacons",
		setting_type = "startup",
		default_value = false,
        order = "b2"
    },
	{
        type = "bool-setting",
        name = "allow-quality-in-all-beacons",
        setting_type = "startup",
		default_value = false,
        order = "b2"
    },
	{
		type = "bool-setting",
		name = "up-allow-lab",
		setting_type = "startup",
		default_value = true,
		order = "c4"
	},
	{
		type = "bool-setting",
		name = "up-allow-furnace",
		setting_type = "startup",
		default_value = true,
		order = "c2"
	},
	{
		type = "bool-setting",
		name = "up-allow-drill",
		setting_type = "startup",
		default_value = true,
		order = "c3"
	},
	{
		type = "bool-setting",
		name = "up-allow-assembler",
		setting_type = "startup",
		default_value = true,
		order = "c1"
	},
	{
		type = "bool-setting",
		name = "up-remove-all-restrictions",
		setting_type = "startup",
		default_value = true,
		order = "e"
	},
	{
        type = "double-setting",
        name = "maximum-productivity",
        setting_type = "startup",
        minimum_value = 1.0,
        default_value = 3.0,
        order = "e1"
    },
	{
		type = "double-setting",
		name = "up-beacon-range",
		setting_type = "startup",
		default_value = 0,
		minimum_value = 0,
		maximum_value = 64,
		order = "oh"
	},
	{
		type = "int-setting",
		name = "up-beacon-module-count",
		setting_type = "startup",
		default_value = 0,
		minimum_value = 0,
		maximum_value = 64,
		order = "og"
	},
	{
		type = "double-setting",
        name = "distribution-effectivity",
        setting_type = "startup",
        minimum_value = 0.5,
        default_value = 1.5,
        order = "e1"
	},
	{
		type = "double-setting",
        name = "distribution-effectivity-quality",
        setting_type = "startup",
        minimum_value = 0.0,
        default_value = 0.2,
        order = "e1"
	}--,
	--{
	--	type = "int-setting",
	--	name = "beacon-quality-module-slots",
	--	setting_type = "startup",
	--	default_value = 0,
	--	minimum_value = 0,
	--	maximum_value = 4,
	--	order = "og"
	--},
	--{
	--	type = "int-setting",
	--	name = "beacon-quality-range",
	--	setting_type = "startup",
	--	default_value = 0,
	--	minimum_value = 0,
	--	maximum_value = 16,
	--	order = "og"
	--}
	
})