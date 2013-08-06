package decompiler.tags.doabc.classAndInstances
{
	import decompiler.core.IByteArrayReader;
	import decompiler.core.ISWFElement;
	import decompiler.core.trait.TraitsInfo;
	
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import decompiler.tags.doabc.ABCFile;
	
	import decompiler.utils.SWFUtil;
	
	/**
	 * The class_info entry is used to define characteristics of an ActionScript 3.0 class.
	 * class_info
		{
			u30 cinit
			u30 trait_count
			traits_info traits[trait_count]
		}
	 * @author ukyohpq
	 * 
	 */
	public class CClass implements IByteArrayReader, ISWFElement
	{
		/**
		 * This is an index into the method array of the abcFile; 
		 * it references the method that is invoked when the class is first created. 
		 * This method is also known as the static initializer for the class.
		 */
		private var _cinit:int;
		/**
		 * The value of trait_count is the number of entries in the trait array. 
		 * The trait array holds the traits for the class (see above for information on traits).
		 */
		private var _traitsArray:Vector.<TraitsInfo>;
		public function CClass()
		{
		}
		
		public function decodeFromBytes(byte:ByteArray):void
		{
			//read u30 cinit
			_cinit = SWFUtil.readU30(byte);
			trace("CClass cinit:" + ABCFile.getInstance().getMethodByIndex(_cinit));
			//read u30 trait_count
			var length:int = SWFUtil.readU30(byte);
			trace("CClass trait_count:" + length);
			_traitsArray = new Vector.<TraitsInfo>(length);
			
			for (var i:int = 0; i < length; ++i) 
			{
				var traitInfo:TraitsInfo = new TraitsInfo;
				traitInfo.decodeFromBytes(byte);
				_traitsArray[i] = traitInfo;
			}
		}
		
		public function encode():ByteArray
		{
			var byte:ByteArray = new ByteArray;
			byte.endian = Endian.LITTLE_ENDIAN;
			//write cinit
			SWFUtil.writeU30(byte, _cinit);
			
			//write trait_count
			var length:int = _traitsArray.length;
			SWFUtil.writeU30(byte, length);
			
			for (var i:int = 0; i < length; ++i) 
			{
				var tempByte:ByteArray = _traitsArray[i].encode();
				byte.writeBytes(tempByte);
				tempByte.clear();
			}
			
			return byte;
		}
		
		public function toString():String
		{
			var str:String = "";
			var length:int = _traitsArray.length;
			for (var i:int = 0; i < length; ++i) 
			{
				str += "\n" + _traitsArray[i];
			}
			
			return "[ CClass  cinit:" + ABCFile.getInstance().getMethodByIndex(_cinit) + " traits: " + str + " ]";
		}
	}
}