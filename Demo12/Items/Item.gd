extends Area2D
class_name Item


onready var _animationPlayer := $AnimationPlayer as AnimationPlayer
onready var _sprite := $Sprite as Sprite

var _isPicked := false
var _type : Reference = null


func _ready() -> void:
	_type = GameConfig.produceItem()
	_sprite.texture = load(_type.icon)


func _on_Item_body_entered(body: Node) -> void:
	if ! _isPicked && is_instance_valid(body) && body.has_method('collect'):
		_isPicked = true
		body.collect(_type)
		_animationPlayer.play('picked')


func _on_LifeTimer_timeout() -> void:
	_animationPlayer.current_animation = 'disappear'


func bomb():
	_animationPlayer.playback_speed = 2.0
	_animationPlayer.current_animation = 'disappear'
