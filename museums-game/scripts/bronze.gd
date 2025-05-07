extends CharacterBody2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("_is_scholar"):
		reveal_layer(self.name)
		queue_free()

func reveal_layer(coin):
	var coin_array = coin.split("_")
	var number = coin_array[1]
	var tilemap = get_parent().get_parent().get_node("TileMap")
	var path = "buddha_layer_%s" % str(number)
	tilemap.get_node(path).visible = true
