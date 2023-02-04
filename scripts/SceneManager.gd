class_name SceneManager extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var food = 5
var peopleCount= 3 
var peopleList =null 
var farmMod =  0.0 
var days = 0 
var currentState : State
var noon : Noon 
var morning :Morning 
var evening : Evening 
var night :Night


func _init():
	morning = Morning.new()
	noon = Noon.new()
	evening = Evening.new()
	night = Night.new()
	
	
	morning.setNextState(noon)
	noon.setNextState(evening)
	evening.setNextState(night)
	night.setNextState(morning)
	currentState =  morning


# Called when the node enters the scene tree for the first time.
func _ready():
	while (days<4 ) :
		
		printState()
		currentState.run()
		currentState = currentState.getNextState()
		if (currentState ==  morning) :
			days = days +1
			print("_______________NEW DAY %s______________"%days) 
			
	currentState.runWithScene(self)
	if (peopleCount == 0):
		print("U LOOSE") 
	

func printState():
	print("Day  %s" %days )
	print("people -> %s" %peopleCount )
	print("food -> %s" %food )
	print("farm -> %s" %farmMod)
	print ("STATE  : %s"  %currentState.nameState) 
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
