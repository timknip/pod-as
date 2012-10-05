package pod.enum
{
	public class EPODFile
	{
		public static const Version:uint = 1000;
		public static const Scene:uint = 1001;
		public static const ExpOpt:uint = 1002;
		public static const History:uint = 1003;
		
		public static const ColourBackground:uint = 2000;
		public static const ColourAmbient:uint = 2001;
		public static const NumCamera:uint = 2002;
		public static const NumLight:uint = 2003;
		public static const NumMesh:uint = 2004;
		public static const NumNode:uint = 2005;
		public static const NumMeshNode:uint = 2006;
		public static const NumTexture:uint = 2007;
		public static const NumMaterial:uint = 2008;
		public static const NumFrame:uint = 2009;
		public static const Camera:uint = 2010;     // Will come multiple times
		public static const Light:uint = 2011;      // Will come multiple times
		public static const Mesh:uint = 2012;       // Will come multiple times
		public static const Node:uint = 2013;       // Will come multiple times
		public static const Texture:uint = 2014;    // Will come multiple times
		public static const Material:uint = 2015;   // Will come multiple times
		public static const Flags:uint = 2016;
		public static const FPS:uint = 2017;
		public static const UserData:uint = 2018;
		
		public static const MatName:uint = 3000;
		public static const MatIdxTexDiffuse:uint = 3001;
		public static const MatOpacity:uint = 3002;
		public static const MatAmbient:uint = 3003;
		public static const MatDiffuse:uint = 3004;
		public static const MatSpecular:uint = 3005;
		public static const MatShininess:uint = 3006;
		public static const MatEffectFile:uint = 3007;
		public static const MatEffectName:uint = 3008;
		public static const MatIdxTexAmbient:uint = 3009;
		public static const MatIdxTexSpecularColour:uint = 3010;
		public static const MatIdxTexSpecularLevel:uint = 3011;
		public static const MatIdxTexBump:uint = 3012;
		public static const MatIdxTexEmissive:uint = 3013;
		public static const MatIdxTexGlossiness:uint = 3014;
		public static const MatIdxTexOpacity:uint = 3015;
		public static const MatIdxTexReflection:uint = 3016;
		public static const MatIdxTexRefraction:uint = 3017;
		public static const MatBlendSrcRGB:uint = 3018;
		public static const MatBlendSrcA:uint = 3019;
		public static const MatBlendDstRGB:uint = 3020;
		public static const MatBlendDstA:uint = 3021;
		public static const MatBlendOpRGB:uint = 3022;
		public static const MatBlendOpA:uint = 3023;
		public static const MatBlendColour:uint = 3024;
		public static const MatBlendFactor:uint = 3025;
		public static const MatFlags:uint = 3026;
		public static const MatUserData:uint = 3027;
		
		public static const TexName:uint = 4000;
		
		public static const NodeIdx:uint = 5000;
		public static const NodeName:uint = 5001;
		public static const NodeIdxMat:uint = 5002;
		public static const NodeIdxParent:uint = 5003;
		public static const NodePos:uint = 5004;
		public static const NodeRot:uint = 5005;
		public static const NodeScale:uint = 5006;
		public static const NodeAnimPos:uint = 5007;
		public static const NodeAnimRot:uint = 5008;
		public static const NodeAnimScale:uint = 5009;
		public static const NodeMatrix:uint = 5010;
		public static const NodeAnimMatrix:uint = 5011;
		public static const NodeAnimFlags:uint = 5012;
		public static const NodeAnimPosIdx:uint = 5013;
		public static const NodeAnimRotIdx:uint = 5014;
		public static const NodeAnimScaleIdx:uint = 5015;
		public static const NodeAnimMatrixIdx:uint = 5016;
		public static const NodeUserData:uint = 5017;
		
		public static const MeshNumVtx:uint = 6000;
		public static const MeshNumFaces:uint = 6001;
		public static const MeshNumUVW:uint = 6002;
		public static const MeshFaces:uint = 6003;
		public static const MeshStripLength:uint = 6004;
		public static const MeshNumStrips:uint = 6005;
		public static const MeshVtx:uint = 6006;
		public static const MeshNor:uint = 6007;
		public static const MeshTan:uint = 6008;
		public static const MeshBin:uint = 6009;
		public static const MeshUVW:uint = 6010;            // Will come multiple times
		public static const MeshVtxCol:uint = 6011;
		public static const MeshBoneIdx:uint = 6012;
		public static const MeshBoneWeight:uint = 6013;
		public static const MeshInterleaved:uint = 6014;
		public static const MeshBoneBatches:uint = 6015;
		public static const MeshBoneBatchBoneCnts:uint = 6016;
		public static const MeshBoneBatchOffsets:uint = 6017;
		public static const MeshBoneBatchBoneMax:uint = 6018;
		public static const MeshBoneBatchCnt:uint = 6019;
		public static const MeshUnpackMatrix:uint = 6020;
		
		public static const LightIdxTgt:uint = 7000;
		public static const LightColour:uint = 7001;
		public static const LightType:uint = 7002;
		public static const LightConstantAttenuation:uint = 7003;
		public static const LightLinearAttenuation:uint = 7004;
		public static const LightQuadraticAttenuation:uint = 7005;
		public static const LightFalloffAngle:uint = 7006;
		public static const LightFalloffExponent:uint = 7007;
		
		public static const CamIdxTgt:uint = 8000;
		public static const CamFOV:uint = 8001;
		public static const CamFar:uint = 8002;
		public static const CamNear:uint = 8003;
		public static const CamAnimFOV:uint = 8004;
		
		public static const DataType:uint = 9000;
		public static const N:uint = 9001;
		public static const Stride:uint = 9002;
		public static const Data:uint = 9003;
	}
}