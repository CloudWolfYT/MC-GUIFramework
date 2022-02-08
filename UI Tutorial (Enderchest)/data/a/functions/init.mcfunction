tellraw @a {"text":"[Ender UI] Reloaded"}

scoreboard objectives add ui dummy
scoreboard players set #1 ui 1
scoreboard objectives add ui.id dummy
scoreboard objectives add ui.page dummy
scoreboard objectives add ui.index dummy
scoreboard objectives add open_ui1 minecraft.custom:minecraft.open_enderchest

forceload add 0 0
setblock 0 -64 0 yellow_shulker_box