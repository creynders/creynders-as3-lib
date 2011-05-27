package be.creynders.framework.data {

	
	/**
	 * ...
	 * @author Camille Reynders, 2009 (c)
	 */
	public  class HTMLText {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "HTMLText";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function HTMLText( text : String = '' ) {
			this.text = text;
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		
		//--( PROPS )--//

		//--( ACCESSORS )--//
		/**
		 * text
		 */
		public function get text() : String { return _text }
		public function set text( value : String ) : void {
			_text = value;
		}
		private var _text : String;
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			
		}
		
		public function toString() : String {
			return this.text;
		}
		
	}//end class 
	
}//end package