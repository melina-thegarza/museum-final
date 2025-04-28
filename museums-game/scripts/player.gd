extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

const speed = 100
var current_dir = "none"

var attack_ip = false

func _ready():
	$AnimatedSprite2D.play('front_idle')

func _physics_process(delta: float) -> void:
	player_movement(delta)
	enemy_attack()
	update_health()
	
	if health <= 0:
		player_alive = false
		#add end screen
		health = 0
		print('player has been killed')
		$AnimatedSprite2D.play("death")
	

func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x=0
		velocity.y=0

	move_and_slide()


func play_anim(movement):
	var dir =current_dir
	var anim = $AnimatedSprite2D
	
	if dir=='right' or dir=='left':
		if dir=='right':
			anim.flip_h = false
		else:
			anim.flip_h= true
			
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("side_idle")
	
	if dir=='down':
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("front_idle")
	
	if dir=='up':
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("back_idle")
	
func player():
	pass

func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown==true:
		health = health-20
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)
		

func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true
	
	
		

func _on_deal_attack_timer_timeout() -> void:
	$deal_attack_timer.stop()
	Global.player_current_attack = false
	attack_ip = false


func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	
	if health>=100:
		healthbar.visible = false
	else:
		healthbar.visible = true

func _on_regin_timer_timeout() -> void:
	if health <= 0:
		health = 0
	elif health < 100:
		health = health + 20
		if health > 100:
			health = 100
	
