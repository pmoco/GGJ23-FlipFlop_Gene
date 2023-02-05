class_name Character extends Control

enum AGE {
	CHILD,
	ADULT,
	ELDER,
	OTHER
}

enum STATUS {
	HEALTHY,
	HUNGRY,
	SICK,
	WOUNDED,
	OTHER
}

var flip: bool = bool(randi() % 2)
var first_name : String = "Flip"
var last_name : String = "Flap"
var age : int = AGE.ADULT
var status : int = STATUS.HEALTHY
var is_alive : bool = true

# this value impacts how a character is able to succeeds in an action.
var efficiency : float = 0.1

# PARENTING
var parents = [] # of type Character
var children = [] # of type Character
var partner : Character = null

# Graph Row represents the row in which this character will be displayed in.
# This might not be needed. Explore other solutions.
var graph_holder : WeakRef = null
var graph_row : int = -1
var is_selected: bool = false

var color_default = Color(1,1,1,1)
var color_dead = Color(0.1,0.1,0.1,0.5)
var color_selected = Color(0.9,0.2,.5,1)


# Drawing frame content info
var frame_index : int = (randi() % 5) + 1
var frame_texture: Texture = null

var frame_status_texture: Texture = null

var status_dead_texture: Texture = null
var status_wounded_texture: Texture = null
var status_hungry_texture: Texture = null
var status_sick_texture: Texture = null
var status_offset : Vector2 = Vector2(20, 25)
var status_size : Vector2

var age_elder_texture: Texture = null
var age_child_texture: Texture = null
var age_offset : Vector2 = Vector2(-50, -55)
var age_size : Vector2

var face_index : int = (randi() % 10) + 1
var face_texture: Texture = null
var face_size : Vector2

