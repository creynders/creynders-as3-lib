package be.creynders.framework.net {
	
	/**
	 * ...
	 * @author Camille Reynders, Camille Reynders, 2010(c)
	 */
	public interface ITracker {
		
		function set isEnabled( value : Boolean ) : void;
		function get isEnabled() : Boolean;
		
		function set pagesPrefix( value : String ) : void;
		function get pagesPrefix() : String;
		
		function set pagesSuffix( value : String ) : void;
		function get pagesSuffix() : String;
		
		function set eventsPrefix( value : String ) : void;
		function get eventsPrefix() : String;
		
		function set eventsSuffix( value : String ) : void;
		function get eventsSuffix() : String;
		
		
		function trackPageview( page : String ) : void;
		function trackEvent( event : String, action : String, value : String = '' ) : void;
		
		function trackPageviewClean( page : String, dropPrefix : Boolean = true, dropSuffix : Boolean = true ) : void;
		function trackEventClean( event : String, action : String, value : String = '', dropPrefix : Boolean = true, dropSuffix : Boolean = true ) : void;
		
	}
	
}