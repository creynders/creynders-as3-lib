package be.creynders.lib.net
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Camille Reynders
	 */
	public class SWFCommunicatorEvent extends Event 
	{
	////////////////////////////////////////////////////////////////////////////
	// 	CLASS MEMBERS
	
		//--( CONSTS )--//
		static public const NAME : String = "SWFCommunicatorEvent";
		
		/**
		 * CONN_READY
		 */
		static public const CONN_READY : String = "connReady";
	
		
	////////////////////////////////////////////////////////////////////////////
	// 	CONSTRUCTOR
			
		public function SWFCommunicatorEvent( type : String, data : Array = null, bubbles : Boolean = false, cancelable : Boolean = false ) 
		{ 
			//trace( reflect() + " constructor" );
			super( type, bubbles, cancelable );
			_data = data;
		} 
		
	////////////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS
		
		//--( PROPS )--//

		//--( AXORS )--//
		
		public function get data() : Array { return _data }
		private var _data : Array;
		
		//--( METHS )--//
		
		public override function clone() : Event 
		{ 
			return new SWFCommunicatorEvent( type, null, bubbles, cancelable );
		} 
		
		public override function toString() : String 
		{ 
			return formatToString( NAME, "type", "bubbles", "cancelable", "eventPhase", "data" ); 
		}
		
		public function reflect() : String {
			return "[object " + NAME+ "]";
		}
		
	
	}
	
}