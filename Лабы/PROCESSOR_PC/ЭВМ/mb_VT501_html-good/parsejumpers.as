//_root.jumpers
_root.jarr=new Array();
var len=_root.jumpers.childNodes.length;
for (i=0;i<len;i++){
	if ((node=_root.jumpers.childNodes[i]).hasChildNodes()){
		var setLen=node.childNodes.length;
		var j;
//		trace(node.childNodes);
		for (j=0;j<setLen;j++){
			this[node.childNodes[j].attributes.area].mode="jumperset";
			this[node.childNodes[j].attributes.area].data=node;
			this[node.childNodes[j].attributes.area].jid=j;
			_root.jarr[node.childNodes[j].attributes.id]={
				clip:node.childNodes[j].attributes.image,
				state:false
			};
//		trace(node.childNodes[j].attributes.id);
		}
//		trace(_root.jarr.length);
		//then we have a jumperset
	}else{
		this[node.attributes.area].mode="jumper";
		this[node.attributes.area].data=node;
		_root.jarr[node.attributes.id]={
			clip:node.attributes.image,
			state:false
		};
		//we have a simple jumper
	}
}