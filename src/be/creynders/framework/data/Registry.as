package be.creynders.framework.data {
	import flash.utils.Dictionary;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class Registry {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "Registry";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function Registry( isStrict : Boolean = false ) {
			_isStrict = isStrict;
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		
		private var _isStrict : Boolean;
		private var _reg  :Dictionary;
		private var _length : uint;

		//--( ACCESSORS )--//
		
		public function get length() : uint { return _length; }
		public function get storage() : Dictionary { return _reg }
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			_reg = new Dictionary( true );
		}
		
		public function parseObject( settings : Object ) : void {
			for ( var prop : String in settings ) {
				_reg[ prop ] = settings[ prop ];
			}
		}
		
		public function add( key : * , value : * ) : uint {
			_reg[ key ] = value;
			return ++_length;
		}
		
		public function remove( key : * ) : uint {
			delete _reg[ key ];
			return --_length;
		}
		
		public function getValue( key : *, suppressErrors : Boolean = false ) : * {
			if( ! suppressErrors && _isStrict && ( _reg[ key ] == undefined ) ) throw new Error( 'registry does not have key "' + key + '"' );
			
			return _reg[ key ];
		}
		
		public function hasKey( key : * ) : Boolean {
			return ( _reg[ key ] != undefined );
		}
		public function dispose() : void {
			_reg = null;
		}
		
	}//end class 
	
}//end package