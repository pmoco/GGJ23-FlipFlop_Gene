
class_name Event_manager extends Node

enum SIZE {
	BIG
	MEDIUM
	SMALL
}

var _random_list=["sick","infected","child","death","roobed"]

	
var _task_list=["injured","extra_food","death","betraied"]





var rdmEventList =[StrangerFound.new() , DiedEvent.new(), SickEvent.new(), MarryEvent.new(), HaveChildEvent.new()]
var DayEventList =[StrangerFound.new() , DiedEvent.new(),ExtrafoodEvent.new(),WoundedEvent.new()]
var GoodEventList = [StrangerFound.new() ,ExtrafoodEvent.new()]
var BadEventList =[ DiedEvent.new(),WoundedEvent.new()]
#DayEventList =[DiedEvent.new()]
#var rdmEventList =[StrangerFound.new(),MarryEvent.new() ]

func getNightEvent(_scene) -> Event:
	return rdmEventList[randi() % rdmEventList.size()]


func getDayEvent(_scene) -> Event:
	return DayEventList[randi() % DayEventList.size()]

func getDineEvent(_scene) -> Event:
	return DineEvent.new()

func getBadEvent(scene) -> Event:
	return BadEventList[randi() % BadEventList.size()]

func getHuntEvent(scene) -> Event:
	return HuntEvent.new()

func getFishingEvent(scene) -> Event:
	return FishingEvent.new()

func getFarmingEvent(scene) -> Event:
	return FarmingEvent.new()
	
func getScavengeEvent(scene) -> Event:
	return ScavengeEvent.new()

# Called when the node enters the scene tree for the first time.
func call_actions():
	var event_type = SIZE.keys()[randi() % SIZE.size()]
	var list
	var hunting
	var fishing
	var agriculture
	var harvest
	if event_type == SIZE.BIG:
		hunting = 3
	elif event_type == SIZE.MEDIUM:
		hunting = 2
	elif event_type == SIZE.SMALL:
		hunting = 1
	list.append(hunting)
	event_type = SIZE.keys()[randi() % SIZE.size()]
	if event_type == SIZE.BIG:
		fishing = 3
	elif event_type == SIZE.MEDIUM:
		fishing = 2
	elif event_type == SIZE.SMALL:
		fishing = 1
	list.append(fishing)
	event_type = SIZE.keys()[randi() % SIZE.size()]
	if event_type == SIZE.BIG:
		agriculture = 3
	elif event_type == SIZE.MEDIUM:
		agriculture = 2
	elif event_type == SIZE.SMALL:
		agriculture = 1
	list.append(agriculture)
	event_type = SIZE.keys()[randi() % SIZE.size()]
	if event_type == SIZE.BIG:
		harvest = 3
	elif event_type == SIZE.MEDIUM:
		harvest = 2
	elif event_type == SIZE.SMALL:
		harvest = 1
	list.append(harvest)
	#return Action_event(list)

	
#func call_task(person):
#	var event_type = _task_list[randi() % _task_list.size()]
#	return Random_event(event_type)#
