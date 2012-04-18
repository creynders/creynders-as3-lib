package be.creynders.lib.controls {
	import flash.display.Loader;	
	
	import be.creynders.lib.utils.FrameUtil;
	import be.creynders.lib.utils.StringUtil;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.text.TextField;		

	public class ProgressBar extends EventDispatcher {
		
		static public const ENT_BYTES_LOADED : String = "%bytesLoaded%";
		static public const ENT_BYTES_TOTAL : String = "%bytesTotal%";
		static public const ENT_KBYTES_LOADED : String = "%kbytesLoaded%";
		static public const ENT_KBYTES_TOTAL : String = "%kbytesTotal%";
		static public const ENT_MBYTES_LOADED : String = "%mbytesLoaded%";
		static public const ENT_MBYTES_TOTAL : String = "%mbytesTotal%";
		static public const ENT_BYTES_PERCENT : String = "%bytesPercent%";
		
		static public const INIT_FORMAT : String = ENT_BYTES_LOADED + "/" +  ENT_BYTES_TOTAL + " (" + ENT_BYTES_PERCENT + "%)";
		
		public function ProgressBar( 	progressBar : MovieClip, 
										source : EventDispatcher = null,
										beginFrameLabel : String = "begin",
										endFrameLabel : String = "end",
										progressText : TextField = null,
										format : String = "" ){
			super( );
			_progressBar = progressBar;
			_progressBar.stop();
			
			if( source != null ){
				_source = source;
				var dispatcher : EventDispatcher;
				
				if( _source is Loader )	dispatcher = ( _source as Loader ).contentLoaderInfo;
				else dispatcher = _source;
				
				dispatcher.addEventListener( ProgressEvent.PROGRESS, loadingProgressHandler );
				dispatcher.addEventListener( Event.COMPLETE, loadingCompleteHandler );
				
			}
			
			_progressText = progressText;
			
			_format = format;
			if( _format == "" ) _format = INIT_FORMAT;
			
			_beginFrame = FrameUtil.getFrame( _progressBar, beginFrameLabel );
			if ( _beginFrame < 0 ) _beginFrame = 1;
			
			
			_endFrame = FrameUtil.getFrame( _progressBar, endFrameLabel );
			if ( _endFrame < 0 ) _endFrame = progressBar.totalFrames;
			
			//trace( _beginFrame, "->", _endFrame );
			
			hide();
		}
		
		public function get content() : DisplayObject { return _content }
		private var _content : DisplayObject;

		private var _progressBar : MovieClip;
		private var _progressText : TextField;
		private var _format : String;
		
		private var _beginFrame : int;
		private var _endFrame : int;
		
		private var _source : EventDispatcher;
		
		public function setProgress( bytesLoaded : Number, bytesTotal : Number ) : void{
			//trace( "progress: " + bytesLoaded, bytesTotal );
			if( ! _progressBar.visible ) _progressBar.visible = true;
			
			var bytesPercent : Number = bytesLoaded / bytesTotal * 100;
			if ( bytesPercent < 0 ) bytesPercent = 0;
			var targetFrame : Number = _beginFrame + Math.round( bytesPercent / 100 * ( _endFrame - _beginFrame ) );
			_progressBar.gotoAndStop( targetFrame );
			
			if( _progressText != null ){	
				var out_str : String = _format;
				
				out_str = StringUtil.replaceString( out_str, ENT_BYTES_LOADED, String( bytesLoaded ) );
				out_str = StringUtil.replaceString( out_str, ENT_BYTES_TOTAL, String( bytesTotal ) );
				out_str = StringUtil.replaceString( out_str, ENT_KBYTES_LOADED, String( Math.round( bytesLoaded / 1024 ) ) );
				out_str = StringUtil.replaceString( out_str, ENT_KBYTES_TOTAL, String( Math.round( bytesTotal / 1024 ) ) );
				out_str = StringUtil.replaceString( out_str, ENT_MBYTES_LOADED, String( Math.round( bytesLoaded / 1024 / 1024 ) ) );
				out_str = StringUtil.replaceString( out_str, ENT_MBYTES_TOTAL, String( Math.round( bytesTotal / 1024 / 1024 ) ) );
				out_str = StringUtil.replaceString( out_str, ENT_BYTES_PERCENT, String( Math.round( bytesPercent ) ) );
				
				_progressText.text = out_str;
			}
		}
		
		public function show() : void {
			_progressBar.visible = true;
		}
		
		public function hide() : void{
			_progressBar.visible = false;
		}
		
		private function loadingProgressHandler( event : ProgressEvent ) : void{
			setProgress( event.bytesLoaded, event.bytesTotal );
		}
		
		private function loadingCompleteHandler( event : Event ) : void{
			hide();
		}
		
	}//end class
}//end package
