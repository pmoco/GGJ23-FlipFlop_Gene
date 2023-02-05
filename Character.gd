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

var face_index : int = (randi() % 10) + 1
var face_texture: Texture = null
var face_offset : Vector2 = Vector2(10, 10)
var face_size : Vector2

var default_font: Font = null

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	rect_position[0] = 0
	rect_position[1] = 0
	rect_size[0] = 60
	
	var frame_texture_name = "MOLDURA_" + str(frame_index) + ".png"
	frame_texture = load("res://ASSETS/UI_OVERLAYS/" + frame_texture_name)
	
#	var face_texture_name = "FACE_" + str(face_index) + ".png"
	var face_texture_name = "FACE.png"
	face_texture = load("res://ASSETS/" + face_texture_name)
	face_size = Vector2(rect_size[0]*1, rect_size[0]*1)
	
	var label = Label.new()
	default_font = label.get_font("")
	label.free()

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
	
	var face_pos: Vector2 = Vector2(rect_position - (face_size * Vector2(.5, .5)))
	var face_rect: Rect2 = Rect2(face_pos, face_size)
	if flip:
		face_pos = Vector2(rect_position + (face_size * Vector2(.5, .5)))
		face_rect = Rect2(Vector2(), face_size)
		draw_set_transform(face_pos, PI, Vector2(1, 1))
	draw_texture_rect(face_texture, face_rect, false, color)
	if flip:
		draw_set_transform(Vector2(), 0, Vector2(1, 1))
	
	# Show Tooltip
	var offset = get_local_mouse_position()
	if offset.distance_to(rect_position) < rect_size[0]:
		var text_pos = Vector2(rect_position + Vector2(rect_size[0]/2, rect_size[0] * 1.4))
		var text_string: String = first_name + " " + last_name
		draw_set_transform(text_pos, 0, Vector2(2, 2))
		draw_string(default_font, Vector2(), text_string)
		draw_set_transform(Vector2(), 0, Vector2(1, 1))

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
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
