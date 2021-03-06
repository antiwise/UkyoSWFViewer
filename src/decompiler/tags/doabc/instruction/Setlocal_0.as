package decompiler.tags.doabc.instruction
{
	/**
	 * Format
		setlocal_<n>
	 * <n> is an index of a local register. The register at that index is set to value, and value is
		popped off the stack.
	 * @author ukyohpq
	 * 
	 */
	public class Setlocal_0 extends AbstractInstruction
	{
		public function Setlocal_0()
		{
			super();
		}
		
		override public function getForm():int
		{
			return 212;
		}
		
		override public function getName():String
		{
			return "setlocal_0";
		}
		
		override public function deltaNumStack():int
		{
			return -1;
		}
	}
}