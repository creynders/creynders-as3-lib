package be.creynders.framework.utils
{
	import com.adobe.crypto.MD5;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Camille Reynders
	 */
	public class UIDUtil 
	{
		
		private static const ALPHA_CHARS : String = "0123456789ABCDEF";

		/** 
		 *  This Dictionary records all generated uids for all existing items.
		 */
		private static var uidDictionary : Dictionary = new Dictionary( true );
		
		/**
		 *  Generates a UID (unique identifier) based on ActionScript's
		 *  pseudo-random number generator and the current time.
		 *
		 *  <p>The UID has the form
		 *  <code>"XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"</code>
		 *  where X is a hexadecimal digit (0-9, A-F).</p>
		 *
		 *  <p>This UID will not be truly globally unique; but it is the best
		 *  we can do without player support for UID generation.</p>
		 *
		 *  @return The newly-generated UID.
		 */
		public static function createUID():String
		{
			var uid:String = "";
			
			var i:int;
			var j:int;
			
			for ( i = 0 ; i < 8 ; i++ )
			{
				uid += ALPHA_CHARS.charAt( Math.round( Math.random() *  15 ) );
			}

			for (i = 0; i < 3; i++)
			{
				uid += "-";
				
				for (j = 0; j < 4; j++)
				{
					uid += ALPHA_CHARS.charAt( Math.round( Math.random() * 15 ) );
				}
			}
			
			uid += "-";

			var time : Number = new Date().getTime();
			// Note: time is the number of milliseconds since 1970,
			// which is currently more than one trillion.
			// We use the low 8 hex digits of this number in the UID.
			// Just in case the system clock has been reset to
			// Jan 1-4, 1970 (in which case this number could have only
			// 1-7 hex digits), we pad on the left with 7 zeros
			// before taking the low digits.
			uid += ( "0000000" + time.toString( 16 ).toUpperCase() ).substr( -8 );
			
			for ( i = 0 ; i < 4 ; i++ )
			{
				uid += ALPHA_CHARS.charAt( Math.round( Math.random() * 15 ) );
			}
			
			return uid;
		}
	
 	}//end class
	
}//end package