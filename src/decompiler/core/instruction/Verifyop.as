package decompiler.core.instruction
{
	public class Verifyop extends AbstractInstruction
	{
		public function Verifyop()
		{
			super();
		}
		
		override public function getForms():int
		{
			return 254;
		}
		
		override public function getName():String
		{
			return "verifyop";
		}
		
		
	}
}