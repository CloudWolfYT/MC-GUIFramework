# Ensure we read values from the marker (works both when called as marker via get_mask
# and when called as minecart from toggle/inc/dec)
execute if entity @s[type=marker] run data modify storage ui _values set from entity @s data.values
execute if entity @s[type=chest_minecart] on passengers run data modify storage ui _values set from entity @s data.values

execute store result score #toggle ui run data get storage ui _values.toggle
execute store result score #count ui run data get storage ui _values.count

# Base layout
data modify storage ui mask set value [\
  {Slot:0b,id:"minecraft:barrier",components:{\
    "minecraft:item_name":'{"text":"BACK","color":"red"}',\
    "minecraft:custom_data":{ui_item:{cmd:"function ui:menu/demo/root/open"}}\
  }},\
  {Slot:12b,id:"minecraft:red_concrete",components:{\
    "minecraft:item_name":'{"text":"-","color":"red","bold":true}',\
    "minecraft:custom_data":{ui_item:{cmd:"function ui:menu/demo/controls/dec"}}\
  }},\
  {Slot:14b,id:"minecraft:lime_concrete",components:{\
    "minecraft:item_name":'{"text":"+","color":"green","bold":true}',\
    "minecraft:custom_data":{ui_item:{cmd:"function ui:menu/demo/controls/inc"}}\
  }}\
]

# --- Toggle button (slot 4) ---
execute if score #toggle ui matches 1 run data modify storage ui mask append value {\
  Slot:4b,id:"minecraft:lime_dye",components:{\
    "minecraft:item_name":'{"text":"Toggle: ON","color":"green","bold":true}',\
    "minecraft:lore":['{"text":"Click to turn OFF","color":"gray","italic":false}'],\
    "minecraft:custom_data":{ui_item:{cmd:"function ui:menu/demo/controls/toggle"}}\
  }\
}
execute unless score #toggle ui matches 1 run data modify storage ui mask append value {\
  Slot:4b,id:"minecraft:gray_dye",components:{\
    "minecraft:item_name":'{"text":"Toggle: OFF","color":"gray","bold":true}',\
    "minecraft:lore":['{"text":"Click to turn ON","color":"gray","italic":false}'],\
    "minecraft:custom_data":{ui_item:{cmd:"function ui:menu/demo/controls/toggle"}}\
  }\
}

# --- Counter display (slot 13) ---
data modify storage ui mask append value {\
  Slot:13b,id:"minecraft:paper",components:{\
    "minecraft:item_name":'{"text":"Count: 0","color":"aqua"}',\
    "minecraft:custom_data":{ui_item:{empty:1b}}\
  }\
}
execute if score #count ui matches 0 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 0","color":"aqua"}'
execute if score #count ui matches 1 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 1","color":"aqua"}'
execute if score #count ui matches 2 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 2","color":"aqua"}'
execute if score #count ui matches 3 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 3","color":"aqua"}'
execute if score #count ui matches 4 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 4","color":"aqua"}'
execute if score #count ui matches 5 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 5","color":"aqua"}'
execute if score #count ui matches 6 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 6","color":"aqua"}'
execute if score #count ui matches 7 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 7","color":"aqua"}'
execute if score #count ui matches 8 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 8","color":"aqua"}'
execute if score #count ui matches 9 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 9","color":"aqua"}'
execute if score #count ui matches 10 run data modify storage ui mask[{Slot:13b}].components."minecraft:item_name" set value '{"text":"Count: 10","color":"aqua"}'

# --- Progress bar (slots 18-26) ---
scoreboard players operation #filled ui = #count ui
execute if score #filled ui matches 10.. run scoreboard players set #filled ui 9

