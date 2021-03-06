package decompiler.tags.doabc.instruction
{
	import decompiler.utils.SWFUtil;
	
	import flash.utils.ByteArray;

	/**
	 * Format
		setlocal
		index
	 * index is a u30 that must be an index of a local register. The register at index is set to value,
		and value is popped off the stack.
	 * @author ukyohpq
	 * 
	 */
	public class Setlocal extends AbstractInstruction
	{
		private var _index:uint;

		public function get index():uint
		{
			return _index;
		}

		public function set index(value:uint):void
		{
			modify();
			_index = value;
		}

		public function Setlocal()
		{
			super();
		}
		
		override protected function pcodeDecodeFromBytes(byte:ByteArray):void
		{
			_index = SWFUtil.readU30(byte);
		}
		
		override protected function encodeBody(byte:ByteArray):void
		{
			SWFUtil.writeU30(byte, index);
		}
		
		override public function getForm():int
		{
			return 99;
		}
		
		override public function getName():String
		{
			return "setlocal";
		}
		
		override public function getParamNames():Vector.<String>
		{
			return new <String>[ "index" ];
		}
		
		override public function getParams():Vector.<int>
		{
			return new <int>[ _index ];
		}
		
		
//		override public function toString():String
//		{
//			return "[ setlocal index:" + index + " ]";
//		}
		
		override protected function stringBody():String
		{
			return "index:" + index;
		}
		
		override public function deltaNumStack():int
		{
			return -1;
		}
	}
}