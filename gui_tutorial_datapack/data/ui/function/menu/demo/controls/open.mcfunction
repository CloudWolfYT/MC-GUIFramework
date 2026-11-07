# Initialize values on the marker if missing (per-UI state → multiplayer safe)
execute on passengers run execute unless data entity @s data.values run data modify entity @s data.values set value {toggle:0b,count:0}

function ui:menu/demo/controls/mask
data modify storage ui current set from storage ui mask
execute on passengers run data modify entity @s data.page.mask set value "function ui:menu/demo/controls/mask"
