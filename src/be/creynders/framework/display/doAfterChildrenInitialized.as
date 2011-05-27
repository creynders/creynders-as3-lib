package be.creynders.framework.display {
	import flash.display.MovieClip;
	import flash.events.Event;

	
	public function doAfterChildrenInitialized( target : MovieClip, callback : Function, ...params ) {
		var f : Function = function( event : Event ) : void {
			target.removeEventListener( Event.RENDER, arguments.callee );
			callback.apply( target, params );
		}
		target.stage.invalidate();
		target.addEventListener( Event.RENDER, f );
	}
	
}//end package