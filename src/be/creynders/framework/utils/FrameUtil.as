package be.creynders.framework.utils 
{
	import flash.display.FrameLabel;
	import flash.display.MovieClip;
	import be.creynders.framework.utils.ArrayUtil;
	
	/**
	 * ...
	 * @author Camille Reynders
	 */
	public class FrameUtil 
	{
		
		static public function getFrame( mc : MovieClip, label : String ) : int {
			var labels : Array = mc.currentLabels;
			var fl : FrameLabel = ArrayUtil.valueByKey( labels, 'name', label );
			if ( fl == null ) return -1;
			else return fl.frame;
		}
		
		static public function addCallBackToFrame( target : MovieClip, frame : * , callback : Function ) : void {
			var frameNr : int 
			if ( frame is String ) {
				frameNr = getFrame( target, frame );
			}else {
				frameNr = frame;
			}
			target.addFrameScript( frameNr, callback );
		}
	}
	
}