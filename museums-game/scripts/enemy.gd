extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null

var health = 100
var player_inattack_zone = false
var can_take_damage = true

var is_attacking = false

func _physics_process(delta: float) -> void:
	update_health()
	deal_with_damage()
	
	
	if player_inattack_zone and !is_attacking:
			$AnimatedSprite2D.play('attack2')
			is_attacking=true
			$attack_timer.start()
	
	else:
	
		if player_chase:
			position += (player.position - position).normalized() * speed * delta
			move_and_collide(Vector2(0,0)) 
			
			if !is_attacking:
				$AnimatedSprite2D.play('walk')
				if (player.position.x - position.x) <0:
					$AnimatedSprite2D.flip_h=true
				else:
					$AnimatedSprite2D.flip_h=false
		else:
			$AnimatedSprite2D.play('idle')
		
func _on_attack_timer_timeout() -> void:
	$attack_timer.stop()
	is_attacking = false
	

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
	
func enemy():
	pass


func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = false

func deal_with_damage():
	if player_inattack_zone and Global.player_current_attack == true:
		if can_take_damage==true:
			health = health - 20
			$take_damage_cooldown.start()
			can_take_damage = false
			print("enemy health = ", health)
			if health <=0: 
				self.queue_free()


func _on_take_damage_cooldown_timeout() -> void:
	can_take_damage = true

func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	
	if health>=100:
		healthbar.visible = false
	else:
		healthbar.visible = true
