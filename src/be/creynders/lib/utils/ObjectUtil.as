package be.creynders.lib.utils {
	import flash.utils.describeType;
	
	/**
	 * Static Class
	 * @author Camille Reynders, Camille Reynders, 2010(c)
	 */
	public class ObjectUtil {
	////////////////////////////////////////////////////////////////////////////
	// 	CLASS MEMBERS
	
		//--( CONSTS )--//
		
		static public const NAME : String = "ObjectUtil";
		
		//--( PROPS )--//

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		static public function toArray( obj : Object ) : Array {
			var result : Array = [];
			for each( var item : * in obj ) {
				result.push( item );
			}
			return result;
		}
		
		static public function getAllPropertyNames( classRef : Class ) : Array {
			var defXML : XML = describeType( classRef );
			var list : XMLList = defXML..variable.@name;
			var output : Array = [];
			for each ( var value : * in list ) {
				output.push( value );
			}
			return output;
		}
		
		
	////////////////////////////////////////////////////////////////////////////
	// 	CONSTRUCTOR
	
		public function ObjectUtil() {
			throw new Error( "*** ERROR *** " + NAME + ": instantiation not allowed!" );
		}
		
		
	}//end class 
	
}//end package