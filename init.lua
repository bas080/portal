dofile(minetest.get_modpath("portal").."/cube.lua")

local mod_name="portal"
local node_group
--if creative mode make diggable
if minetest.setting_getbool("creative_mode") then
    node_group = {dig_immediate=3}
else
    node_group = {cracky=3}
end
--regster nodes
local solid = {
    'node_acid',
    'node_floor_checker',
    'node_floor_checker_white',
    'node_unbreakable_half',
    'node_unbreakable_one',
    'node_unbreakable_quart',
    'node_wall_bottom',
    'node_wall_top',
}
local luminescent = {
    'node_wall_bottom_light',
}
local transparent = {
    'node_mesh',
}
local sign = {
    'sign_arrow_down',
    'sign_arrow_left',
    'sign_arrow_right',
    'sign_arrow_up',
    'sign_cake',
    'sign_cube',
    'sign_exit',
    'sign_number_1',
    'sign_number_2',
    'sign_number_3',
    'sign_number_4',
    'sign_number_5',
    'sign_number_6',
    'sign_number_7',
    'sign_number_8',
    'sign_number_9',
    'sign_false',
    'sign_true',
}
local wire = {
    'wire_false',
    'wire_true',
}

for i, name in ipairs(wire) do
    minetest.register_node(mod_name..":"..name,{
        description = name,
        paramtype = "light",
        tile_images = {name..".png"},
        groups = node_group,
        drawtype="raillike",
        walkable = false,
	    selection_box = {
		    type = "fixed",
                    -- but how to specify the dimensions for curved and sideways rails?
                    fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	    },
    })
end
for i, name in ipairs(solid) do
  minetest.register_node(mod_name..":"..name,{
    description = name,
    tile_images = {name..".png"},
    groups = node_group,
    sounds = default.node_sound_stone_defaults(),
  })
end
for i, name in ipairs(transparent) do
  minetest.register_node(mod_name..":"..name,{
    description = name,
    tile_images = {name..".png"},
    drawtype = "glasslike",
    paramtype = "light",
    groups = node_group,
  })
end
for i, name in ipairs(sign) do
    minetest.register_node(mod_name..":"..name,{
        description = name,
        paramtype = "light",
        light_source = 5,
        walkable = false,
        sunlight_propagates = true,
        tile_images = {name..".png"},
        drawtype = "signlike",
        paramtype2 = 'wallmounted',
        selection_box = {
        type = "wallmounted",
        --wall_side = = <default>
        },
        inventory_image = name..".png",
        wield_image = name..".png",
        groups = node_group,
    })
end
for i, name in ipairs(luminescent) do
    minetest.register_node(mod_name..":"..name,{
        description = name,
        light_source = 5,
        tile_images = {name..".png"},
        groups = node_group,
    })
end
--end
print("["..mod_name.."] Loaded!")
