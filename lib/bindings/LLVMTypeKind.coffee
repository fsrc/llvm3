module.exports =
  LLVMVoidTypeKind      : 0   #< type with no size
  LLVMHalfTypeKind      : 1   #< 16 bit floating point type
  LLVMFloatTypeKind     : 2   #< 32 bit floating point type
  LLVMDoubleTypeKind    : 3   #< 64 bit floating point type
  LLVMX86_FP80TypeKind  : 4   #< 80 bit floating point type (X87)
  LLVMFP128TypeKind     : 5   #< 128 bit floating point type (112-bit mantissa)*
  LLVMPPC_FP128TypeKind : 6   #< 128 bit floating point type (two 64-bits)
  LLVMLabelTypeKind     : 7   #< Labels
  LLVMIntegerTypeKind   : 8   #< Arbitrary bit width integers
  LLVMFunctionTypeKind  : 9   #< Functions
  LLVMStructTypeKind    : 10   #< Structures
  LLVMArrayTypeKind     : 11   #< Arrays
  LLVMPointerTypeKind   : 12   #< Pointers
  LLVMVectorTypeKind    : 13   #< SIMD 'packed' format, or other vector type
  LLVMMetadataTypeKind  : 14   #< Metadata
  LLVMX86_MMXTypeKind   : 15   #< X86 MMX
  '0'  : 'LLVMVoidTypeKind'
  '1'  : 'LLVMHalfTypeKind'
  '2'  : 'LLVMFloatTypeKind'
  '3'  : 'LLVMDoubleTypeKind'
  '4'  : 'LLVMX86_FP80TypeKind'
  '5'  : 'LLVMFP128TypeKind'
  '6'  : 'LLVMPPC_FP128TypeKind'
  '7'  : 'LLVMLabelTypeKind'
  '8'  : 'LLVMIntegerTypeKind'
  '9'  : 'LLVMFunctionTypeKind'
  '10' : 'LLVMStructTypeKind'
  '11' : 'LLVMArrayTypeKind'
  '12' : 'LLVMPointerTypeKind'
  '13' : 'LLVMVectorTypeKind'
  '14' : 'LLVMMetadataTypeKind'
  '15' : 'LLVMX86_MMXTypeKind'
