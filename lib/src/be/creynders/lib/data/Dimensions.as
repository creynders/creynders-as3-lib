package be.creynders.lib.data {
	
	/**
	 * ...
	 * @author Camille Reynders, 2009 (c)
	 */
	public class Dimensions {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "Dimensions";
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function Dimensions( w : Number = 0, h : Number = 0) {
			width = w;
			height = h;
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
	
		//--( ACCESSORS )--//
		
		/**
		 * width
		 */
		public function get width() : Number { return _width }
		public function set width( value : Number ) : void {
			_width = value;
		}
		private var _width : Number = 0;
		
		/**
		 * height
		 */
		public function get height() : Number { return _height }
		public function set height( value : Number ) : void {
			_height = value;
		}
		private var _height : Number = 0;
		
		//--( METHS )--//
		
		public function clone() : Dimensions {
			return new Dimensions( this.width, this.height );
		}
		
		public function add( w : Number, h : Number ) : Dimensions {
			var result : Dimensions = this.clone();
			result.width += w;
			result.height += h;
			return result;
		}
		
		public function toString() : String {
			return 'width: ' + _width + ", " + 'height: ' + height;
		}
		
	}//end class 
	
}//end package