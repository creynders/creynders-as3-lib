


package be.creynders.framework.utils {
	import flash.display.DisplayObject;
	import flash.events.Event;
	/**
	 * @author creynders
	 */
	public function doNextFrame ( target : DisplayObject, callback : Function, ...params ) : void {
		var f : Function = function( event : Event ) : void{
			target.removeEventListener( Event.ENTER_FRAME, arguments.callee );
			callback.apply( target, params );
		}
		target.addEventListener( Event.ENTER_FRAME, f );
	}
}
