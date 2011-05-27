package be.creynders.framework.controls
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	[Event(name="change", type="flash.events.Event")]
	
	public class ToggleButtonGroup extends EventDispatcher
	{


//========================================================
// CONSTRUCTOR
//========================================================

		public function ToggleButtonGroup()
		{
			buttonsHash = new Dictionary( true );
		}
		

//========================================================
// INSTANCE MEMBERS
//========================================================
		//---------
		// PROPS

		private var buttonsHash : Dictionary;

		//----------
		// ACCESSORS
		
		
		public function get selectedButton() : ToggleButton{ return _selectedButton }
		public function set selectedButton( value : ToggleButton ) : void{ selectButton( value ) }
		private var _selectedButton : ToggleButton;
		
		public function get selectedData() : Object{ return buttonsHash[ selectedButton ] }
		public function set selectedData( value : Object ) : void{ selectButtonByData( value ) }

		//---------
		// METHS
				
		public function addButton( toggleButton : ToggleButton, data : Object = null ) : void{
			buttonsHash[ toggleButton ] = data;
			toggleButton.addEventListener( MouseEvent.CLICK, onClickButton, false, 0, true );
		}
		
		public function removeButton( toggleButton : ToggleButton ) : Object{
			toggleButton.removeEventListener( MouseEvent.CLICK, onClickButton );
			var data : Object = buttonsHash[ toggleButton ];
			delete buttonsHash[ toggleButton ];
			return data;
		}
		
		private function selectButton( toggleButton : ToggleButton ) : void{
			toggleButton.selected = true;
			_selectedButton = toggleButton;
		}
		
		private function selectButtonByData( data : Object ) : void{
			
			buttonLoop : for ( var button : Object in buttonsHash ){
				if( buttonsHash[ button ] == data ){
					selectButton( button as ToggleButton );
					break buttonLoop;
				} 
			}
		}
		
		private function onClickButton( event : MouseEvent ) : void{
			if( _selectedButton != null ) _selectedButton.selected = false;
			_selectedButton = event.target as ToggleButton;
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		
		
	}
}