package be.creynders.lib.net 
{
	import be.creynders.lib.utils.StringUtil;
	import be.creynders.lib.utils.XMLUtil;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.LocalConnection;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * @usage
	 * <code>	
	 * test1 function load() : void {
			var cl : ConfigLoader = new ConfigLoader( 'testConfigLoaderConfig.xml' );
			cl.addEventListener( Event.COMPLETE, test1::completeHandler );
		}
		
		test1 function completeHandler( event : Event ) : void {
			var cl : ConfigLoader = ( event.target as ConfigLoader );
			trace( ObjectUtil.toString( cl.data ) );
		}
		</code>
	 * @author Camille Reynders
	 * @version 1.1 added cache breaking
	 * @version 1.0 main functionality
	 */
		
	 
	public class ConfigLoader extends EventDispatcher
	{
		
		static public const DOMAIN : String = '%domain%';
		
	///////////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR
	
		public function ConfigLoader( configURL : String = 'config.xml', autoLoad : Boolean = true, disableCache : Boolean = true, cacheBuster : String = null ) 
		{
			this.configURL = configURL;
			this.disableCache = disableCache;
			this.cacheBuster = cacheBuster;
			if ( autoLoad ) load();
		}
		
	///////////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS
		
		//--( PROPS          )-------//
		
		/**
		 * configURL
		 */
		public var configURL : String;
		
		private var loader : URLLoader;
		private var disableCache : Boolean = true;
		private var cacheBuster : String;
		
		private var parseXML : Boolean;

		//--( ACCESSORS      )-------//
		
		/**
		 * data
		 */
		public function get data() : * { return _data };
		private var _data : * ;
		
		
		//--( METHS          )-------//
		
		/**
		 * load
		 */
		public function load( parseXML : Boolean = true ) : void {
			
			this.parseXML = parseXML;
			
			loader = new URLLoader();
			
			loader.addEventListener( Event.OPEN, loaderNS::passEvent );
			loader.addEventListener(IOErrorEvent.IO_ERROR, loaderNS::passEvent );
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loaderNS::passEvent );
			
			loader.addEventListener( Event.COMPLETE, loaderNS::complete );
			var fullURL : String = configURL;
			
			if ( disableCache ) {
				fullURL += "?nocache="
				if ( cacheBuster != null ) fullURL += cacheBuster;
				else fullURL += new Date().getTime().toString();
			}
			loader.load( new URLRequest( fullURL ) );
		}
		
		private namespace loaderNS;
		loaderNS function complete( event : Event ) : void {
			var xml : XML = new XML( loader.data );
			_data = ( parseXML ) ? XMLUtil.toTypedObjects( xml ) : xml;
			loaderNS::passEvent( event );
		}
		
		loaderNS function passEvent( event : Event ) : void {
			dispatchEvent( event.clone() );
		}
	}
	
}