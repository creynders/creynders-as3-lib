package be.creynders.framework.net {
	
	
	import flash.external.ExternalInterface;
	
	public class JavaScript {
		static private var available : Boolean = checkAvailability();
		
		static private function checkAvailability() : Boolean {
			return ExternalInterface.available;
		}
		
		static public function call( functionName : String, ...params ) : * {
			if( available )
				return ExternalInterface.call.apply( null, [ functionName ].concat( params ) );
			else
				return null;
		}
		
		static public function execute( js : String ) : * {
			if ( available )	
				return ExternalInterface.call( "function js_" + ( new Date().getTime() ) + "(){ " + js + " }" );
			else
				return null;
		}
		
		static public function addCallback( eventType : String, callback : Function ) : void{
			if( available )	ExternalInterface.addCallback( eventType, callback );
		}
	}
}