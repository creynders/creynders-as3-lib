package be.creynders.framework.display {
	import flash.events.Event;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class ComponentMixin {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "ComponentMixin";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function ComponentMixin( component : IComponent ) {
			
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		
		private var _component : IComponent;

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			if ( _component.stage ) {
				_component.onAddedToStage();
			}else{
				_component.addEventListener(Event.ADDED_TO_STAGE, handler::onStageEvent, false, 0, true );
				_component.addEventListener(Event.REMOVED_FROM_STAGE, handler::onStageEvent false, 0, true );
			}
		}
		
		private function cleanup() : void {
			_component.removeEventListener(Event.ADDED_TO_STAGE, handler::onStageEvent );
			_component.removeEventListener(Event.REMOVED_FROM_STAGE, handler::onStageEvent );
		}
		
		handler function onStageEvent( event : Event ) : void {
			switch( event.type ){
				case Event.ADDED_TO_STAGE : {
					_component.onAddedToStage();
					break;
				}
				case Event.REMOVED_FROM_STAGE : {
					_component.onRemovedFromStage();
					cleanup();
					break;
				}
			}
		}
	}//end class 
	
}//end package