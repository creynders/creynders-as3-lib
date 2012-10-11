/**
 * 
 * 
 * @usage
 * <code>
 * var pwd : String = PasswordUtil.generatePassword( 8, false ) 
 * var pwd : String = PasswordUtil.generatePassword( 5, true, PasswordUtil.UPPER_CASE + PasswordUtil.NUMERIC );
 * var pwd : String = PasswordUtil.generatePassword( 20, false, PasswordUtil.LOWER_CASE, [ "@", "&" ] );
 * </code>
 */

package be.creynders.lib.utils
{
	public class PasswordUtil
	{
		static public const UPPER_CASE : int = 1;
		static public const LOWER_CASE : int = 2;
		static public const NUMERIC : int = 4;
		static public const EXTRAS : int = 8;
		static public const ALPHA_UPPER : int = UPPER_CASE + NUMERIC;
		static public const ALPHA_LOWER : int = LOWER_CASE + NUMERIC;
		static public const ALPHA_NUMERIC : int = UPPER_CASE + LOWER_CASE + NUMERIC;
		static public const ALL : int = ALPHA_NUMERIC + EXTRAS;
		
		static private const UPPER_CASE_SET : Array = [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" ];
		static private const LOWER_CASE_SET : Array = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ];
		static private const NUMERIC_SET : Array = [ "1", "2", "3", "4", "5", "6", "7", "8", "9" ];
		static private const EXTRAS_SET : Array = [ ",", "?", ".", ";", "/", ":", "+", "=", "!", "-", "(", ")", "&", "@", "#", "�", "-", "_", "<", ">", "\\", "\"", "{", "}" ];
		
		static public function generatePassword( length : int = 8, onlyUniques : Boolean = false, sets : int = ALPHA_NUMERIC, addChars : Array = null ) : String{
			var chars : Array = new Array();
			
			//bitwise AND !!
			if( sets & UPPER_CASE ) chars = chars.concat( UPPER_CASE_SET );
			
			//bitwise AND !!
			if( sets & LOWER_CASE ) chars = chars.concat( LOWER_CASE_SET );
			
			//bitwise AND !!
			if( sets & NUMERIC ) chars = chars.concat( NUMERIC_SET );
			
			if( addChars ) chars = chars.concat( addChars );
			
			var output : String = ""; 
			for( var i : int = 0 ; i < length ; i++ ){
				var char : String;
				if( onlyUniques ){
					char = chars.splice( Math.floor( Math.random() * chars.length ), 1 )[ 0 ]
				}else{
					char = chars[ Math.floor( Math.random() * chars.length ) ]
				}
				output += char;
			}
			return output;
		} 
	}
}