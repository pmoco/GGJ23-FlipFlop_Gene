class_name Character extends Control

enum AGE {
	CHILD,
	ADULT,
	ELDER,
	OTHER
}

enum STATUS {
	HEALTHY,
	HUNGRY,
	SICK,
	WOUNDED,
	OTHER
}

var first_name : String = "Flip"
var last_name : String = "Flap"
var age : int = AGE.ADULT
var status : int = STATUS.HEALTHY
var is_alive : bool = true

# this value impacts how a character is able to succeeds in an action.
var efficiency : float = 0.1


# Called when the node enters the scene tree for the first time.
func _init() -> void:
	pass

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _to_string() -> String:
	var alive_text = "It is dead."
	if is_alive:
		alive_text = "It is alive."
	return "This character is named " + first_name + " " + last_name + ". It is at the age of " + AGE.keys()[age] + " and is " + STATUS.keys()[status] + ". " + alive_text
