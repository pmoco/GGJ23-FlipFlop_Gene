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
		scene.food = feed(scene)
		var eventWindow = scene.EventWindow
		eventWindow.open(event.title , event.text, event.photoPath)
	
func feed(scene):
	var childs = scene.graph_holder.get_characters_by_age (Character.AGE.CHILD)
	var adults = scene.graph_holder.get_characters_by_age (Character.AGE.ADULT)
	var elders = scene.graph_holder.get_characters_by_age (Character.AGE.ELDER)
	var food = scene.food 
	var hungry
	for i in childs:
		if i.is_alive:
			if food-1 >= 0:
				food = food-1
			else:
				hungry = randi() % 2
				if hungry == 0:
					if i.status == Character.STATUS.HUNGRY:
						hungry = randi() % 2
						if hungry == 0:
							i.is_alive = false
					i.status = Character.STATUS.HUNGRY
	for i in adults:
		if i.is_alive:
			if food-1 >= 0:
				food = food-1
			else:
				hungry = randi() % 2
				if hungry == 0:
					if i.status == Character.STATUS.HUNGRY:
						hungry = randi() % 2
						if hungry == 0:
							i.is_alive = false
					i.status = Character.STATUS.HUNGRY
	for i in elders:
		if i.is_alive:
			if food-1 >= 0:
				food = food-1
			else:
				hungry = randi() % 2
				if hungry == 0:
					if i.status == Character.STATUS.HUNGRY:
						hungry = randi() % 2
						if hungry == 0:
							i.is_alive = false
					i.status = Character.STATUS.HUNGRY
	return food
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
