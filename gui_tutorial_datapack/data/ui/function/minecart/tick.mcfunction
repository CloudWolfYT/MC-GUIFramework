# Snapshot current Items
data modify storage ui current set from entity @s Items

# Get previous tick's Items from the marker passenger
execute on passengers run data modify storage ui previous set from entity @s data.previous

# If Items changed, previous is updated and score becomes 1
execute on passengers store result score #bool ui run data modify entity @s data.previous set from storage ui current

execute if score #bool ui matches 1 run function ui:minecart/on_change
