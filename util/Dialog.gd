extends CanvasLayer

var ch_text={"full":"","build":""}
var ch_name

func _ready():
	if ch_text.full=="":
		set_text("EMPTY_DIALOG")
	$SlowText.start()
func _process(_delta):
	if len(ch_text.full)==len(ch_text.build):
		$SlowText.stop()
		ch_text.build=""
		print("Fin")
func sentence_builder():
	var build_length=len(ch_text.build)
	if build_length==0:
		ch_text.build=ch_text.full[0]
	else:
		ch_text.build=ch_text.full.substr(0,build_length+1)
	$Panel/Dialog.text=ch_text.build
	
func set_text(id):
	ch_text.full=tr(id)