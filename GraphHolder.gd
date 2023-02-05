class_name GraphHolder extends Control

var characters = []
var characters_by_row = {}
# top left corner of the graph
var collumn_jump : float = 20
var row_jump : float = 30

var color_default = Color(1,1,1,0.3)
var color_selected = Color(1,1,0, 0.9)

func _init():
	rect_position = Vector2(200,200)
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_graph()
	update()

func add_character(character: Character) -> void:
	if !is_instance_valid(character):
		return
	
	if character.graph_row < 0:
		# Find correct row
		var graph_row = -1
		for row in characters_by_row:
			for charac in characters_by_row[row]:
				if charac.age == character.age:
					graph_row = row
				break
			if graph_row != -1:
				break
		if graph_row < 0:
			graph_row = 0
		character.graph_row = graph_row
	
	characters.append(character)
	character.graph_holder = weakref(self)
	
	if !characters_by_row.has(character.graph_row):
		characters_by_row[character.graph_row] = []
	characters_by_row[character.graph_row].append(character)
	
	self.add_child(character)

func characters_info_string() -> String:
	var output = ""
	for character in characters:
		output += str(character) + "\n"
	return output

func update_graph() -> void:
	var current_collumn : int = 0
	# Reposition characters
	for row in characters_by_row:
		current_collumn = 0
		for character in characters_by_row[row]:
			var _character : Character = character
			
			var x = current_collumn * (_character.rect_size[0] + collumn_jump)
			var y = row * (_character.rect_size[0] + row_jump)
			_character.rect_position = Vector2(x, y)
			current_collumn += 1

func _draw():
	
	var visited_characters = []
	# Draw lines
	for character in characters:
		var _character: Character = character
		if !is_instance_valid(_character.partner):
			continue
		if visited_characters.has(_character):
			continue
		
		visited_characters.append(_character)
		visited_characters.append(_character.partner)
		
		var a_position = _character.rect_position * 2 # HACK? I don't know why it works
		
		var b_position = _character.partner.rect_position * 2
		
		var color : Color = color_default
		if _character.is_selected or _character.partner.is_selected:
			color = color_selected
		# Mariage line
		draw_line(a_position, b_position, color, 5)
		
		if _character.children.size() > 0 :
			var parent_mid_point = a_position + ((b_position - a_position) / 2)
			var child_top_mid_point = parent_mid_point + Vector2(0, (_character.rect_size[0] + row_jump))
			# midpoint for children
			draw_line(parent_mid_point, child_top_mid_point, color, 5)
			for child in _character.children:
				var _child : Character = child
				var char_pos = child.rect_position * 2
				var char_pos_top = char_pos - Vector2(0, (_character.rect_size[0] + row_jump))
				
				var color_child = color_default
				if _child.is_selected:
					color_child = color_selected
				draw_line(child_top_mid_point, char_pos_top, color_child, 5)
				draw_line(char_pos_top, char_pos, color_child, 5)

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		print("unhandled")
		clear_selection()

func clear_selection() -> void:
	for character in characters:
		character.is_selected = false
		

func get_alive_characters() -> Array:
	var alives = []
	for character in characters:
		if character.is_alive:
			alives.append(character)
	return alives

func init_default_graph()->void:
	var graph_holder = self
	
	var A = Character.new()
	A.first_name = "A"
	A.last_name = "Fliby"
	A.age = Character.AGE.ELDER
	A.status = Character.STATUS.WOUNDED
	graph_holder.add_character(A)
	
	var B = Character.new()
	B.first_name = "B"
	B.last_name = "Flob"
	B.age = Character.AGE.ELDER
	graph_holder.add_character(B)
	
	var C = Character.new()
	C.first_name = "C"
	C.last_name = "Flab"
	C.age = Character.AGE.ELDER
	graph_holder.add_character(C)
	
	B.marry(C)

	var D = Character.new()
	D.first_name = "D"
	D.last_name = "Flobady"
	D.age = Character.AGE.ELDER
	graph_holder.add_character(D)
	
	A.marry(D)
	
	
	var E = Character.new()
	E.first_name = "E"
	E.age = Character.AGE.ADULT
	E.is_child_of(B)
	E.is_child_of(C)
	graph_holder.add_character(E)
	
	var G = Character.new()
	G.first_name = "G"
	G.age = Character.AGE.ADULT
	G.is_child_of(B)
	G.is_child_of(C)
	graph_holder.add_character(G)
	
	var H = Character.new()
	H.first_name = "H"
	H.age = Character.AGE.ADULT
	H.is_child_of(B)
	H.is_child_of(C)
	graph_holder.add_character(H)
	
	var F = Character.new()
	F.first_name = "F"
	F.age = Character.AGE.ADULT
	F.is_child_of(A)
	F.is_child_of(D)
	H.marry(F)
	graph_holder.add_character(F)
	
	var I = Character.new()
	I.first_name = "I"
	I.age = Character.AGE.CHILD
	I.is_child_of(H)
	I.is_child_of(F)
	graph_holder.add_character(I)
