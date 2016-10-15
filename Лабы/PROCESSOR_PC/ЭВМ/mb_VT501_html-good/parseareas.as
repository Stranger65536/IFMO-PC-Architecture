//_root.areas;
var len=_root.areas.childNodes.length;
var i;
//area array
_root.aarr=new Array();
for (i=0;i<len;i++){
	if ((area=this[_root.areas.childNodes[i].attributes.name])!=undefined){
		area.data=_root.areas.childNodes[i];
		area.mode="area";
		if (area.data.attributes.type=="hint"){
			area.mode="hint";
		}
		_root.aarr[_root.areas.childNodes[i].attributes.name]=undefined;
	}
}