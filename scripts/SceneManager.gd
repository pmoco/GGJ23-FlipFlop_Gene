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
var TaskWindow
var sideBar

#Handlers 

var eventManager :  Event_manager

var graph_holder : GraphHolder

var WindowOpened =false

#Action

var action = "NONE"
var risk= 0.0
var gain= 0.0

func _init():
	randomize()
	
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
	
	peopleCount =int(find_node("people").text)
	
	
	
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
	TaskWindow =  get_node("TaskWindow")


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

func _on_ScavButton_pressed():
	risk = float(find_node("ScavRisk").text) 
	gain = float(find_node("ScavGain").text)
	action = "SCAV"
	WindowOpened =false

func _on_HuntButton_pressed():
	risk = float(find_node("HuntRisk").text) 
	gain = float(find_node("HuntGain").text)
	action = "HUNT"
	WindowOpened =false

func _on_FarmButton_pressed():
	risk = float(find_node("FarmRisk").text) 
	gain = float(find_node("FarmGain").text)
	action = "FARM"
	WindowOpened =false
	
func _on_FishButton_pressed():
	risk = float(find_node("FishRisk").text) 
	gain = float(find_node("FishGain").text)
	action = "FISH"
	WindowOpened =false
	
	
func calc_efficiency ():
	
	var chars = graph_holder.get_alive_characters()
	var efficiency = 0
	
	var base_eff= 1
	for character in chars:
		if character.is_alive:
			if character.age == Character.AGE.ADULT :
				 base_eff =1.5
			elif character.age == Character.AGE.ELDER :
				 base_eff =.7
			else:
				base_eff=0
			
			if character.status == Character.STATUS.HEALTHY:
				base_eff  = base_eff *1 
			elif character.status == Character.STATUS.HUNGRY:
				base_eff =base_eff *.7
			elif character.status == Character.STATUS.SICK:
				base_eff =base_eff *.5
			elif character.status == Character.STATUS.WOUNDED:
				base_eff =base_eff *.5
			
			efficiency= efficiency +base_eff
	return efficiency
