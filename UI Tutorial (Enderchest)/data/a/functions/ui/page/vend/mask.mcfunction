data remove storage ui temp
data modify storage ui temp set from entity @p[tag=this] EnderItems[{Slot:11b}]
data modify storage ui temp.Slot set value 0b
execute if data storage ui temp.tag.ui.null run data remove storage ui temp
function a:ui/clear
data modify block 0 -64 0 Items insert -1 from storage ui temp
loot replace entity @p[tag=this] enderchest.11 mine 0 -64 0 air{drop_contents:true}

item replace entity @p[tag=this] enderchest.0 with barrier{display:{Name:'{"text":"BACK","italic":false}'},ui:{null:1b},CustomModelData:1}
item replace entity @p[tag=this] enderchest.6 with barrier{display:{Name:'{"text":"UP","italic":false}'},ui:{null:1b},CustomModelData:1}
item replace entity @p[tag=this] enderchest.24 with barrier{display:{Name:'{"text":"DOWN","italic":false}'},ui:{null:1b},CustomModelData:1}
item replace entity @p[tag=this] enderchest.26 with barrier{display:{Name:'{"text":"","italic":false}'},ui:{null:1b},CustomModelData:4}