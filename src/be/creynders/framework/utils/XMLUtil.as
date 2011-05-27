package be.creynders.framework.utils
{
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Camille Reynders
	 */
	public class XMLUtil 
	{
		/**
		 * converts xml to typed objects using a strict syntax
		 * @usage 			
		 *  var xml : XML =
			<object name="settings">
				<string name="whatever"><![CDATA[yeah]]></string>
				<string name="foo"></string>
				<number name="ork">123.9654</number>
				<object name="mc">
					<int name="x">102</int>
					<number name="y">205</number>
				</object>
				<boolean name="hasMofos">true</boolean>
				<boolean name="hasMojo">false</boolean>
				<xml name="zut">
					<items>
						<item>een of ander item</item>
						<item>nog een item</item>
					</items>
				</xml>
				<TestClass path="be.creynders.framework">
					<string name="foo">bar</string>
					<string name="doesNotExist">should throw error</string>
				</TestClass>
			</object>;
			var obj : Object = XMLUtil.toTypedObjects( xml );

		 * @param	xml
		 * @return
		 */
		static public function toTypedObjects( xml : XML ) : * {
			var objType : String = String( xml.name() );
			var children : XMLList = xml.children();
			var n : int = children.length(); //WARNING: method call !!
			var i : int;
			var child : XML;
			switch( objType.toLowerCase() ) {
				
				case 'xml': 	return XML( children );
				case 'string': 	return( String( children ) );
				case 'number': 	return( Number( children ) );
				case 'uint' : 	return( uint( children ) );
				case 'int': 	return( int( children ) );
				case 'boolean':	return( ( children.toString() == "true" ) );
				case 'date':	return DateUtil.stringToDate( children.toString(), 'JMDHIS', true )
				
				case 'object': {
					var obj : Object = {};
					for ( i = 0 ; i < n ; i++ ) {
						child = children[ i ] as XML;
						obj[ child.@name ] = toTypedObjects( child );
					}
					return obj;
				}
				
				case 'array': {
					var arr : Array = [];
					for ( i = 0 ; i < n ; i++ ) {
						child = children[ i ] as XML;
						arr.push( toTypedObjects( child ) );
					}
					return arr;
				}
				
				//must be String [!]
				case 'null': {
					return '';
				}
				
				default:
					var fullPath : String = ( xml.@path == undefined ) ? objType : xml.@path + "." + objType;
					var $classRef : Class = getDefinitionByName( fullPath ) as Class;
					var inst : Object = new $classRef();
					for ( i = 0 ; i < n ; i++ ) {
						child = children[ i ] as XML;
						inst[ child.@name ] = toTypedObjects( child );
					}
					return inst;
				break;
			}
			
			return null;
		}
		
	}
	
}