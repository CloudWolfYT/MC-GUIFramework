scoreboard players remove #loop open_ui 1
## find a marker on the path
execute as @e[type=marker,tag=ui,distance=..0.5,limit=1] run function a:ui/find/at_marker
execute if score #loop open_ui matches 1.. positioned ^ ^ ^0.5 run function a:ui/find/raycast