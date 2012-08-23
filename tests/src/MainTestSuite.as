package
{
	import be.creynders.lib.utils.MathUtilTest;

	/**
	 * @author creynder
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MainTestSuite{
		public function MainTestSuite()
		{
			trace( this );
		}
		
		public var mathUtilTest : MathUtilTest;
	}
}