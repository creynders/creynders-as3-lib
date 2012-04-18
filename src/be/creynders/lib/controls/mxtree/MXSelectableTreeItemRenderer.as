package be.creynders.lib.controls.mxtree
{
	import flash.events.MouseEvent;
	
	import mx.collections.ICollectionView;
	import mx.collections.IViewCursor;
	import mx.controls.CheckBox;
	import mx.controls.Image;
	import mx.controls.Tree;
	import mx.controls.treeClasses.ITreeDataDescriptor;
	import mx.controls.treeClasses.TreeItemRenderer;
	import mx.controls.treeClasses.TreeListData;

	public class MXSelectableTreeItemRenderer extends TreeItemRenderer
	{
        
		static public var STATE_SCHRODINGER:String = "schrodinger";
		static public var STATE_CHECKED:String = "checked";
		static public var STATE_UNCHECKED:String = "unchecked";
		
		public function MXSelectableTreeItemRenderer(){
			super();
			mouseEnabled = false;
		}
		
		[Bindable]
		public var schrodingerImageClass :Class;
		
		protected var _checkBox : CheckBox;
		protected var _schrodingerIcon : Image;
       	private var imageWidth:Number 	= 6;
	    private var imageHeight:Number 	= 6;
 		
		/*
        private var inner:String 	= "assets/graphics/inner.png";
        */
        
		override protected function createChildren():void
		{
		   super.createChildren();
		   _checkBox = new CheckBox();
		   _checkBox.addEventListener( MouseEvent.CLICK, onToggleCheckBoxHandler );
		   _checkBox.height = 12;
		   addChild(_checkBox);
		   _schrodingerIcon = new Image();
		   _schrodingerIcon.source = new schrodingerImageClass();
		   _schrodingerIcon.addEventListener( MouseEvent.CLICK, onToggleImageHandler );
		   addChild(_schrodingerIcon);
		} 
		
		protected function onToggleCheckBoxHandler( event : MouseEvent ) :void {
		   if (data)
		   {
		      var listData : TreeListData = this.listData as TreeListData;
		      var selectedNode : Object = listData.item;
		      var tree : Tree = listData.owner as Tree;
		      var toggle : Boolean = _checkBox.selected;
		      toggleChildren( data, tree, (toggle) ? STATE_CHECKED : STATE_UNCHECKED );
		      var parent : Object = tree.getParentItem (data);
		      toggleParents (parent, tree, getState (tree, parent));
		    }
			
		}
		
		protected function onToggleImageHandler( event : MouseEvent ) :void {
		   _checkBox.selected = ! _checkBox.selected;
		   onToggleCheckBoxHandler( event );
		}
		
		private function getState(tree:Tree, parent:Object) : String
		{
		   var noChecks:int = 0;
		   var noCats:int = 0;
		   var noUnChecks:int = 0;
		   if (parent != null){
		      var treeData:ITreeDataDescriptor = tree.dataDescriptor;
		      var cursor:IViewCursor = treeData.getChildren(parent).createCursor();
		      while (!cursor.afterLast){
		         if (cursor.current.@state == STATE_CHECKED){
		            noChecks++;
		         } else if (cursor.current.@state == STATE_UNCHECKED){
		            noUnChecks++
		         } else {
		            noCats++;
		         }
		         cursor.moveNext();
		      }
		   }
		   
			if ((noChecks > 0 && noUnChecks > 0) || (noCats > 0 && noChecks>0)) {
		         return STATE_SCHRODINGER;
		   } else if (noChecks > 0){
		         return STATE_CHECKED;
		   } else{
		         return STATE_UNCHECKED;
		   }
		}		
		
		private function toggleParents (item:Object, tree:Tree, state:String):void
		{
		   if (item == null){
		      return;
		   } else {
		      item.@state = state;
		      toggleParents(tree.getParentItem(item), tree, getState (tree, tree.getParentItem(item)));
		   }
		}
		
		private function toggleChildren (item:Object, tree:Tree, state:String):void {
		   if (item == null){
		      return;
		   } else {
		      item.@state = state;
		      var treeData:ITreeDataDescriptor = tree.dataDescriptor;
		      if (treeData.hasChildren(item))
		      {
		         var children:ICollectionView = treeData.getChildren (item);
		         var cursor:IViewCursor = children.createCursor();
		         while (!cursor.afterLast)
		         {
		            toggleChildren(cursor.current, tree, state);
		            cursor.moveNext();
		         }
		      }
		   }
		}
		
		
		private function setCheckState (state:String):void
		{
			_checkBox.selected = (state == STATE_CHECKED); 
			/*
		   if (state == STATE_CHECKED) {
		      _checkBox.selected = true;
		   }else if (state == STATE_UNCHECKED) {
		      _checkBox.selected = false;
		   }else if (state == STATE_SCHRODINGER){
		      _checkBox.selected = false;
		   }
		   */
		}       
		
		override public function set data(value:Object):void
		{
		   super.data = value;
		   
		   var tree:Tree = Tree(this.parent.parent);
		   
		   var state : String = ( value && '@state' in value ) ? value.@state : STATE_UNCHECKED;
	   		setCheckState ( state );
			/*
		   if((super.listData as TreeListData).item.@isBranch == 'true')
		   {
		      tree.setStyle("defaultLeafIcon", null);
		   }
		   */
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
		   super.updateDisplayList(unscaledWidth, unscaledHeight);
		   if(super.data){
		      if (super.icon != null){
		         _checkBox.x = super.icon.x;
		         _checkBox.y = 2;
		         super.icon.x = _checkBox.x + _checkBox.width + 17;
		         super.label.x = super.icon.x + super.icon.width + 3;
		      } else {
		         _checkBox.x = super.label.x;
		         _checkBox.y = 2;
		         super.label.x = _checkBox.x + _checkBox.width + 17;
		      }
		      if (data.@state == STATE_SCHRODINGER){
		         _schrodingerIcon.x = _checkBox.x + 4;
		         _schrodingerIcon.y = _checkBox.y + 4;
		         _schrodingerIcon.width = imageWidth;
		         _schrodingerIcon.height = imageHeight;
		      }else{
		         _schrodingerIcon.x = 0;
		         _schrodingerIcon.y = 0;
		         _schrodingerIcon.width = 0;
		         _schrodingerIcon.height = 0;
		      }
		   }
		} 				
	}//end class
}//end package