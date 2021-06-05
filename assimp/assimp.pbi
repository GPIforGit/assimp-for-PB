;
; converted by gpi for PureBasic
;
; for Version 5.01
;
;---------------------------------------------------------------------------
;Open Asset Import Library (assimp)
;---------------------------------------------------------------------------
;
;Copyright (c) 2006-2019, assimp team
;
;
;
;All rights reserved.
;
;Redistribution and use of this software in source and binary forms,
;with or without modification, are permitted provided that the following
;conditions are met:
;
;* Redistributions of source code must retain the above
;  copyright notice, this list of conditions and the
;  following disclaimer.
;
;* Redistributions in binary form must reproduce the above
;  copyright notice, this list of conditions and the
;  following disclaimer in the documentation and/or other
;  materials provided with the distribution.
;
;* Neither the name of the assimp team, nor the names of its
;  contributors may be used to endorse or promote products
;  derived from this software without specific prior
;  written permission of the assimp team.
;
;THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
;LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;---------------------------------------------------------------------------
DeclareModule ai
  CompilerSelect #PB_Compiler_OS 
    CompilerCase #PB_OS_Windows
      #assimp_LIB="assimp-5.01.lib"
      #FuncPrefix=""
    CompilerCase #PB_OS_MacOS
      #assimp_LIB="/Library/Frameworks/assimp.framework/assimp"
      #FuncPrefix="_"
    CompilerCase #PB_OS_Linux
      #assimp_LIB="-lassimp"
      #FuncPrefix=""
    CompilerDefault
      CompilerError "Os is not supported!"
  CompilerEndSelect
