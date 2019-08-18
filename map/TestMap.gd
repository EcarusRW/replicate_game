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
	var next_cell=get_cellv(target_cell)
	print(self.tile_set.tile_get_name(next_cell)," ",target_cell)
	if next_cell == 1:
		return true
	else:
		return false
