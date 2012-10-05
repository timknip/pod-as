package pod
{
	public class PODNode
	{
		public var nIdx:int = -1;              		/*!< Index into mesh, light or camera array, depending on which object list contains this Node */
		public var pszName:String = '';     		/*!< Name of object */
		public var nIdxMaterial:int = -1;      		/*!< Index of material used on this mesh */
		public var nIdxParent:int = -1;        		/*!< Index into MeshInstance array; recursively apply ancestor's transforms after this instance's. */
		public var nAnimFlags:int = 0;          	/*!< Stores which animation arrays the POD Node contains */
		public var pnAnimPositionIdx:Vector.<uint>;
		public var pfAnimPosition:Vector.<Number>;	/*!< 3 floats per frame of animation. */
		public var pnAnimRotationIdx:Vector.<uint>;
		public var pfAnimRotation:Vector.<Number>;	/*!< 4 floats per frame of animation. */
		public var pnAnimScaleIdx:Vector.<uint>;
		public var pfAnimScale:Vector.<Number>;		/*!< 7 floats per frame of animation. */
		public var pnAnimMatrixIdx:Vector.<uint>;
		public var pfAnimMatrix:Vector.<Number>;    /*!< 16 floats per frame of animation. */
		public var nUserDataSize:int = 0;
		public var pUserData:* = null;
		
		public function PODNode()
		{
		}
	}
}