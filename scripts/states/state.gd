extends Node

class_name State 


var nameState :String  = "state"
var nextState :State = null




# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func getNextState() -> State : 
	return nextState
	
func setNextState(nextS) -> void:
	nextState = nextS
	
func run( scene) -> void: 
	printName()
	scene.peopleCount= 0

func printName():
	print(nameState)



