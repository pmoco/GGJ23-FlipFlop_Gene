extends Control

var graph_holder : GraphHolder

# Called when the node enters the scene tree for the first time.
func _ready():
	graph_holder = GraphHolder.new()
	add_child(graph_holder)
	
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
	
#	print(graph_holder.characters_info_string())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
