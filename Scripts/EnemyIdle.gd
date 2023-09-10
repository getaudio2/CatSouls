extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var move_speed := 150.0

var player: CharacterBody2D

var move_direction : float
var wander_time : float

func randomize_wander():
	move_direction = randf_range(-1,1)
	wander_time = randf_range(1,3)

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()

func Update(delta:float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
		
func Physics_Update(delta:float):
	if enemy:
		enemy.velocity.x = move_direction * move_speed
		
	var direction = player.get_global_transform().origin.x - enemy.get_global_transform().origin.x
	
	if abs(direction) < 200:
		Transitioned.emit(self, "follow")
