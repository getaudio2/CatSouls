extends Interactable

func Interact():
		print("Take Health")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		Interact()
