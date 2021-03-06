﻿package be.creynders.lib.vendor.monsterdebugger {
	import be.creynders.lib.debug.logger.ALogger;
	import be.creynders.lib.debug.logger.ILogger;
	import be.creynders.lib.debug.logger.LogLevel;
	
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.DisplayObject;
	

	
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
	
		public function MonsterDebuggerLogger( context : Object, address : String = "127.0.0.1" ) {
			super();
			MonsterDebugger.initialize( context, address );
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
		
		override public function log( level : LogLevel, target : Object, params : Array ) : void {
			var color : uint;
			switch( level ) {
				case LogLevel.DEBUG		: color = debugColor; 	break;
				case LogLevel.INFO		: color = infoColor; 	break;
				case LogLevel.SYSTEM	: color = systemColor; 	break;
				case LogLevel.WARNING	: color = warningColor;	break;
				case LogLevel.ERROR		: color = errorColor; 	break;
				default 				: color = defaultColor;
			}
			MonsterDebugger.trace( target, params.join( ' ' ), '', '', color );
		}

		
		public function clearTraces():void {
			MonsterDebugger.clear();
		}
		
		public function inspect( target : Object ) : void {
			MonsterDebugger.inspect( target );
		}
		
		public function snapshot( caller : *, object: * ) : void {
			MonsterDebugger.snapshot( caller, object );
		}
		
	}//end class 
	
}//end package