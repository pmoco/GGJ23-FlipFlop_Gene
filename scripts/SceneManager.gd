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

#============= states
var noon : Noon 
var morning :Morning 
var evening : Evening 
var night :Night

#===============UI 
var EventWindow 
var sideBar

#Handlers 

var eventManager :  Event_manager

var graph_holder : GraphHolder


func _init():
	eventManager =  Event_manager.new ()
	
	morning = Morning.new()
	noon = Noon.new()
	evening = Evening.new()
	night = Night.new()
	
	
	morning.setNextState(noon)
	noon.setNextState(evening)
	evening.setNextState(night)
	night.setNextState(morning)
	currentState =  morning
	
	# Graph Init
	graph_holder = GraphHolder.new()
	add_child(graph_holder)
	graph_holder.init_default_graph()
	
	graph_holder.rect_position = Vector2(400, 250)
	graph_holder.rect_scale = Vector2(1.5,1.5)



func _process(_delta):
	
	sideBar.updateUI(self)
	if (peopleCount == 0):
		print("U LOOSE") 
	





func nextStep(): 
	
	currentState = currentState.getNextState()
	currentState.run(self)
	printState()




# Called when the node enters the scene tree for the first time.
func _ready():
	EventWindow = get_node("EventWindow")
	sideBar = get_node("SideBar")


func printState():
	print("Day  %s" %days )
	print("people -> %s" %peopleCount )
	print("food -> %s" %food )
	print("farm -> %s" %farmMod)
	print ("STATE  : %s"  %currentState.nameState) 
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NextButton_pressed():
	nextStep() # Replace with function body.
