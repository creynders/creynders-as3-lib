package be.creynders.framework.data {
	
	/**
	 * 
	 * Singleton
	 * @author Camille Reynders, Camille Reynders, 2010(c)
	 */
	public class Texts {
	////////////////////////////////////////////////////////////////////////////
	// 	CLASS MEMBERS
	
		//--( CONSTS )--//
		
		static public const NAME : String = "Texts";
		
		//--( PROPS )--//
		
		static private var _initialized : Boolean = false;
		static private var _registry : Registry;
		static private var instance : Texts;

		//--( METHS )--//
		
		static public function initialize( registry : Registry ) : void {
			_registry = registry;
			_initialized = true;
			
		}
		
		static public function getInstance() : Texts {
			if ( instance == null ) instance = new Texts( new TextsLock() );
			return instance;
		}
		
	////////////////////////////////////////////////////////////////////////////
	// 	CONSTRUCTOR
	
		public function Texts( lock : TextsLock ) {
			if ( ! _initialized ) throw new Error( '*** ERROR *** ' + this.reflect() + ' first needs to be initialized with static method "initialize"' );
			if( lock == null ) throw new Error( '*** ERROR *** ' + this.reflect() + ' Direct instantiation is not allowed. Please use the "getInstance" method.' );
			//trace( reflect() + " constructor" );
			init();
		}
		
	////////////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS
		
		//--( NAMESPACES )--//
		
		//--( PROPS )--//

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		public function reflect() : String {
			return "[object " + NAME + "]";
		}
		
		private function init() : void{
			//trace( reflect() + ".init" );
			
		}
		
		public function getText( id : String ) : String {
			return _registry.getValue( id ) as String;
		}
	}//end class
	
}//end package

internal class TextsLock {}