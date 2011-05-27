package be.creynders.framework.data {
	
	/**
	 * Static Class
	 * @author Camille Reynders, Camille Reynders, 2010(c)
	 */
	public class TextFieldRestrictCharacterSets {
		
	//--------------------------------------------------------------------------
	// 	CLASS MEMBERS
	//--------------------------------------------------------------------------
	
		//--( CONSTS )--//
		
		static public const NAME : String = "TextFieldRestrictCharacterSets";
		
		static public const NUMERIC : String = '0-9';
		static public const UPPERCASE : String = 'A-Z';
		static public const LOWERCASE : String = 'a-z';
		static public const ALPHANUMERIC : String = combineSets( [ NUMERIC, UPPERCASE, LOWERCASE ] );
		
		static public function combineSets( sets : Array ) : String {
			return sets.join( ' ' );
		}
		
	//--------------------------------------------------------------------------
	// 	CONSTRUCTOR
	//--------------------------------------------------------------------------
	
		public function TextFieldRestrictCharacterSets() {
			throw new Error( "*** ERROR *** " + NAME + ": instantiation not allowed!" );
		}
		
		
	}//end class 
	
}//end package