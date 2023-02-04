extends Control

var characters = []


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(10):
		var chara = Character.new()
		chara.first_name += "_" + str(i)
		characters.append(chara)
		print(chara)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
