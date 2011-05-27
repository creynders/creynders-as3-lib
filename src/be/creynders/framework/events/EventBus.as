package be.creynders.framework.events {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Camille Reynders, Camille Reynders, 2010(c)
	 */
	public class EventBus implements IEventDispatcher {
	////////////////////////////////////////////////////////////////////////////
	// 	CLASS MEMBERS
	
		//--( CONSTS )--//
		
		static public const NAME : String = "EventBus";
		
		
	////////////////////////////////////////////////////////////////////////////
	// 	CONSTRUCTOR
	
		public function EventBus() {
			//trace( reflect() + " constructor" );
			init();
		}
		
	////////////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS
		
		//--( NAMESPACES )--//
		
		//--( PROPS )--//
		private var _dispatcher : EventDispatcher;
		private var _listeners : Dictionary;

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		public function addEventListener( type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false ) : void {
			_dispatcher.addEventListener( type, listener, useCapture, priority, useWeakReference );
			_listeners[ listener ] = new ListenerData( type, useCapture );
		}
				
		public function dispatchEvent( event : Event ) : Boolean {
			return _dispatcher.dispatchEvent( event );
		}
				
		public function hasEventListener( type : String ) : Boolean {
			return _dispatcher.hasEventListener( type );
		}
				
		public function removeEventListener( type : String, listener : Function, useCapture : Boolean = false ) : void {
			_listeners[ listener ] = null;
			delete _listeners[ listener ];
			_dispatcher.removeEventListener( type, listener, useCapture );
		}
				
		public function willTrigger ( type : String ) : Boolean {
			return _dispatcher.willTrigger( type );
		}
		
		public function removeAllEventListeners() : void {
			for ( var listener : * in  _listeners ) {
				var data : ListenerData = _listeners[ listener ] as ListenerData;
				removeEventListener( data.type, listener, data.useCapture );
				delete _listeners[ listener ];
			}
		}
		
		public function reflect() : String {
			return "[object " + NAME + "]";
		}
		
		private function init() : void{
			//trace( reflect() + ".init" );
			_dispatcher = new EventDispatcher( this );
			_listeners = new Dictionary( true );
		}
		
	}//end class 
	
}//end package

internal class ListenerData {
	
	public function ListenerData ( type : String, useCapture : Boolean = false ) {
		this.type = type;	
		this.useCapture = useCapture;
	}
	
	/**
	 * type
	 */
	public function get type() : String { return _type }
	public function set type( value : String ) : void {
		_type = value;
	}
	private var _type : String;
	
	/**
	 * useCapture
	 */
	public function get useCapture() : Boolean { return _useCapture }
	public function set useCapture( value : Boolean ) : void {
		_useCapture = value;
	}
	private var _useCapture : Boolean;
}