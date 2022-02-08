data modify storage ui load1 set from storage ui load
data modify storage ui load1.Count set from storage ui container[{Slot:11b}].Count
data modify storage ui load1.Slot set value 0b
data remove storage ui load1.tag.ui
data remove block 0 -64 0 Items
data modify block 0 -64 0 Items insert -1 from storage ui load1
loot give @p mine 0 -64 0 air{drop_contents:1b}

data remove entity @s Items[{Slot:11b}]
data remove storage ui load