var default_font: Font = null

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	rect_position[0] = 0
	rect_position[1] = 0
	rect_size[0] = 60
	
	var frame_texture_name = "MOLDURA_" + str(frame_index) + ".png"
	frame_texture = load("res://ASSETS/UI_OVERLAYS/" + frame_texture_name)
	frame_status_texture = load("res://ASSETS/UI_OVERLAYS/MOLDURA_STATES.png")
	
	var face_texture_name = "FACE_" + str(face_index) + ".png"
	face_texture = load("res://ASSETS/FACES/" + face_texture_name)
	face_size = Vector2(rect_size[0]*.8, rect_size[0]*1)
	
	status_size = Vector2(rect_size[0]*.5, rect_size[0]*.5)
	age_size = Vector2(rect_size[0]*.5, rect_size[0]*.5)
	
	var label = Label.new()
	default_font = label.get_font("")
	label.free()
	
	status_dead_texture = load("res://ASSETS/ICONS/ICON_DEAD.png")
	status_wounded_texture = load("res://ASSETS/ICONS/ICONS_WOUNDED.png")
	status_hungry_texture = load("res://ASSETS/ICONS/ICON_FOOD_HUNGER.png")
	status_sick_texture = load("res://ASSETS/ICONS/ICON_SICK.png")
	
	age_child_texture = load("res://ASSETS/ICONS/ICON_BABY.png")
	age_elder_texture = load("res://ASSETS/ICONS/ICONS_ELDER.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update()

func _to_string() -> String:
	var alive_text = "It is dead."
	if is_alive:
		alive_text = "It is alive."
	return "This character is named " + first_name + " " + last_name + ". " + \
		"It is at the age of " + AGE.keys()[age] + " and is " + STATUS.keys()[status] + ". " + \
		alive_text + \
		"It has " + str(num_of_generations()) + " family generations."

func marry(character : Character) -> void:
	if character == self:
		# cannot marry yourself
		return
		
	partner = character
	if character:
		character.partner = self
		if num_of_generations() >= character.num_of_generations():
			character.last_name = last_name
		else:
			last_name = character.last_name

func num_of_generations() -> int:
	# Returns the number of generations the family of this character has.
	# It only counts from this character upwards
	var generations = 1
	
	var parent_generations = 0
	for parent in parents:
		if parent:
			var gen = parent.num_of_generations()
			if gen > parent_generations:
				parent_generations = gen
	
	return generations + parent_generations

func is_child_of(character: Character) -> void:
	if !is_instance_valid(character):
		return
	
	parents.append(character)
	character.children.append(self)
	
	last_name = character.last_name
	
	graph_row = character.graph_row + 1

func _draw():
	var color = color_default
	if is_selected:
		color = color_selected
	if !is_alive:
		color = color_dead
#	draw_circle(rect_position, rect_size[0], color)
	var frame_pos: Vector2 = Vector2(rect_position - Vector2(rect_size[0], rect_size[0]))
	var frame_size: Vector2 = Vector2(Vector2(rect_size[0] * 2, rect_size[0] * 2))
	var frame_rect: Rect2 = Rect2(frame_pos, frame_size)
	draw_texture_rect(frame_texture, frame_rect, false, color)
	draw_texture_rect(frame_status_texture, frame_rect, false, color)
	
	var face_pos: Vector2 = Vector2(rect_position - (face_size * Vector2(.5, .5)))
	var face_rect: Rect2 = Rect2(face_pos, face_size)
	if flip:
		face_pos = Vector2(rect_position + (face_size * Vector2(.5, .5)))
		face_rect = Rect2(Vector2(), face_size)
		draw_set_transform(face_pos, PI, Vector2(1, 1))
	draw_texture_rect(face_texture, face_rect, false, color)
	if flip:
		draw_set_transform(Vector2(), 0, Vector2(1, 1))
	
	# Status Effect
	var status_texture = null
	if !is_alive:
		status_texture = status_dead_texture
	else:
		match status:
			STATUS.HUNGRY:
				status_texture = status_hungry_texture
			STATUS.SICK:
				status_texture = status_sick_texture
			STATUS.WOUNDED:
				status_texture = status_wounded_texture
	if status_texture:
		var status_pos: Vector2 = Vector2(rect_position + status_offset)
		var status_rect: Rect2 = Rect2(status_pos, status_size)
		draw_texture_rect(status_texture, status_rect, false, color)
	
	# Age Effect
	var age_texture = null
	match age:
		AGE.CHILD:
			age_texture = age_child_texture
		AGE.ELDER:
			age_texture = age_elder_texture
	if age_texture:
		var age_pos: Vector2 = Vector2(rect_position + age_offset)
		var age_rect: Rect2 = Rect2(age_pos, age_size)
		draw_texture_rect(age_texture, age_rect, false, color)
	
	# Show Tooltip
	var offset = get_local_mouse_position()
	if offset.distance_to(rect_position) < rect_size[0]:
		var text_pos = Vector2(rect_position + Vector2(rect_size[0]/2, rect_size[0] * 1.4))
		var text_string: String = first_name + " " + last_name
		draw_set_transform(text_pos, 0, Vector2(2, 2))
		draw_string(default_font, Vector2(), text_string)
		draw_set_transform(Vector2(), 0, Vector2(1, 1))

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var offset = get_local_mouse_position()
		if offset.distance_to(rect_position) < rect_size[0]:
			var was_selected = is_selected
			var graph = graph_holder.get_ref()
			if graph:
				graph.clear_selection()
			if !was_selected:
				set_is_selected()
			
			get_tree().set_input_as_handled()

func set_is_selected() -> void:
	is_selected = true
	for parent in parents:
		parent.set_is_selected_parent()
	for child in children:
		child.set_is_selected_child()

func set_is_selected_child() -> void:
	is_selected = true
	for child in children:
		child.set_is_selected_child()
		
func set_is_selected_parent() -> void:
	is_selected = true
	for parent in parents:
		parent.set_is_selected_parent()

func eat(totalfood):
	var hungry = 0
	var foodneeded
	if(self.status == STATUS.SICK):
		foodneeded = 2
	else:
		foodneeded = 1
	if totalfood-foodneeded >= 0:
		totalfood = totalfood-foodneeded
		if self.status == STATUS.HUNGRY:
			self.status = STATUS.HEALTHY
	else:
		hungry = randi() % 2
		if hungry == 0:
			if self.status == STATUS.HUNGRY:
				print("time to die")
				self.is_alive = false
			self.status = STATUS.HUNGRY
	return totalfood
