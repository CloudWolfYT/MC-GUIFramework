data modify storage ui temp set from entity @s Inventory[{Slot:103b}]
data remove storage ui temp.tag.ui
data remove storage ui temp.tag.Enchantments[{id:"minecraft:binding_curse",lvl:69s}]
data remove storage ui temp.tag.EnderItems
data modify storage ui temp.Slot set value 0b
data remove block 0 -64 0 Items
data modify block 0 -64 0 Items insert -1 from storage ui temp
loot replace entity @s armor.head mine 0 -64 0 air{drop_contents:true}