this.leader=false;
this.onMouseDown=function(){
	if (_root.pw_on||_root.burning)
		return
	if (this.hitTest(_root._xmouse,_root._ymouse)){
		this.leader=true;
		_root.dragtool=_root.libfile.attachMovie(this._parent.item.data.image,"dragTool",1);
		_root.dragtool._visible=false;
		_root.dragtool.data=this._parent.item.data;
		_root.dragtool.startDrag(true);
		_root.dragtool.onMouseUp=function(){
			var i;
			if (_root.activeArea!=undefined){
				if (_root.activeArea.data.attributes.type==this.data.type){
					len=_root.activeArea.data.childNodes.length;
					for (i=0;i<len;i++){
						if (_root.activeArea.data.childNodes[i].attributes.id==this.data.id)
							break;
					}
					if (i!=len){
						if (_root.activeArea.idSet!=undefined){
							_root.activeArea._parent[_root.activeArea.data.childNodes[_root.activeArea.idSet].attributes.image]._visible=false;
						}						
						_root.activeArea._parent[_root.activeArea.data.childNodes[i].attributes.image]._visible=true;
						_root.aarr[_root.activeArea.data.attributes.name]=this.data;
						_root.activeArea.idSet=i;
						_root.activeArea.dragToolData=this.data;
					}else{
						trace("Error id "+this.data.id+" not found");
					}
				}
			}
			this.removeMovieClip();
		}
	}
	this.onMouseMove=function(){
		if (_root.pw_on||_root.burning)
			return;
		_root.dragtool._visible=true;
		this.onMouseMove=undefined;		
	}
	this.onMouseUp=function(){
		if (_root.pw_on||_root.burning)
			return;
		this.onMouseUp=undefined;
		this.onMouseMove=undefined;
	}
}

