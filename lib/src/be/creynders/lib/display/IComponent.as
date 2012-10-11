package be.creynders.lib.display {
	import flash.display.Stage;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author Camille Reynders, Camille Reynders, 2010(c)
	 */
	public interface IComponent extends IEventDispatcher {
		function onAddedToStage() : void;
		function onRemovedFromStage() : void;
		
		function get stage() : Stage;
	}
	
}