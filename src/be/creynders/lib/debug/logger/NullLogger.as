package be.creynders.lib.debug.logger {
	import be.creynders.lib.debug.logger.LogLevel;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class NullLogger extends ALogger implements ILogger {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "NullLogger";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function NullLogger() {
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
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			
		}
		
		override public function log(level:LogLevel, target:Object, params:Array):void {
			//super.log(level, target, object);
		}
		
	}//end class 
	
}//end package