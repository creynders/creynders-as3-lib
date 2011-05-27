package be.creynders.framework.display {
	import flash.display.LoaderInfo;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.geom.Point;

	
	/**
	 * ...
	 * @author Camille Reynders, 2010(c)
	 */
	public  class StageHelper {

	//////////////////////////////////////////////////////////////////////
	// CLASS MEMBERS                                                    //
	//////////////////////////////////////////////////////////////////////
	
		//--( CONSTS )--//
		
		static public const NAME : String = "StageHelper";
		
		
	//////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR                                                      //
	//////////////////////////////////////////////////////////////////////
	
		public function StageHelper( info : LoaderInfo ) {
			_info = info;
			_stage = _info.content.stage;
			init();
		}
		
	//////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS                                                 //
	//////////////////////////////////////////////////////////////////////
		
		//--( NAMESPACES )--//
		private namespace handler;
		
		//--( PROPS )--//
		
		private var _stageWidth : Number;
		private var _stageHeight : Number;
		
		public function get canvasWidth() : Number { return _canvasWidth; }
		private var _canvasWidth : Number;
		
		public function get canvasHeight() : Number { return _canvasHeight; }
		private var _canvasHeight : Number;
		
		//--( ACCESSORS )--//
		
		public function get stage() : Stage { return _stage; }
		private var _stage : Stage;
		
		public function get info() : LoaderInfo { return _info; }
		private var _info : LoaderInfo;
		
		public function get bottom() : Number {  calculate(); return _bottom; }
		private var _bottom : Number;
		
		public function get left() : Number {  calculate(); return _left; }
		private var _left : Number;
		
		public function get right() : Number {  calculate(); return _right; }
		private var _right : Number;
		
		public function get top() : Number {  calculate(); return _top; }
		private var _top : Number;
		
		
		public function get centerX() : Number { return _cx; }
		private var _cx : Number;
		
		public function get centerY() : Number { return _cy; }
		private var _cy : Number;
		
		//--( METHS )--//
		
		private function init() : void{
			//trace( this + ".init" );
			_canvasWidth = _info.width;
			_canvasHeight = _info.height;
		}
		
		private function calculate() : void {
			
			if ( ( stage.stageWidth != _stageWidth ) || ( stage.stageHeight != _stageHeight ) ) {
				_stageWidth = stage.stageWidth;
				_stageHeight = stage.stageHeight;
				var dw : Number = _stageWidth - _canvasWidth;
				var dh : Number = _stageHeight - _canvasHeight;
				var dw2 : Number = ( dw / 2 );
				var dh2 : Number = ( dh / 2 );
				switch( stage.align ) {
					case StageAlign.BOTTOM: {
						_right = _stageWidth - dw2;
						_left = -dw2;
						_bottom =  _canvasHeight;
						_top = - dh;
						_cx = _canvasWidth / 2;
						_cy = _canvasHeight - ( _stageHeight / 2 );
						break;
					}
					
					case StageAlign.BOTTOM_LEFT: {
						_left = 0;
						_right = _stageWidth;
						_bottom =  _canvasHeight;
						_top = - dh;
						_cx = _stageWidth / 2;
						_cy = _canvasHeight - ( _stageHeight / 2 );
						break;
					}
					
					case StageAlign.BOTTOM_RIGHT: {
						_right = _canvasWidth;
						_left = - dw;
						_bottom = _canvasHeight;
						_top = - dh;
						_cx = _canvasWidth - ( _stageWidth / 2 );
						_cy = _canvasHeight - ( _stageHeight / 2 );
						break;
					}
					
					case StageAlign.LEFT: {
						_left = 0;
						_right = _stageWidth;
						_bottom = _stageHeight - dh2;
						_top = -dh2;
						_cx = _stageWidth / 2;
						_cy = _canvasHeight / 2;
						break;
					}
					
					case StageAlign.RIGHT: {
						_right = _canvasWidth;
						_left = - dw;
						_bottom = _stageHeight - dh2;
						_top = -dh2;
						_cx = _canvasWidth - ( _stageWidth / 2 );
						_cy = _canvasHeight / 2;
						break;
					}
					
					case StageAlign.TOP: {
						_right = _stageWidth - dw2;
						_left = -dw2;
						_top = 0;
						_bottom = _stageHeight;
						_cx = _canvasWidth / 2;
						_cy = _stageHeight / 2;
						break;
					}
					
					case StageAlign.TOP_LEFT: {
						_left = 0;
						_right = _stageWidth;
						_top = 0;
						_bottom = _stageHeight;
						_cx = _stageWidth / 2;
						_cy = _stageHeight / 2;
						break;
					}
					
					case StageAlign.TOP_RIGHT: {
						_top = 0;
						_bottom = _stageHeight;
						_right = _canvasWidth;
						_left = - dw;
						_cx = _canvasWidth - ( _stageWidth / 2 );
						_cy = _stageHeight / 2;
						break;
					}
					
					default: {
						_right = _stageWidth - dw2;
						_left = -dw2;
						_top = -dh2;
						_bottom = _stageHeight - dh2;
						
						_cx = _canvasWidth / 2;
						_cy = _canvasHeight / 2;
						break;
					}
				}
				
			}
			
		}
		
		
	}//end class 
	
}//end package