extends CharacterBody2D

@export var move_speed = 100
@export var starting_direction : Vector2 = Vector2(0, 1)

var player_state


func _ready():
	pass

func _physics_process(_delta):
	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	if input_direction.x == 0 and input_direction.y == 0:
		player_state = "idle"
	
	elif input_direction.x != 0 or input_direction.y != 0:
		player_state = "walking"
	
	velocity = input_direction * move_speed
	move_and_slide()
	play_anim(input_direction)
	
func play_anim(input_dir):
	
	#print(input_dir)
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	
	if player_state == "walking":
		if input_dir.y == -1:
			$AnimatedSprite2D.play("up_walk")
		if input_dir.y == 1:
			$AnimatedSprite2D.play("down_walk")
		if input_dir.x == 1:
			$AnimatedSprite2D.play("right_walk")
		if input_dir.x == -1:
			$AnimatedSprite2D.play("left_walk")
	

