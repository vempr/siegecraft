extends CharacterBody2D

const SPEED := 400.0
const JUMP_VELOCITY := -700.0
var in_inventory := false


func _ready() -> void:
	%IdleBody.visible = true
	%Walk.visible = false
	%IdleBody.flip_h = false
	%WalkingBody.flip_h = false


func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity += get_gravity() * 2.5 * delta
	
	if in_inventory:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
		return
	
	var direction := Input.get_axis("move_left", "move_right")
	
	if is_on_floor():
		if direction != 0:
			%IdleBody.visible = false
			%Walk.visible = true
			if %AnimationPlayerWalk.current_animation != "walk":
				%AnimationPlayerWalk.play("walk")
		else:
			%IdleBody.visible = true
			%Walk.visible = false
	
	if direction > 0:
		%WalkingBody.flip_h = false
		%IdleBody.flip_h = false
		%SpriteAB.flip_h = false
		%SpriteAF.flip_h = false
		%SpriteLB.flip_h = false
		%SpriteLF.flip_h = false
	elif direction < 0:
		%WalkingBody.flip_h = true
		%IdleBody.flip_h = true
		%SpriteAB.flip_h = true
		%SpriteAF.flip_h = true
		%SpriteLB.flip_h = true
		%SpriteLF.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_pressed("jump") && is_on_floor():
		%AnimationPlayerWalk.play("jump")
		%IdleBody.visible = false
		%Walk.visible = true
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()


func _on_game_inventory_toggled(is_toggled: bool) -> void:
	in_inventory = is_toggled
