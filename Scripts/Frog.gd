extends CharacterBody2D
class_name FrogEnemy


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()


	if floor(self.get_position_delta().x) == 3:
		$AnimatedSprite2D.flip_h = true
	elif floor(self.get_position_delta().x) == -4:
		$AnimatedSprite2D.flip_h = false
