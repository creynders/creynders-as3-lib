package be.creynders.lib.debug {

	import be.creynders.lib.debug.ns_debug
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Camille Reynders, 2009 (c)
	 */
	public  class Chrono extends EventDispatcher{

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "Chrono";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function Chrono( autostart : Boolean = true ) {
			if ( autostart ) click();
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		
		//--( PROPS )--//
		
		private var running : Boolean = false;

		//--( ACCESSORS )--//
		
		/**
		 * t1
		 */
		ns_debug function get t1() : int { return _t1; }
		private var _t1 : int = -1;
		
		/**
		 * t2
		 */
		ns_debug function get t2() : int { return _t2; }
		private var _t2 : int = -1;
		
		/**
		 * elapsed
		 */
		public function get elapsed() : int { 
			if ( running ) click();
			else if ( _t1 == -1 ) return -1;
			
			return _elapsed; 
		}
		private var _elapsed : int;
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			
		}
		
		public function click() : void {
			if ( _t1 == -1 ) {
				_t1 = getTimer();
				running = true;
			}else if ( _t2 == -1 ) {
				_t2 = getTimer();
				_elapsed = _t2 - _t1;
				dispatchEvent( new Event( Event.COMPLETE ) );
			}
		}
		
	}//end class 
	
}//end package