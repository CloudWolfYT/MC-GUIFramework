# Find and destroy this player's UI entities
scoreboard players operation #search ui.id = @s ui.id

# Clear items first to prevent drops
execute as @e[type=chest_minecart,tag=ui] if score @s ui.id = #search ui.id run data remove entity @s Items

# Kill the whole stack (display + minecart + marker)
execute as @e[tag=ui] if score @s ui.id = #search ui.id run kill @s

# Reset player score
scoreboard players reset @s ui.id
