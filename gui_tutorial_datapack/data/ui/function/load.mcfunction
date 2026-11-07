scoreboard objectives add ui dummy
scoreboard objectives add ui.id dummy
scoreboard objectives add ui.drop minecraft.custom:minecraft.drop

# Global unique ID counter for linking players <-> UI entities
execute unless score .global ui.id matches -2147483648.. run scoreboard players set .global ui.id 0

# Shared temporary container for item returns (used briefly, scoped per call)
# Location is world spawn height limit safe for most worlds; still best-effort in MP
forceload add 0 0
setblock 0 -64 0 yellow_shulker_box{CustomName:'{"text":"UI Temp"}'} replace

tellraw @a [{"text":"[GUI Tutorial] ","color":"gold"},{"text":"Datapack loaded (Multiplayer fixed). Hold an item with custom_data:{ui:1b} to open.","color":"gray"}]