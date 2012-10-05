package pod
{
	import flash.geom.Matrix3D;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	public class PODMesh
	{
		public var nNumVertex:uint = 0;        			/*!< Number of vertices in the mesh */
		public var nNumFaces:uint = 0;         			/*!< Number of triangles in the mesh */
		public var nNumUVW:uint = 0;           			/*!< Number of texture coordinate channels per vertex */
		public var sFaces:CPODData;         			/*!< List of triangle indices */
		public var pnStripLength:Vector.<uint>;    		/*!< If mesh is stripped: number of tris per strip. */
		public var nNumStrips:uint = 0;        			/*!< If mesh is stripped: number of strips, length of pnStripLength array. */
		public var sVertex:CPODData;        			/*!< List of vertices (x0, y0, z0, x1, y1, z1, x2, etc...) */
		public var sNormals:CPODData;       			/*!< List of vertex normals (Nx0, Ny0, Nz0, Nx1, Ny1, Nz1, Nx2, etc...) */
		public var sTangents:CPODData;      			/*!< List of vertex tangents (Tx0, Ty0, Tz0, Tx1, Ty1, Tz1, Tx2, etc...) */
		public var sBinormals:CPODData;     			/*!< List of vertex binormals (Bx0, By0, Bz0, Bx1, By1, Bz1, Bx2, etc...) */
		public var psUVW:Vector.<CPODData>;	/*!< List of UVW coordinate sets; size of array given by 'nNumUVW' */
		public var sVtxColours:Vector.<PODColor>;		/*!< A colour per vertex */
		public var sBoneIdx:Vector.<int>;       		/*!< nNumBones*nNumVertex ints (Vtx0Idx0, Vtx0Idx1, ... Vtx1Idx0, Vtx1Idx1, ...) */
		public var sBoneWeight:Vector.<Number>;    		/*!< nNumBones*nNumVertex floats (Vtx0Wt0, Vtx0Wt1, ... Vtx1Wt0, Vtx1Wt1, ...) */
		public var pInterleaved:ByteArray;    			/*!< Interleaved vertex data */
		public var sBoneBatches:Array;   				/*!< Bone tables */
		public var ePrimitiveType:int;    				/*!< Primitive type used by this mesh */
		public var mUnpackMatrix:Matrix3D;    			/*!< A matrix used for unscaling scaled vertex data created with PVRTModelPODScaleAndConvertVtxData*/
		
		public function PODMesh()
		{
			psUVW = new Vector.<CPODData>();
			pInterleaved = new ByteArray();
			pInterleaved.endian = Endian.LITTLE_ENDIAN;
		}
	}
}