data modify storage ui mask append value {Slot:18b,id:"minecraft:gray_stained_glass_pane",components:{"minecraft:item_name":'{"text":" ","color":"dark_gray"}',"minecraft:custom_data":{ui_item:{empty:1b}}}}
data modify storage ui mask append value {Slot:19b,id:"minecraft:gray_stained_glass_pane",components:{"minecraft:item_name":'{"text":" ","color":"dark_gray"}',"minecraft:custom_data":{ui_item:{empty:1b}}}}
data modify storage ui mask append value {Slot:20b,id:"minecraft:gray_stained_glass_pane",components:{"minecraft:item_name":'{"text":" ","color":"dark_gray"}',"minecraft:custom_data":{ui_item:{empty:1b}}}}
data modify storage ui mask append value {Slot:21b,id:"minecraft:gray_stained_glass_pane",components:{"minecraft:item_name":'{"text":" ","color":"dark_gray"}',"minecraft:custom_data":{ui_item:{empty:1b}}}}
data modify storage ui mask append value {Slot:22b,id:"minecraft:gray_stained_glass_pane",components:{"minecraft:item_name":'{"text":" ","color":"dark_gray"}',"minecraft:custom_data":{ui_item:{empty:1b}}}}
data modify storage ui mask append value {Slot:23b,id:"minecraft:gray_stained_glass_pane",components:{"minecraft:item_name":'{"text":" ","color":"dark_gray"}',"minecraft:custom_data":{ui_item:{empty:1b}}}}
data modify storage ui mask append value {Slot:24b,id:"minecraft:gray_stained_glass_pane",components:{"minecraft:item_name":'{"text":" ","color":"dark_gray"}',"minecraft:custom_data":{ui_item:{empty:1b}}}}
data modify storage ui mask append value {Slot:25b,id:"minecraft:gray_stained_glass_pane",components:{"minecraft:item_name":'{"text":" ","color":"dark_gray"}',"minecraft:custom_data":{ui_item:{empty:1b}}}}
data modify storage ui mask append value {Slot:26b,id:"minecraft:gray_stained_glass_pane",components:{"minecraft:item_name":'{"text":" ","color":"dark_gray"}',"minecraft:custom_data":{ui_item:{empty:1b}}}}

execute if score #filled ui matches 1.. run data modify storage ui mask[{Slot:18b}].id set value "minecraft:lime_stained_glass_pane"
execute if score #filled ui matches 2.. run data modify storage ui mask[{Slot:19b}].id set value "minecraft:lime_stained_glass_pane"
execute if score #filled ui matches 3.. run data modify storage ui mask[{Slot:20b}].id set value "minecraft:lime_stained_glass_pane"
execute if score #filled ui matches 4.. run data modify storage ui mask[{Slot:21b}].id set value "minecraft:lime_stained_glass_pane"
execute if score #filled ui matches 5.. run data modify storage ui mask[{Slot:22b}].id set value "minecraft:lime_stained_glass_pane"
execute if score #filled ui matches 6.. run data modify storage ui mask[{Slot:23b}].id set value "minecraft:lime_stained_glass_pane"
execute if score #filled ui matches 7.. run data modify storage ui mask[{Slot:24b}].id set value "minecraft:lime_stained_glass_pane"
execute if score #filled ui matches 8.. run data modify storage ui mask[{Slot:25b}].id set value "minecraft:lime_stained_glass_pane"
execute if score #filled ui matches 9.. run data modify storage ui mask[{Slot:26b}].id set value "minecraft:lime_stained_glass_pane"

# Toggle ON → cyan progress for visual feedback
execute if score #toggle ui matches 1 if score #filled ui matches 1.. run data modify storage ui mask[{Slot:18b}].id set value "minecraft:cyan_stained_glass_pane"
execute if score #toggle ui matches 1 if score #filled ui matches 2.. run data modify storage ui mask[{Slot:19b}].id set value "minecraft:cyan_stained_glass_pane"
execute if score #toggle ui matches 1 if score #filled ui matches 3.. run data modify storage ui mask[{Slot:20b}].id set value "minecraft:cyan_stained_glass_pane"
execute if score #toggle ui matches 1 if score #filled ui matches 4.. run data modify storage ui mask[{Slot:21b}].id set value "minecraft:cyan_stained_glass_pane"
execute if score #toggle ui matches 1 if score #filled ui matches 5.. run data modify storage ui mask[{Slot:22b}].id set value "minecraft:cyan_stained_glass_pane"
execute if score #toggle ui matches 1 if score #filled ui matches 6.. run data modify storage ui mask[{Slot:23b}].id set value "minecraft:cyan_stained_glass_pane"
execute if score #toggle ui matches 1 if score #filled ui matches 7.. run data modify storage ui mask[{Slot:24b}].id set value "minecraft:cyan_stained_glass_pane"
execute if score #toggle ui matches 1 if score #filled ui matches 8.. run data modify storage ui mask[{Slot:25b}].id set value "minecraft:cyan_stained_glass_pane"
execute if score #toggle ui matches 1 if score #filled ui matches 9.. run data modify storage ui mask[{Slot:26b}].id set value "minecraft:cyan_stained_glass_pane"
