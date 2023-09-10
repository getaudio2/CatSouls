extends State
class_name EnemyFollow

@export var enemy : CharacterBody2D
@export var move_speed := 200.0
var player : CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func Physics_Update(delta:float):
	var direction = player.get_global_transform().origin.x - enemy.get_global_transform().origin.x

	if abs(direction) > 30:
		if direction > 0:
			enemy.velocity.x = move_speed
		else:
			enemy.velocity.x = -1 * move_speed
	else:
		enemy.velocity.x = 0
		
	if abs(direction) > 200:
		Transitioned.emit(self,"idle")
