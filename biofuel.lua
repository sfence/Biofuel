-- Load support for MT game translation.
local S = minetest.get_translator("biofuel")


--Biofuel:
----------

--Empty Vial
minetest.register_craftitem("hades_biofuel:phial", {
	description = S("Empty Vial"),
	inventory_image = "biofuel_phial.png"
})

minetest.register_craft({
	output = "hades_biofuel:phial 6",
	recipe = {{"hades_core:glass"},
						{"hades_core:glass"}},
})

minetest.register_craft({
  type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {"hades_biofuel:phial","hades_biofuel:phial","hades_biofuel:phial"},
})

--Vial of Biofuel
minetest.register_craftitem("hades_biofuel:phial_fuel", {
	description = S("Vial of Biofuel"),
	inventory_image = "biofuel_phial_fuel.png"
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_biofuel:phial_fuel",
	burntime = 10,
	replacements = {{"hades_biofuel:phial_fuel", "hades_biofuel:phial"}},
})


--Bottle of Biofuel

minetest.register_craftitem("hades_biofuel:bottle_fuel", {
	description = S("Bottle of Biofuel"),
	inventory_image = "biofuel_bottle_fuel.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "hades_biofuel:bottle_fuel",
    recipe = {"hades_biofuel:phial_fuel", "hades_biofuel:phial_fuel", "hades_biofuel:phial_fuel", "hades_biofuel:phial_fuel","vessels:glass_bottle"},
    replacements = {{"hades_biofuel:phial_fuel", "hades_biofuel:phial"},{"hades_biofuel:phial_fuel", "hades_biofuel:phial"},{"hades_biofuel:phial_fuel", "hades_biofuel:phial"},{"hades_biofuel:phial_fuel", "hades_biofuel:phial"}},
})


minetest.register_craft({
	type = "fuel",
	recipe = "hades_biofuel:bottle_fuel",
	burntime = 40,
	replacements = {{"hades_biofuel:bottle_fuel", "vessels:glass_bottle"}},
})


--Canister of Biofuel

minetest.register_craftitem("hades_biofuel:can", {
	description = S("Empty Canister"),
	inventory_image = "biofuel_fuel_can.png"
})

if minetest.get_modpath("hades_technic") then
	minetest.register_craft({
		output = "hades_biofuel:can",
		recipe = {{"hades_technic:water_can"}}
	})
else
	minetest.register_craft({
		output = "hades_biofuel:can",
		recipe = {
			{"hades_core:steel_ingot","hades_core:bronze_ingot","hades_core:steel_ingot"},
			{"hades_core:steel_ingot","","hades_core:steel_ingot"},
			{"hades_core:steel_ingot","hades_core:steel_ingot","hades_core:steel_ingot"}
		},
	})
end

minetest.register_craftitem("hades_biofuel:fuel_can", {
	description = S("Canister of Biofuel"),
	inventory_image = "biofuel_fuel_can.png"
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_biofuel:fuel_can",
	burntime = 320,
	replacements = {{"hades_biofuel:fuel_can", "hades_biofuel:can"}},
})

minetest.register_craft({
	output = "hades_biofuel:fuel_can",
	recipe = {
			{"hades_biofuel:bottle_fuel", "hades_biofuel:bottle_fuel", "hades_biofuel:bottle_fuel"},
			{"hades_biofuel:bottle_fuel", "hades_biofuel:bottle_fuel", "hades_biofuel:bottle_fuel"},
			{"hades_biofuel:bottle_fuel", "hades_biofuel:can", "hades_biofuel:bottle_fuel"}
		},
	replacements = {{"hades_biofuel:bottle_fuel", "vessels:glass_bottle"},{"hades_biofuel:bottle_fuel", "vessels:glass_bottle"},{"hades_biofuel:bottle_fuel", "vessels:glass_bottle"},{"hades_biofuel:bottle_fuel", "vessels:glass_bottle"},{"hades_biofuel:bottle_fuel", "vessels:glass_bottle"},{"hades_biofuel:bottle_fuel", "vessels:glass_bottle"},{"hades_biofuel:bottle_fuel", "vessels:glass_bottle"},{"hades_biofuel:bottle_fuel", "vessels:glass_bottle"}},
})

minetest.register_craft({
	output = "hades_biofuel:fuel_can",
	recipe = {
			{"group:biofuel", "group:biofuel", "group:biofuel"},
			{"group:biofuel", "group:biofuel", "group:biofuel"},
			{"group:biofuel", "hades_biofuel:can", "group:biofuel"}
		}
})


--Mod compatibility:
--------------------

local register_biofuel = function(name, burntime)
	if not minetest.registered_items[name] then
		return;
	end
	local groups = table.copy(minetest.registered_items[name].groups)
	groups.biofuel = 1
	minetest.override_item(name, { groups = groups })
	if burntime and burntime >= 0 then
		minetest.register_craft({
			type = "fuel",
			recipe = name,
			burntime = burntime,
		})
	end
end


--Wine 
register_biofuel("wine:bottle_rum", 40)
register_biofuel("wine:bottle_tequila", 40)
register_biofuel("wine:bottle_bourbon", 40)
register_biofuel("wine:bottle_sake", 40)
register_biofuel("wine:bottle_vodka", 40)

--Basic Materials
register_biofuel("basic_materials:oil_extract")


--Cucina_Vegana
register_biofuel("cucina_vegana:sunflower_seeds_oil")
register_biofuel("cucina_vegana:flax_seed_oil")
register_biofuel("cucina_vegana:lettuce_oil")
register_biofuel("cucina_vegana:peanut_oil")

--Farming_Redo
register_biofuel("farming:bottle_ethanol")
register_biofuel("farming:hemp_oil")
