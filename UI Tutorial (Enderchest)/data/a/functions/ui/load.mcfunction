data remove storage ui head
execute if data entity @s Inventory[{Slot:103b}] run data modify storage ui head set from entity @s Inventory[{Slot:103b}]
execute unless data entity @s Inventory[{Slot:103b}] run data modify storage ui head set value {id:"minecraft:stone_button",Count:1b,tag:{ui:1b}}

data modify storage ui head.Slot set value 0b
data modify storage ui head.tag.Enchantments append value {id:"minecraft:binding_curse",lvl:69s}
data modify storage ui head.tag.EnderItems set from entity @s EnderItems
function a:ui/clear
data remove block 0 -64 0 Items
data modify block 0 -64 0 Items insert -1 from storage ui head
loot replace entity @s armor.head mine 0 -64 0 air{drop_contents:true}