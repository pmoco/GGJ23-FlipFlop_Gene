extends Node

class_name State 


var nameState :String  = "state"
var nextState :State = null




# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getNextState() -> State : 
	return nextState
	
func setNextState(nextS) -> void:
	nextState = nextS
	
func run() ->void:
	pass
	
func runWithScene( scene) -> void: 
	printName()
	scene.peopleCount= 0

func printName():
	print(nameState)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
