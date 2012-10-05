package pod
{
	import flash.geom.Matrix3D;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import pod.enum.EPODAnimationData;
	import pod.enum.EPODBlendFunc;
	import pod.enum.EPODBlendOp;
	import pod.enum.EPODFile;

	public class PODFile
	{	
		public static const PVRTMODELPOD_TAG_END:int = 0x80000000;
		
		private var _data:ByteArray;
		
		public function PODFile(data:ByteArray)
		{
			_data = data;
		}
		
		public function parse():PODScene
		{
			if (!_data)
			{
				return null;
			}
			
			
			_data.endian = Endian.LITTLE_ENDIAN;
			_data.position = 0;
			
			var marker:Marker = readMarker();
			var scene:PODScene = null;
			
			while (marker)
			{
				switch (marker.name)
				{
					case EPODFile.Scene:
						scene = readScene();
						break;
					default:
						_data.position += marker.len;
						break;
				}
				marker = readMarker();
			}
			
			return scene;
		}
		
		protected function readScene():PODScene
		{
			var marker:Marker = readMarker();
			var s:PODScene = new PODScene();
			
			while (marker)
			{
				switch (marker.name)
				{
					case (EPODFile.Scene | PVRTMODELPOD_TAG_END):
						return s;
					case EPODFile.NumCamera:
						s.nNumCamera = _data.readUnsignedInt();
						break;
					case EPODFile.NumLight:
						s.nNumLight = _data.readUnsignedInt();
						break;
					case EPODFile.NumMesh:
						s.nNumMesh = _data.readUnsignedInt();
						break;
					case EPODFile.NumNode:
						s.nNumNode = _data.readUnsignedInt();
						break;
					case EPODFile.NumMeshNode:
						s.nNumMeshNode = _data.readUnsignedInt();
						break;
					case EPODFile.NumTexture:
						s.nNumTexture = _data.readUnsignedInt();
						break;
					case EPODFile.NumMaterial:
						s.nNumMaterial = _data.readUnsignedInt();
						break;
					case EPODFile.NumFrame:
						s.nNumFrame = _data.readUnsignedInt();
						break;
					case EPODFile.FPS:
						s.nFPS = _data.readUnsignedInt();
						break;
					case EPODFile.Flags:
						s.nFlags = _data.readUnsignedInt();
						break;
					/*case EPODFile.Camera:
						s.pCamera.push(this.readCamera());
						break;
					case EPODFile.Light:
						s.pLight.push(this.readLight());
						break;*/
					case EPODFile.Material:
						s.pMaterial.push(this.readMaterial());
						break;
					case EPODFile.Mesh:
						s.pMesh.push(this.readMesh());
						break;
					case EPODFile.Node:
						s.pNode.push(this.readNode());
						break;
					case EPODFile.Texture:
						s.pTexture.push(this.readTexture());
						break;
					default:
						_data.position += marker.len;
						break;
				}
				marker = readMarker();
			}
			return s;
		}
		
		protected function readCamera():PODCamera
		{
			var marker:Marker = readMarker();
			
			while (marker)
			{
				switch (marker.name)
				{
					default:
						_data.position += marker.len;
						break;
				}
				marker = readMarker();
			}
			return null;
		}
		
		protected function readLight():PODLight
		{
			var marker:Marker = readMarker();
			
			while (marker)
			{
				switch (marker.name)
				{
					default:
						_data.position += marker.len;
						break;
				}
				marker = readMarker();
			}
			return null;
		}
		
		protected function readMaterial():PODMaterial
		{
			var marker:Marker = readMarker();
			var s:PODMaterial = new PODMaterial();
			
			// Set texture IDs to -1
			s.nIdxTexDiffuse = -1;
			s.nIdxTexAmbient = -1;
			s.nIdxTexSpecularColour = -1;
			s.nIdxTexSpecularLevel = -1;
			s.nIdxTexBump = -1;
			s.nIdxTexEmissive = -1;
			s.nIdxTexGlossiness = -1;
			s.nIdxTexOpacity = -1;
			s.nIdxTexReflection = -1;
			s.nIdxTexRefraction = -1;
			
			// Set defaults for blend modes
			s.eBlendSrcRGB = s.eBlendSrcA = EPODBlendFunc.ONE;
			s.eBlendDstRGB = s.eBlendDstA = EPODBlendFunc.ZERO;
			s.eBlendOpRGB  = s.eBlendOpA  = EPODBlendOp.ADD;
			
			// Set default for material flags
			s.nFlags = 0;
			
			// Set default for user data
			s.pUserData = null;
			s.nUserDataSize = 0;
			
			while (marker)
			{
				switch (marker.name)
				{
					case (EPODFile.Material | PVRTMODELPOD_TAG_END):
						return s;
					case EPODFile.MatFlags:
						s.nFlags = _data.readUnsignedInt();
						break;
					case EPODFile.MatName:
						s.pszName = _data.readMultiByte(marker.len, 'iso-8859-1');
						break;                
					case EPODFile.MatIdxTexDiffuse:
						s.nIdxTexDiffuse = _data.readUnsignedInt();
						break;
					case EPODFile.MatIdxTexAmbient:
						s.nIdxTexAmbient = _data.readUnsignedInt();
						break;
					case EPODFile.MatIdxTexSpecularColour:
						s.nIdxTexSpecularColour = _data.readUnsignedInt();
						break;
					case EPODFile.MatIdxTexSpecularLevel:
						s.nIdxTexSpecularLevel = _data.readUnsignedInt();
						break;
					case EPODFile.MatIdxTexBump:
						s.nIdxTexBump = _data.readUnsignedInt();
						break;
					case EPODFile.MatIdxTexEmissive:
						s.nIdxTexEmissive = _data.readUnsignedInt();
						break;
					case EPODFile.MatIdxTexGlossiness:
						s.nIdxTexGlossiness = _data.readUnsignedInt();
						break;
					case EPODFile.MatIdxTexOpacity:
						s.nIdxTexOpacity = _data.readUnsignedInt();
						break;
					case EPODFile.MatIdxTexReflection:
						s.nIdxTexReflection = _data.readUnsignedInt();
						break;
					case EPODFile.MatIdxTexRefraction:
						s.nIdxTexRefraction = _data.readUnsignedInt();
						break;
					case EPODFile.MatOpacity:
						s.fMatOpacity = _data.readUnsignedInt();
						break;                        
					case EPODFile.MatAmbient:
						s.pfMatAmbient = this.readColor(marker.len/4);
						break;
					case EPODFile.MatDiffuse:
						s.pfMatDiffuse = this.readColor(marker.len/4);
						break;
					case EPODFile.MatSpecular:
						s.pfMatSpecular = this.readColor(marker.len/4);
						break;
					case EPODFile.MatShininess:
						s.fMatShininess = _data.readUnsignedInt();
						break;
					case EPODFile.MatEffectFile:
						s.pszEffectFile = _data.readMultiByte(marker.len, 'iso-8859-1');
						break;
					case EPODFile.MatEffectName:
						s.pszEffectName = _data.readMultiByte(marker.len, 'iso-8859-1');
						break;
					case EPODFile.MatBlendSrcRGB:
						s.eBlendSrcRGB = _data.readUnsignedInt();
						break;
					case EPODFile.MatBlendSrcA:
						s.eBlendSrcA = _data.readUnsignedInt();
						break;
					case EPODFile.MatBlendDstRGB:
						s.eBlendDstRGB = _data.readUnsignedInt();
						break;
					case EPODFile.MatBlendDstA:
						s.eBlendDstA = _data.readUnsignedInt();
						break;
					case EPODFile.MatBlendOpRGB:
						s.eBlendOpRGB = _data.readUnsignedInt();
						break;
					case EPODFile.MatBlendOpA:
						s.eBlendOpA = _data.readUnsignedInt();
						break;
					case EPODFile.MatBlendColour:
						s.pfBlendColour = this.readColor(marker.len / 4);
						break;
					case EPODFile.MatBlendFactor:
						s.pfBlendFactor = this.readArray32(marker.len / 4);
						break;
					case EPODFile.MatUserData:
						s.pUserData = _data.readMultiByte(marker.len, 'iso-8859-1');
						break;
					default:
						_data.position += marker.len;
						break;
				}
				marker = readMarker();
			}
			return null;
		}
		
		protected function readMesh():PODMesh
		{
			var marker:Marker = readMarker();
			var mesh:PODMesh = new PODMesh();
			
			while (marker)
			{
				switch (marker.name)
				{
					case (EPODFile.Mesh | PVRTMODELPOD_TAG_END):
						return mesh;
					case EPODFile.MeshNumVtx:
						mesh.nNumVertex = _data.readUnsignedInt();
						break;
					case EPODFile.MeshNumFaces:
						mesh.nNumFaces = _data.readUnsignedInt();
						break;
					case EPODFile.MeshNumUVW:
						mesh.nNumUVW = _data.readUnsignedInt();
						break;
					case EPODFile.MeshStripLength:
						mesh.pnStripLength = readArray32(marker.len / 4);
						break;
					case EPODFile.MeshNumStrips:
						mesh.nNumStrips = _data.readUnsignedInt();
						break;
					case EPODFile.MeshInterleaved:
						_data.readBytes(mesh.pInterleaved, 0, marker.len);
						break;
					case EPODFile.MeshUnpackMatrix:
						mesh.mUnpackMatrix = this.readMatrix();
						break;
					case EPODFile.MeshFaces:
						mesh.sFaces = this.readCPODData(marker.name, true);
						break;
					case EPODFile.MeshVtx:
						mesh.sVertex = this.readCPODData(marker.name, (mesh.pInterleaved.length == 0));
						break;
					case EPODFile.MeshNor:
						mesh.sNormals = this.readCPODData(marker.name, (mesh.pInterleaved.length == 0));
						break;
					case EPODFile.MeshTan:
						mesh.sTangents = this.readCPODData(marker.name, (mesh.pInterleaved.length == 0));
						break;
					case EPODFile.MeshBin:
						mesh.sBinormals = this.readCPODData(marker.name, (mesh.pInterleaved.length == 0));
						break;
					case EPODFile.MeshUVW:
						var uvw:CPODData = this.readCPODData(marker.name, (mesh.pInterleaved.length == 0));
						mesh.psUVW.push(uvw);
						break;
					default:
						_data.position += marker.len;
						break;
				}
				marker = readMarker();
			}
			
			return null;
		}
		
		protected function readNode():PODNode
		{
			var marker:Marker = readMarker(),
				s:PODNode = new PODNode(),
				bOldNodeFormat:Boolean = false,
				fPos:Vector.<Number> = null,
				fQuat:Vector.<Number> = null,
				fScale:Vector.<Number> = null;
			
			s.nAnimFlags = 0;
			
			while (marker)
			{
				switch (marker.name)
				{
					case (EPODFile.Node | PVRTMODELPOD_TAG_END):
						if (bOldNodeFormat) {
							if(s.pfAnimPosition) {
								s.nAnimFlags |= EPODAnimationData.ePODHasPositionAni;
							} else {
								s.pfAnimPosition = fPos;
							}
							if(s.pfAnimRotation) {
								s.nAnimFlags |= EPODAnimationData.ePODHasRotationAni;
							} else {
								s.pfAnimRotation = fQuat;
							}
							if(s.pfAnimScale) {
								s.nAnimFlags |= EPODAnimationData.ePODHasScaleAni;
							} else {
								s.pfAnimScale = fScale;
							}
						}
						return s;
					case EPODFile.NodeIdx:
						s.nIdx = _data.readUnsignedInt();
						break;
					case EPODFile.NodeName:
						s.pszName = _data.readMultiByte(marker.len, 'iso-8859-1');
						break;
					case EPODFile.NodeIdxMat:
						s.nIdxMaterial = _data.readUnsignedInt();
						break;
					case EPODFile.NodeIdxParent:
						s.nIdxParent = _data.readUnsignedInt();
						break;
					case EPODFile.NodeAnimFlags:
						s.nAnimFlags = _data.readUnsignedInt();
						break;
					case EPODFile.NodeAnimPosIdx:
						s.pnAnimPositionIdx = this.readArray32(marker.len/4);
						break;
					case EPODFile.NodeAnimPos:
						s.pfAnimPosition = this.readArray32f(marker.len/4);
						break;
					case EPODFile.NodeAnimRotIdx:
						s.pnAnimRotationIdx = this.readArray32(marker.len/4);
						break;
					case EPODFile.NodeAnimRot:
						s.pfAnimRotation = this.readArray32f(marker.len/4);
						break;
					case EPODFile.NodeAnimScaleIdx:
						s.pnAnimScaleIdx = this.readArray32(marker.len/4);
						break;
					case EPODFile.NodeAnimScale:
						s.pfAnimScale = this.readArray32f(marker.len/4);
						break;
					case EPODFile.NodeAnimMatrixIdx:
						s.pnAnimMatrixIdx = this.readArray32(marker.len/4);
						break;
					case EPODFile.NodeAnimMatrix:
						s.pfAnimMatrix = this.readArray32f(marker.len/4);
						break;
					// Parameters from the older pod format
					case EPODFile.NodePos:
						fPos = this.readArray32f(marker.len/4);
						bOldNodeFormat = true;
						break;
					case EPODFile.NodeRot:
						fQuat = this.readArray32f(marker.len/4);
						bOldNodeFormat = true;
						break;
					case EPODFile.NodeScale:
						fScale = this.readArray32f(marker.len/4);
						bOldNodeFormat = true;
						break;
					default:
						_data.position += marker.len;
						break;
				}
				marker = readMarker();
			}
			return null;
		}
		
		protected function readTexture():PODTexture
		{
			var marker:Marker = readMarker();
			var s:PODTexture = new PODTexture();
			
			while (marker)
			{
				switch (marker.name)
				{
					case (EPODFile.Texture | PVRTMODELPOD_TAG_END):
						return s;
					case EPODFile.TexName:
						s.pszName = _data.readMultiByte(marker.len, 'iso-8859-1');
						break;
					default:
						_data.position += marker.len;
						break;
				}
				marker = readMarker();
			}
			return null;
		}
		
		protected function readMarker():Marker
		{
			if (_data.position + 8 >= _data.length - 1) {
				return null;
			}
			return new Marker(_data.readUnsignedInt(),
							  _data.readUnsignedInt());
		}
		
		protected function readArray32(len:uint):Vector.<uint>
		{
			var result:Vector.<uint> = new Vector.<uint>();
			for (var i:int = 0; i < len; i++) {
				result.push(_data.readUnsignedInt());
			}
			return result;
		}
		
		protected function readArray32f(len:uint):Vector.<Number>
		{
			var result:Vector.<Number> = new Vector.<Number>();
			for (var i:int = 0; i < len; i++) {
				result.push(_data.readFloat());
			}
			return result;
		}
		
		protected function readMatrix():Matrix3D
		{
			var v:Vector.<Number> = new Vector.<Number>();
			for (var i:int = 0; i < 16; i++)
			{
				v.push(_data.readFloat());
			}
			return new Matrix3D(v);
		}
		
		protected function readColor(len:uint):PODColor
		{
			var c:PODColor = new PODColor();
			for (var i:int = 0; i < len; i++) {
				var f:Number = _data.readFloat();
				switch (i)
				{
					case 0: c.r = f; break;
					case 1: c.g = f; break;
					case 2: c.b = f; break;
					case 3: c.a = f; break;
					default: break;
				}
			}
			return c;
		}
		
		protected function readCPODData(nSpec:int, bValidData:Boolean):CPODData
		{
			var marker:Marker = this.readMarker();
			var data:CPODData = new CPODData();
			var i:int;
			
			while (marker) {
				switch (marker.name) {
					case (nSpec | PVRTMODELPOD_TAG_END):
						return data;
					case EPODFile.DataType:
						data.eType = _data.readUnsignedInt();
						break;
					case EPODFile.N:
						data.n = _data.readUnsignedInt();
						break;
					case EPODFile.Stride:
						data.nStride = _data.readUnsignedInt();
						break;
					case EPODFile.Data:
						if (bValidData) {
							switch(CPODData.getDataSize(data.eType)) {
								case 1:
									for (i = 0; i < marker.len; i++) {
										data.pData.push(_data.readByte());
									}
									break;
								case 2:
									for (i = 0; i < marker.len / 2; i++) {
										data.pData.push(_data.readUnsignedShort());
									}
									break;
								case 4:
									for (i = 0; i < marker.len / 4; i++) {
										data.pData.push(_data.readUnsignedInt());
									}
									break;
								default:
									break;
							}
						} else {
							for (i = 0; i < 4; i++) {
								data.pData.push(_data.readByte());
							}
						}
						break;
					default:
						_data.position += marker.len;
						break;
				}
				marker = this.readMarker();
			}
			return null;
		}
		

	}
}

class Marker
{
	public var name:int;
	public var len:int;
	
	public function Marker(name:int, len:int)
	{
		this.name = name;
		this.len = len;
	}
}