# Holding the opener item -> keep UI following the player
execute if items entity @s weapon.* *[minecraft:custom_data={ui:1b}] run function ui:player/teleport

# Not holding opener and has an open UI -> close it
execute unless items entity @s weapon.* *[minecraft:custom_data={ui:1b}] if score @s ui.id matches 0.. run function ui:player/close
