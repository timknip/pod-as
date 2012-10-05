package pod
{
	import pod.enum.EPVRTDataType;

	public class CPODData
	{
		public var eType:uint;
		public var pData:Array;
		public var n:uint;
		public var nStride:uint;
		
		public function CPODData()
		{
			pData = [];
		}
		
		public function get floats():Vector.<Number>
		{
			if (eType != EPVRTDataType.EPODDataFloat)
			{
				return null;
			}
			return null;
		}
		
		public static function getDataSize(type:int):int
		{
			switch(type)
			{
				case EPVRTDataType.EPODDataFloat:
				case EPVRTDataType.EPODDataInt:
				case EPVRTDataType.EPODDataUnsignedInt:
					return 4;
				case EPVRTDataType.EPODDataShort:
				case EPVRTDataType.EPODDataShortNorm:
				case EPVRTDataType.EPODDataUnsignedShort:
				case EPVRTDataType.EPODDataUnsignedShortNorm:
					return 2;
				case EPVRTDataType.EPODDataRGBA:
				case EPVRTDataType.EPODDataARGB:
				case EPVRTDataType.EPODDataD3DCOLOR:
				case EPVRTDataType.EPODDataUBYTE4:
				case EPVRTDataType.EPODDataDEC3N:
				case EPVRTDataType.EPODDataFixed16_16:
					return 4;
				case EPVRTDataType.EPODDataUnsignedByte:
				case EPVRTDataType.EPODDataUnsignedByteNorm:
				case EPVRTDataType.EPODDataByte:
				case EPVRTDataType.EPODDataByteNorm:
					return 1;
				default:
					return 0;
			}
		}
	}
}