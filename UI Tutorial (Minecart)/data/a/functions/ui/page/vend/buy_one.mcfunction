item modify entity @s container.11 a:remove_one

data modify storage ui load1 set from storage ui load
data modify storage ui load1.Slot set value 0b
data remove storage ui load1.tag.ui
data remove block 0 -64 0 Items
data modify block 0 -64 0 Items insert -1 from storage ui load1
loot give @p mine 0 -64 0 air{drop_contents:1b}