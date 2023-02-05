class_name Random_event extends Node

var _people
var _quantity
var _new_person
var _type
func _init(type):
	_type = type
	if type == "sick":
		_people = get_random() #get random character
		_quantity = 0
		_new_person = false
	if type == "infected":
		_people.append(get_random()) 
		_people.append(get_random())
		_quantity = 0
		_new_person = false
	if type == "child":
		_people = get_new() #get new character
		_quantity = 0
		_new_person = True
	if type == "death":
		_people = get_random() 
		_quantity = 0
		_new_person = false
	if type == "roobed":
		_people = null
		_quantity = randi() % get_current_food()
		_new_person = false
	if type == "injured":
		_people = get_random() 
		_quantity = 0
		_new_person = false
	if type == "extra_food":
		_people = get_random() 
		_quantity = randi() % get_current_food()
		_new_person = false
	if type == "betraied":
		_people.append(get_random()) # delete from communiy
		_people.append(get_random()) 
		_quantity = randi() % get_current_food()
		_new_person = false

