# Summon the UI stack (item_display -> chest_minecart -> marker)
summon item_display ~ ~ ~ {view_range:0f,width:0f,height:0f,teleport_duration:0,Tags:["ui","new"],Passengers:[{id:"minecraft:chest_minecart",Invulnerable:1b,Tags:["ui","new"],CustomDisplayTile:1b,DisplayState:{Name:"minecraft:air"},Passengers:[{id:"minecraft:marker",Tags:["ui","new"]}]}]}

# Assign unique ui.id linking this player to the UI entities
scoreboard players add .global ui.id 1
scoreboard players operation @s ui.id = .global ui.id
scoreboard players operation @e[tag=new] ui.id = .global ui.id

# Open initial page
scoreboard players set .type ui 1
execute as @e[type=chest_minecart,tag=new,limit=1] run function ui:menu/demo/root/open
execute as @e[type=chest_minecart,tag=new,limit=1] run function ui:minecart/load_page

tag @e[tag=new] remove new
