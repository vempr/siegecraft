extends CharacterBody2D

signal mining_toggled(is_mining: bool)

const SPEED := 400.0
const JUMP_VELOCITY := -700.0
var in_inventory := false
var is_mining := false
var mining_time := 0.0


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
	
	if !is_mining:
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
	
	if is_mining:
		%MiningArm.look_at(get_global_mouse_position())
		%MiningArm.rotation -= deg_to_rad(90)
		
		mining_time += delta
		%MiningArm.rotation += sin(mining_time * 30) * deg_to_rad(20)
	else:
		mining_time = 0.0


func _on_game_inventory_toggled(is_toggled: bool) -> void:
	in_inventory = is_toggled


func _on_mining_toggled(m: bool) -> void:
	is_mining = m
	if m:
		%Walk.visible = false
		%IdleBody.visible = true
		%AnimationPlayerWalk.stop()
		%AnimationPlayerWalk.play("RESET")
		
		%Mine.visible = true
		# %AnimationPlayerMine.play("mine")
	else:
		%Walk.visible = true
		%IdleBody.visible = false
		
		%Mine.visible = false
		# %AnimationPlayerMine.stop()
		# %AnimationPlayerMine.play("RESET")
