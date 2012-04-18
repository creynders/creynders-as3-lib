package be.creynders.lib.thirdparty.googleanalytics {
	import be.creynders.lib.net.ITracker;
	import com.google.analytics.GATracker;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public class GATrackerWrapper implements ITracker {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "GATrackerWrapper";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function GATrackerWrapper( container : DisplayObject, ID : String ) {
			_container = container;
			_ID = ID;
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		
		private var _delegate : GATracker;

		//--( ACCESSORS )--//
		
		public function get container() : DisplayObject { return _container; }
		private var _container : DisplayObject;
		
		public function get ID() : String { return _ID; }
		private var _ID : String;
		
		/**
		 * @see be.creynders.lib.net.ITracker
		 */
		public function get isEnabled() : Boolean { return _isEnabled }
		public function set isEnabled( value : Boolean ) : void {
			_isEnabled = value;
		}
		private var _isEnabled : Boolean = true;
		
		/**
		 * @see be.creynders.lib.net.ITracker
		 */
		public function set pagesPrefix( value : String ) : void {
			_pagesPrefix = value;
		}
		public function get pagesPrefix() : String { return _pagesPrefix }
		private var _pagesPrefix : String = '';
		
		/**
		 * @see be.creynders.lib.net.ITracker
		 */
		public function set pagesSuffix( value : String ) : void {
			_pagesSuffix = value;
		}
		public function get pagesSuffix() : String { return _pagesSuffix }
		private var _pagesSuffix : String = '';
		
		/**
		 * @see be.creynders.lib.net.ITracker
		 */
		public function set eventsPrefix( value : String ) : void {
			_eventsPrefix = value;
		}
		public function get eventsPrefix() : String { return _eventsPrefix }
		private var _eventsPrefix : String = '';
		
		/**
		 * @see be.creynders.lib.net.ITracker
		 */
		public function set eventsSuffix( value : String ) : void {
			_eventsSuffix = value;
		}
		public function get eventsSuffix() : String { return _eventsSuffix }
		private var _eventsSuffix : String = '';
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			_delegate = new GATracker( container, ID, 'AS3' );
		}
		
		
		/**
		 * @see be.creynders.lib.net.ITracker
		 * @param	page
		 */
		public function trackPageview(page:String):void {
			trackPageviewClean( page, false, false );
		}
		
		/**
		 * @see be.creynders.lib.net.ITracker
		 * @param	page
		 * @param	dropPrefix
		 * @param	dropSuffix
		 */
		public function trackPageviewClean( page : String, dropPrefix : Boolean = true, dropSuffix : Boolean = true ) : void {
			if ( _isEnabled ) {
				var pp : String = ( dropPrefix ) ? '' : pagesPrefix;
				var ps : String = ( dropSuffix ) ? '' : pagesSuffix;
				_delegate.trackPageview( pp + page + ps );
			}			
		}
		
		/**
		 * @see be.creynders.lib.net.ITracker
		 * @param	event
		 * @param	action
		 * @param	value
		 */
		public function trackEvent(event:String, action:String, value:String = '') : void {
			trackEventClean( event, action, value, false, false );
		}
		
		/**
		 * @see be.creynders.lib.net.ITracker
		 * @param	event
		 * @param	action
		 * @param	value
		 * @param	dropPrefix
		 * @param	dropSuffix
		 */
		public function trackEventClean( event : String, action : String, value : String = '', dropPrefix : Boolean = true, dropSuffix : Boolean = true ) : void {
			if ( _isEnabled ) {
				var ep : String = ( dropPrefix ) ? '' : eventsPrefix;
				var es : String = ( dropSuffix ) ? '' : eventsSuffix;
				_delegate.trackEvent( ep + event + es, action, value );
			}
		}
				
	}//end class 
	
}//end package