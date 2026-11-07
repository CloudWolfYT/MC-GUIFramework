# Must be executed AS the owner player.
# Uses the shared temp shulker briefly to return arbitrary items via loot.
data remove block 0 -64 0 Items
data modify block 0 -64 0 Items set from storage ui in
loot give @s mine 0 -64 0 stick[minecraft:custom_data={drop_contents:1b}]
data remove block 0 -64 0 Items
