class_name Noon extends State


var HUNT_Mod = 2.0
var FARM_Mod = .1
var SCAV_Mod = 1.2
var FISH_Mod = 1.5


# Called when the node enters the scene tree for the first time.
func _init():
	nameState = "NOON"
	nextState = null
	# Replace with function body.

func run(_scene) ->void : 
	
	var people =  _scene.graph_holder.get_alive_characters().size()
	var eficiency =  people * .75
	
	var HuntRisk = generateTaskRisk(HUNT_Mod)
	var HuntGain = generateTaskGain(eficiency,HUNT_Mod)
		
	var ScavRisk = generateTaskRisk(SCAV_Mod)
	var ScavGain = generateTaskGain(eficiency,SCAV_Mod)

	var FishRisk = generateTaskRisk(FISH_Mod)
	var FishGain = generateTaskGain(eficiency,FISH_Mod)
	
	var FarmRisk = generateTaskRisk(FISH_Mod)
	var FarmGain = generateTaskGain(eficiency,FISH_Mod)
	
	_scene.TaskWindow.open(_scene,HuntRisk,HuntGain,ScavRisk,ScavGain,FarmRisk,FarmGain,FishRisk,FishGain)
	
	



func generateTaskRisk( Modifier) :
	
	var rdm =  randi() % 10
	return  Modifier * rdm  

func generateTaskGain(eficiency,Mod) :
	
	var rdm =  randi() % 51
	
	return (Mod + (rdm * .1 )) * eficiency
