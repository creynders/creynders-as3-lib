package be.creynders.lib.mvc {
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public class ViewMixin {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "ViewMixin";
		
		static public const VIEW_CREATED : String = 'viewCreated';
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function ViewMixin( view : DisplayObject, dispatcher : IEventDispatcher = null ) {
			_view = view;
			_dispatcher = ( dispatcher ) ? dispatcher : view; 
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		private var _view : DisplayObject;
		private var _dispatcher : IEventDispatcher;

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		private function init() : void{
			if ( _view.stage ) notifyOfCreation();
			else _view.addEventListener( Event.ADDED_TO_STAGE, handler::onViewAddedToStage, false, 0, false );
		}
		
		handler function onViewAddedToStage( event : Event ) : void {
			_view.removeEventListener(Event.ADDED_TO_STAGE, handler::onViewAddedToStage );
			notifyOfCreation();
		}
		
		protected function notifyOfCreation() : void {
			//trace( _dispatcher, 'notifyOfCreation' );
			_dispatcher.dispatchEvent( new Event( VIEW_CREATED ) );
		}

		
	}//end class 
	
}//end package