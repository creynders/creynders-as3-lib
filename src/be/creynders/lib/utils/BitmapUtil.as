package be.creynders.lib.utils {
	import flash.display.Bitmap;
	
	/**
	 * Static Class
	 * @author Camille Reynders, Camille Reynders, 2010(c)
	 */
	public class BitmapUtil {
	////////////////////////////////////////////////////////////////////////////
	// 	CLASS MEMBERS
	
		//--( CONSTS )--//
		
		static public const NAME : String = "BitmapUtil";
		
		//--( PROPS )--//

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		static public function clone( bmp : Bitmap ) : Bitmap {
			return new Bitmap( bmp.bitmapData.clone() );
		}
		
	////////////////////////////////////////////////////////////////////////////
	// 	CONSTRUCTOR
	
		public function BitmapUtil() {
			throw new Error( "*** ERROR *** " + NAME + ": instantiation not allowed!" );
		}
		
		
	}//end class 
	
}//end package