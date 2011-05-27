package be.creynders.framework.debug.logger {
	
	/**
	 * ...
	 * @author Camille Reynders, Camille Reynders, 2010(c)
	 */
	public interface ILogCentre extends ILogger{
		function set updateDelay( value : uint ) : void;
		function get updateDelay() : uint;
		
		function addLogger( logger : ILogger ) : int;
		function removeLogger( logger : ILogger ) : int;
		function hasLoggers() : Boolean;
		
	}
	
}