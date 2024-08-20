# Update Page & History
data modify entity @s Items set from storage ui current
data modify storage ui current set from entity @s Items
execute on passengers run data modify entity @s data.previous set from storage ui current