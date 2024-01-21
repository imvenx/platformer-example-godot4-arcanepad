extends Control

func _ready():
    Arcane.init(self, { "deviceType": "pad" })
    Arcane.msg.on(AEventName.ArcaneClientInitialized, onArcaneClientInitialized)
    
        
func onArcaneClientInitialized(initialState: AModels.InitialState):
    pass
    
