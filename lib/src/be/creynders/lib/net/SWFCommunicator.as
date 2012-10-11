package be.creynders.lib.net
{
	import be.creynders.lib.utils.UIDUtil;
	import com.adobe.crypto.MD5;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;
	import flash.net.SharedObject;

	
	/**
	 * ...
	 * @author Camille Reynders
	 */
	
	 
	/**
	 * Dispatched when ...
	 *
	 * @eventType be.creynders.lib.net::SWFCommunicator.CONN_READY
	 */
	[Event( name="connReady", type="be.creynders.lib.net.SWFCommunicatorEvent.CONN_READY" )]	 
	public class SWFCommunicator implements IEventDispatcher
	{
	////////////////////////////////////////////////////////////////////////////
	// 	CLASS MEMBERS
	
		//--( CONSTS )--//
		
		/**
		 * NAME
		 */
		static public const NAME : String = "SWFCommunicator";
		
		static private const METH_PING : String = "ping";
		static private const METH_EVENT : String = "event";

		
	////////////////////////////////////////////////////////////////////////////
	// 	CONSTRUCTOR
	
		/**
		 * 
		 * @param	cookieName
		 * @param	senderName
		 * @param	receiverName
		 */
		public function SWFCommunicator( cookieName : String, senderName : String, receiverName : String ) 
		{
			_cookieName = cookieName;
			_senderName = senderName;
			_receiverName = receiverName;
			
			//trace( reflect() + " constructor" );
		
			init();
		}
		
	////////////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS
		
		//--( NAMESPACES )--//
		
		private namespace senderNS;
		
		//--( PROPS )--//
		
		private var _cookieName : String;
		private var _senderName : String;
		private var _receiverName : String;
		
		private var _pageUID : String;
		private var _sConnName : String;
		private var _rConnName : String;
		private var _dispatcher : EventDispatcher;
		private var _sender : LocalConnection;
		private var _receiver : LocalConnection;
		private var _client : Object;
		
		//--( AXORS )--//
		
		//--( METHS )--//
		
		/**
		 * 
		 * @return
		 */
		public function reflect() : String {
			return "[object " + NAME+ "]";
		}
		
		/**
		 * 
		 * @param	event
		 * @return
		 */
		public function dispatchEvent( event : Event ) : Boolean {
			return _dispatcher.dispatchEvent( event );
		}
		
		/**
		 * 
		 * @param	type
		 * @param	listener
		 * @param	useCapture
		 * @param	priority
		 * @param	useWeakReference
		 */
		public function addEventListener( type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false ) : void {
			_dispatcher.addEventListener( type, listener, useCapture, priority, useWeakReference );
		}
		
		/**
		 * 
		 * @param	type
		 * @param	listener
		 * @param	useCapture
		 */
		public function removeEventListener( type : String, listener : Function, useCapture : Boolean = false ) : void {
			_dispatcher.removeEventListener( type, listener, useCapture );
		}
		
		/**
		 * 
		 * @param	type
		 * @return
		 */
		public function hasEventListener( type : String ) : Boolean {
			return _dispatcher.hasEventListener( type );
		}
		
		/**
		 * 
		 * @param	type
		 * @return
		 */
		public function willTrigger( type : String ) : Boolean {
			return _dispatcher.willTrigger( type );
		}
		
		private function init() : void{
			//trace( reflect() + ".init" );
			
			_dispatcher = new EventDispatcher();
			
			//see if there's unique ID for this page in the cookie
			var so : SharedObject = SharedObject.getLocal( _cookieName, "/" );
			if( so.data.pageUID != null && so.data.pageUID != "" ){
				//retrieve page UID from sharedobject
				_pageUID = so.data.pageUID;
			}else {
				//create pageUID
				_pageUID = UIDUtil.createUID();
				so.data.pageUID = _pageUID;
				so.flush();
			}
			
			//construct connection names
			_sConnName = _pageUID + "_" + _senderName + "_" + _receiverName;
			_rConnName = _pageUID + "_" + _receiverName + "_" + _senderName;

			//create connectors
			_sender = new LocalConnection();
			_receiver = new LocalConnection();
			
			//attach responders to receiving connector
			_client = new Object();
			_client[ METH_EVENT ] = function ( eventName : String, ...args ) : void {
				_dispatcher.dispatchEvent( new SWFCommunicatorEvent( eventName, args ) );
			};
			_client[ METH_PING ] = function() : void {
				_dispatcher.dispatchEvent( new SWFCommunicatorEvent( SWFCommunicatorEvent.CONN_READY ) );
			};
			_receiver.client = _client;
			
			//connect the receiver
			_receiver.connect( _rConnName );
			
			//test the connection/presence of the receiver
			sendPing();
			
		}
		
		//checks to see whether there's a receiver
		private function sendPing() : void {
			//listening to this event is a must, otherwise an unhandled status error occurs, when there's no receiver
			_sender.addEventListener( StatusEvent.STATUS, senderNS::statusHandler );
			_sender.send( _sConnName, METH_PING );
		}
		
		senderNS function statusHandler ( event : StatusEvent ) : void {
			//silent fail
			//trace( "ping: connection not yet established" );
		}
		
		/**
		 * Sends an event through the localconnection to the receiver
		 * @param	eventName (string) The name of the event to be sent
		 * @param	...args
		 */
		public function sendEvent( eventName : String, ...args ) : void{
			_sender.send.apply( _sender, [ _sConnName, METH_EVENT, eventName ].concat( args ) );
		}
		
		/**
		 * Clears the cookie
		 */
		public function expireCookie() : void{
			var so : SharedObject = SharedObject.getLocal( _cookieName, "/" );
			so.clear();
		}
		
		
	}//end class 
	
}//end package