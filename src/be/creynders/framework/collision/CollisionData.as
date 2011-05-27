






package be.creynders.framework.collision {
	import flash.display.DisplayObject;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class CollisionData {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "CollisionData";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function CollisionData( object1 : DisplayObject, object2 : DisplayObject, angle : Number, overlapping : Array ) {
			_object1 = object1;
			_object2 = object2;
			_angle = angle;
			_overlapping = overlapping;
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			
		}
		
		public function get object1() : DisplayObject { return _object1 }
		private var _object1 : DisplayObject;
		
		public function get object2() : DisplayObject { return _object2 }
		private var _object2 : DisplayObject;
		
		public function get angle() : Number { return _angle }
		private var _angle : Number = -1;
		
		public function get overlapping() : Array { return _overlapping }
		private var _overlapping : Array;
	}//end class 
	
}//end package