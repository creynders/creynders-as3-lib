package be.creynders.lib.vendor.as3console
{
	import be.creynders.lib.debug.logger.ALogger;
	import be.creynders.lib.debug.logger.ILogger;
	import be.creynders.lib.debug.logger.LogLevel;
	import be.creynders.lib.utils.StringUtil;
	
	import br.dcoder.console.Console;
	
	import flash.display.Stage;
	
	public class AS3ConsoleLogger extends ALogger implements ILogger
	{
		public function AS3ConsoleLogger( stage : Stage )
		{
			_stage = stage;
			super();
			init();
		}
		/**
		 * separator
		 */
		public function get separator() : String { return _separator }
		public function set separator( value : String ) : void {
			_separator = value;
		}
		private var _separator : String = '##';
		
		private var _console : Console;
		private var _stage : Stage;
		
		public function init():void{
			_console = Console.create( _stage ); //meh!
		}
		
		override public function log(level:LogLevel, target:Object, params:Array):void
		{
			if( enabled ){
				var message : String =	
					separator
					+ StringUtil.addTrailing( ' ', level.name.toUpperCase(), 7 )
					+ separator
					+ target
					+ params.join( ' ' )
				;
				_console.println( message );
			}
			
		}
		
		public function show():void{
			_console.show();
		}
		
		public function hide():void{
			_console.hide();
		}
		
		public function maximize() : void{
			_console.maximize();
		}
		
		public function minimize():void{
			_console.minimize();
		}
		
	}
}