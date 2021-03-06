package decompiler.tags.doabc.instruction
{
	/**
	 * Format
		subtract
	 * Pop value1 and value2 off of the stack and convert value1 and value2 to Number to create
		value1_number and value2_number. Subtract value2_number from value1_number. Push the
		result onto the stack.
	 * @author ukyohpq
	 * 
	 */
	public class Subtract extends AbstractInstruction
	{
		public function Subtract()
		{
			super();
		}
		
		override public function getForm():int
		{
			return 161;
		}
		
		override public function getName():String
		{
			return "subtract";
		}
		
		override public function deltaNumStack():int
		{
			return -1;
		}
	}
}