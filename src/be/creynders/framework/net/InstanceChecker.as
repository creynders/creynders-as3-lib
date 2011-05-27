package be.creynders.framework.net {
	import be.creynders.framework.debug.logger.ILogger;
	import be.creynders.framework.utils.UIDUtil;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;
	import flash.net.SharedObject;
	import flash.utils.setTimeout;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public class InstanceChecker extends EventDispatcher{

	//--------------------------------------------------------------------------
	// CLASS MEMBERS
	//--------------------------------------------------------------------------
	
		//--( CONSTS )--//
		
		static public const NAME : String = "InstanceChecker";
		
		static public const PING_RECEIVED : String = 'be.creynders.framework.net::InstanceChecker/pingReceived';
		static public const RELEASE_RECEIVED : String = 'be.creynders.framework.net::InstanceChecker/releaseReceived';
		static public const INSTANCE_FOUND : String = 'be.creynders.framework.net::InstanceChecker/instanceFound';
		static public const IS_LISTENING : String = 'be.creynders.framework.net::InstanceChecker/isListening';
		
		
		static private const COOKIE_KEY_INSTANCE_UID : String = 'instanceUID';
		static private const METH_PING : String = 'onPingReceived';
		static private const METH_RELEASE : String = 'onReleaseReceived';
		
	//--------------------------------------------------------------------------
	// CONSTRUCTOR
	//--------------------------------------------------------------------------
	
		public function InstanceChecker( so : SharedObject, logger : ILogger = null ) {
			_cookie = so;
			_logger = logger;
			init();
		}
		
	//--------------------------------------------------------------------------
	// INSTANCE MEMBERS
	//--------------------------------------------------------------------------
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		
		
		private var _cookie : SharedObject;
		private var _logger : ILogger;
		private var _tunnel : LocalConnection;
		private var _client : Object;
		
		private var _uid : String;

		private var _isDominant : Boolean = false;
		
		//--( METHS )--//
		
		private function log( msg : * ) : void {
			if ( _logger ) _logger.system( this, msg.toString() );
		}
		
		private function init() : void{
			log( 'init' );
			_tunnel = new LocalConnection();
		}
		
		public function checkInstances() : void {
			checkCookie();
		}
		
		private function checkCookie() : void {
			log( 'checkCookie' );
			if ( _cookie.data && _cookie.data.hasOwnProperty( COOKIE_KEY_INSTANCE_UID ) ) {
				_uid = _cookie.data[ COOKIE_KEY_INSTANCE_UID ];
				ping( );
			}else {
				_uid = UIDUtil.createUID();
				_cookie.data[ COOKIE_KEY_INSTANCE_UID ] = _uid
				_cookie.flush();
				
				prepareListening();
			}
			
			log( _uid );
		}
		
		private function ping() : void {
			log( 'ping' );
			//_tunnel.connect( uid );
			_tunnel.addEventListener( StatusEvent.STATUS, onPingSent );
			_tunnel.send( _uid, METH_PING );
		}
		
		private function onPingSent( event : StatusEvent ) : void {
			log( 'onPingSent' );
			_tunnel.removeEventListener( StatusEvent.STATUS, onPingSent );
			if( event.level == 'error' ){
				//no previous instance found
				prepareListening();
			}else {
				//previous instance IS found
				this.dispatchEvent( new Event( INSTANCE_FOUND ) );
			}
		}
		
		private function prepareListening() : void {
			log( 'prepareListening' );
			_isDominant = true;
			
			_tunnel.client = this;
			_tunnel.connect( _uid );
			
			this.dispatchEvent( new Event( IS_LISTENING ) );
		}
		
		public function onPingReceived() : void {
			log( 'onPingReceived' );
			this.dispatchEvent( new Event( PING_RECEIVED ) );
		}
		
		public function onReleaseReceived() : void {
			log( 'onRelease' );
			//stop listening
			_tunnel.close();
			_isDominant = false;
			this.dispatchEvent( new Event( RELEASE_RECEIVED ) );
		}
		
		public function dominate() : void {
			if( ! _isDominant ){
				log( 'dominate' );
				_tunnel.addEventListener( StatusEvent.STATUS, onReleaseSent );
				_tunnel.send( _uid, METH_RELEASE );
			}
		}
		
		private function onReleaseSent( event : StatusEvent ) : void {
			log( 'onReleaseSent' );
			_tunnel.removeEventListener( StatusEvent.STATUS, onReleaseSent );
			
			_tunnel = new LocalConnection();
			
			//prepareListening();
			
			setTimeout( prepareListening, 500 );
		}
	}//end class 
	
}//end package