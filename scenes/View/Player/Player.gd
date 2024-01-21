extends Node


var pad:ArcanePad
var padQuaternion := Quaternion.IDENTITY

func initialize(_pad:ArcanePad) -> void:
    
    pad = _pad
    
    print("User Name: ", pad.user.name)
    
    pad.on("Attack", onAttack)
    
    
func onAttack():
    
    AUtils.writeToScreen(self, pad.user.name + " attacked")
    
