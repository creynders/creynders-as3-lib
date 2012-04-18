package be.creynders.lib.debug.logger {
	
	/**
	 * ...
	 * @author Camille Reynders, Camille Reynders, 2010 (c)
	 */
	public interface ILogger {
		function debug( target : Object, ...params ) : void;
		function info( target : Object, ...params ) : void;
		function system( target : Object, ...params ) : void;
		function warning( target : Object, ...params ) : void;
		function error( target : Object, ...params ) : void;
		
		function log( level : LogLevel, target : Object, params : Array ) : void;
		
		function set enabled( value : Boolean ) : void;
		function get enabled() : Boolean;
		
		function set levelTreshold( value : uint ) : void;
		function get levelTreshold() : uint;
	}
	
}