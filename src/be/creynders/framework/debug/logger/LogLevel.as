package be.creynders.framework.debug.logger
{
	public class LogLevel
	{

//========================================================
// CLASS MEMBERS
//========================================================
		//---------
		// CONSTS
		
		static public const ERROR : LogLevel = new LogLevel( "error", 0 );
		static public const WARNING : LogLevel = new LogLevel( "warning", 1 );
		static public const SYSTEM : LogLevel = new LogLevel( "system", 2 );
		static public const INFO : LogLevel = new LogLevel( "info", 3 );
		static public const DEBUG : LogLevel = new LogLevel( "debug", 4 ); 
		

		//----------
		// ACCESSORS
		static public function get list() : Array{
			return 	_list;
		}
		static private var _list : Array = [ 
			ERROR, 
			WARNING, 
			SYSTEM, 
			INFO, 
			DEBUG 
		];
		
		//---------
		// METHS
		
		static public function getLevelByName( name : String ) : LogLevel {
			var i : int;
			var n : int = list.length;
			for( i = 0 ; i < n ; i++ ) {
				var level : LogLevel = list[ i ] as LogLevel;
				if ( level.name == name ) return level;
			}
			return null;
		}
		
//========================================================
// CONSTRUCTOR
//========================================================

		public function LogLevel( name : String, ordinal : int )
		{
			_name = name;
			_ordinal = ordinal;
		}

//========================================================
// INSTANCE MEMBERS
//========================================================

		//---------
		// PROPS
		
		public function get name() : String{ return _name }
		private var _name : String;
		
		public function get ordinal() : int { return _ordinal }
		private var _ordinal : int; 
		

	}
}