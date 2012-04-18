package be.creynders.lib.debug.logger {
	import be.creynders.lib.debug.logger.LogLevel;
	import be.creynders.lib.debug.logger.ILogger;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class LogCentre extends ALogger implements ILogCentre {

	//--------------------------------------------------------------------------
	// CLASS MEMBERS
	//--------------------------------------------------------------------------
	
		//--( CONSTS )--//
		
		static public const NAME : String = "LogCentre";
		
		
	//--------------------------------------------------------------------------
	// CONSTRUCTOR
	//--------------------------------------------------------------------------
	
		public function LogCentre() {
			
			init();
		}
		
	//--------------------------------------------------------------------------
	// INSTANCE MEMBERS
	//--------------------------------------------------------------------------
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		
		private var _loggers : Dictionary;
		private var _updateDelay : uint = 0;
		private var _length : int = 0;
		private var _buffer : Array;
		private var _timer : Timer;

		//--( ACCESSORS )--//
				
		/**
		 * 
		 */
		
		public function set updateDelay(value:uint):void{
			_updateDelay = value;
			resetTimer();
		}
		
		public function get updateDelay():uint{
			return _updateDelay;
		}
		
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			_loggers = new Dictionary( false );
			_buffer = [];
			_timer = new Timer( _updateDelay );
			_timer.addEventListener(TimerEvent.TIMER, handler::onTimerEvent );
			resetTimer();
		}
		
		private function resetTimer() : void {
			if( _timer.running ) _timer.stop();
			_timer.delay = _updateDelay;
			if ( _updateDelay > 0 ) _timer.start();
		}
		
		handler function onTimerEvent( event : TimerEvent ) : void {
			flushBuffer();
		}
		
		/* INTERFACE be.creynders.lib.debug.logger.ILogCentre */
		
		
		public function addLogger(logger:ILogger):int {
			if( _loggers[ logger ] == null ){
				_loggers[ logger ] = logger;
				_length++;
			}
			return _length;
		}
		
		public function removeLogger(logger:ILogger):int {
			if( _loggers[ logger ] ){
				delete _loggers[ logger ];
				_length--;
			}
			return _length;
		}
		
		public function hasLoggers():Boolean {
			return _length > 0;
		}
				
		override public function log(level:LogLevel, target:Object, params:Array):void{
			if ( _updateDelay <= 0 ) {
				dispatch( level, target, params );
			}else {
				_buffer.push( { level : level, target : target, params : params } );
			}

		}
		
		private function dispatch( level : LogLevel, target : Object, params : Array ) : void {
			for each( var logger : ILogger in _loggers ) {
				logger.log( level, target, params );
			}
		}
		
		private function flushBuffer() : void {
			var i : int;
			var n : int = _buffer.length;
			for( i = 0 ; i < n ; i++ ) {
				var message : Object = _buffer.shift();
				dispatch( message.level, message.target, message.params );
			}
		}
				
	}//end class 
	
}//end package