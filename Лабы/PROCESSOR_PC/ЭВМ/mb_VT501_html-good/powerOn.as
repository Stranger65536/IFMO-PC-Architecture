import mx.controls.Alert;
var pw_on = false;
_root.burned=false;
_root.burning=false;
myClickHandler = function(evt){
	_root.burning=false;
	_root.switchState();
};
function switchState(){
	_root.mc_processors.enabled=pw_on;
	_root.mc_memory.enabled=pw_on;
	_root.mc_video.enabled=pw_on;	
	pw_on=!pw_on;
	if (pw_on){
		powerOn();
	}else{
		powerOff();
	}
	
}
function powerOn() {
	_root.power.label="Power Off";
	_root.output._visible=true;
	var out=_root.workArea.content.startup();
	if (!_root.burned){
		if (out==undefined){
			var myAlert = Alert.show("You've burned off your motherboard", "We appologise for our inconvenience", Alert.OK, this, myClickHandler);	
			_root.burning=true;
			Alert.addEventListener();
			_root.burned=true;
			_root.output.out.text="";
		}else{
			_root.output.out.text=out;
		}
	}
}
function powerOff() {
	_root.power.label="Power On";
	_root.output._visible=false;
}