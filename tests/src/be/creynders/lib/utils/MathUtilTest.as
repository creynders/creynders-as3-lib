package be.creynders.lib.utils
{
	import flash.geom.Point;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertStrictlyEquals;
	import org.flexunit.asserts.assertTrue;

	/**
	 * @author creynder
	 */
	public class MathUtilTest{
		
		static private const POLYGON_AREA : Number = 30;
		
		public function MathUtilTest()
		{
			trace( this );
		}
		
		private function createLine( length : Number = 250 ) : Vector.<Point>{
			var output : Vector.<Point> = new Vector.<Point>();
			output.push( new Point( 0, 0 ) );
			output.push( new Point(length, 0 ) );
			output.push( new Point( 0, 0 ) );
			return output;
		}
		
		private function createTriangle( base : Number = 250, height : Number = 500 ) : Vector.<Point>{
			var output : Vector.<Point> = new Vector.<Point>();
			output.push( new Point( 0, 0 ) );
			output.push( new Point(base, 0 ) );
			output.push( new Point( 0, height ) );
			output.push( new Point( 0, 0 ) );
			return output;
		}
		
		
		private function createRectangle( sideLength : Number = 250 ) : Vector.<Point>{
			var output : Vector.<Point> = new Vector.<Point>();
			output.push( new Point( 0, 0 ) );
			output.push( new Point(sideLength, 0 ) );
			output.push( new Point(sideLength, sideLength ) );
			output.push( new Point( 0, sideLength ) );
			output.push( new Point( 0, 0 ) );
			return output;
		}
		
		private function createPolygon() : Vector.<Point>{
			var output : Vector.<Point> = new Vector.<Point>();
			output.push( new Point( 4, 10 ) );
			output.push( new Point( 7, 5 ) );
			output.push( new Point( 14, 4 ) );
			output.push( new Point( 2, 2 ) );
			output.push( new Point( 4, 10 ) );
			return output;
		}
		
		
		[Before]
		public function setup():void{
		}
		
		[After]
		public function teardown():void{
		}
		
		[Test]
		public function test_self():void{
			assertTrue( 'tests correct wiring of MathUtilTest itself, set to true to pass', true );
		}
		
		[Test(expects="Error")]
		public function test_calculateArea_throwsErrorIfPolygonNotClosed() : void{
			var rectangle : Vector.<Point> = createRectangle( 250 );
			rectangle.pop();
			
			var area : Number = MathUtil.calculateArea( rectangle );
		}
		
		[Test]
		public function test_calculateArea_returnsCorrectAreaForPoint() : void{
			var p : Point = new Point( 100, 100 );
			var point : Vector.<Point> = new Vector.<Point>();
			point.push( p );
			point.push( p );
			var area : Number = MathUtil.calculateArea( point );
			
			assertStrictlyEquals( 0, area );
		}
		
		[Test]
		public function test_calculateArea_returnsCorrectAreaForLine() : void{
			var length : Number = 250;
			var line : Vector.<Point> = createLine( length );
			var area : Number = MathUtil.calculateArea( line );
			
			assertStrictlyEquals( 0, area );
		}
		
		[Test]
		public function test_calculateArea_returnsCorrectAreaForRectangle() : void{
			const sideLength : Number = 250
			var rectangle : Vector.<Point> = createRectangle( 250 );
			var area : Number = MathUtil.calculateArea( rectangle );
			assertStrictlyEquals( sideLength * sideLength, area );
		}
		
		[Test]
		public function test_calculateArea_returnsCorrectAreaForTriangle() : void{
			const base : Number = 250;
			const height : Number = 500;
			var triangle : Vector.<Point> = createTriangle( base, height );
			var area : Number = MathUtil.calculateArea( triangle );
			assertStrictlyEquals( base * height / 2, area );
		}
		
		[Test]
		public function test_calculateArea_returnsCorrectAreaForPolygon() : void{
			var polygon : Vector.<Point> = createPolygon();
			var area : Number = MathUtil.calculateArea( polygon );
			assertStrictlyEquals( POLYGON_AREA, area );
		}
		
		[Test(expects="Error")]
		public function test_calculateCentroid_throwsErrorIfPolygonNotClosed() : void{
			var rectangle : Vector.<Point> = createRectangle( 250 );
			rectangle.pop();
			
			var centroid : Point = MathUtil.calculateCentroid( rectangle );
		}
		
		[Test]
		public function test_calculateCentroid_returnsNullForPoint() : void{
			var p : Point = new Point( 100, 100 );
			var point : Vector.<Point> = new Vector.<Point>();
			point.push( p );
			point.push( p );
			var centroid : Point = MathUtil.calculateCentroid( point );
			
			assertNull( centroid );
		}
		
		[Test]
		public function test_calculateCentroid_returnsCorrectCentroidForLine() : void{
			var length : Number = 250;
			var line : Vector.<Point> = createLine( length );
			var centroid : Point = MathUtil.calculateCentroid( line );
			assertNull( centroid );
		}
		
		[Test]
		public function test_calculateCentroid_returnsCorrectCentroidForRectangle() : void{
			const sideLength : Number = 250
			var rectangle : Vector.<Point> = createRectangle( 250 );
			var centroid : Point = MathUtil.calculateCentroid( rectangle );
			var expected : Point = new Point( sideLength / 2, sideLength / 2 );
			assertStrictlyEquals( expected.x, centroid.x );
			assertStrictlyEquals( expected.y, centroid.y );
		}
	}
}