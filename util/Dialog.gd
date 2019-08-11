extends CanvasLayer

# Dialog box that recieves a bunch of ids and names and processes
# them as readable text, it has a skip text function and full
# flow (except animations)
# the constructor's array is like so:
# [ {text,name},{...} ]

export var dialog_ids=[]
var dialog_stack=[]
var ch_text={"full":"","build":""}
var talking=true

func init(ids:Array):
	dialog_ids=ids
	dialog_stack=dialog_ids.duplicate()
	
func _ready():
	next_step_setup(dialog_stack[0])
	if ch_text.full=="":
		set_text("EMPTY_DIALOG")
	$SlowText.start()

func _process(_delta):
	if len(ch_text.full)==len(ch_text.build)&&talking:
		stop_talking()

func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		if talking:
			#ch_text.build=ch_text.full
			$Panel/Dialog.text=ch_text.full
			stop_talking()
		else:
			if dialog_stack.empty():
				queue_free()
			else:
				next_step_setup(dialog_stack[0])
				start_talking()

func sentence_builder():
	var build_length=len(ch_text.build)
	if build_length==0:
		ch_text.build=ch_text.full[0]
	else:
		ch_text.build=ch_text.full.substr(0,build_length+1)
	$Panel/Dialog.text=ch_text.build

func set_text(id:String):
	ch_text.full=tr(id)
	ch_text.build=""

func next_step_setup(res:Dictionary):
	set_text(res.text)
	$Panel/Name.text=res.name
	
func stop_talking():
	$SlowText.stop()
	dialog_stack.pop_front()
	$Panel/Next_arrow.visible=true
	talking=false

func start_talking():
	$SlowText.start()
	$Panel/Next_arrow.visible=false
	talking=true