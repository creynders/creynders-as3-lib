package be.creynders.framework.display {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class MouseTracker extends Sprite{

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "MouseTracker";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function MouseTracker() {
			
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		
		private var _out : TextField;
		private var _timer : Timer;

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			_timer = new Timer( 1000 / 30 );
			_timer.addEventListener(TimerEvent.TIMER, render );
			
			createChildren();
			
			followMouse();
		}
		
		handler function onStageEvent( event : Event ) : void {
			switch( event.type ){
				case Event.ADDED_TO_STAGE: {
					followMouse();
					break;
				}
			}
		}
		
		private function createChildren() : void {
			_out = new TextField();
			_out.background = true;
			_out.backgroundColor = 0xFFFFFF;
			var fmt : TextFormat = new TextFormat;
			fmt.color = 0x000000;
			fmt.size = 8;
			_out.setTextFormat( fmt );
			_out.x = -20;
			_out.y = -20;
			this.addChild( _out );
		}
		
		private function followMouse() : void {
			_timer.start();
		}
		private function render( event : TimerEvent ) : void {
			_out.text = this.mouseX + "," + this.mouseY;
		}
		
	}//end class 
	
}//end package