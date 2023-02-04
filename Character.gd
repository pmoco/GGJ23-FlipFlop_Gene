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
var graph_row : int = 0


# Called when the node enters the scene tree for the first time.
func _init() -> void:
	rect_position[0] = 0
	rect_position[1] = 0
	rect_size[0] = 60

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
	var color = Color.red
	color.a = 0.8
	draw_circle(rect_position, rect_size[0], color)
