extends Button


var isButtonDown:bool = false


func _on_button_down():
    isButtonDown = true


func _input(event):
    if !isButtonDown: return
    if event is InputEventScreenTouch or event is InputEventMouseButton:
        if event.pressed:
            $DPad.position = event.position

