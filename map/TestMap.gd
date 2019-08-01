extends TileMap

func hitting_wall(player,direction):
	var target_cell=world_to_map(player.position)+direction
	var obstacle=get_cellv(target_cell)
	#print(obstacle," ",target_cell)
	if obstacle == 1:
		return true
	else:
		return false