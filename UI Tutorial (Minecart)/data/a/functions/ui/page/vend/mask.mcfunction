data remove storage ui temp
data modify storage ui temp set from entity @s Items[{Slot:11b}]
execute if data storage ui temp.tag.ui.null run data remove storage ui temp
data remove entity @s Items
data modify entity @s Items insert -1 from storage ui temp

data modify entity @s Items insert -1 from storage ui load

item replace entity @s container.0 with barrier{display:{Name:'{"text":"BACK","italic":false}'},ui:{null:1b},CustomModelData:1}
item replace entity @s container.6 with barrier{display:{Name:'{"text":"UP","italic":false}'},ui:{null:1b},CustomModelData:1}
item replace entity @s container.24 with barrier{display:{Name:'{"text":"DOWN","italic":false}'},ui:{null:1b},CustomModelData:1}
item replace entity @s container.26 with barrier{display:{Name:'{"text":"","italic":false}'},ui:{null:1b},CustomModelData:4}