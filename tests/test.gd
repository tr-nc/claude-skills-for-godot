extends SceneTree

func _init():
	print("Running tests...")
	run_tests()
	quit()

func run_tests():
	# Test 1: Basic scene structure
	print("Test 1: Checking scene structure...")
	assert(FileAccess.file_exists("user://test_data.tres"), "Failed to create test data")

	# Test 2: Resource loading
	print("Test 2: Testing resource loading...")
	var test_scene = load("res://examples/minimal_scene.tscn")
	assert(test_scene != null, "Failed to load test scene")
	assert(test_scene is PackedScene, "Test scene is not a PackedScene")

	# Test 3: Node instantiation
	print("Test 3: Testing node instantiation...")
	var instance = test_scene.instantiate()
	assert(instance != null, "Failed to instantiate scene")
	assert(instance.has_node("Label"), "Scene missing expected node")
	instance.free()

	print("All tests passed!")

func assert(condition, message):
	if not condition:
		print("ASSERTION FAILED: ", message)
		quit(1)
