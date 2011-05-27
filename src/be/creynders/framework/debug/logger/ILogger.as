package be.creynders.framework.debug.logger {
	
	/**
	 * ...
	 * @author Camille Reynders, Camille Reynders, 2010 (c)
	 */
	public interface ILogger {
		function debug( target : Object, object : * ) : void;
		function info( target : Object, object : * ) : void;
		function system( target : Object, object : * ) : void;
		function warning( target : Object, object : * ) : void;
		function error( target : Object, object : * ) : void;
		
		function log( level : LogLevel, target : Object, object : * ) : void;
		
		function set enabled( value : Boolean ) : void;
		function get enabled() : Boolean;
		
		function set levelTreshold( value : uint ) : void;
		function get levelTreshold() : uint;
	}
	
}