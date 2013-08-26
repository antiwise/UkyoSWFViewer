package decompiler.tags.doabc.instruction
{
	import decompiler.tags.doabc.ABCFile;
	import decompiler.tags.doabc.Reference;
	import decompiler.utils.SWFUtil;
	import decompiler.utils.SWFXML;
	
	import flash.utils.ByteArray;

	/**
	 * Format
		dxns
		index
	 * index is a u30 that must be an index into the string constant pool. 
	 * The string at index is used as the uri for the default XML namespace for this method.
	 * @author ukyohpq
	 * 
	 */
	public class Dxns extends AbstractInstruction
	{
		private var _index:uint;

		public function get index():uint
		{
			return _index;
		}

		public function set index(value:uint):void
		{
			modify();
			$abcFile.getStringByIndex(_index).removeReference(this, "index");
			_index = value;
			$abcFile.getStringByIndex(_index).addReference(this, "index");
		}

		public function Dxns()
		{
			super();
		}
		
		override public function getForm():int
		{
			return 6;
		}
		
		override public function getName():String
		{
			return "dxns";
		}
		
		override public function decodeFromBytes(byte:ByteArray):void
		{
			_index = SWFUtil.readU30(byte);
			super.decodeFromBytes(byte);
		}
		
		override public function creatRefrenceRelationship():void
		{
			$abcFile.getStringByIndex(_index).addReference(this, "index");
		}
		
		
		override protected function encodeBody(byte:ByteArray):void
		{
			SWFUtil.writeU30(byte, _index);
		}
		
//		override public function toString():String
//		{
//			return "[ dxns name:" + $abcFile.getStringByIndex(index) + " ]";
//		}
		
		override protected function stringBody():String
		{
			return "name:" + $abcFile.getStringByIndex(_index);
		}
		
		override public function getParams():Vector.<uint>
		{
			return new <uint>[_index];
		}
		
		override protected function paramsToXML(xml:SWFXML):void
		{
			xml.appendChild("<index>" + _index + "</index>");
		}
	}
}