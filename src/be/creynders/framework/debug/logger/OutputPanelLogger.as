package be.creynders.framework.debug.logger {
	import be.creynders.framework.debug.logger.ILogger;
	import be.creynders.framework.debug.logger.ALogger;
	

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class OutputPanelLogger extends ALogger implements ILogger {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "OutputPanelLogger";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function OutputPanelLogger() {
			super();
			
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//

		//--( ACCESSORS )--//
		
		/**
		 * separator
		 */
		public function get separator() : String { return _separator }
		public function set separator( value : String ) : void {
			_separator = value;
		}
		private var _separator : String = '##';
		
		
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			
		}
		
		override public function log(level:LogLevel, target:Object, object:*):void{
			//trace( level, target, object );
			if( enabled ){
				trace( 	
						separator,
						level.name.toUpperCase(),
						separator,
						target,
						object
				);
			}
		}
		
	}//end class 
	
}//end package