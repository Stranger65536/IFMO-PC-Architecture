this._alpha=0;
this.onMouseMove=function(){
	if (_root.pw_on||_root.burning)
		return;
	if (this.hitTest(_root._xmouse,_root._ymouse)){
		if (!(this._parent._parent.mask_mc.hitTest(_root._xmouse,_root._ymouse))){
			return;
		}
		
		_root.activeArea=this;
		if (this.mode=="area"){
			this._alpha=100;
			_root.status.text=this.data.attributes.description;
		}else if ((this.mode=="hint")&&(_root.dragtool==undefined)){
			this._alpha=100;
			_root.status.text=this.data.attributes.description;
		}
		
	}else{
		if (_root.activeArea==this){
			_root.activeArea=undefined;
			_root.status.text=""
		}
		this._alpha=0;
	}
}
this.onPress=function(){
	if (_root.pw_on||_root.burning)
		return;
	if (this.mode=="area"){
		if (this.idSet!=undefined){
			_root.aarr[this.data.attributes.name]=undefined;
			this._parent[this.data.childNodes[this.idSet].attributes.image]._visible=false;
			_root.dragtool=_root.libfile.attachMovie(_root.activeArea.dragToolData.image,"dragTool",1);
			_root.dragtool._visible=false;
			_root.dragtool.data=this.dragToolData;
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
			_root.dragtool.onMouseMove=function(){
				if (_root.pw_on)
					return;
				this._visible=false;
				this.onMouseMove=undefined;
			}
			this.idSet=undefined;
		}
	}else if (this.mode=="jumper"){
		this._parent[this.data.attributes.image]._visible=!this._parent[this.data.attributes.image]._visible;
		_root.jarr[this.data.attributes.id].state=!_root.jarr[this.data.attributes.id].state;
	}else if (this.mode=="jumperset"){
		var len=this.data.childNodes.length;
		var i;
		var vis=this._parent[this.data.childNodes[this.jid].attributes.image]._visible;
		for (i=0;i<len;i++){
			this._parent[this.data.childNodes[i].attributes.image]._visible=false;
			_root.jarr[this.data.childNodes[i].attributes.id].state=false;
		}
		this._parent[this.data.childNodes[this.jid].attributes.image]._visible=!vis;
		_root.jarr[this.data.childNodes[this.jid].attributes.id].state=!vis;
	}else if (this.mode=="hint"){
		//
	}else{
		trace ("Unknown mode");
	}
}