package be.creynders.framework.utils
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	public class MathUtil
	{
		
		static public const Q1 : int = 0;
		static public const Q2 : int = 1;
		static public const Q3 : int = 2;
		static public const Q4 : int = 3;
		static public const NUM_QUADRANTS : int = 4;
		
		static public function degToRad( degrees : Number ) : Number{
			return degrees * Math.PI/180;
		}
		
		static public function radToDeg( radians : Number ) : Number{
			return radians * 180/Math.PI;
		}
		
		/**
		 * returns a Number/integer between [ begin ; end ]
		 * @param	begin
		 * @param	end
		 * @param	round
		 * @return
		 */
		static public function randomFromRange( begin : Number, end : Number, round : Boolean = false ) : Number {
			var decimals : int = ( round ) ? 0 : -1;
			return MathUtil.randomFromRangeWithDecimals( begin, end, decimals );
		}
		
		static public function randomFromRangeWithDecimals( begin : Number, end : Number, decimals : int = -1 ) : Number {
			var output : Number = begin + ( Math.random() * ( end - begin ) );
			return ( decimals >= 0 ) ? MathUtil.round( output, decimals ) : output;
			
		}
		
		static public function randomUint( value : uint ) : uint{
			return randomFromRange( 0, value );
		}
		
		static public function round( value : Number, decimals : int = 0 ) : Number{
			return _addDecimals( Math.round, value, decimals );
		}
		
		static public function floor( value : Number, decimals : int = 0 ) : Number{
			return _addDecimals( Math.floor, value, decimals );
		}
		
		static public function ceil( value : Number, decimals : int = 0 ) : Number{
			return _addDecimals( Math.ceil, value, decimals );
		}
		
		static private function _addDecimals( mathFunc : Function, value : Number, decimals : int ) : Number{
			var valueStr : String = String( value );
			var nrOfDec : int = valueStr.length - valueStr.indexOf( "." );
			if( nrOfDec > decimals ){
				var pow : int = Math.pow( 10, decimals );
				var output : Number = mathFunc.call( null, value * pow );
				return output / pow;
			}else{
				return value;
			}
		}
		
		static public function getDistance( p1 : Point, p2 : Point ) : Number {
			var dx : Number = p2.x-p1.x;
			var dy : Number = p2.y-p1.y;
			return Math.sqrt(dx * dx + dy * dy);
		}
		
		// Q1 | Q2
		// -- + --
		// Q4 | Q3
		static public function getPointInQuadrant( rectangle : Rectangle, q : int ) : Point {
			var dw2 : Number = rectangle.width / 2;
			var dh2 : Number = rectangle.height / 2;
			var rqX : Number = Math.random() * dw2;
			var rqY : Number = Math.random() * dh2;
			var leftX : int = Math.round( rectangle.x + rqX );
			var rightX : int = leftX + dw2;
			var upperY : int = Math.round( rectangle.y + rqY );
			var lowerY : int = upperY + dh2;
			switch( q ) {
				case Q1 : {
					return new Point( leftX, upperY );
				}
				
				case Q2 : {
					return new Point( rightX, upperY );
				}
				
				case Q3 : {
					return new Point( rightX, lowerY );
				}
				
				case Q4 : {
					return new Point( leftX, lowerY );
				}
			}
			
			return new Point( 0, 0 );
		}
		
		static public function randomBoolean() : Boolean {
			return ( Math.round( Math.random() ) == 1 );
		}
		
	}
}