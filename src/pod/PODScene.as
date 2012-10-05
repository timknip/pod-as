package pod
{
	public class PODScene
	{
		public var nNumCamera:uint;
		public var nNumLight:uint;
		public var nNumMesh:uint;
		public var nNumNode:uint;
		public var nNumMeshNode:uint;
		public var nNumTexture:uint;
		public var nNumMaterial:uint;
		public var nNumFrame:uint;
		public var nFPS:uint;
		public var nFlags:uint;
		public var pCamera:Vector.<PODCamera>;
		public var pLight:Vector.<PODLight>;
		public var pMaterial:Vector.<PODMaterial>;
		public var pMesh:Vector.<PODMesh>;
		public var pNode:Vector.<PODNode>;
		public var pTexture:Vector.<PODTexture>;
		
		public function PODScene()
		{
			this.nNumCamera = 0;
			this.nNumLight = 0;
			this.nNumMesh = 0;
			this.nNumNode = 0;
			this.nNumMeshNode = 0;
			this.nNumTexture = 0;
			this.nNumMaterial = 0;
			this.nNumFrame = 0;
			this.nFPS = 0;
			this.nFlags = 0;
			this.pCamera = new Vector.<PODCamera>();
			this.pLight = new Vector.<PODLight>();
			this.pMaterial = new Vector.<PODMaterial>();
			this.pMesh = new Vector.<PODMesh>();
			this.pNode = new Vector.<PODNode>();
			this.pTexture = new Vector.<PODTexture>();
		}
	}
}