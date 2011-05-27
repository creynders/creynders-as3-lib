package be.creynders.framework.debug.logger {
	import be.creynders.framework.debug.logger.LogLevel;
	import flash.text.TextField;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class TextFieldLogger extends ALogger implements ILogger {

	//--------------------------------------------------------------------------
	// CLASS MEMBERS
	//--------------------------------------------------------------------------
	
		//--( CONSTS )--//
		
		static public const NAME : String = "TextFieldLogger";
		
		
	//--------------------------------------------------------------------------
	// CONSTRUCTOR
	//--------------------------------------------------------------------------
	
		public function TextFieldLogger( field : TextField ) {
			_field = field;
			
			super();
			
			init();
		}
		
	//--------------------------------------------------------------------------
	// INSTANCE MEMBERS
	//--------------------------------------------------------------------------
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		
		private var _field : TextField;

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
			_field.text = '';
		}
		
		override public function log(level:LogLevel, target:Object, object:*):void {
			trace( this, 'log' );
			//super.log(level, target, object);
			if( enabled ){
				_field.appendText( separator + '' +
						level.name.toUpperCase() + '' +
						separator + ' ' +
						target + ' ' +
						object +
						'\n'
				);
			}
		}
		
	}//end class 
	
}//end package