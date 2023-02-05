class_name Night extends State




# Called when the node enters the scene tree for the first time.
func _init():
	nameState = "NIGHT"
	nextState = null


func run(scene) ->void : 
	var flag
	print("am Running %s"  % nameState)
	var event  =  scene.eventManager.getDineEvent(scene)
	flag = event.triggerEvent( scene)
	if flag == 0 :
		var eventWindow = scene.EventWindow
		eventWindow.open(event.title , event.text, event.photoPath)
		scene.food = feed(scene)
	
func feed(scene):
	var childs = scene.graph_holder.get_characters_by_age (Character.AGE.CHILD)
	var adults = scene.graph_holder.get_characters_by_age (Character.AGE.ADULT)
	var elders = scene.graph_holder.get_characters_by_age (Character.AGE.ELDER)
	var food = scene.food 
	for i in childs:
		if i.is_alive:
			food = i.eat(food)
	for i in adults:
		if i.is_alive:
			food = i.eat(food)
	for i in elders:
		if i.is_alive:
			food = i.eat(food)
		
	return food
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
