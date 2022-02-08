setblock ~ ~ ~ barrel[facing=up]

## spawn a marker with a unique id value
execute unless entity @e[type=marker,tag=ui,distance=..0.5] run summon marker ~ ~ ~ {Tags:["ui"]}
scoreboard players add .global ui.id 1
scoreboard players operation @e[type=marker,tag=ui,distance=..0.5,sort=nearest,limit=1] ui.id = .global ui.id