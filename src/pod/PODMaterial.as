package pod
{
	public class PODMaterial
	{
		public var pszName:String = "";         /*!< Name of material */
		public var nIdxTexDiffuse:int;        	/*!< Idx into pTexture for the diffuse texture */
		public var nIdxTexAmbient:int;        	/*!< Idx into pTexture for the ambient texture */
		public var nIdxTexSpecularColour:int;	/*!< Idx into pTexture for the specular colour texture */
		public var nIdxTexSpecularLevel:int;  	/*!< Idx into pTexture for the specular level texture */
		public var nIdxTexBump:int;           	/*!< Idx into pTexture for the bump map */
		public var nIdxTexEmissive:int;	    	/*!< Idx into pTexture for the emissive texture */
		public var nIdxTexGlossiness:int;     	/*!< Idx into pTexture for the glossiness texture */
		public var nIdxTexOpacity:int;        	/*!< Idx into pTexture for the opacity texture */
		public var nIdxTexReflection:int;     	/*!< Idx into pTexture for the reflection texture */
		public var nIdxTexRefraction:int;     	/*!< Idx into pTexture for the refraction texture */
		public var fMatOpacity:Number;          /*!< Material opacity (used with vertex alpha ?) */
		public var pfMatAmbient:PODColor;       /*!< Ambient RGB value */
		public var pfMatDiffuse:PODColor;       /*!< Diffuse RGB value */
		public var pfMatSpecular:PODColor;      /*!< Specular RGB value */
		public var fMatShininess:Number;        /*!< Material shininess */
		public var pszEffectFile:String;        /*!< Name of effect file */
		public var pszEffectName:String;        /*!< Name of effect in the effect file */
		public var eBlendSrcRGB:uint;       	/*!< Blending RGB source value */
		public var eBlendSrcA:Number;           /*!< Blending alpha source value */
		public var eBlendDstRGB:uint;       	/*!< Blending RGB destination value */
		public var eBlendDstA:Number;           /*!< Blending alpha destination value */
		public var eBlendOpRGB:uint;        	/*!< Blending RGB operation */
		public var eBlendOpA:Number;            /*!< Blending alpha operation */
		public var pfBlendColour:PODColor;      /*!< A RGBA colour to be used in blending */
		public var pfBlendFactor:Vector.<uint>; /*!< An array of blend factors, one for each RGBA component */
		public var nFlags:int = 0;            	/*!< Stores information about the material e.g. Enable blending */
		public var nUserDataSize:int;
		public var pUserData:*;
		
		public function PODMaterial()
		{
		}
	}
}