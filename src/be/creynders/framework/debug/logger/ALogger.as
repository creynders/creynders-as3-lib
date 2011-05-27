package be.creynders.framework.debug.logger {
	import be.creynders.framework.debug.logger.ILogger;
	import flash.errors.IllegalOperationError;
	

	
	/**
	 * ...
	 * @author Camille Reynders, 2009 (c)
	 */
	public class ALogger implements ILogger {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "ALogger";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function ALogger() {
			//trace( reflect() + " constructor" );
			
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		
		//--( PROPS )--//

		//--( ACCESSORS )--//
		public function get enabled() : Boolean { return _enabled }
		public function set enabled( value : Boolean ) : void {
			_enabled = value;
		}
		private var _enabled : Boolean = true;
		
		public function get levelTreshold() : uint { return _levelTreshold }
		public function set levelTreshold( value : uint ) : void {
			this.system( this, 'levelTreshold changed: ' + value );
			_levelTreshold = value;
		}
		private var _levelTreshold : uint = LogLevel.DEBUG.ordinal;
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( reflect() + ".init" );
			
		}
		
		/* INTERFACE be.creynders.debug.logger.ILogger */
		
		public function debug(target:Object, object:*):void {
			if( LogLevel.DEBUG.ordinal <= _levelTreshold ) log( LogLevel.DEBUG, target, object );
		}
		
		public function info(target:Object, object:*):void {
			if( LogLevel.INFO.ordinal <= _levelTreshold ) log( LogLevel.INFO, target, object );
		}
		
		public function system(target:Object, object:*):void{
			if( LogLevel.SYSTEM.ordinal <= _levelTreshold ) log( LogLevel.SYSTEM, target, object );
		}
		
		public function warning(target:Object, object:*):void{
			if( LogLevel.WARNING.ordinal <= _levelTreshold ) log( LogLevel.WARNING, target, object );
		}
		
		public function error(target:Object, object:*):void{
			if( LogLevel.ERROR.ordinal <= _levelTreshold ) log( LogLevel.ERROR, target, object );
		}
		
		public function log(level : LogLevel, target:Object, object:*):void{
			throw new IllegalOperationError( 'Abstract method must be overridden: log'  );
		}
		
	}//end class 
	
}//end package