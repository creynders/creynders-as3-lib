package be.creynders.framework.data {
	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public class ProgressData {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "ProgressData";
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function ProgressData( bytesLoaded : Number = -1, bytesTotal : Number = 0 ) {
			_bytesLoaded = bytesLoaded;
			_bytesTotal = bytesTotal;
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		public function get bytesLoaded() : Number { return _bytesLoaded }
		public function set bytesLoaded( value : Number ) : void {
			_bytesLoaded = value;
		}
		private var _bytesLoaded : Number;
		
		public function get bytesTotal() : Number { return _bytesTotal }
		public function set bytesTotal( value : Number ) : void {
			_bytesTotal = value;
		}
		private var _bytesTotal : Number;
		
	}//end class 
	
}//end package