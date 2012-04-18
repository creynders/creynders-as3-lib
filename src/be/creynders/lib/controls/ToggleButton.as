package be.creynders.lib.controls
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class ToggleButton extends MovieClip
	{
		
		static private const FR_UP : String = "up";
		static private const FR_OVER : String = "over";
		static private const FR_DOWN : String = "down";
		static private const FR_SELECTED : String = "selected";
		
		public function ToggleButton() {
			super();
			stop();
			registerListeners();
		}
		
		public function get selected() : Boolean { return _selected;  }
		public function set selected( value : Boolean ) : void { _selected = value; toggle(); }
		private var _selected : Boolean = false;
		
		public function remove() : void{
			removeListeners();
		}
		
		private function registerListeners() : void{
			this.addEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage, false, 0, true );
			registerMouseListeners();
		}
		
		private function registerMouseListeners() : void{
			this.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown, false, 0, true );
			this.addEventListener( MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true );
			this.addEventListener( MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true );
			this.addEventListener( MouseEvent.MOUSE_UP, onMouseUp, false, 0, true );
		}
		
		private function removeListeners() : void{
			this.removeEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
			removeMouseListeners();
		}
		
		private function removeMouseListeners() : void{
			this.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			this.removeEventListener( MouseEvent.MOUSE_OUT, onMouseOut );
			this.removeEventListener( MouseEvent.MOUSE_OVER, onMouseOver );
			this.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
		}
		
		private function toggle() : void{
			if( _selected ) select();
			else deselect();
		}
		
		private function select() : void{
			this.gotoAndStop( FR_SELECTED );
			removeMouseListeners();
		}
		
		private function deselect() : void{
			this.gotoAndStop( FR_UP );
			registerMouseListeners();
		}
		
		private function onRemovedFromStage( event : Event ) : void{
			remove();
		}
		
		private function onMouseDown( event : MouseEvent ) : void{
			this.gotoAndStop( FR_DOWN );
		}

		private function onMouseOut( event : MouseEvent ) : void{
			this.gotoAndStop( FR_UP );
		}

		private function onMouseOver( event : MouseEvent ) : void{
			this.gotoAndStop( FR_OVER );			
		}

		private function onMouseUp( event : MouseEvent ) : void{
			selected = true;
		}
		
	}
}