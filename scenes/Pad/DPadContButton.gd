extends Button


var isButtonDown:bool = false
var dPadInitialPos: Vector2
var isPressing = false
var pressingPoint: Vector2

func _ready():
    Arcane.init(self, {"deviceType": "pad"})
    
    await get_tree().process_frame
    dPadInitialPos = $DPad.position
    print($DPad.position)

func _input(e):
    
    isPressing = get_rect().has_point(e.position)
    if(!isPressing): return
    
    if e is InputEventScreenTouch:
        if e.pressed:
            if isPressing:
                onPress(e)
        else:
            onRelease(e)

    elif e is InputEventScreenDrag and isPressing:
        if get_rect().has_point(e.position):
            onDrag(e)

func onPress(e):
    pressingPoint = e.position
    $DPad.position = e.position
   
 
func onDrag(e):
    $DPad.position = e.position 
    var diffX = e.position.x - pressingPoint.x 
    var diffY = e.position.y - pressingPoint.y  
    Arcane.msg.emitToViews(MovePlayerEvent.new(diffX, diffY))  
    
    
func onRelease(e):
    $DPad.position = dPadInitialPos
    isPressing = false
    Arcane.msg.emitToViews(AEvents.ArcaneBaseEvent.new("StopMovingPlayer"))
    

class MovePlayerEvent extends AEvents.ArcaneBaseEvent:
    var x:float
    var y:float

    func _init(_x:float, _y:float):
        super._init("MovePlayer")
        x = _x
        y = _y
