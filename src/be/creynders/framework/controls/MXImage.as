package be.creynders.framework.controls {
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import mx.controls.Image;
    import mx.core.mx_internal;
    
    use namespace mx_internal;	

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public class MXImage extends Image {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "MXImage";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function MXImage() {
			super();
			
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//

		//--( ACCESSORS )--//
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			
		}
		
        /**
         * @private
         */
        override mx_internal function contentLoaderInfo_completeEventHandler(event:Event):void {
            var smoothLoader:Loader = event.target.loader as Loader;
            var smoothImage:Bitmap = smoothLoader.content as Bitmap;
            smoothImage.smoothing = true;
            
            super.contentLoaderInfo_completeEventHandler(event);
        }		
	}//end class 
	
}//end package