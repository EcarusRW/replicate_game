extends TileMap

onready var dialog_scn= preload("res://util/Dialog.tscn")

func _ready():
	var dialog = dialog_scn.instance()
	dialog.init([
		{"text":"DIALOG_1","name":"Sam1"},
		{"text":"DIALOG_2","name":"Sam2"},
		{"text":"DIALOG_3","name":"Sam3"},
		{"text":"DIALOG_4","name":"Sam4"},
	])
	add_child(dialog)

func hitting_wall(player,direction):
	var target_cell=world_to_map(player.position)+direction
	var obstacle=get_cellv(target_cell)
	#print(obstacle," ",target_cell)
	if obstacle == 1:
		return true
	else:
		return false
