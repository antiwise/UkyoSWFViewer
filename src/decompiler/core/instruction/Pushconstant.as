package decompiler.core.instruction
{
	/**
	 * Undocumented  push constant(常数)
	 * @author ukyohpq
	 * 
	 */
	public class Pushconstant extends AbstractInstruction
	{
		public function Pushconstant()
		{
			super();
		}
		
		override public function getForms():int
		{
			return 34;
		}
		
		override public function getName():String
		{
			return "pushconstant";
		}
		
		
	}
}