;-----------------------
;- config.h.pbi
;{

#CONFIG_GLOB_MEASURE_TIME = "GLOB_MEASURE_TIME"
#CONFIG_IMPORT_NO_SKELETON_MESHES = "IMPORT_NO_SKELETON_MESHES"
#CONFIG_PP_SBBC_MAX_BONES = "PP_SBBC_MAX_BONES"
#SBBC_DEFAULT_MAX_BONES = 60
#CONFIG_PP_CT_MAX_SMOOTHING_ANGLE = "PP_CT_MAX_SMOOTHING_ANGLE"
#CONFIG_PP_CT_TEXTURE_CHANNEL_INDEX = "PP_CT_TEXTURE_CHANNEL_INDEX"
#CONFIG_PP_GSN_MAX_SMOOTHING_ANGLE = "PP_GSN_MAX_SMOOTHING_ANGLE"
#CONFIG_PP_RRM_EXCLUDE_LIST = "PP_RRM_EXCLUDE_LIST"
#CONFIG_PP_PTV_KEEP_HIERARCHY = "PP_PTV_KEEP_HIERARCHY"
#CONFIG_PP_PTV_NORMALIZE = "PP_PTV_NORMALIZE"
#CONFIG_PP_PTV_ADD_ROOT_TRANSFORMATION = "PP_PTV_ADD_ROOT_TRANSFORMATION"
#CONFIG_PP_PTV_ROOT_TRANSFORMATION = "PP_PTV_ROOT_TRANSFORMATION"
#CONFIG_PP_FD_REMOVE = "PP_FD_REMOVE"
#CONFIG_PP_FD_CHECKAREA = "PP_FD_CHECKAREA"
#CONFIG_PP_OG_EXCLUDE_LIST = "PP_OG_EXCLUDE_LIST"
#CONFIG_PP_SLM_TRIANGLE_LIMIT  = "PP_SLM_TRIANGLE_LIMIT"
#SLM_DEFAULT_MAX_TRIANGLES = 1000000
#CONFIG_PP_SLM_VERTEX_LIMIT  = "PP_SLM_VERTEX_LIMIT"
#SLM_DEFAULT_MAX_VERTICES = 1000000
#CONFIG_PP_LBW_MAX_WEIGHTS     = "PP_LBW_MAX_WEIGHTS"
#LMW_MAX_WEIGHTS = $4
#CONFIG_PP_DB_THRESHOLD  = "PP_DB_THRESHOLD"
#DEBONE_THRESHOLD = 1.0
#CONFIG_PP_DB_ALL_OR_NONE  = "PP_DB_ALL_OR_NONE"
#PP_ICL_PTCACHE_SIZE = 12
#CONFIG_PP_ICL_PTCACHE_SIZE =  "PP_ICL_PTCACHE_SIZE"
Enumeration Component
  #Component_NORMALS = $2
  #Component_TANGENTS_AND_BITANGENTS = $4
  #Component_COLORS = $8
  #Component_TEXCOORDS = $10
  #Component_BONEWEIGHTS = $20
  #Component_ANIMATIONS = $40
  #Component_TEXTURES = $80
  #Component_LIGHTS = $100
  #Component_CAMERAS = $200
  #Component_MESHES = $400
  #Component_MATERIALS = $800
  #_Component_Force32Bit = $9fffffff
EndEnumeration
Macro Component_COLORSn(n) 
  (1 << (n+20))
EndMacro
Macro Component_TEXCOORDSn(n) 
  (1 << (n+25))
EndMacro
#CONFIG_PP_RVC_FLAGS               = "PP_RVC_FLAGS"
#CONFIG_PP_SBP_REMOVE              = "PP_SBP_REMOVE"
#CONFIG_PP_FID_ANIM_ACCURACY               = "PP_FID_ANIM_ACCURACY"
#CONFIG_PP_FID_IGNORE_TEXTURECOORDS         = "PP_FID_IGNORE_TEXTURECOORDS"
#UVTRAFO_SCALING = $1
#UVTRAFO_ROTATION = $2
#UVTRAFO_TRANSLATION = $4
#UVTRAFO_ALL = (#UVTRAFO_SCALING | #UVTRAFO_ROTATION | #UVTRAFO_TRANSLATION)
#CONFIG_PP_TUV_EVALUATE                = "PP_TUV_EVALUATE"
#CONFIG_FAVOUR_SPEED    = "FAVOUR_SPEED"
#CONFIG_IMPORT_FBX_READ_ALL_GEOMETRY_LAYERS  = "IMPORT_FBX_READ_ALL_GEOMETRY_LAYERS"
#CONFIG_IMPORT_FBX_READ_ALL_MATERIALS  = "IMPORT_FBX_READ_ALL_MATERIALS"
#CONFIG_IMPORT_FBX_READ_MATERIALS  = "IMPORT_FBX_READ_MATERIALS"
#CONFIG_IMPORT_FBX_READ_TEXTURES  = "IMPORT_FBX_READ_TEXTURES"
#CONFIG_IMPORT_FBX_READ_CAMERAS  = "IMPORT_FBX_READ_CAMERAS"
#CONFIG_IMPORT_FBX_READ_LIGHTS  = "IMPORT_FBX_READ_LIGHTS"
#CONFIG_IMPORT_FBX_READ_ANIMATIONS  = "IMPORT_FBX_READ_ANIMATIONS"
#CONFIG_IMPORT_FBX_STRICT_MODE  = "IMPORT_FBX_STRICT_MODE"
#CONFIG_IMPORT_FBX_PRESERVE_PIVOTS  = "IMPORT_FBX_PRESERVE_PIVOTS"
#CONFIG_IMPORT_FBX_OPTIMIZE_EMPTY_ANIMATION_CURVES  = "IMPORT_FBX_OPTIMIZE_EMPTY_ANIMATION_CURVES"
#CONFIG_IMPORT_FBX_EMBEDDED_TEXTURES_LEGACY_NAMING =	"AI_CONFIG_IMPORT_FBX_EMBEDDED_TEXTURES_LEGACY_NAMING"
#CONFIG_IMPORT_REMOVE_EMPTY_BONES  = "AI_CONFIG_IMPORT_REMOVE_EMPTY_BONES"
#CONFIG_FBX_CONVERT_TO_M  = "AI_CONFIG_FBX_CONVERT_TO_M"
#CONFIG_IMPORT_GLOBAL_KEYFRAME   = "IMPORT_GLOBAL_KEYFRAME"
#CONFIG_IMPORT_MD3_KEYFRAME      = "IMPORT_MD3_KEYFRAME"
#CONFIG_IMPORT_MD2_KEYFRAME      = "IMPORT_MD2_KEYFRAME"
#CONFIG_IMPORT_MDL_KEYFRAME      = "IMPORT_MDL_KEYFRAME"
#CONFIG_IMPORT_MDC_KEYFRAME      = "IMPORT_MDC_KEYFRAME"
#CONFIG_IMPORT_SMD_KEYFRAME      = "IMPORT_SMD_KEYFRAME"
#CONFIG_IMPORT_UNREAL_KEYFRAME   = "IMPORT_UNREAL_KEYFRAME"
#CONFIG_IMPORT_SMD_LOAD_ANIMATION_LIST = "IMPORT_SMD_LOAD_ANIMATION_LIST"
#CONFIG_IMPORT_AC_SEPARATE_BFCULL  = "IMPORT_AC_SEPARATE_BFCULL"
#CONFIG_IMPORT_AC_EVAL_SUBDIVISION     = "IMPORT_AC_EVAL_SUBDIVISION"
#CONFIG_IMPORT_UNREAL_HANDLE_FLAGS  = "UNREAL_HANDLE_FLAGS"
#CONFIG_IMPORT_TER_MAKE_UVS  = "IMPORT_TER_MAKE_UVS"
#CONFIG_IMPORT_ASE_RECONSTRUCT_NORMALS     = "IMPORT_ASE_RECONSTRUCT_NORMALS"
#CONFIG_IMPORT_MD3_HANDLE_MULTIPART  = "IMPORT_MD3_HANDLE_MULTIPART"
#CONFIG_IMPORT_MD3_SKIN_NAME  = "IMPORT_MD3_SKIN_NAME"
#CONFIG_IMPORT_MD3_SHADER_SRC  = "IMPORT_MD3_SHADER_SRC"
#CONFIG_IMPORT_LWO_ONE_LAYER_ONLY          = "IMPORT_LWO_ONE_LAYER_ONLY"
#CONFIG_IMPORT_MD5_NO_ANIM_AUTOLOAD            = "IMPORT_MD5_NO_ANIM_AUTOLOAD"
#CONFIG_IMPORT_LWS_ANIM_START          = "IMPORT_LWS_ANIM_START"
#CONFIG_IMPORT_LWS_ANIM_END            = "IMPORT_LWS_ANIM_END"
#CONFIG_IMPORT_IRR_ANIM_FPS                = "IMPORT_IRR_ANIM_FPS"
#CONFIG_IMPORT_OGRE_MATERIAL_FILE  = "IMPORT_OGRE_MATERIAL_FILE"
#CONFIG_IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME  = "IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME"
#CONFIG_ANDROID_JNI_ASSIMP_MANAGER_SUPPORT = "AI_CONFIG_ANDROID_JNI_ASSIMP_MANAGER_SUPPORT"
#CONFIG_IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS = "IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS"
#CONFIG_IMPORT_IFC_CUSTOM_TRIANGULATION = "IMPORT_IFC_CUSTOM_TRIANGULATION"
#CONFIG_IMPORT_IFC_SMOOTHING_ANGLE = "IMPORT_IFC_SMOOTHING_ANGLE"
#IMPORT_IFC_DEFAULT_SMOOTHING_ANGLE = 10.0
#CONFIG_IMPORT_IFC_CYLINDRICAL_TESSELLATION = "IMPORT_IFC_CYLINDRICAL_TESSELLATION"
#IMPORT_IFC_DEFAULT_CYLINDRICAL_TESSELLATION = 32
#CONFIG_IMPORT_COLLADA_IGNORE_UP_DIRECTION = "IMPORT_COLLADA_IGNORE_UP_DIRECTION"
#CONFIG_IMPORT_COLLADA_USE_COLLADA_NAMES = "IMPORT_COLLADA_USE_COLLADA_NAMES"
#CONFIG_EXPORT_XFILE_64BIT = "EXPORT_XFILE_64BIT"
#CONFIG_EXPORT_POINT_CLOUDS = "EXPORT_POINT_CLOUDS"
#CONFIG_GLOBAL_SCALE_FACTOR_KEY = "GLOBAL_SCALE_FACTOR"
#CONFIG_GLOBAL_SCALE_FACTOR_DEFAULT = 1.0
#CONFIG_APP_SCALE_KEY = "APP_SCALE_FACTOR"
;#CONFIG_APP_SCALE_KEY = 1.0
;}
;-----------------------
;- defs.h.pbi
;{

Macro real
  f
EndMacro
Macro int
  w
EndMacro
Macro uint
  u
EndMacro
#MATH_PI         = #PI
#MATH_TWO_PI     = (#MATH_PI * 2.0)
#MATH_HALF_PI    = (#MATH_PI * 0.5)
#MATH_PI_F       = #PI
#MATH_TWO_PI_F   = (#MATH_PI_F * 2.0)
#MATH_HALF_PI_F  = (#MATH_PI_F * 0.5)
Macro DEG_TO_RAD(x) 
  ((x) * 0.0174532925)
EndMacro
Macro RAD_TO_DEG(x) 
  ((x) * 57.2957795)
EndMacro
Macro MAX_ALLOC(type) 
  ((256 * 1024 * 1024) / SizeOf(type))
EndMacro
;}
;-----------------------
;- vector3.h.pbi
;{

Structure Vector3D Align #PB_Structure_AlignC
  x.real
  y.real 
  z.real
EndStructure
;}
;-----------------------
;- vector2.h.pbi
;{

Structure Vector2D Align #PB_Structure_AlignC
  x.real
  y.real
EndStructure
;}
;-----------------------
;- color4.h.pbi
;{

Structure Color4D Align #PB_Structure_AlignC
  r.real
  g.real
  b.real
  a.real
EndStructure
;}
;-----------------------
;- matrix3x3.h.pbi
;{

Structure Matrix3x3 Align #PB_Structure_AlignC
  a1.real
  a2.real
  a3.real
  b1.real
  b2.real
  b3.real
  c1.real
  c2.real
  c3.real
EndStructure
;}
;-----------------------
;- matrix4x4.h.pbi
;{

Structure Matrix4x4 Align #PB_Structure_AlignC
  a1.real  
  a2.real  
  a3.real  
  a4.real
  b1.real  
  b2.real  
  b3.real  
  b4.real
  c1.real  
  c2.real  
  c3.real  
  c4.real
  d1.real  
  d2.real  
  d3.real  
  d4.real
EndStructure
;}
;-----------------------
;- quaternion.h.pbi
;{

Structure Quaternion Align #PB_Structure_AlignC
  w.real
  x.real
  y.real
  z.real
EndStructure
;}
;-----------------------
;- types.h.pbi
;{

Macro int32
  l
EndMacro
Macro uint32
  l
EndMacro
#MAXLEN = 1024
Structure Plane Align #PB_Structure_AlignC
  a.real
  b.real
  c.real
  d.real
EndStructure
Structure Ray Align #PB_Structure_AlignC
  pos.Vector3D
  dir.Vector3D
EndStructure
Structure Color3D Align #PB_Structure_AlignC
  r.real
  g.real
  b.real
EndStructure
Structure aiString Align #PB_Structure_AlignC
  length.uint32
  Data.b[#MAXLEN]
EndStructure
Enumeration aiReturn
  #Return_SUCCESS = $0
  #Return_FAILURE = -$1
  #Return_OUTOFMEMORY = -$3
  #_ENFORCE_ENUM_SIZE = $7fffffff
EndEnumeration
#SUCCESS     = #Return_SUCCESS
#FAILURE     = #Return_FAILURE
#OUTOFMEMORY = #Return_OUTOFMEMORY
Enumeration Origin
  #Origin_SET = $0
  #Origin_CUR = $1
  #Origin_END = $2
  #_ORIGIN_ENFORCE_ENUM_SIZE = $7fffffff
EndEnumeration
Enumeration DefaultLogStream
  #DefaultLogStream_FILE = $1
  #DefaultLogStream_STDOUT = $2
  #DefaultLogStream_STDERR = $4
  #DefaultLogStream_DEBUGGER = $8
  #_DLS_ENFORCE_ENUM_SIZE = $7fffffff
EndEnumeration
#DLS_FILE     = #DefaultLogStream_FILE
#DLS_STDOUT   = #DefaultLogStream_STDOUT
#DLS_STDERR   = #DefaultLogStream_STDERR
#DLS_DEBUGGER = #DefaultLogStream_DEBUGGER
Structure MemoryInfo Align #PB_Structure_AlignC
  textures.l
  materials.l
  meshes.l
  nodes.l
  animations.l
  cameras.l
  lights.l
  total.l
EndStructure
;}
;-----------------------
;- importerdesc.h.pbi
;{

Enumeration ImporterFlags
  #ImporterFlags_SupportTextFlavour = $1
  #ImporterFlags_SupportBinaryFlavour = $2
  #ImporterFlags_SupportCompressedFlavour = $4
  #ImporterFlags_LimitedSupport = $8
  #ImporterFlags_Experimental = $10
EndEnumeration
Structure ImporterDesc Align #PB_Structure_AlignC
  *mName.ascii
  *mAuthor.ascii
  *mMaintainer.ascii
  *mComments.ascii
  mFlags.l
  mMinMajor.l
  mMinMinor.l
  mMaxMajor.l
  mMaxMinor.l
  *mFileExtensions.ascii
EndStructure
ImportC #assimp_LIB
  GetImporterDesc.i ( extension.p-utf8 ) As #FuncPrefix + "aiGetImporterDesc"
EndImport
;}
;-----------------------
;- texture.h.pbi
;{

Structure Texel ;packed
  b.a
  g.a
  r.a
  a.a
EndStructure
#HINTMAXTEXTURELEN = 9
Structure Texture Align #PB_Structure_AlignC
  mWidth.l
  mHeight.l
  achFormatHint.ascii[ #HINTMAXTEXTURELEN ]; 8 for string + 1 for terminator.
  *pcData.Texel
  mFilename.aiString
EndStructure
;}
;-----------------------
;- aabb.h.pbi
;{

Structure AABB Align #PB_Structure_AlignC
  mMin.Vector3D
  mMax.Vector3D
EndStructure
;}
;-----------------------
;- mesh.h.pbi
;{

#MAX_FACE_INDICES = $7fff
#MAX_BONE_WEIGHTS = $7fffffff
#MAX_VERTICES = $7fffffff
#MAX_FACES = $7fffffff
#MAX_NUMBER_OF_COLOR_SETS = $8
#MAX_NUMBER_OF_TEXTURECOORDS = $8
Structure longarray
  l.l[0]
EndStructure
Structure Face Align #PB_Structure_AlignC
  mNumIndices.l
  *mIndices.longarray
EndStructure
Structure VertexWeight Align #PB_Structure_AlignC
  mVertexId.l
  mWeight.f
EndStructure
Structure Bone Align #PB_Structure_AlignC
  mName.aiString
  mNumWeights.l
  *mWeights.VertexWeight
  mOffsetMatrix.Matrix4x4
EndStructure
Enumeration PrimitiveType
  #PrimitiveType_POINT       = $1
  #PrimitiveType_LINE        = $2
  #PrimitiveType_TRIANGLE    = $4
  #PrimitiveType_POLYGON     = $8
EndEnumeration
Declare PRIMITIVE_TYPE_FOR_N_INDICES(n)
Structure ppVector3D
  v.Vector3D[0]
EndStructure 
Structure ppColor4D
  c.Color4D[0]
EndStructure
Structure AnimMesh Align #PB_Structure_AlignC
  mName.aiString
  *mVertices.ppVector3D
  *mNormals.ppVector3D
  *mTangents.ppVector3D
  *mBitangents.ppVector3D
  *mColors.ppColor4D[#MAX_NUMBER_OF_COLOR_SETS]
  *mTextureCoords.ppVector3D[#MAX_NUMBER_OF_TEXTURECOORDS]
  mNumVertices.l
  mWeight.f
EndStructure
Enumeration MorphingMethod 
  #MorphingMethod_VERTEX_BLEND       = $1
  #MorphingMethod_MORPH_NORMALIZED   = $2
  #MorphingMethod_MORPH_RELATIVE     = $3
EndEnumeration
Structure ppFace
  f.Face[0]
EndStructure
Structure ppBone
  b.Bone[0]
EndStructure
Structure ppAnimMesh
  a.AnimMesh[0]
EndStructure
Structure Mesh Align #PB_Structure_AlignC
  mPrimitiveTypes.l  
  mNumVertices.l
  mNumFaces.l
  *mVertices.ppVector3D
  *mNormals.ppVector3D
  *mTangents.ppVector3D
  *mBitangents.ppVector3D
  *mColors.ppColor4D[#MAX_NUMBER_OF_COLOR_SETS]
  *mTextureCoords.ppVector3D[#MAX_NUMBER_OF_TEXTURECOORDS]
  mNumUVComponents.l[#MAX_NUMBER_OF_TEXTURECOORDS]
  *mFaces.ppFace
  mNumBones.l
  *mBones.ppBone
  mMaterialIndex.l
  mName.aiString
  mNumAnimMeshes.l
  *mAnimMeshes.ppAnimMesh
  mMethod.l
  mAABB.AABB
EndStructure
;}
;-----------------------
;- light.h.pbi
;{

Enumeration LightSourceType
  #LightSource_UNDEFINED     = $0
  #LightSource_DIRECTIONAL   = $1
  #LightSource_POINT         = $2
  #LightSource_SPOT          = $3
  #LightSource_AMBIENT       = $4
  #LightSource_AREA          = $5
EndEnumeration
Structure Light Align #PB_Structure_AlignC
  mName.aiString
  mType.l
  mPosition.Vector3D
  mDirection.Vector3D
  mUp.Vector3D
  mAttenuationConstant.f
  mAttenuationLinear.f
  mAttenuationQuadratic.f
  mColorDiffuse.Color3D
  mColorSpecular.Color3D
  mColorAmbient.Color3D
  mAngleInnerCone.f
  mAngleOuterCone.f
  mSize.Vector2D
EndStructure
;}
;-----------------------
;- camera.h.pbi
;{

Structure Camera Align #PB_Structure_AlignC
  mName.aiString
  mPosition.Vector3D
  mUp.Vector3D
  mLookAt.Vector3D
  mHorizontalFOV.f
  mClipPlaneNear.f
  mClipPlaneFar.f
  mAspect.f
EndStructure
;}
;-----------------------
;- material.h.pbi
;{

#DEFAULT_MATERIAL_NAME         = "DefaultMaterial"
Enumeration TextureOp
  #TextureOp_Multiply = $0
  #TextureOp_Add = $1
  #TextureOp_Subtract = $2
  #TextureOp_Divide = $3
  #TextureOp_SmoothAdd = $4
  #TextureOp_SignedAdd = $5
EndEnumeration
Enumeration TextureMapMode
  #TextureMapMode_Wrap = $0
  #TextureMapMode_Clamp = $1
  #TextureMapMode_Decal = $3
  #TextureMapMode_Mirror = $2
EndEnumeration
Enumeration TextureMapping
  #TextureMapping_UV = $0
  #TextureMapping_SPHERE = $1
  #TextureMapping_CYLINDER = $2
  #TextureMapping_BOX = $3
  #TextureMapping_PLANE = $4
  #TextureMapping_OTHER = $5
EndEnumeration
Enumeration TextureType
  #TextureType_NONE = 0
  #TextureType_DIFFUSE = 1
  #TextureType_SPECULAR = 2
  #TextureType_AMBIENT = 3
  #TextureType_EMISSIVE = 4
  #TextureType_HEIGHT = 5
  #TextureType_NORMALS = 6
  #TextureType_SHININESS = 7
  #TextureType_OPACITY = 8
  #TextureType_DISPLACEMENT = 9
  #TextureType_LIGHTMAP = 10
  #TextureType_REFLECTION = 11
  #TextureType_BASE_COLOR = 12
  #TextureType_NORMAL_CAMERA = 13
  #TextureType_EMISSION_COLOR = 14
  #TextureType_METALNESS = 15
  #TextureType_DIFFUSE_ROUGHNESS = 16
  #TextureType_AMBIENT_OCCLUSION = 17
  #TextureType_UNKNOWN = 18
EndEnumeration
Enumeration ShadingMode
  #ShadingMode_Flat = $1
  #ShadingMode_Gouraud = $2
  #ShadingMode_Phong = $3
  #ShadingMode_Blinn = $4
  #ShadingMode_Toon = $5
  #ShadingMode_OrenNayar = $6
  #ShadingMode_Minnaert = $7
  #ShadingMode_CookTorrance = $8
  #ShadingMode_NoShading = $9
  #ShadingMode_Fresnel = $a
EndEnumeration
Enumeration TextureFlags
  #TextureFlags_Invert = $1
  #TextureFlags_UseAlpha = $2
  #TextureFlags_IgnoreAlpha = $4
EndEnumeration
Enumeration BlendMode
  #BlendMode_Default = $0
  #BlendMode_Additive = $1
EndEnumeration
Structure UVTransform ;packed
  mTranslation.Vector2D
  mScaling.Vector2D
  mRotation.real
EndStructure
Enumeration PropertyTypeInfo
  #PTI_Float   = $1
  #PTI_Double   = $2
  #PTI_String  = $3
  #PTI_Integer = $4
  #PTI_Buffer  = $5
EndEnumeration
Structure MaterialProperty Align #PB_Structure_AlignC
  mKey.aiString
  mSemantic.l
  mIndex.l
  mDataLength.l
  mType.l
  *mData
EndStructure
Structure Material Align #PB_Structure_AlignC
  *mProperties.MaterialProperty
  mNumProperties.l
  mNumAllocated.l
EndStructure
Macro MATKEY_NAME:"?mat.name",0,0:EndMacro
Macro MATKEY_TWOSIDED:"$mat.twosided",0,0:EndMacro
Macro MATKEY_SHADING_MODEL:"$mat.shadingm",0,0:EndMacro
Macro MATKEY_ENABLE_WIREFRAME:"$mat.wireframe",0,0:EndMacro
Macro MATKEY_BLEND_FUNC:"$mat.blend",0,0:EndMacro
Macro MATKEY_OPACITY:"$mat.opacity",0,0:EndMacro
Macro MATKEY_TRANSPARENCYFACTOR:"$mat.transparencyfactor",0,0:EndMacro
Macro MATKEY_BUMPSCALING:"$mat.bumpscaling",0,0:EndMacro
Macro MATKEY_SHININESS:"$mat.shininess",0,0:EndMacro
Macro MATKEY_REFLECTIVITY:"$mat.reflectivity",0,0:EndMacro
Macro MATKEY_SHININESS_STRENGTH:"$mat.shinpercent",0,0:EndMacro
Macro MATKEY_REFRACTI:"$mat.refracti",0,0:EndMacro
Macro MATKEY_COLOR_DIFFUSE:"$clr.diffuse",0,0:EndMacro
Macro MATKEY_COLOR_AMBIENT:"$clr.ambient",0,0:EndMacro
Macro MATKEY_COLOR_SPECULAR:"$clr.specular",0,0:EndMacro
Macro MATKEY_COLOR_EMISSIVE:"$clr.emissive",0,0:EndMacro
Macro MATKEY_COLOR_TRANSPARENT:"$clr.transparent",0,0:EndMacro
Macro MATKEY_COLOR_REFLECTIVE:"$clr.reflective",0,0:EndMacro
Macro MATKEY_GLOBAL_BACKGROUND_IMAGE:"?bg.global",0,0:EndMacro
Macro MATKEY_GLOBAL_SHADERLANG:"?sh.lang",0,0:EndMacro
Macro MATKEY_SHADER_VERTEX:"?sh.vs",0,0:EndMacro
Macro MATKEY_SHADER_FRAGMENT:"?sh.fs",0,0:EndMacro
Macro MATKEY_SHADER_GEO:"?sh.gs",0,0:EndMacro
Macro MATKEY_SHADER_TESSELATION:"?sh.ts",0,0:EndMacro
Macro MATKEY_SHADER_PRIMITIVE:"?sh.ps",0,0:EndMacro
Macro MATKEY_SHADER_COMPUTE:"?sh.cs",0,0:EndMacro
#_MATKEY_TEXTURE_BASE        = "$tex.file"
#_MATKEY_UVWSRC_BASE         = "$tex.uvwsrc"
#_MATKEY_TEXOP_BASE          = "$tex.op"
#_MATKEY_MAPPING_BASE        = "$tex.mapping"
#_MATKEY_TEXBLEND_BASE       = "$tex.blend"
#_MATKEY_MAPPINGMODE_U_BASE  = "$tex.mapmodeu"
#_MATKEY_MAPPINGMODE_V_BASE  = "$tex.mapmodev"
#_MATKEY_TEXMAP_AXIS_BASE    = "$tex.mapaxis"
#_MATKEY_UVTRANSFORM_BASE    = "$tex.uvtrafo"
#_MATKEY_TEXFLAGS_BASE       = "$tex.flags"
Macro MATKEY_TEXTURE(type, N): ai::#_MATKEY_TEXTURE_BASE,type,N : EndMacro
Macro MATKEY_TEXTURE_DIFFUSE(N)    :ai::MATKEY_TEXTURE(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_TEXTURE_SPECULAR(N)   :ai::MATKEY_TEXTURE(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_TEXTURE_AMBIENT(N)    :ai::MATKEY_TEXTURE(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_TEXTURE_EMISSIVE(N)   :ai::MATKEY_TEXTURE(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_TEXTURE_NORMALS(N)    :ai::MATKEY_TEXTURE(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_TEXTURE_HEIGHT(N) :ai::MATKEY_TEXTURE(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_TEXTURE_SHININESS(N)  :ai::MATKEY_TEXTURE(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_TEXTURE_OPACITY(N)    :ai::MATKEY_TEXTURE(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_TEXTURE_DISPLACEMENT(N)   :ai::MATKEY_TEXTURE(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_TEXTURE_LIGHTMAP(N)   :ai::MATKEY_TEXTURE(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_TEXTURE_REFLECTION(N) :ai::MATKEY_TEXTURE(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_UVWSRC(type, N): ai::#_MATKEY_UVWSRC_BASE,type,N : EndMacro
Macro MATKEY_UVWSRC_DIFFUSE(N) :ai::MATKEY_UVWSRC(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_UVWSRC_SPECULAR(N)    :ai::MATKEY_UVWSRC(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_UVWSRC_AMBIENT(N) :ai::MATKEY_UVWSRC(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_UVWSRC_EMISSIVE(N)    :ai::MATKEY_UVWSRC(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_UVWSRC_NORMALS(N) :ai::MATKEY_UVWSRC(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_UVWSRC_HEIGHT(N)  :ai::MATKEY_UVWSRC(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_UVWSRC_SHININESS(N)   :ai::MATKEY_UVWSRC(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_UVWSRC_OPACITY(N) :ai::MATKEY_UVWSRC(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_UVWSRC_DISPLACEMENT(N)    :ai::MATKEY_UVWSRC(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_UVWSRC_LIGHTMAP(N)    :ai::MATKEY_UVWSRC(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_UVWSRC_REFLECTION(N)  :ai::MATKEY_UVWSRC(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_TEXOP(type, N) :ai::#_MATKEY_TEXOP_BASE,type,N: EndMacro
Macro MATKEY_TEXOP_DIFFUSE(N)  :ai::MATKEY_TEXOP(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_TEXOP_SPECULAR(N) :ai::MATKEY_TEXOP(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_TEXOP_AMBIENT(N)  :ai::MATKEY_TEXOP(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_TEXOP_EMISSIVE(N) :ai::MATKEY_TEXOP(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_TEXOP_NORMALS(N)  :ai::MATKEY_TEXOP(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_TEXOP_HEIGHT(N)   :ai::MATKEY_TEXOP(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_TEXOP_SHININESS(N)    :ai::MATKEY_TEXOP(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_TEXOP_OPACITY(N)  :ai::MATKEY_TEXOP(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_TEXOP_DISPLACEMENT(N) :ai::MATKEY_TEXOP(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_TEXOP_LIGHTMAP(N) :ai::MATKEY_TEXOP(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_TEXOP_REFLECTION(N)   :ai::MATKEY_TEXOP(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_MAPPING(type, N) :ai::#_MATKEY_MAPPING_BASE,type,N:EndMacro
Macro MATKEY_MAPPING_DIFFUSE(N)    :ai::MATKEY_MAPPING(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_MAPPING_SPECULAR(N)   :ai::MATKEY_MAPPING(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_MAPPING_AMBIENT(N)    :ai::MATKEY_MAPPING(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_MAPPING_EMISSIVE(N)   :ai::MATKEY_MAPPING(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_MAPPING_NORMALS(N)    :ai::MATKEY_MAPPING(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_MAPPING_HEIGHT(N) :ai::MATKEY_MAPPING(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_MAPPING_SHININESS(N)  :ai::MATKEY_MAPPING(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_MAPPING_OPACITY(N)    :ai::MATKEY_MAPPING(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_MAPPING_DISPLACEMENT(N)   :ai::MATKEY_MAPPING(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_MAPPING_LIGHTMAP(N)   :ai::MATKEY_MAPPING(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_MAPPING_REFLECTION(N) :ai::MATKEY_MAPPING(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_TEXBLEND(type, N) :ai::#_MATKEY_TEXBLEND_BASE,type,N: EndMacro
Macro MATKEY_TEXBLEND_DIFFUSE(N)   :ai::MATKEY_TEXBLEND(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_TEXBLEND_SPECULAR(N)  :ai::MATKEY_TEXBLEND(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_TEXBLEND_AMBIENT(N)   :ai::MATKEY_TEXBLEND(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_TEXBLEND_EMISSIVE(N)  :ai::MATKEY_TEXBLEND(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_TEXBLEND_NORMALS(N)   :ai::MATKEY_TEXBLEND(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_TEXBLEND_HEIGHT(N)    :ai::MATKEY_TEXBLEND(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_TEXBLEND_SHININESS(N) :ai::MATKEY_TEXBLEND(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_TEXBLEND_OPACITY(N)   :ai::MATKEY_TEXBLEND(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_TEXBLEND_DISPLACEMENT(N)  :ai::MATKEY_TEXBLEND(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_TEXBLEND_LIGHTMAP(N)  :ai::MATKEY_TEXBLEND(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_TEXBLEND_REFLECTION(N)    :ai::MATKEY_TEXBLEND(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_MAPPINGMODE_U(type, N) :ai::#_MATKEY_MAPPINGMODE_U_BASE,type,N: EndMacro
Macro MATKEY_MAPPINGMODE_U_DIFFUSE(N)  :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_SPECULAR(N) :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_AMBIENT(N)  :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_EMISSIVE(N) :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_NORMALS(N)  :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_HEIGHT(N)   :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_SHININESS(N)    :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_OPACITY(N)  :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_DISPLACEMENT(N) :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_LIGHTMAP(N) :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_MAPPINGMODE_U_REFLECTION(N)   :ai::MATKEY_MAPPINGMODE_U(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_MAPPINGMODE_V(type, N) :ai::#_MATKEY_MAPPINGMODE_V_BASE,type,N: EndMacro
Macro MATKEY_MAPPINGMODE_V_DIFFUSE(N)  :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_SPECULAR(N) :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_AMBIENT(N)  :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_EMISSIVE(N) :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_NORMALS(N)  :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_HEIGHT(N)   :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_SHININESS(N)    :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_OPACITY(N)  :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_DISPLACEMENT(N) :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_LIGHTMAP(N) :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_MAPPINGMODE_V_REFLECTION(N)   :ai::MATKEY_MAPPINGMODE_V(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_TEXMAP_AXIS(type, N) :ai::#_MATKEY_TEXMAP_AXIS_BASE,type,N: EndMacro
Macro MATKEY_TEXMAP_AXIS_DIFFUSE(N)    :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_SPECULAR(N)   :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_AMBIENT(N)    :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_EMISSIVE(N)   :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_NORMALS(N)    :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_HEIGHT(N) :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_SHININESS(N)  :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_OPACITY(N)    :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_DISPLACEMENT(N)   :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_LIGHTMAP(N)   :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_TEXMAP_AXIS_REFLECTION(N) :ai::MATKEY_TEXMAP_AXIS(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_UVTRANSFORM(type, N) :ai::#_MATKEY_UVTRANSFORM_BASE,type,N :EndMacro
Macro MATKEY_UVTRANSFORM_DIFFUSE(N)    :ai::MATKEY_UVTRANSFORM(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_UVTRANSFORM_SPECULAR(N)   :ai::MATKEY_UVTRANSFORM(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_UVTRANSFORM_AMBIENT(N)    :ai::MATKEY_UVTRANSFORM(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_UVTRANSFORM_EMISSIVE(N)   :ai::MATKEY_UVTRANSFORM(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_UVTRANSFORM_NORMALS(N)    :ai::MATKEY_UVTRANSFORM(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_UVTRANSFORM_HEIGHT(N) :ai::MATKEY_UVTRANSFORM(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_UVTRANSFORM_SHININESS(N)  :ai::MATKEY_UVTRANSFORM(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_UVTRANSFORM_OPACITY(N)    :ai::MATKEY_UVTRANSFORM(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_UVTRANSFORM_DISPLACEMENT(N)   :ai::MATKEY_UVTRANSFORM(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_UVTRANSFORM_LIGHTMAP(N)   :ai::MATKEY_UVTRANSFORM(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_UVTRANSFORM_REFLECTION(N) :ai::MATKEY_UVTRANSFORM(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_UVTRANSFORM_UNKNOWN(N)    :ai::MATKEY_UVTRANSFORM(ai::#TextureType_UNKNOWN,N):EndMacro
Macro MATKEY_TEXFLAGS(type, N) :ai::#_MATKEY_TEXFLAGS_BASE,type,N:EndMacro
Macro MATKEY_TEXFLAGS_DIFFUSE(N)   :ai::MATKEY_TEXFLAGS(ai::#TextureType_DIFFUSE,N):EndMacro
Macro MATKEY_TEXFLAGS_SPECULAR(N)  :ai::MATKEY_TEXFLAGS(ai::#TextureType_SPECULAR,N):EndMacro
Macro MATKEY_TEXFLAGS_AMBIENT(N)   :ai::MATKEY_TEXFLAGS(ai::#TextureType_AMBIENT,N):EndMacro
Macro MATKEY_TEXFLAGS_EMISSIVE(N)  :ai::MATKEY_TEXFLAGS(ai::#TextureType_EMISSIVE,N):EndMacro
Macro MATKEY_TEXFLAGS_NORMALS(N)   :ai::MATKEY_TEXFLAGS(ai::#TextureType_NORMALS,N):EndMacro
Macro MATKEY_TEXFLAGS_HEIGHT(N)    :ai::MATKEY_TEXFLAGS(ai::#TextureType_HEIGHT,N):EndMacro
Macro MATKEY_TEXFLAGS_SHININESS(N) :ai::MATKEY_TEXFLAGS(ai::#TextureType_SHININESS,N):EndMacro
Macro MATKEY_TEXFLAGS_OPACITY(N)   :ai::MATKEY_TEXFLAGS(ai::#TextureType_OPACITY,N):EndMacro
Macro MATKEY_TEXFLAGS_DISPLACEMENT(N)  :ai::MATKEY_TEXFLAGS(ai::#TextureType_DISPLACEMENT,N):EndMacro
Macro MATKEY_TEXFLAGS_LIGHTMAP(N)  :ai::MATKEY_TEXFLAGS(ai::#TextureType_LIGHTMAP,N):EndMacro
Macro MATKEY_TEXFLAGS_REFLECTION(N)    :ai::MATKEY_TEXFLAGS(ai::#TextureType_REFLECTION,N):EndMacro
Macro MATKEY_TEXFLAGS_UNKNOWN(N)   :ai::MATKEY_TEXFLAGS(ai::#TextureType_UNKNOWN,N):EndMacro
ImportC #assimp_LIB
  GetMaterialProperty.l ( *pMat.Material, pkey.p-utf8, type.l, index.l, *pPropOut.MaterialProperty ) As #FuncPrefix + "aiGetMaterialProperty"
  GetMaterialFloatArray.l ( *pMat.Material, pkey.p-utf8, type.l, index.l, *pout.float, *pMax.long) As #FuncPrefix + "aiGetMaterialFloatArray"
  Macro GetMaterialFloat (pMat, type, index, pKey, pOut) 
    ai::GetMaterialFloatArray(pMat, type, index, pKey, pOut, #Null)
  EndMacro
  GetMaterialIntegerArray.l ( *pMat.Material, pkey.p-utf8, type.l, index.l, *pout.float, *pMax.long) As #FuncPrefix + "aiGetMaterialIntegerArray"
  Macro GetMaterialInteger (pMat, type, index, pKey, pOut) 
    ai::GetMaterialIntegerArray(pMat, type, index, pKey, pOut, NULL)
  EndMacro
  GetMaterialColor_.l ( *pMat.Material, pkey.p-utf8, type.l, index.l, *pout.Color4D) As #FuncPrefix + "aiGetMaterialColor"
  Macro GetMaterialColor ( pMat_Material, pkey_utf8, type_l, index_l, pout_Color4D)
    ai::GetMaterialColor_( pMat_Material, pkey_utf8, type_l, index_l, pout_Color4D)
  EndMacro
  GetMaterialUVTransform.l ( *pMat.Material, pkey.p-utf8, type.l, index.l, *pout.UVTransform) As #FuncPrefix + "aiGetMaterialUVTransform"
  GetMaterialString.l ( *pMat.Material, pkey.p-utf8, type.l, index.l, *pout.aiString) As #FuncPrefix + "aiGetMaterialString"
  GetMaterialTextureCount.l ( *pMat.Material, type.l) As #FuncPrefix + "aiGetMaterialTextureCount"
  GetMaterialTexture.l ( *pMat.Material, type.l, index.l, *path.aiString, *mapping.long = #Null, *uvindex.long = #Null, *blend.float = #Null, *op.long = #Null, *mapmode.long = #Null, *flags.long = #Null ) As #FuncPrefix + "aiGetMaterialTexture"
EndImport
;}
;-----------------------
;- anim.h.pbi
;{

Structure VectorKey Align #PB_Structure_AlignC
  mTime.d
  mValue.Vector3D
EndStructure
Structure QuatKey Align #PB_Structure_AlignC
  mTime.d
  mValue.Quaternion
EndStructure
Structure MeshKey Align #PB_Structure_AlignC
  mTime.d
  mValue.l
EndStructure
Structure MeshMorphKey Align #PB_Structure_AlignC
  mTime.d
  *mValues.long
  *mWeights.double
  mNumValuesAndWeights.l
EndStructure
Enumeration AnimBehaviour
  #AnimBehaviour_DEFAULT  = $0
  #AnimBehaviour_CONSTANT = $1
  #AnimBehaviour_LINEAR   = $2
  #AnimBehaviour_REPEAT   = $3
EndEnumeration
Structure NodeAnim Align #PB_Structure_AlignC
  mNodeName.aiString
  mNumPositionKeys.l
  *mPositionKeys.VectorKey
  mNumRotationKeys.l
  *mRotationKeys.QuatKey
  mNumScalingKeys.l
  *mScalingKeys.VectorKey
  mPreState.l
  mPostState.l
EndStructure
Structure MeshAnim Align #PB_Structure_AlignC
  mName.aiString
  mNumKeys.l
  *mKeys.MeshKey
EndStructure
Structure MeshMorphAnim Align #PB_Structure_AlignC
  mName.aiString
  mNumKeys.l
  *mKeys.MeshMorphKey
EndStructure
Structure Animation Align #PB_Structure_AlignC
  mName.aiString
  mDuration.d
  mTicksPerSecond.d
  mNumChannels.l
  *mChannels.NodeAnim
  mNumMeshChannels.l
  *mMeshChannels.MeshAnim
  mNumMorphMeshChannels.l
  *mMorphMeshChannels.MeshMorphAnim
EndStructure
;}
;-----------------------
;- metadata.h.pbi
;{

Enumeration MetadataType
  #BOOL       = 0
  #INT32      = 1
  #UINT64     = 2
  #FLOAT      = 3
  #DOUBLE     = 4
  #AISTRING   = 5
  #AIVECTOR3D = 6
  #META_MAX   = 7
EndEnumeration
Structure MetadataEntry Align #PB_Structure_AlignC
  mType.l
  *mData
EndStructure
Structure Metadata Align #PB_Structure_AlignC
  mNumProperties.l
  *mKeys.aiString
  *mValues.MetadataEntry
EndStructure
;}
;-----------------------
;- scene.h.pbi
;{

Structure ppNode
  *n.Node[0]
EndStructure
Structure Node Align #PB_Structure_AlignC
  mName.aiString
  mTransformation.Matrix4x4
  *mParent.Node
  mNumChildren.l
  *mChildren.ppNode
  mNumMeshes.l
  *mMeshes.longarray
  *mMetaData.Metadata
EndStructure
#SCENE_FLAGS_INCOMPLETE   = $1
#SCENE_FLAGS_VALIDATED    = $2
#SCENE_FLAGS_VALIDATION_WARNING   = $4
#SCENE_FLAGS_NON_VERBOSE_FORMAT   = $8
#SCENE_FLAGS_TERRAIN = $10
#SCENE_FLAGS_ALLOW_SHARED			= $20
Structure ppMesh
  *m.Mesh[0]
EndStructure
Structure ppMaterial
  *m.Material[0]
EndStructure
Structure ppAnimation
  *a.Animation[0]
EndStructure
Structure ppTexture
  *t.Texture[0]
EndStructure
Structure ppLight
  *l.Light[0]
EndStructure
Structure ppCamera
  *c.Camera[0]
EndStructure
Structure Scene Align #PB_Structure_AlignC
  mFlags.l
  *mRootNode.Node
  mNumMeshes.l
  *mMeshes.ppMesh
  mNumMaterials.l
  *mMaterials.ppMaterial
  mNumAnimations.l
  *mAnimations.ppAnimation
  mNumTextures.l
  *mTextures.ppTexture
  mNumLights.l
  *mLights.ppLight
  mNumCameras.l
  *mCameras.ppCamera
  *mMetaData.Metadata
  *mPrivate
EndStructure
;}
;-----------------------
;- cimport.h.pbi
;{

Prototype LogStreamCallback(*message.ascii, *user.ascii)
Structure LogStream
  callback.LogStreamCallback
  *user.ascii
EndStructure
Structure PropertyStore
  sentinel.a
EndStructure
Macro Bool
  l
EndMacro
#False = 0
#True = 1
ImportC #assimp_LIB
  ImportFile.i ( pFile.p-utf8, pFlags.l ) As #FuncPrefix + "aiImportFile"  
  ImportFileEx.i ( pFile.p-utf8, pFlags.l, *pFS ) As #FuncPrefix + "aiImportFileEx"  
  ImportFileExWithProperties.i ( pFile.p-utf8, pFlags.l, *pFS, *pProps ) As #FuncPrefix + "aiImportFileExWithProperties"  
  ImportFileFromMemory.i ( *pbuffer, pLength.l, pFlags.l, pHint.p-utf8 ) As #FuncPrefix + "aiImportFileFromMemory"  
  ImportFileFromMemoryWithProperties.i ( *pbuffer, pLength.l, pFlags.l, pHint.p-utf8, *pProps ) As #FuncPrefix + "aiImportFileFromMemoryWithProperties"  
  ApplyPostProcessing.i ( *pScene, pFlags.l ) As #FuncPrefix + "aiApplyPostProcessing"  
  ;removed LogStream - functions, because PB doesn't support c - return - string
  ReleaseImport ( *pScene ) As #FuncPrefix + "aiReleaseImport"  
  _GetErrorString () As #FuncPrefix + "aiGetErrorString"  
  Macro GetErrorString() : PeekS(ai::_GetErrorString(),-1,#PB_UTF8) : EndMacro
  IsExtensionSupported.Bool (szExtension.p-utf8) As #FuncPrefix + "aiIsExtensionSupported"  
  GetExtensionList(*szOut.aiString)  As #FuncPrefix + "aiGetExtensionList"  
  GetMemoryRequirements(*pin.Scene, *in.MemoryInfo)  As #FuncPrefix + "aiGetMemoryRequirements"  
  CreatePropertyStore.i()  As #FuncPrefix + "aiCreatePropertyStore"  
  ReleasePropertyStore(*p.PropertyStore)  As #FuncPrefix + "aiReleasePropertyStore"  
  SetImportPropertyInteger(*p.PropertyStore, szName.p-ascii, value.l)  As #FuncPrefix + "aiSetImportPropertyInteger"  
  SetImportPropertyFloat(*p.PropertyStore, szName.p-ascii, value.real)  As #FuncPrefix + "aiSetImportPropertyFloat"  
  SetImportPropertyString(*p.PropertyStore, szName.p-ascii, *st.aiString)  As #FuncPrefix + "aiSetImportPropertyString"  
  SetImportPropertyMatrix(*p.PropertyStore, szName.p-ascii, *mat.Matrix4x4)  As #FuncPrefix + "aiSetImportPropertyMatrix"  
  CreateQuaternionFromMatrix(*quat.Quaternion, *mat.Matrix3x3)  As #FuncPrefix + "aiCreateQuaternionFromMatrix"  
  DecomposeMatrix(*mat.Matrix4x4, *scaling.Vector3D, *rotation.Quaternion, *position.Vector3D )  As #FuncPrefix + "aiDecomposeMatrix"
  TransposeMatrix4(*mat.Matrix4x4)  As #FuncPrefix + "aiTransposeMatrix4"  
  TransposeMatrix3(*mat.Matrix3x3)  As #FuncPrefix + "aiTransposeMatrix3"  
  TransformVecByMatrix3(*vec.Vector3D, *mat.Matrix3x3)  As #FuncPrefix + "aiTransformVecByMatrix3"  
  TransformVecByMatrix4(*vec.Vector3D, *mat.Matrix4x4)  As #FuncPrefix + "aiTransformVecByMatrix4"  
  MultiplyMatrix4(*dst.Matrix4x4, *src.Matrix4x4)  As #FuncPrefix + "aiMultiplyMatrix4"  
  MultiplyMatrix3(*dst.Matrix3x3, *src.Matrix3x3)  As #FuncPrefix + "aiMultiplyMatrix3"  
  IdentityMatrix3(*mat.Matrix3x3)  As #FuncPrefix + "aiIdentityMatrix3"  
  IdentityMatrix4(*mat.Matrix4x4)  As #FuncPrefix + "aiIdentityMatrix4"
  GetImportFormatCount.q()  As #FuncPrefix + "aiGetImportFormatCount"  
  GetImportFormatDescription.i(pIndex.q)  As #FuncPrefix + "aiGetImportFormatDescription"  
 EndImport
;}
;-----------------------
;- postprocess.h.pbi
;{

Enumeration PostProcessSteps
  #Process_CalcTangentSpace = $1
  #Process_JoinIdenticalVertices = $2
  #Process_MakeLeftHanded = $4
  #Process_Triangulate = $8
  #Process_RemoveComponent = $10
  #Process_GenNormals = $20
  #Process_GenSmoothNormals = $40
  #Process_SplitLargeMeshes = $80
  #Process_PreTransformVertices = $100
  #Process_LimitBoneWeights = $200
  #Process_ValidateDataStructure = $400
  #Process_ImproveCacheLocality = $800
  #Process_RemoveRedundantMaterials = $1000
  #Process_FixInfacingNormals = $2000
  #Process_SortByPType = $8000
  #Process_FindDegenerates = $10000
  #Process_FindInvalidData = $20000
  #Process_GenUVCoords = $40000
  #Process_TransformUVCoords = $80000
  #Process_FindInstances = $100000
  #Process_OptimizeMeshes  = $200000
  #Process_OptimizeGraph  = $400000
  #Process_FlipUVs = $800000
  #Process_FlipWindingOrder  = $1000000
  #Process_SplitByBoneCount  = $2000000
  #Process_Debone  = $4000000
  #Process_GlobalScale = $8000000
  #Process_EmbedTextures  = $10000000
  ; #Process_GenEntityMeshes = $100000
  ; #Process_OptimizeAnimations = $200000
  ; #Process_FixTexturePaths = $200000
  #Process_ForceGenNormals = $20000000
  #Process_DropNormals = $40000000
  #Process_GenBoundingBoxes = $80000000
EndEnumeration
#Process_ConvertToLeftHanded  = #Process_MakeLeftHanded | #Process_FlipUVs | #Process_FlipWindingOrder | 0 
#ProcessPreset_TargetRealtime_Fast = #Process_CalcTangentSpace | #Process_GenNormals | #Process_JoinIdenticalVertices | #Process_Triangulate | #Process_GenUVCoords | #Process_SortByPType | 0 
#ProcessPreset_TargetRealtime_Quality = #Process_CalcTangentSpace | #Process_GenSmoothNormals | #Process_JoinIdenticalVertices | #Process_ImproveCacheLocality | #Process_LimitBoneWeights | #Process_RemoveRedundantMaterials | #Process_SplitLargeMeshes | #Process_Triangulate | #Process_GenUVCoords | #Process_SortByPType | #Process_FindDegenerates | #Process_FindInvalidData | 0
#ProcessPreset_TargetRealtime_MaxQuality = #ProcessPreset_TargetRealtime_Quality | #Process_FindInstances | #Process_ValidateDataStructure | #Process_OptimizeMeshes | 0
;}
  ;   ;scene
;   ;postprocess
EndDeclareModule
Module ai
  ; mesh.h.pbi
  Procedure PRIMITIVE_TYPE_FOR_N_INDICES(n) 
  If n > 3
    ProcedureReturn #PrimitiveType_POLYGON
  Else
    ProcedureReturn (1 << ((n)-1))
  EndIf
EndProcedure
; ImportC #assimp_LIB
;   aiGetImporterDesc.i ( extension.p-utf8 ) As #FuncPrefix + "aiGetImporterDesc"
; EndImport
EndModule
