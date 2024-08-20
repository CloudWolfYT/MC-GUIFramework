# make a copy of current Items
data modify storage ui current set from entity @s Items

# obtain the previous tick's Items
execute on passengers run data modify storage ui previous set from entity @s data.previous

# save current tick's Items over previous, if you are able to then something has changed
execute on passengers store result score #bool ui run data modify entity @s data.previous set from storage ui current

execute if score #bool ui matches 1 run function ui:minecart/on_change