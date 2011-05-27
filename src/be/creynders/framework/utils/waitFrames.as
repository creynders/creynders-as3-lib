package be.creynders.framework.utils {
	import flash.display.MovieClip;
	import flash.events.Event;

	public function waitFrames( target : MovieClip, callback : Function, numFrames : int = 1, ...params ) {
		var f : Function = function( event : Event ) : void {
			trace( numFrames );
			numFrames--;
			if( numFrames <= 0 ){
				target.removeEventListener( Event.ENTER_FRAME, arguments.callee );
				callback.apply( target, params );
			}
		}
		target.addEventListener( Event.ENTER_FRAME, f );
		
	}
		
}//end package