package decompiler.core.instruction
{
	/**
	 * Format
		label
	 * 	Do nothing. Used to indicate that this location is the target of a branch
	 * @author ukyohpq
	 * 
	 */
	public class Label extends AbstractInstruction
	{
		public function Label()
		{
			super();
		}
		
		override public function getForms():int
		{
			return 9;
		}
		
		override public function getName():String
		{
			return "label";
		}
		
		
	}
}