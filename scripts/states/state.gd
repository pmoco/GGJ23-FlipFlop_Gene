class_name State extends Node

var nameState :String  = "state"
var nextState :State = null

func nextEvent(scene):
	
	var window =scene.EventWindow
	if window.is_visible():
		window.hide()


func getNextState() -> State : 
	return nextState
	
func setNextState(nextS: State) -> void:
	nextState = nextS
	
func run(scene) -> void: 
	print(nameState)
	scene.peopleCount= 0
