package be.creynders.framework.debug.logger {
	import flash.display.DisplayObject;
	import nl.demonsters.debugger.MonsterDebugger;
	

	
	/**
	 * ...
	 * @author Camille Reynders, 2009 (c)
	 */
	public class MonsterDebuggerLogger extends ALogger implements ILogger {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "MonsterDebuggerLogger";
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function MonsterDebuggerLogger() {
			trace( this, "constructor" );
			super();
			
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		
		/**
		 * debugColor
		 */
		public function get debugColor() : uint { return _debugColor }
		public function set debugColor( value : uint ) : void {
			_debugColor = value;
		}
		private var _debugColor : uint = 0x009ee0;
		
		/**
		 * infoColor
		 */
		public function get infoColor() : uint { return _infoColor }
		public function set infoColor( value : uint ) : void {
			_infoColor = value;
		}
		private var _infoColor : uint = 0x97bf0d;
		
		/**
		 * systemColor
		 */
		public function get systemColor() : uint { return _systemColor }
		public function set systemColor( value : uint ) : void {
			_systemColor = value;
		}
		private var _systemColor : uint = 0x00501f;
		
		/**
		 * warningColor
		 */
		public function get warningColor() : uint { return _warningColor }
		public function set warningColor( value : uint ) : void {
			_warningColor = value;
		}
		private var _warningColor : uint = 0xf9722e;
		
		/**
		 * errorColor
		 */
		public function get errorColor() : uint { return _errorColor }
		public function set errorColor( value : uint ) : void {
			_errorColor = value;
		}
		private var _errorColor : uint = 0x9d0d15;
		
		/**
		 * defaultColor
		 */
		public function get defaultColor() : uint { return _defaultColor }
		public function set defaultColor( value : uint ) : void {
			_defaultColor = value;
		}
		private var _defaultColor : uint = 0x000000;
		
		/**
		 * separator
		 */
		public function get separator() : String { return _separator }
		public function set separator( value : String ) : void {
			_separator = value;
		}
		private var _separator : String = '***';
				
		override public function set enabled(value:Boolean):void {
			super.enabled = value;
			MonsterDebugger.enabled = value;
		}
		
		//--( PROPS )--//

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( reflect() + ".init" );
			
		}
		
		override public function log( level : LogLevel, target : Object, object : * ) : void {
			var color : uint;
			switch( level ) {
				case LogLevel.DEBUG		: color = debugColor; 	break;
				case LogLevel.INFO		: color = infoColor; 	break;
				case LogLevel.SYSTEM	: color = systemColor; 	break;
				case LogLevel.WARNING	: color = warningColor;	break;
				case LogLevel.ERROR		: color = errorColor; 	break;
				default 				: color = defaultColor;
			}
			MonsterDebugger.trace( target, object, color );
		}

		
		public function clearTraces():void {
			MonsterDebugger.clearTraces();
		}
		
		public function inspect( target : Object ) : void {
			MonsterDebugger.inspect( target );
		}
		
		public function snapshot( target : DisplayObject, color : uint = 0x111111 ) : void {
			MonsterDebugger.snapshot( target, color );
		}
		
	}//end class 
	
}//end package