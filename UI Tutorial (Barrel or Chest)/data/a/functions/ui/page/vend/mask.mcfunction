data remove storage ui temp
data modify storage ui temp set from block ~ ~ ~ Items[{Slot:11b}]
execute if data storage ui temp.tag.ui.null run data remove storage ui temp
data remove block ~ ~ ~ Items
data modify block ~ ~ ~ Items insert -1 from storage ui temp

data modify block ~ ~ ~ Items insert -1 from storage ui load

item replace block ~ ~ ~ container.0 with barrier{display:{Name:'{"text":"BACK","italic":false}'},ui:{null:1b},CustomModelData:1}
item replace block ~ ~ ~ container.6 with barrier{display:{Name:'{"text":"UP","italic":false}'},ui:{null:1b},CustomModelData:1}
item replace block ~ ~ ~ container.24 with barrier{display:{Name:'{"text":"DOWN","italic":false}'},ui:{null:1b},CustomModelData:1}
item replace block ~ ~ ~ container.26 with barrier{display:{Name:'{"text":"","italic":false}'},ui:{null:1b},CustomModelData:4}