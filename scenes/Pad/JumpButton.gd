extends Button


#func _ready():
    #connect("pressed", func(): Arcane.msg.emitToViews(AEvents.ArcaneBaseEvent.new("Jump")))

func _input(e):
    if e is InputEventScreenTouch:
        if e.pressed:
            if !get_rect().has_point(e.position): return
            Arcane.msg.emitToViews(AEvents.ArcaneBaseEvent.new("Jump"))
