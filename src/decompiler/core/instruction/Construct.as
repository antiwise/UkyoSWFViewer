package decompiler.core.instruction
{
	import flash.utils.ByteArray;
	
	import decompiler.utils.SWFUtil;

	/**
	 * Format
		construct
		arg_count
	 * arg_count is a u30 that is the number of arguments present on the stack. 
	 * object is the function that is being constructed. 
	 * This will invoke the [[Construct]] property on object with the given arguments. 
	 * The new instance generated by invoking [[Construct]] will be pushed onto the stack.
	 * @author ukyohpq
	 * 
	 */
	public class Construct extends AbstractInstruction
	{
		private var arg_count:uint;
		public function Construct()
		{
			super();
		}
		
		override public function getForms():int
		{
			return 66;
		}
		
		override public function getName():String
		{
			return "construct";
		}
		
		override public function decodeFromBytes(byte:ByteArray):void
		{
			arg_count = SWFUtil.readU30(byte);
		}
		
		override protected function encodeBody(byte:ByteArray):void
		{
			SWFUtil.writeU30(byte, arg_count);
		}
		
//		override public function toString():String
//		{
//			return "[ construct arg_count:" + arg_count + " ]";
//		}
		
		override protected function stringBody():String
		{
			return "arg_count:" + arg_count;
		}
		
		
		
		
	}
}