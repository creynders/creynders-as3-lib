package be.creynders.lib.data {
	import be.creynders.lib.utils.XMLUtil;
	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class ConfigFile {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "ConfigFile";
		
		static public const PROFILE_PRODUCTION : String = 'production';
		static public const PROFILE_DEVELOPMENT : String = 'development';
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function ConfigFile( configXML : XML ) {
			_configXML = configXML;
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		
		private var _configXML : XML;

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
		}
		
		private function parse( xml : XML ) : void {
			
		}
		
		public function getSettings( profileName : String ) : Object {
			var xml : XML = _configXML.Object.( @type=='profile' ).( @name == profileName )[ 0 ];
			var settings : Object = XMLUtil.toTypedObjects( xml );
			if ( xml.@parent != undefined ) {
				var obj : Object = getSettings( xml.@parent.toString() );
				for ( var prop : String in obj ) {
					if ( ! settings.hasOwnProperty( prop ) ) {
						settings[ prop ] = obj[ prop ];
					}
				}
			}
			return settings;
		}
		
	}//end class 
	
}//end package