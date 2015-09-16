FFI       = require('ffi')
ArrayType = require('ref-array')
Struct    = require('ref-struct')
ref       = require('ref')

voidPtr = ref.refType(ref.types.void)

exports.LLVMDiagnosticSeverity =
  LLVMDSError   : 0
  LLVMDSWarning : 1
  LLVMDSRemark  : 2
  LLVMDSNote    : 3
  '0' : 'LLVMDSError'
  '1' : 'LLVMDSWarning'
  '2' : 'LLVMDSRemark'
  '3' : 'LLVMDSNote'

exports.LLVMTypeKind =
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

exports.LLVMOpcode =
  # Terminator Instructions
  LLVMRet            : 1
  LLVMBr             : 2
  LLVMSwitch         : 3
  LLVMIndirectBr     : 4
  LLVMInvoke         : 5
  # removed 6 due to API changes
  LLVMUnreachable    : 7

  # Standard Binary Operators
  LLVMAdd            : 8
  LLVMFAdd           : 9
  LLVMSub            : 10
  LLVMFSub           : 11
  LLVMMul            : 12
  LLVMFMul           : 13
  LLVMUDiv           : 14
  LLVMSDiv           : 15
  LLVMFDiv           : 16
  LLVMURem           : 17
  LLVMSRem           : 18
  LLVMFRem           : 19

  # Logical Operators
  LLVMShl            : 20
  LLVMLShr           : 21
  LLVMAShr           : 22
  LLVMAnd            : 23
  LLVMOr             : 24
  LLVMXor            : 25

  # Memory Operators
  LLVMAlloca         : 26
  LLVMLoad           : 27
  LLVMStore          : 28
  LLVMGetElementPtr  : 29
  LLVMTrunc          : 30
  LLVMZExt           : 31
  LLVMSExt           : 32
  LLVMFPToUI         : 33
  LLVMFPToSI         : 34
  LLVMUIToFP         : 35
  LLVMSIToFP         : 36

  # Cast Operators
  LLVMFPTrunc        : 37
  LLVMFPExt          : 38
  LLVMPtrToInt       : 39
  LLVMIntToPtr       : 40
  LLVMBitCast        : 41
  LLVMAddrSpaceCast  : 60
  # Other Operators
  LLVMICmp           : 42
  LLVMFCmp           : 43
  LLVMPHI            : 44
  LLVMCall           : 45
  LLVMSelect         : 46
  LLVMUserOp1        : 47
  LLVMUserOp2        : 48
  LLVMVAArg          : 49
  LLVMExtractElement : 50
  LLVMInsertElement  : 51
  LLVMShuffleVector  : 52
  LLVMExtractValue   : 53
  LLVMInsertValue    : 54
  # Atomic operators
  LLVMFence          : 55
  LLVMAtomicCmpXchg  : 56
  LLVMAtomicRMW      : 57
  # Exception Handling Operators
  LLVMResume         : 58
  LLVMLandingPad     : 59

  '1'  : 'LLVMRet'
  '2'  : 'LLVMBr'
  '3'  : 'LLVMSwitch'
  '4'  : 'LLVMIndirectBr'
  '5'  : 'LLVMInvoke'
  '7'  : 'LLVMUnreachable'
  '8'  : 'LLVMAdd'
  '9'  : 'LLVMFAdd'
  '10' : 'LLVMSub'
  '11' : 'LLVMFSub'
  '12' : 'LLVMMul'
  '13' : 'LLVMFMul'
  '14' : 'LLVMUDiv'
  '15' : 'LLVMSDiv'
  '16' : 'LLVMFDiv'
  '17' : 'LLVMURem'
  '18' : 'LLVMSRem'
  '19' : 'LLVMFRem'
  '20' : 'LLVMShl'
  '21' : 'LLVMLShr'
  '22' : 'LLVMAShr'
  '23' : 'LLVMAnd'
  '24' : 'LLVMOr'
  '25' : 'LLVMXor'
  '26' : 'LLVMAlloca'
  '27' : 'LLVMLoad'
  '28' : 'LLVMStore'
  '29' : 'LLVMGetElementPtr'
  '30' : 'LLVMTrunc'
  '31' : 'LLVMZExt'
  '32' : 'LLVMSExt'
  '33' : 'LLVMFPToUI'
  '34' : 'LLVMFPToSI'
  '35' : 'LLVMUIToFP'
  '36' : 'LLVMSIToFP'
  '37' : 'LLVMFPTrunc'
  '38' : 'LLVMFPExt'
  '39' : 'LLVMPtrToInt'
  '40' : 'LLVMIntToPtr'
  '41' : 'LLVMBitCast'
  '60' : 'LLVMAddrSpaceCast'
  '42' : 'LLVMICmp'
  '43' : 'LLVMFCmp'
  '44' : 'LLVMPHI'
  '45' : 'LLVMCall'
  '46' : 'LLVMSelect'
  '47' : 'LLVMUserOp1'
  '48' : 'LLVMUserOp2'
  '49' : 'LLVMVAArg'
  '50' : 'LLVMExtractElement'
  '51' : 'LLVMInsertElement'
  '52' : 'LLVMShuffleVector'
  '53' : 'LLVMExtractValue'
  '54' : 'LLVMInsertValue'
  '55' : 'LLVMFence'
  '56' : 'LLVMAtomicCmpXchg'
  '57' : 'LLVMAtomicRMW'
  '58' : 'LLVMResume'
  '59' : 'LLVMLandingPad'

exports.LLVMIntPredicate =
  LLVMIntEQ  : 32   #< equal
  LLVMIntNE  : 33   #< not equal
  LLVMIntUGT : 34   #< unsigned greater than
  LLVMIntUGE : 35   #< unsigned greater or equal
  LLVMIntULT : 36   #< unsigned less than
  LLVMIntULE : 37   #< unsigned less or equal
  LLVMIntSGT : 38   #< signed greater than
  LLVMIntSGE : 39   #< signed greater or equal
  LLVMIntSLT : 40   #< signed less than
  LLVMIntSLE : 41   #< signed less or equal
  '32' : 'LLVMIntEQ'
  '33' : 'LLVMIntNE'
  '34' : 'LLVMIntUGT'
  '35' : 'LLVMIntUGE'
  '36' : 'LLVMIntULT'
  '37' : 'LLVMIntULE'
  '38' : 'LLVMIntSGT'
  '39' : 'LLVMIntSGE'
  '40' : 'LLVMIntSLT'
  '41' : 'LLVMIntSLE'

exports.LLVMRealPredicate =
  LLVMRealPredicateFalse : 0   #< Always false (always folded)
  LLVMRealOEQ            : 1   #< True if ordered and equal
  LLVMRealOGT            : 2   #< True if ordered and greater than
  LLVMRealOGE            : 3   #< True if ordered and greater than or equal
  LLVMRealOLT            : 4   #< True if ordered and less than
  LLVMRealOLE            : 5   #< True if ordered and less than or equal
  LLVMRealONE            : 6   #< True if ordered and operands are unequal
  LLVMRealORD            : 7   #< True if ordered (no nans)
  LLVMRealUNO            : 8   #< True if unordered: isnan(X) | isnan(Y)
  LLVMRealUEQ            : 9   #< True if unordered or equal
  LLVMRealUGT            : 10   #< True if unordered or greater than
  LLVMRealUGE            : 11   #< True if unordered, greater than, or equal
  LLVMRealULT            : 12   #< True if unordered or less than
  LLVMRealULE            : 13   #< True if unordered, less than, or equal
  LLVMRealUNE            : 14   #< True if unordered or not equal
  LLVMRealPredicateTrue  : 15   #< Always true (always folded)
  '0'  : 'LLVMRealPredicateFalse'
  '1'  : 'LLVMRealOEQ'
  '2'  : 'LLVMRealOGT'
  '3'  : 'LLVMRealOGE'
  '4'  : 'LLVMRealOLT'
  '5'  : 'LLVMRealOLE'
  '6'  : 'LLVMRealONE'
  '7'  : 'LLVMRealORD'
  '8'  : 'LLVMRealUNO'
  '9'  : 'LLVMRealUEQ'
  '10' : 'LLVMRealUGT'
  '11' : 'LLVMRealUGE'
  '12' : 'LLVMRealULT'
  '13' : 'LLVMRealULE'
  '14' : 'LLVMRealUNE'
  '15' : 'LLVMRealPredicateTrue'

exports.LLVMLinkage =
  LLVMExternalLinkage            : 0   #< Externally visible function
  LLVMAvailableExternallyLinkage : 1
  LLVMLinkOnceAnyLinkage         : 2   #< Keep one copy of function when linking (inline)*
  LLVMLinkOnceODRLinkage         : 3   #< Same, but only replaced by something
  LLVMLinkOnceODRAutoHideLinkage : 4   #< Obsolete
  LLVMWeakAnyLinkage             : 5   #< Keep one copy of function when linking (weak)
  LLVMWeakODRLinkage             : 6   #< Same, but only replaced by something
  LLVMAppendingLinkage           : 7   #< Special purpose, only applies to global arrays *
  LLVMInternalLinkage            : 8   #< Rename collisions when linking (static
  LLVMPrivateLinkage             : 9   #< Like Internal, but omit from symbol table
  LLVMDLLImportLinkage           : 10   #< Obsolete
  LLVMDLLExportLinkage           : 11   #< Obsolete
  LLVMExternalWeakLinkage        : 12   #< ExternalWeak linkage description
  LLVMGhostLinkage               : 13   #< Obsolete
  LLVMCommonLinkage              : 14   #< Tentative definitions
  LLVMLinkerPrivateLinkage       : 15   #< Like Private, but linker removes.
  LLVMLinkerPrivateWeakLinkage   : 16   #< Like LinkerPrivate, but is weak.
  '0'  : 'LLVMExternalLinkage'
  '1'  : 'LLVMAvailableExternallyLinkage'
  '2'  : 'LLVMLinkOnceAnyLinkage'
  '3'  : 'LLVMLinkOnceODRLinkage'
  '4'  : 'LLVMLinkOnceODRAutoHideLinkage'
  '5'  : 'LLVMWeakAnyLinkage'
  '6'  : 'LLVMWeakODRLinkage'
  '7'  : 'LLVMAppendingLinkage'
  '8'  : 'LLVMInternalLinkage'
  '9'  : 'LLVMPrivateLinkage'
  '10' : 'LLVMDLLImportLinkage'
  '11' : 'LLVMDLLExportLinkage'
  '12' : 'LLVMExternalWeakLinkage'
  '13' : 'LLVMGhostLinkage'
  '14' : 'LLVMCommonLinkage'
  '15' : 'LLVMLinkerPrivateLinkage'
  '16' : 'LLVMLinkerPrivateWeakLinkage'

exports.LLVMVisibility =
  LLVMDefaultVisibility   : 0   #< The GV is visible
  LLVMHiddenVisibility    : 1   #< The GV is hidden
  LLVMProtectedVisibility : 2   #< The GV is protected
  '0' : 'LLVMDefaultVisibility'
  '1' : 'LLVMHiddenVisibility'
  '2' : 'LLVMProtectedVisibility'

exports.LLVMDLLStorageClass =
  LLVMDefaultStorageClass   : 0
  LLVMDLLImportStorageClass : 1   #< Function to be imported from DLL.
  LLVMDLLExportStorageClass : 2   #< Function to be accessible from DLL.
  '0' : 'LLVMDefaultStorageClass'
  '1' : 'LLVMDLLImportStorageClass'
  '2' : 'LLVMDLLExportStorageClass'

exports.LLVMThreadLocalMode =
  LLVMNotThreadLocal         : 0
  LLVMGeneralDynamicTLSModel : 1
  LLVMLocalDynamicTLSModel   : 2
  LLVMInitialExecTLSModel    : 3
  LLVMLocalExecTLSModel      : 4
  '0' : 'LLVMNotThreadLocal'
  '1' : 'LLVMGeneralDynamicTLSModel'
  '2' : 'LLVMLocalDynamicTLSModel'
  '3' : 'LLVMInitialExecTLSModel'
  '4' : 'LLVMLocalExecTLSModel'

exports.LLVMAttribute =
  LLVMZExtAttribute              : 1
  LLVMSExtAttribute              : 2
  LLVMNoReturnAttribute          : 4
  LLVMInRegAttribute             : 8
  LLVMStructRetAttribute         : 16
  LLVMNoUnwindAttribute          : 32
  LLVMNoAliasAttribute           : 64
  LLVMByValAttribute             : 128
  LLVMNestAttribute              : 256
  LLVMReadNoneAttribute          : 512
  LLVMReadOnlyAttribute          : 1024
  LLVMNoInlineAttribute          : 2048
  LLVMAlwaysInlineAttribute      : 4096
  LLVMOptimizeForSizeAttribute   : 8192
  LLVMStackProtectAttribute      : 16384
  LLVMStackProtectReqAttribute   : 32768
  LLVMAlignment                  : 2031616
  LLVMNoCaptureAttribute         : 2097152
  LLVMNoRedZoneAttribute         : 4194304
  LLVMNoImplicitFloatAttribute   : 8388608
  LLVMNakedAttribute             : 16777216
  LLVMInlineHintAttribute        : 33554432
  LLVMStackAlignment             : 469762048
  LLVMReturnsTwice               : 536870912
  LLVMUWTable                    : 1073741824
  LLVMNonLazyBind                : -2147483648
  '1'           : 'LLVMZExtAttribute'
  '2'           : 'LLVMSExtAttribute'
  '4'           : 'LLVMNoReturnAttribute'
  '8'           : 'LLVMInRegAttribute'
  '16'          : 'LLVMStructRetAttribute'
  '32'          : 'LLVMNoUnwindAttribute'
  '64'          : 'LLVMNoAliasAttribute'
  '128'         : 'LLVMByValAttribute'
  '256'         : 'LLVMNestAttribute'
  '512'         : 'LLVMReadNoneAttribute'
  '1024'        : 'LLVMReadOnlyAttribute'
  '2048'        : 'LLVMNoInlineAttribute'
  '4096'        : 'LLVMAlwaysInlineAttribute'
  '8192'        : 'LLVMOptimizeForSizeAttribute'
  '16384'       : 'LLVMStackProtectAttribute'
  '32768'       : 'LLVMStackProtectReqAttribute'
  '2031616'     : 'LLVMAlignment'
  '2097152'     : 'LLVMNoCaptureAttribute'
  '4194304'     : 'LLVMNoRedZoneAttribute'
  '8388608'     : 'LLVMNoImplicitFloatAttribute'
  '16777216'    : 'LLVMNakedAttribute'
  '33554432'    : 'LLVMInlineHintAttribute'
  '469762048'   : 'LLVMStackAlignment'
  '536870912'   : 'LLVMReturnsTwice'
  '1073741824'  : 'LLVMUWTable'
  '-2147483648' : 'LLVMNonLazyBind'
  #
  #FIXME: These attributes are currently not included in the C API as
     #a temporary measure until the API/ABI impact to the C API is understood
     #and the path forward agreed upon.
  #LLVMAddressSafety = 1ULL << 32,
  #LLVMStackProtectStrongAttribute = 1ULL<<33,
  #LLVMCold = 1ULL << 34,
  #LLVMOptimizeNone = 1ULL << 35,
  #LLVMInAllocaAttribute = 1ULL << 36,
  #LLVMNonNullAttribute = 1ULL << 37,
  #LLVMJumpTableAttribute = 1ULL << 38,
  #LLVMDereferenceableAttribute = 1ULL << 39,



exports.LLVMAtomicOrdering =
  LLVMAtomicOrderingNotAtomic              : 0   #< A load or store which is not atomic
  LLVMAtomicOrderingUnordered              : 1   #< Lowest level of atomicity, guarantees
  LLVMAtomicOrderingMonotonic              : 2   #< guarantees that if you take all the
  LLVMAtomicOrderingAcquire                : 4   #< Acquire provides a barrier of the sort
  LLVMAtomicOrderingRelease                : 5   #< Release is similar to Acquire, but with
  LLVMAtomicOrderingAcquireRelease         : 6   #< provides both an Acquire and a
  LLVMAtomicOrderingSequentiallyConsistent : 7   #< provides Acquire semantics
  '0' : 'LLVMAtomicOrderingNotAtomic'
  '1' : 'LLVMAtomicOrderingUnordered'
  '2' : 'LLVMAtomicOrderingMonotonic'
  '4' : 'LLVMAtomicOrderingAcquire'
  '5' : 'LLVMAtomicOrderingRelease'
  '6' : 'LLVMAtomicOrderingAcquireRelease'
  '7' : 'LLVMAtomicOrderingSequentiallyConsistent'

exports.LLVMAtomicRMWBinOp =
  LLVMAtomicRMWBinOpXchg : 0   #< Set the new value and return the one old
  LLVMAtomicRMWBinOpAdd  : 1   #< Add a value and return the old one
  LLVMAtomicRMWBinOpSub  : 2   #< Subtract a value and return the old one
  LLVMAtomicRMWBinOpAnd  : 3   #< And a value and return the old one
  LLVMAtomicRMWBinOpNand : 4   #< Not-And a value and return the old one
  LLVMAtomicRMWBinOpOr   : 5   #< OR a value and return the old one
  LLVMAtomicRMWBinOpXor  : 6   #< Xor a value and return the old one
  LLVMAtomicRMWBinOpMax  : 7   #< Sets the value if it's greater than the
  LLVMAtomicRMWBinOpMin  : 8   #< Sets the value if it's Smaller than the
  LLVMAtomicRMWBinOpUMax : 9   #< Sets the value if it's greater than the
  LLVMAtomicRMWBinOpUMin : 10   #< Sets the value if it's greater than the
  '0'  : 'LLVMAtomicRMWBinOpXchg'
  '1'  : 'LLVMAtomicRMWBinOpAdd'
  '2'  : 'LLVMAtomicRMWBinOpSub'
  '3'  : 'LLVMAtomicRMWBinOpAnd'
  '4'  : 'LLVMAtomicRMWBinOpNand'
  '5'  : 'LLVMAtomicRMWBinOpOr'
  '6'  : 'LLVMAtomicRMWBinOpXor'
  '7'  : 'LLVMAtomicRMWBinOpMax'
  '8'  : 'LLVMAtomicRMWBinOpMin'
  '9'  : 'LLVMAtomicRMWBinOpUMax'
  '10' : 'LLVMAtomicRMWBinOpUMin'



LLVMPassRegistryRef      = exports.LLVMPassRegistryRef      = voidPtr
LLVMPassRegistryRefPtr   = exports.LLVMPassRegistryRefPtr   = ref.refType(LLVMPassRegistryRef)
LLVMFatalErrorHandler    = exports.LLVMFatalErrorHandler    = FFI.Function(ref.types.void, [ ref.types.CString ])
LLVMFatalErrorHandlerPtr = exports.LLVMFatalErrorHandlerPtr = ref.refType(LLVMFatalErrorHandler)
LLVMContextRef           = exports.LLVMContextRef           = voidPtr
LLVMContextRefPtr        = exports.LLVMContextRefPtr        = ref.refType(LLVMContextRef)
LLVMDiagnosticHandler    = exports.LLVMDiagnosticHandler    = FFI.Function(ref.types.void, [ voidPtr voidPtr ])
LLVMDiagnosticHandlerPtr = exports.LLVMDiagnosticHandlerPtr = ref.refType(LLVMDiagnosticHandler)
LLVMYieldCallback        = exports.LLVMYieldCallback        = FFI.Function(ref.types.void, [ voidPtr voidPtr ])
LLVMYieldCallbackPtr     = exports.LLVMYieldCallbackPtr     = ref.refType(LLVMYieldCallback)
LLVMDiagnosticInfoRef    = exports.LLVMDiagnosticInfoRef    = voidPtr
LLVMDiagnosticInfoRefPtr = exports.LLVMDiagnosticInfoRefPtr = ref.refType(LLVMDiagnosticInfoRef)
LLVMModuleRef            = exports.LLVMModuleRef            = voidPtr
LLVMModuleRefPtr         = exports.LLVMModuleRefPtr         = ref.refType(LLVMModuleRef)
LLVMTypeRef              = exports.LLVMTypeRef              = voidPtr
LLVMTypeRefPtr           = exports.LLVMTypeRefPtr           = ref.refType(LLVMTypeRef)
LLVMValueRef             = exports.LLVMValueRef             = voidPtr
LLVMValueRefPtr          = exports.LLVMValueRefPtr          = ref.refType(LLVMValueRef)
LLVMUseRef               = exports.LLVMUseRef               = voidPtr
LLVMUseRefPtr            = exports.LLVMUseRefPtr            = ref.refType(LLVMUseRef)
LLVMBasicBlockRef        = exports.LLVMBasicBlockRef        = voidPtr
LLVMBasicBlockRefPtr     = exports.LLVMBasicBlockRefPtr     = ref.refType(LLVMBasicBlockRef)
LLVMBuilderRef           = exports.LLVMBuilderRef           = voidPtr
LLVMBuilderRefPtr        = exports.LLVMBuilderRefPtr        = ref.refType(LLVMBuilderRef)
LLVMModuleProviderRef    = exports.LLVMModuleProviderRef    = voidPtr
LLVMModuleProviderRefPtr = exports.LLVMModuleProviderRefPtr = ref.refType(LLVMModuleProviderRef)
LLVMMemoryBufferRef      = exports.LLVMMemoryBufferRef      = voidPtr
LLVMMemoryBufferRefPtr   = exports.LLVMMemoryBufferRefPtr   = ref.refType(LLVMMemoryBufferRef)
LLVMPassManagerRef       = exports.LLVMPassManagerRef       = voidPtr
LLVMPassManagerRefPtr    = exports.LLVMPassManagerRefPtr    = ref.refType(LLVMPassManagerRef)

try
  exports.library = new (FFI.Library)('libLLVM-3.6',
    LLVMLoadLibraryPermanently: [ ref.types.int32 [ ref.types.CString ] ]
    LLVMInitializeCore: [ ref.types.void [ LLVMPassRegistryRef ] ]
    # Deallocate and destroy all ManagedStatic variables.
    # @see llvm::llvm_shutdown
    # @see ManagedStatic
    LLVMShutdown: [ ref.types.void [] ]
    # Error handling
    LLVMCreateMessage: [ ref.types.CString [ ref.types.CString ] ]
    LLVMDisposeMessage: [ ref.types.void [ ref.types.CString ] ]
    #
    # Install a fatal error handler. By default, if LLVM detects a fatal error, it
    # will call exit(1). This may not be appropriate in many contexts. For example,
    # doing exit(1) will bypass many crash reporting/tracing system tools. This
    # function allows you to install a callback that will be invoked prior to the
    # call to exit(1).
    #
    LLVMInstallFatalErrorHandler: [ ref.types.void [ LLVMFatalErrorHandler ] ]
    #
    # Reset the fatal error handler. This resets LLVM's fatal error handling
    # behavior to the default.
    #
    LLVMResetFatalErrorHandler: [ ref.types.void [] ]
    #
    # Enable LLVM's built-in stack trace code. This intercepts the OS's crash
    # signals and prints which component of LLVM you were in at the time if the
    # crash.
    #
    LLVMEnablePrettyStackTrace: [ ref.types.void [] ]
    #
    # Create a new context.
    #
    # Every call to this function should be paired with a call to
    # LLVMContextDispose() or the context will leak memory.
    #
    LLVMContextCreate: [ LLVMContextRef [] ]
    #
    # Obtain the global context instance.
    #
    LLVMGetGlobalContext: [ LLVMContextRef [] ]
    #
    # Set the diagnostic handler for this context.
    #
    LLVMContextSetDiagnosticHandler: [ ref.types.void [ LLVMContextRef LLVMDiagnosticHandler voidPtr ] ]
    #
    # Set the yield callback function for this context.
    #
    # @see LLVMContext::setYieldCallback()
    #
    LLVMContextSetYieldCallback: [ ref.types.void [ LLVMContextRef LLVMYieldCallback voidPtr ] ]
    #
    # Destroy a context instance.
    #
    # This should be called for every call to LLVMContextCreate() or memory
    # will be leaked.
    #
    LLVMContextDispose: [ ref.types.void [ LLVMContextRef ] ]
    #
    # Return a string representation of the DiagnosticInfo. Use
    # LLVMDisposeMessage to free the string.
    #
    # @see DiagnosticInfo::print()
    #
    LLVMGetDiagInfoDescription: [ ref.types.CString [ LLVMDiagnosticInfoRef ] ]
    #
    # Return an enum LLVMDiagnosticSeverity.
    #
    # @see DiagnosticInfo::getSeverity()
    #
    LLVMGetDiagInfoSeverity: [ ref.types.uint32 [ LLVMDiagnosticInfoRef ] ]
    #
    # Return an enum LLVMDiagnosticSeverity.
    #
    # @see DiagnosticInfo::getSeverity()
    #
    LLVMGetMDKindIDInContext: [ ref.types.uint32 [ LLVMContextRef ref.types.CString ref.types.uint32 ] ]
    #
    # Return an enum LLVMDiagnosticSeverity.
    #
    # @see DiagnosticInfo::getSeverity()
    #
    LLVMGetMDKindID: [ ref.types.uint32 [ ref.types.CString ref.types.uint32 ] ]
    #
    # Create a new, empty module in the global context.
    #
    # This is equivalent to calling LLVMModuleCreateWithNameInContext with
    # LLVMGetGlobalContext() as the context parameter.
    #
    # Every invocation should be paired with LLVMDisposeModule() or memory
    # will be leaked.
    #
    LLVMModuleCreateWithName: [ LLVMModuleRef [ ref.types.CString ] ]
    #
    # Create a new, empty module in the global context.
    #
    # This is equivalent to calling LLVMModuleCreateWithNameInContext with
    # LLVMGetGlobalContext() as the context parameter.
    #
    # Every invocation should be paired with LLVMDisposeModule() or memory
    # will be leaked.
    #
    LLVMModuleCreateWithNameInContext: [ LLVMModuleRef [ ref.types.CString LLVMContextRef ] ]
    #
    # Destroy a module instance.
    #
    # This must be called for every created module or memory will be
    # leaked.
    #
    LLVMDisposeModule: [ ref.types.void [ LLVMModuleRef ] ]
    #
    # Obtain the data layout for a module.
    #
    # @see Module::getDataLayout()
    #
    LLVMGetDataLayout: [ ref.types.CString [ LLVMModuleRef ] ]
    #
    # Set the data layout for a module.
    #
    # @see Module::setDataLayout()
    #
    LLVMSetDataLayout: [ ref.types.void [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain the target triple for a module.
    #
    # @see Module::getTargetTriple()
    #
    LLVMGetTarget: [ ref.types.CString [ LLVMModuleRef ] ]
    #
    # Set the target triple for a module.
    #
    # @see Module::setTargetTriple()
    #
    LLVMSetTarget: [ ref.types.void [ LLVMModuleRef ref.types.CString ] ]
    #
    # Dump a representation of a module to stderr.
    #
    # @see Module::dump()
    #
    LLVMDumpModule: [ ref.types.void [ LLVMModuleRef ] ]
    #
    # Print a representation of a module to a file. The ErrorMessage needs to be
    # disposed with LLVMDisposeMessage. Returns 0 on success, 1 otherwise.
    #
    # @see Module::print()
    #
    LLVMPrintModuleToFile: [ ref.types.int32 [ LLVMModuleRef ref.types.CString voidPtr ] ]
    #
    # Return a string representation of the module. Use
    # LLVMDisposeMessage to free the string.
    #
    # @see Module::print()
    #
    LLVMPrintModuleToString: [ ref.types.CString [ LLVMModuleRef ] ]
    #
    # Set inline assembly for a module.
    #
    # @see Module::setModuleInlineAsm()
    #
    LLVMSetModuleInlineAsm: [ ref.types.void [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain the context to which this module is associated.
    #
    # @see Module::getContext()
    #
    LLVMGetModuleContext: [ LLVMContextRef [ LLVMModuleRef ] ]
    #
    # Obtain a Type from a module by its registered name.
    #
    LLVMGetTypeByName: [ LLVMTypeRef [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain the number of operands for named metadata in a module.
    #
    # @see llvm::Module::getNamedMetadata()
    #
    LLVMGetNamedMetadataNumOperands: [ ref.types.uint32 [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain the named metadata operands for a module.
    #
    # The passed LLVMValueRef pointer should refer to an array of
    # LLVMValueRef at least LLVMGetNamedMetadataNumOperands long. This
    # array will be populated with the LLVMValueRef instances. Each
    # instance corresponds to a llvm::MDNode.
    #
    # @see llvm::Module::getNamedMetadata()
    # @see llvm::MDNode::getOperand()
    #
    LLVMGetNamedMetadataOperands: [ ref.types.void [ LLVMModuleRef ref.types.CString LLVMValueRef ] ]
    #
    # Add an operand to named metadata.
    #
    # @see llvm::Module::getNamedMetadata()
    # @see llvm::MDNode::addOperand()
    #
    LLVMAddNamedMetadataOperand: [ ref.types.void [ LLVMModuleRef ref.types.CString LLVMValueRef ] ]
    #
    # Add a function to a module under a specified name.
    #
    # @see llvm::Function::Create()
    #
    LLVMAddFunction: [ LLVMValueRef [ LLVMModuleRef ref.types.CString LLVMTypeRef ] ]
    #
    # Obtain a Function value from a Module by its name.
    #
    # The returned value corresponds to a llvm::Function value.
    #
    # @see llvm::Module::getFunction()
    #
    LLVMGetNamedFunction: [ LLVMValueRef [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain an iterator to the first Function in a Module.
    #
    # @see llvm::Module::begin()
    #
    LLVMGetFirstFunction: [ LLVMValueRef [ LLVMModuleRef ] ]
    #
    # Obtain an iterator to the last Function in a Module.
    #
    # @see llvm::Module::end()
    #
    LLVMGetLastFunction: [ LLVMValueRef [ LLVMModuleRef ] ]
    #
    # Advance a Function iterator to the next Function.
    #
    # Returns NULL if the iterator was already at the end and there are no more
    # functions.
    #
    LLVMGetNextFunction: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Decrement a Function iterator to the previous Function.
    #
    # Returns NULL if the iterator was already at the beginning and there are
    # no previous functions.
    #
    LLVMGetPreviousFunction: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the enumerated type of a Type instance.
    #
    # @see llvm::Type:getTypeID()
    #
    LLVMGetTypeKind: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Whether the type has a known size.
    #
    # Things that don't have a size are abstract types, labels, and void.a
    #
    # @see llvm::Type::isSized()
    #
    LLVMTypeIsSized: [ ref.types.int32 [ LLVMTypeRef ] ]
    #
    # Obtain the context to which this type instance is associated.
    #
    # @see llvm::Type::getContext()
    #
    LLVMGetTypeContext: [ LLVMContextRef [ LLVMTypeRef ] ]
    #
    # Dump a representation of a type to stderr.
    #
    # @see llvm::Type::dump()
    #
    LLVMDumpType: [ ref.types.void [ LLVMTypeRef ] ]
    #
    # Return a string representation of the type. Use
    # LLVMDisposeMessage to free the string.
    #
    # @see llvm::Type::print()
    #
    LLVMPrintTypeToString: [ ref.types.CString [ LLVMTypeRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt1TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt8TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt16TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt32TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt64TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMIntTypeInContext: [ LLVMTypeRef [ LLVMContextRef ref.types.uint32 ] ]
    #
    # Obtain an integer type from the global context with a specified bit
    # width.
    #
    LLVMInt1Type: [ LLVMTypeRef [] ]
    LLVMInt8Type: [ LLVMTypeRef [] ]
    LLVMInt16Type: [ LLVMTypeRef [] ]
    LLVMInt32Type: [ LLVMTypeRef [] ]
    LLVMInt64Type: [ LLVMTypeRef [] ]
    LLVMIntType: [ LLVMTypeRef [ ref.types.uint32 ] ]
    LLVMGetIntTypeWidth: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Obtain a 16-bit floating point type from a context.
    #
    LLVMHalfTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 32-bit floating point type from a context.
    #
    LLVMFloatTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 64-bit floating point type from a context.
    #
    LLVMDoubleTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 80-bit floating point type (X87) from a context.
    #
    LLVMX86FP80TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 128-bit floating point type (112-bit mantissa) from a
    # context.
    #
    LLVMFP128TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 128-bit floating point type (two 64-bits) from a context.
    #
    LLVMPPCFP128TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a floating point type from the global context.
    #
    # These map to the functions in this group of the same name.
    #
    LLVMHalfType: [ LLVMTypeRef [] ]
    LLVMFloatType: [ LLVMTypeRef [] ]
    LLVMDoubleType: [ LLVMTypeRef [] ]
    LLVMX86FP80Type: [ LLVMTypeRef [] ]
    LLVMFP128Type: [ LLVMTypeRef [] ]
    LLVMPPCFP128Type: [ LLVMTypeRef [] ]
    #
    # Obtain a function type consisting of a specified signature.
    #
    # The function is defined as a tuple of a return Type, a list of
    # parameter types, and whether the function is variadic.
    #
    LLVMFunctionType: [ LLVMTypeRef [ LLVMTypeRef LLVMTypeRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Returns whether a function type is variadic.
    #
    LLVMIsFunctionVarArg: [ ref.types.int32 [ LLVMTypeRef ] ]
    #
    # Obtain the Type this function Type returns.
    #
    LLVMGetReturnType: [ LLVMTypeRef [ LLVMTypeRef ] ]
    #
    # Obtain the number of parameters this function accepts.
    #
    LLVMCountParamTypes: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Obtain the types of a function's parameters.
    #
    # The Dest parameter should point to a pre-allocated array of
    # LLVMTypeRef at least LLVMCountParamTypes() large. On return, the
    # first LLVMCountParamTypes() entries in the array will be populated
    # with LLVMTypeRef instances.
    #
    # @param FunctionTy The function type to operate on.
    # @param Dest Memory address of an array to be filled with result.
    #
    LLVMGetParamTypes: [ ref.types.void [ LLVMTypeRef LLVMTypeRefPtr ] ]
    #
    # Create a new structure type in a context.
    #
    # A structure is specified by a list of inner elements/types and
    # whether these can be packed together.
    #
    # @see llvm::StructType::create()
    #
    LLVMStructTypeInContext: [ LLVMTypeRef [ LLVMContextRef LLVMTypeRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Create a new structure type in the global context.
    #
    # @see llvm::StructType::create()
    #
    LLVMStructType: [ LLVMTypeRef [ LLVMTypeRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Create an empty structure in a context having a specified name.
    #
    # @see llvm::StructType::create()
    #
    LLVMStructCreateNamed: [ LLVMTypeRef [ LLVMContextRef ref.types.CString ] ]
    #
    # Obtain the name of a structure.
    #
    # @see llvm::StructType::getName()
    #
    LLVMGetStructName: [ ref.types.CString [ LLVMTypeRef ] ]
    #
    # Set the contents of a structure type.
    #
    # @see llvm::StructType::setBody()
    #
    LLVMStructSetBody: [ ref.types.void [ LLVMTypeRef LLVMTypeRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Get the number of elements defined inside the structure.
    #
    # @see llvm::StructType::getNumElements()
    #
    LLVMCountStructElementTypes: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Get the elements within a structure.
    #
    # The function is passed the address of a pre-allocated array of
    # LLVMTypeRef at least LLVMCountStructElementTypes() long. After
    # invocation, this array will be populated with the structure's
    # elements. The objects in the destination array will have a lifetime
    # of the structure type itself, which is the lifetime of the context it
    # is contained in.
    #
    LLVMGetStructElementTypes: [ ref.types.void [ LLVMTypeRef LLVMTypeRefPtr ] ]
    #
    # Determine whether a structure is packed.
    #
    # @see llvm::StructType::isPacked()
    #
    LLVMIsPackedStruct: [ ref.types.int32 [ LLVMTypeRef ] ]
    #
    # Determine whether a structure is opaque.
    #
    # @see llvm::StructType::isOpaque()
    #
    LLVMIsOpaqueStruct: [ ref.types.int32 [ LLVMTypeRef ] ]
    #
    # Obtain the type of elements within a sequential type.
    #
    # This works on array, vector, and pointer types.
    #
    # @see llvm::SequentialType::getElementType()
    #
    LLVMGetElementType: [ LLVMTypeRef [ LLVMTypeRef ] ]
    #
    # Create a fixed size array type that refers to a specific type.
    #
    # The created type will exist in the context that its element type
    # exists in.
    #
    # @see llvm::ArrayType::get()
    #
    LLVMArrayType: [ LLVMTypeRef [ LLVMTypeRef ref.types.uint32 ] ]
    #
    # Obtain the length of an array type.
    #
    # This only works on types that represent arrays.
    #
    # @see llvm::ArrayType::getNumElements()
    #
    LLVMGetArrayLength: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Create a pointer type that points to a defined type.
    #
    # The created type will exist in the context that its pointee type
    # exists in.
    #
    # @see llvm::PointerType::get()
    #
    LLVMPointerType: [ LLVMTypeRef [ LLVMTypeRef ref.types.uint32 ] ]
    #
    # Obtain the address space of a pointer type.
    #
    # This only works on types that represent pointers.
    #
    # @see llvm::PointerType::getAddressSpace()
    #
    LLVMGetPointerAddressSpace: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Create a vector type that contains a defined type and has a specific
    # number of elements.
    #
    # The created type will exist in the context thats its element type
    # exists in.
    #
    # @see llvm::VectorType::get()
    #
    LLVMVectorType: [ LLVMTypeRef [ LLVMTypeRef ref.types.uint32 ] ]
    #
    # Obtain the number of elements in a vector type.
    #
    # This only works on types that represent vectors.
    #
    # @see llvm::VectorType::getNumElements()
    #
    LLVMGetVectorSize: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Create a void type in a context.
    #
    LLVMVoidTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Create a label type in a context.
    #
    LLVMLabelTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Create a X86 MMX type in a context.
    #
    LLVMX86MMXTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # These are similar to the above functions except they operate on the
    # global context.
    #
    LLVMVoidType: [ LLVMTypeRef [] ]
    #
    # These are similar to the above functions except they operate on the
    # global context.
    #
    LLVMLabelType: [ LLVMTypeRef [] ]
    #
    # These are similar to the above functions except they operate on the
    # global context.
    #
    LLVMX86MMXType: [ LLVMTypeRef [] ]
    #
    # Obtain the type of a value.
    #
    # @see llvm::Value::getType()
    #
    LLVMTypeOf: [ LLVMTypeRef [ LLVMValueRef ] ]
    #
    # Obtain the string name of a value.
    #
    # @see llvm::Value::getName()
    #
    LLVMGetValueName: [ ref.types.CString [ LLVMValueRef ] ]
    #
    # Set the string name of a value.
    #
    # @see llvm::Value::setName()
    #
    LLVMSetValueName: [ ref.types.void [ LLVMValueRef ref.types.CString ] ]
    #
    # Dump a representation of a value to stderr.
    #
    # @see llvm::Value::dump()
    #
    LLVMDumpValue: [ ref.types.void [ LLVMValueRef ] ]
    #
    # Return a string representation of the value. Use
    # LLVMDisposeMessage to free the string.
    #
    # @see llvm::Value::print()
    #
    LLVMPrintValueToString: [ ref.types.CString [ LLVMValueRef ] ]
    #
    # Replace all uses of a value with another one.
    #
    # @see llvm::Value::replaceAllUsesWith()
    #
    LLVMReplaceAllUsesWith: [ ref.types.void [ LLVMValueRef LLVMValueRef ] ]
    #
    # Determine whether the specified constant instance is constant.
    #
    LLVMIsConstant: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Determine whether a value instance is undefined.
    #
    LLVMIsUndef: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # @defgroup LLVMCCoreValues Values
    #
    # The bulk of LLVM's object model consists of values, which comprise a very
    # rich type hierarchy.
    #
    # LLVMValueRef essentially represents llvm::Value. There is a rich
    # hierarchy of classes within this type. Depending on the instance
    # obtained, not all APIs are available.
    #
    # Callers can determine the type of an LLVMValueRef by calling the
    # LLVMIsA* family of functions (e.g. LLVMIsAArgument()). These
    # functions are defined by a macro, so it isn't obvious which are
    # available by looking at the Doxygen source code. Instead, look at the
    # source definition of LLVM_FOR_EACH_VALUE_SUBCLASS and note the list
    # of value names given. These value names also correspond to classes in
    # the llvm::Value hierarchy.
    #
    # @{
    #
    LLVMIsAArgument: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABasicBlock: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInlineAsm: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMDNode: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMDString: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUser: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstant: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABlockAddress: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantAggregateZero: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantArray: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantDataSequential: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantDataArray: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantDataVector: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantExpr: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantFP: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantInt: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantPointerNull: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantStruct: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantVector: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGlobalValue: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGlobalAlias: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGlobalObject: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFunction: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGlobalVariable: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUndefValue: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInstruction: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABinaryOperator: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsACallInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAIntrinsicInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsADbgInfoIntrinsic: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsADbgDeclareInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMemIntrinsic: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMemCpyInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMemMoveInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMemSetInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsACmpInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFCmpInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAICmpInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAExtractElementInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGetElementPtrInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInsertElementInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInsertValueInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsALandingPadInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAPHINode: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsASelectInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAShuffleVectorInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAStoreInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsATerminatorInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABranchInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAIndirectBrInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInvokeInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAReturnInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsASwitchInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUnreachableInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAResumeInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUnaryInstruction: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAAllocaInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsACastInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAAddrSpaceCastInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABitCastInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFPExtInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFPToSIInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFPToUIInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFPTruncInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAIntToPtrInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAPtrToIntInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsASExtInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsASIToFPInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsATruncInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUIToFPInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAZExtInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAExtractValueInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsALoadInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAVAArgInst: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # @defgroup LLVMCCoreValueGeneral General APIs
    #
    # Functions in this section work on all LLVMValueRef instances,
    # regardless of their sub-type. They correspond to functions available
    # on llvm::Value.
    #
    # @{
    #
    #
    # Obtain the first use of a value.
    #
    # Uses are obtained in an iterator fashion. First, call this function
    # to obtain a reference to the first use. Then, call LLVMGetNextUse()
    # on that instance and all subsequently obtained instances until
    # LLVMGetNextUse() returns NULL.
    #
    # @see llvm::Value::use_begin()
    #
    LLVMGetFirstUse: [ LLVMUseRef [ LLVMValueRef ] ]
    #
    # Obtain the next use of a value.
    #
    # This effectively advances the iterator. It returns NULL if you are on
    # the final use and no more are available.
    #
    LLVMGetNextUse: [ LLVMUseRef [ LLVMUseRef ] ]
    #
    # Obtain the user value for a user.
    #
    # The returned value corresponds to a llvm::User type.
    #
    # @see llvm::Use::getUser()
    #
    LLVMGetUser: [ LLVMValueRef [ LLVMUseRef ] ]
    #
    # Obtain the value this use corresponds to.
    #
    # @see llvm::Use::get().
    #
    LLVMGetUsedValue: [ LLVMValueRef [ LLVMUseRef ] ]
    #
    # Obtain an operand at a specific index in a llvm::User value.
    #
    # @see llvm::User::getOperand()
    #
    LLVMGetOperand: [ LLVMValueRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Set an operand at a specific index in a llvm::User value.
    #
    # @see llvm::User::setOperand()
    #
    LLVMSetOperand: [ ref.types.void [ LLVMValueRef ref.types.uint32 LLVMValueRef ] ]
    #
    # Obtain the number of operands in a llvm::User value.
    #
    # @see llvm::User::getNumOperands()
    #
    LLVMGetNumOperands: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Obtain a constant value referring to the null instance of a type.
    #
    # @see llvm::Constant::getNullValue()
    #
    LLVMConstNull: [ LLVMValueRef [ LLVMTypeRef ] ]
    #
    # Obtain a constant value referring to the instance of a type
    # consisting of all ones.
    #
    # This is only valid for integer types.
    #
    # @see llvm::Constant::getAllOnesValue()
    #
    LLVMConstAllOnes: [ LLVMValueRef [ LLVMTypeRef ] ]
    #
    # Obtain a constant value referring to an undefined value of a type.
    #
    # @see llvm::UndefValue::get()
    #
    LLVMGetUndef: [ LLVMValueRef [ LLVMTypeRef ] ]
    #
    # Determine whether a value instance is null.
    #
    # @see llvm::Constant::isNullValue()
    #
    LLVMIsNull: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Obtain a constant that is a constant pointer pointing to NULL for a
    # specified type.
    #
    LLVMConstPointerNull: [ LLVMValueRef [ LLVMTypeRef ] ]
    #
    # Obtain a constant value for an integer type.
    #
    # The returned value corresponds to a llvm::ConstantInt.
    #
    # @see llvm::ConstantInt::get()
    #
    # @param IntTy Integer type to obtain value of.
    # @param N The value the returned instance should refer to.
    # @param SignExtend Whether to sign extend the produced value.
    #
    LLVMConstInt: [ LLVMValueRef [ LLVMTypeRef ref.types.ulonglong ref.types.int32 ] ]
    #
    # Obtain a constant value for an integer parsed from a string.
    #
    # A similar API, LLVMConstIntOfStringAndSize is also available. If the
    # string's length is available, it is preferred to call that function
    # instead.
    #
    # @see llvm::ConstantInt::get()
    #
    LLVMConstIntOfString: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ref.types.uchar ] ]
    #
    # Obtain a constant value for an integer parsed from a string with
    # specified length.
    #
    # @see llvm::ConstantInt::get()
    #
    LLVMConstIntOfStringAndSize: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ref.types.uint32 ref.types.uchar ] ]
    #
    # Obtain a constant value referring to a double floating point value.
    #
    LLVMConstReal: [ LLVMValueRef [ LLVMTypeRef ref.types.double ] ]
    #
    # Obtain a constant for a floating point value parsed from a string.
    #
    # A similar API, LLVMConstRealOfStringAndSize is also available. It
    # should be used if the input string's length is known.
    #
    LLVMConstRealOfString: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ] ]
    #
    # Obtain a constant for a floating point value parsed from a string.
    #
    LLVMConstRealOfStringAndSize: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ref.types.uint32 ] ]
    #
    # Obtain the zero extended value for an integer constant value.
    #
    # @see llvm::ConstantInt::getZExtValue()
    #
    LLVMConstIntGetZExtValue: [ ref.types.ulonglong [ LLVMValueRef ] ]
    #
    # Obtain the sign extended value for an integer constant value.
    #
    # @see llvm::ConstantInt::getSExtValue()
    #
    LLVMConstIntGetSExtValue: [ ref.types.longlong [ LLVMValueRef ] ]
    #
    # Create a ConstantDataSequential and initialize it with a string.
    #
    # @see llvm::ConstantDataArray::getString()
    #
    LLVMConstStringInContext: [ LLVMValueRef [ LLVMContextRef ref.types.CString ref.types.uint32 ref.types.int32 ] ]
    #
    # Create a ConstantDataSequential with string content in the global context.
    #
    # This is the same as LLVMConstStringInContext except it operates on the
    # global context.
    #
    # @see LLVMConstStringInContext()
    # @see llvm::ConstantDataArray::getString()
    #
    LLVMConstString: [ LLVMValueRef [ ref.types.CString ref.types.uint32 ref.types.int32 ] ]
    #
    # Create an anonymous ConstantStruct with the specified values.
    #
    # @see llvm::ConstantStruct::getAnon()
    #
    LLVMConstStructInContext: [ LLVMValueRef [ LLVMContextRef LLVMValueRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Create a ConstantStruct in the global Context.
    #
    # This is the same as LLVMConstStructInContext except it operates on the
    # global Context.
    #
    # @see LLVMConstStructInContext()
    #
    LLVMConstStruct: [ LLVMValueRef [ LLVMValueRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Create a ConstantArray from values.
    #
    # @see llvm::ConstantArray::get()
    #
    LLVMConstArray: [ LLVMValueRef [ LLVMTypeRef LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # Create a non-anonymous ConstantStruct from values.
    #
    # @see llvm::ConstantStruct::get()
    #
    LLVMConstNamedStruct: [ LLVMValueRef [ LLVMTypeRef LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # Create a ConstantVector from values.
    #
    # @see llvm::ConstantVector::get()
    #
    LLVMConstVector: [ LLVMValueRef [ LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # @defgroup LLVMCCoreValueConstantExpressions Constant Expressions
    #
    # Functions in this group correspond to APIs on llvm::ConstantExpr.
    #
    # @see llvm::ConstantExpr.
    #
    # @{
    #
    LLVMGetConstOpcode: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMAlignOf: [ LLVMValueRef [ LLVMTypeRef ] ]
    LLVMSizeOf: [ LLVMValueRef [ LLVMTypeRef ] ]
    LLVMConstNeg: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstNSWNeg: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstNUWNeg: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstFNeg: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstNot: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstAdd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNSWAdd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNUWAdd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFAdd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstSub: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNSWSub: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNUWSub: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFSub: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstMul: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNSWMul: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNUWMul: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFMul: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstUDiv: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstSDiv: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstExactSDiv: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFDiv: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstURem: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstSRem: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFRem: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstAnd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstOr: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstXor: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstICmp: [ LLVMValueRef [ ref.types.uint32 LLVMValueRef LLVMValueRef ] ]
    LLVMConstFCmp: [ LLVMValueRef [ ref.types.uint32 LLVMValueRef LLVMValueRef ] ]
    LLVMConstShl: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstLShr: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstAShr: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstGEP: [ LLVMValueRef [ LLVMValueRef LLVMValueRefPtr ref.types.uint32 ] ]
    LLVMConstInBoundsGEP: [ LLVMValueRef [ LLVMValueRef LLVMValueRefPtr ref.types.uint32 ] ]
    LLVMConstTrunc: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstSExt: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstZExt: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstFPTrunc: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstFPExt: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstUIToFP: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstSIToFP: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstFPToUI: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstFPToSI: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstPtrToInt: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstIntToPtr: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstBitCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstAddrSpaceCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstZExtOrBitCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstSExtOrBitCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstTruncOrBitCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstPointerCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstIntCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ref.types.int32 ] ]
    LLVMConstFPCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstSelect: [ LLVMValueRef [ LLVMValueRef LLVMValueRef LLVMValueRef ] ]
    LLVMConstExtractElement: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstInsertElement: [ LLVMValueRef [ LLVMValueRef LLVMValueRef LLVMValueRef ] ]
    LLVMConstShuffleVector: [ LLVMValueRef [ LLVMValueRef LLVMValueRef LLVMValueRef ] ]
    LLVMConstExtractValue: [ LLVMValueRef [ LLVMValueRef ref.refType(ref.types.uint32) ref.types.uint32 ] ]
    LLVMConstInsertValue: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ref.refType(ref.types.uint32) ref.types.uint32 ] ]
    LLVMConstInlineAsm: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ref.types.CString ref.types.int32 ref.types.int32 ] ]
    LLVMBlockAddress: [ LLVMValueRef [ LLVMValueRef LLVMBasicBlockRef ] ]
    #
    # @}
    #

    #
    # @defgroup LLVMCCoreValueConstantGlobals Global Values
    #
    # This group contains functions that operate on global values. Functions in
    # this group relate to functions in the llvm::GlobalValue class tree.
    #
    # @see llvm::GlobalValue
    #
    # @{
    #
    LLVMGetGlobalParent: [ LLVMModuleRef [ LLVMValueRef ] ]
    LLVMIsDeclaration: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMGetLinkage: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMSetLinkage: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    LLVMGetSection: [ ref.types.CString [ LLVMValueRef ] ]
    LLVMSetSection: [ ref.types.void [ LLVMValueRef ref.types.CString ] ]
    LLVMGetVisibility: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMSetVisibility: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    LLVMGetDLLStorageClass: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMSetDLLStorageClass: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    LLVMHasUnnamedAddr: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetUnnamedAddr: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]

    #
    # Obtain the preferred alignment of the value.
    # @see llvm::AllocaInst::getAlignment()
    # @see llvm::LoadInst::getAlignment()
    # @see llvm::StoreInst::getAlignment()
    # @see llvm::GlobalValue::getAlignment()
    #
    LLVMGetAlignment: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Set the preferred alignment of the value.
    # @see llvm::AllocaInst::setAlignment()
    # @see llvm::LoadInst::setAlignment()
    # @see llvm::StoreInst::setAlignment()
    # @see llvm::GlobalValue::setAlignment()
    #
    LLVMSetAlignment: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    #
    # @defgroup LLVMCoreValueConstantGlobalVariable Global Variables
    #
    # This group contains functions that operate on global variable values.
    #
    # @see llvm::GlobalVariable
    #
    # @{
    #
    LLVMAddGlobal: [ LLVMValueRef [ LLVMModuleRef LLVMTypeRef ref.types.CString ] ]
    LLVMAddGlobalInAddressSpace: [ LLVMValueRef [ LLVMModuleRef LLVMTypeRef ref.types.CString ref.types.uint32 ] ]
    LLVMGetNamedGlobal: [ LLVMValueRef [ LLVMModuleRef ref.types.CString ] ]
    LLVMGetFirstGlobal: [ LLVMValueRef [ LLVMModuleRef ] ]
    LLVMGetLastGlobal: [ LLVMValueRef [ LLVMModuleRef ] ]
    LLVMGetNextGlobal: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMGetPreviousGlobal: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMDeleteGlobal: [ ref.types.void [ LLVMValueRef ] ]
    LLVMGetInitializer: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMSetInitializer: [ ref.types.void [ LLVMValueRef LLVMValueRef ] ]
    LLVMIsThreadLocal: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetThreadLocal: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    LLVMIsGlobalConstant: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetGlobalConstant: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    LLVMGetThreadLocalMode: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMSetThreadLocalMode: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    LLVMIsExternallyInitialized: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetExternallyInitialized: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # @}
    #
    #
    # @defgroup LLVMCoreValueConstantGlobalAlias Global Aliases
    #
    # This group contains function that operate on global alias values.
    #
    # @see llvm::GlobalAlias
    #
    # @{
    #
    LLVMAddAlias: [ LLVMValueRef [ LLVMModuleRef LLVMTypeRef LLVMValueRef ref.types.CString ] ]
    #
    # @}
    #
    #
    # @defgroup LLVMCCoreValueFunction Function values
    #
    # Functions in this group operate on LLVMValueRef instances that
    # correspond to llvm::Function instances.
    #
    # @see llvm::Function
    #
    # @{
    #
    #
    # Remove a function from its containing module and deletes it.
    #
    # @see llvm::Function::eraseFromParent()
    #
    LLVMDeleteFunction: [ ref.types.void [ LLVMValueRef ] ]
    #
    # Obtain the ID number from a function instance.
    #
    # @see llvm::Function::getIntrinsicID()
    #
    LLVMGetIntrinsicID: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the calling function of a function.
    #
    # The returned value corresponds to the LLVMCallConv enumeration.
    #
    # @see llvm::Function::getCallingConv()
    #
    LLVMGetFunctionCallConv: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Set the calling convention of a function.
    #
    # @see llvm::Function::setCallingConv()
    #
    # @param Fn Function to operate on
    # @param CC LLVMCallConv to set calling convention to
    #
    LLVMSetFunctionCallConv: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain the name of the garbage collector to use during code
    # generation.
    #
    # @see llvm::Function::getGC()
    #
    LLVMGetGC: [ ref.types.CString [ LLVMValueRef ] ]
    #
    # Define the garbage collector to use during code generation.
    #
    # @see llvm::Function::setGC()
    #
    LLVMSetGC: [ ref.types.void [ LLVMValueRef ref.types.CString ] ]
    #
    # Add an attribute to a function.
    #
    # @see llvm::Function::addAttribute()
    #
    LLVMAddFunctionAttr: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Add a target-dependent attribute to a fuction
    # @see llvm::AttrBuilder::addAttribute()
    #
    LLVMAddTargetDependentFunctionAttr: [ ref.types.void [ LLVMValueRef ref.types.CString ref.types.CString ] ]
    #
    # Obtain an attribute from a function.
    #
    # @see llvm::Function::getAttributes()
    #
    LLVMGetFunctionAttr: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Remove an attribute from a function.
    #
    LLVMRemoveFunctionAttr: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Obtain the number of parameters in a function.
    #
    # @see llvm::Function::arg_size()
    #
    LLVMCountParams: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the parameters in a function.
    #
    # The takes a pointer to a pre-allocated array of LLVMValueRef that is
    # at least LLVMCountParams() long. This array will be filled with
    # LLVMValueRef instances which correspond to the parameters the
    # function receives. Each LLVMValueRef corresponds to a llvm::Argument
    # instance.
    #
    # @see llvm::Function::arg_begin()
    #
    LLVMGetParams: [ ref.types.void [ LLVMValueRef LLVMValueRefPtr ] ]
    #
    # Obtain the parameter at the specified index.
    #
    # Parameters are indexed from 0.
    #
    # @see llvm::Function::arg_begin()
    #
    LLVMGetParam: [ LLVMValueRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain the function to which this argument belongs.
    #
    # Unlike other functions in this group, this one takes an LLVMValueRef
    # that corresponds to a llvm::Attribute.
    #
    # The returned LLVMValueRef is the llvm::Function to which this
    # argument belongs.
    #
    LLVMGetParamParent: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the first parameter to a function.
    #
    # @see llvm::Function::arg_begin()
    #
    LLVMGetFirstParam: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the last parameter to a function.
    #
    # @see llvm::Function::arg_end()
    #
    LLVMGetLastParam: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the next parameter to a function.
    #
    # This takes an LLVMValueRef obtained from LLVMGetFirstParam() (which is
    # actually a wrapped iterator) and obtains the next parameter from the
    # underlying iterator.
    #
    LLVMGetNextParam: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the previous parameter to a function.
    #
    # This is the opposite of LLVMGetNextParam().
    #
    LLVMGetPreviousParam: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Add an attribute to a function argument.
    #
    # @see llvm::Argument::addAttr()
    #
    LLVMAddAttribute: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Remove an attribute from a function argument.
    #
    # @see llvm::Argument::removeAttr()
    #
    LLVMRemoveAttribute: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Get an attribute from a function argument.
    #
    LLVMGetAttribute: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Set the alignment for a function parameter.
    #
    # @see llvm::Argument::addAttr()
    # @see llvm::AttrBuilder::addAlignmentAttr()
    #
    LLVMSetParamAlignment: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain a MDString value from a context.
    #
    # The returned instance corresponds to the llvm::MDString class.
    #
    # The instance is specified by string data of a specified length. The
    # string content is copied, so the backing memory can be freed after
    # this function returns.
    #
    LLVMMDStringInContext: [ LLVMValueRef [ LLVMContextRef ref.types.CString ref.types.uint32 ] ]
    #
    # Obtain a MDString value from the global context.
    #
    LLVMMDString: [ LLVMValueRef [ ref.types.CString ref.types.uint32 ] ]
    #
    # Obtain a MDNode value from a context.
    #
    # The returned value corresponds to the llvm::MDNode class.
    #
    LLVMMDNodeInContext: [ LLVMValueRef [ LLVMContextRef LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # Obtain a MDNode value from the global context.
    #
    LLVMMDNode: [ LLVMValueRef [ LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # Obtain the underlying string from a MDString value.
    #
    # @param V Instance to obtain string from.
    # @param Len Memory address which will hold length of returned string.
    # @return String data in MDString.
    #
    LLVMGetMDString: [ ref.types.CString [ LLVMValueRef ref.refType(ref.types.uint32) ] ]
    #
    # Obtain the number of operands from an MDNode value.
    #
    # @param V MDNode to get number of operands from.
    # @return Number of operands of the MDNode.
    #
    LLVMGetMDNodeNumOperands: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the given MDNode's operands.
    #
    # The passed LLVMValueRef pointer should point to enough memory to hold all of
    # the operands of the given MDNode (see LLVMGetMDNodeNumOperands) as
    # LLVMValueRefs. This memory will be populated with the LLVMValueRefs of the
    # MDNode's operands.
    #
    # @param V MDNode to get the operands from.
    # @param Dest Destination array for operands.
    #
    LLVMGetMDNodeOperands: [ ref.types.void [ LLVMValueRef LLVMValueRefPtr ] ]
    #
    # Convert a basic block instance to a value type.
    #
    LLVMBasicBlockAsValue: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Determine whether an LLVMValueRef is itself a basic block.
    #
    LLVMValueIsBasicBlock: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Convert an LLVMValueRef to an LLVMBasicBlockRef instance.
    #
    LLVMValueAsBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Obtain the function to which a basic block belongs.
    #
    # @see llvm::BasicBlock::getParent()
    #
    LLVMGetBasicBlockParent: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Obtain the terminator instruction for a basic block.
    #
    # If the basic block does not have a terminator (it is not well-formed
    # if it doesn't), then NULL is returned.
    #
    # The returned LLVMValueRef corresponds to a llvm::TerminatorInst.
    #
    # @see llvm::BasicBlock::getTerminator()
    #
    LLVMGetBasicBlockTerminator: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Obtain the number of basic blocks in a function.
    #
    # @param Fn Function value to operate on.
    #
    LLVMCountBasicBlocks: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain all of the basic blocks in a function.
    #
    # This operates on a function value. The BasicBlocks parameter is a
    # pointer to a pre-allocated array of LLVMBasicBlockRef of at least
    # LLVMCountBasicBlocks() in length. This array is populated with
    # LLVMBasicBlockRef instances.
    #
    LLVMGetBasicBlocks: [ ref.types.void [ LLVMValueRef LLVMBasicBlockRefPtr ] ]
    #
    # Obtain the first basic block in a function.
    #
    # The returned basic block can be used as an iterator. You will likely
    # eventually call into LLVMGetNextBasicBlock() with it.
    #
    # @see llvm::Function::begin()
    #
    LLVMGetFirstBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Obtain the last basic block in a function.
    #
    # @see llvm::Function::end()
    #
    LLVMGetLastBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Advance a basic block iterator.
    #
    LLVMGetNextBasicBlock: [ LLVMBasicBlockRef [ LLVMBasicBlockRef ] ]
    #
    # Go backwards in a basic block iterator.
    #
    LLVMGetPreviousBasicBlock: [ LLVMBasicBlockRef [ LLVMBasicBlockRef ] ]
    #
    # Obtain the basic block that corresponds to the entry point of a
    # function.
    #
    # @see llvm::Function::getEntryBlock()
    #
    LLVMGetEntryBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Append a basic block to the end of a function.
    #
    # @see llvm::BasicBlock::Create()
    #
    LLVMAppendBasicBlockInContext: [ LLVMBasicBlockRef [ LLVMContextRef LLVMValueRef ref.types.CString ] ]
    #
    # Append a basic block to the end of a function using the global
    # context.
    #
    # @see llvm::BasicBlock::Create()
    #
    LLVMAppendBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ref.types.CString ] ]
    #
    # Insert a basic block in a function before another basic block.
    #
    # The function to add to is determined by the function of the
    # passed basic block.
    #
    # @see llvm::BasicBlock::Create()
    #
    LLVMInsertBasicBlockInContext: [ LLVMBasicBlockRef [ LLVMContextRef LLVMBasicBlockRef ref.types.CString ] ]
    #
    # Insert a basic block in a function using the global context.
    #
    # @see llvm::BasicBlock::Create()
    #
    LLVMInsertBasicBlock: [ LLVMBasicBlockRef [ LLVMBasicBlockRef ref.types.CString ] ]
    #
    # Remove a basic block from a function and delete it.
    #
    # This deletes the basic block from its containing function and deletes
    # the basic block itself.
    #
    # @see llvm::BasicBlock::eraseFromParent()
    #
    LLVMDeleteBasicBlock: [ ref.types.void [ LLVMBasicBlockRef ] ]
    #
    # Remove a basic block from a function.
    #
    # This deletes the basic block from its containing function but keep
    # the basic block alive.
    #
    # @see llvm::BasicBlock::removeFromParent()
    #
    LLVMRemoveBasicBlockFromParent: [ ref.types.void [ LLVMBasicBlockRef ] ]
    #
    # Move a basic block to before another one.
    #
    # @see llvm::BasicBlock::moveBefore()
    #
    LLVMMoveBasicBlockBefore: [ ref.types.void [ LLVMBasicBlockRef LLVMBasicBlockRef ] ]
    #
    # Move a basic block to after another one.
    #
    # @see llvm::BasicBlock::moveAfter()
    #
    LLVMMoveBasicBlockAfter: [ ref.types.void [ LLVMBasicBlockRef LLVMBasicBlockRef ] ]
    #
    # Obtain the first instruction in a basic block.
    #
    # The returned LLVMValueRef corresponds to a llvm::Instruction
    # instance.
    #
    LLVMGetFirstInstruction: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Obtain the last instruction in a basic block.
    #
    # The returned LLVMValueRef corresponds to an LLVM:Instruction.
    #
    LLVMGetLastInstruction: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Determine whether an instruction has any metadata attached.
    #
    LLVMHasMetadata: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Return metadata associated with an instruction value.
    #
    LLVMGetMetadata: [ LLVMValueRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Set metadata associated with an instruction value.
    #
    LLVMSetMetadata: [ ref.types.void [ LLVMValueRef ref.types.uint32 LLVMValueRef ] ]
    #
    # Obtain the basic block to which an instruction belongs.
    #
    # @see llvm::Instruction::getParent()
    #
    LLVMGetInstructionParent: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Obtain the instruction that occurs after the one specified.
    #
    # The next instruction will be from the same basic block.
    #
    # If this is the last instruction in a basic block, NULL will be
    # returned.
    #
    LLVMGetNextInstruction: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the instruction that occurred before this one.
    #
    # If the instruction is the first instruction in a basic block, NULL
    # will be returned.
    #
    LLVMGetPreviousInstruction: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Remove and delete an instruction.
    #
    # The instruction specified is removed from its containing building
    # block and then deleted.
    #
    # @see llvm::Instruction::eraseFromParent()
    #
    LLVMInstructionEraseFromParent: [ ref.types.void [ LLVMValueRef ] ]
    #
    # Obtain the code opcode for an individual instruction.
    #
    # @see llvm::Instruction::getOpCode()
    #
    LLVMGetInstructionOpcode: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the predicate of an instruction.
    #
    # This is only valid for instructions that correspond to llvm::ICmpInst
    # or llvm::ConstantExpr whose opcode is llvm::Instruction::ICmp.
    #
    # @see llvm::ICmpInst::getPredicate()
    #
    LLVMGetICmpPredicate: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Set the calling convention for a call instruction.
    #
    # This expects an LLVMValueRef that corresponds to a llvm::CallInst or
    # llvm::InvokeInst.
    #
    # @see llvm::CallInst::setCallingConv()
    # @see llvm::InvokeInst::setCallingConv()
    #
    LLVMSetInstructionCallConv: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain the calling convention for a call instruction.
    #
    # This is the opposite of LLVMSetInstructionCallConv(). Reads its
    # usage.
    #
    # @see LLVMSetInstructionCallConv()
    #
    LLVMGetInstructionCallConv: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the calling convention for a call instruction.
    #
    # This is the opposite of LLVMSetInstructionCallConv(). Reads its
    # usage.
    #
    # @see LLVMSetInstructionCallConv()
    #
    LLVMAddInstrAttribute: [ ref.types.void [ LLVMValueRef ref.types.uint32 ref.types.int32 ] ]
    #
    # Obtain the calling convention for a call instruction.
    #
    # This is the opposite of LLVMSetInstructionCallConv(). Reads its
    # usage.
    #
    # @see LLVMSetInstructionCallConv()
    #
    LLVMRemoveInstrAttribute: [ ref.types.void [ LLVMValueRef ref.types.uint32 ref.types.int32 ] ]
    #
    # Obtain the calling convention for a call instruction.
    #
    # This is the opposite of LLVMSetInstructionCallConv(). Reads its
    # usage.
    #
    # @see LLVMSetInstructionCallConv()
    #
    LLVMSetInstrParamAlignment: [ ref.types.void [ LLVMValueRef ref.types.uint32 ref.types.uint32 ] ]
    #
    # Obtain whether a call instruction is a tail call.
    #
    # This only works on llvm::CallInst instructions.
    #
    # @see llvm::CallInst::isTailCall()
    #
    LLVMIsTailCall: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Set whether a call instruction is a tail call.
    #
    # This only works on llvm::CallInst instructions.
    #
    # @see llvm::CallInst::setTailCall()
    #
    LLVMSetTailCall: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Obtain the default destination basic block of a switch instruction.
    #
    # This only works on llvm::SwitchInst instructions.
    #
    # @see llvm::SwitchInst::getDefaultDest()
    #
    LLVMGetSwitchDefaultDest: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Add an incoming value to the end of a PHI list.
    #
    LLVMAddIncoming: [ ref.types.void [ LLVMValueRef LLVMValueRefPtr LLVMBasicBlockRefPtr ref.types.uint32 ] ]
    #
    # Obtain the number of incoming basic blocks to a PHI node.
    #
    LLVMCountIncoming: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain an incoming value to a PHI node as an LLVMValueRef.
    #
    LLVMGetIncomingValue: [ LLVMValueRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain an incoming value to a PHI node as an LLVMBasicBlockRef.
    #
    LLVMGetIncomingBlock: [ LLVMBasicBlockRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # @defgroup LLVMCCoreInstructionBuilder Instruction Builders
    #
    # An instruction builder represents a point within a basic block and is
    # the exclusive means of building instructions using the C interface.
    #
    # @{
    #
    LLVMCreateBuilderInContext: [ LLVMBuilderRef [ LLVMContextRef ] ]
    LLVMCreateBuilder: [ LLVMBuilderRef [] ]
    LLVMPositionBuilder: [ ref.types.void [ LLVMBuilderRef LLVMBasicBlockRef LLVMValueRef ] ]
    LLVMPositionBuilderBefore: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMPositionBuilderAtEnd: [ ref.types.void [ LLVMBuilderRef LLVMBasicBlockRef ] ]
    LLVMGetInsertBlock: [ LLVMBasicBlockRef [ LLVMBuilderRef ] ]
    LLVMClearInsertionPosition: [ ref.types.void [ LLVMBuilderRef ] ]
    LLVMInsertIntoBuilder: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMInsertIntoBuilderWithName: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMDisposeBuilder: [ ref.types.void [ LLVMBuilderRef ] ]
    # Metadata
    LLVMSetCurrentDebugLocation: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMGetCurrentDebugLocation: [ LLVMValueRef [ LLVMBuilderRef ] ]
    LLVMSetInstDebugLocation: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ] ]
    # Terminators
    LLVMBuildRetVoid: [ LLVMValueRef [ LLVMBuilderRef ] ]
    LLVMBuildRet: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMBuildAggregateRet: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRefPtr ref.types.uint32 ] ]
    LLVMBuildBr: [ LLVMValueRef [ LLVMBuilderRef LLVMBasicBlockRef ] ]
    LLVMBuildCondBr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMBasicBlockRef LLVMBasicBlockRef ] ]
    LLVMBuildSwitch: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMBasicBlockRef ref.types.uint32 ] ]
    LLVMBuildIndirectBr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.uint32 ] ]
    LLVMBuildInvoke: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRefPtr ref.types.uint32 LLVMBasicBlockRef LLVMBasicBlockRef ref.types.CString ] ]
    LLVMBuildLandingPad: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef LLVMValueRef ref.types.uint32 ref.types.CString ] ]
    LLVMBuildResume: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMBuildUnreachable: [ LLVMValueRef [ LLVMBuilderRef ] ]
    # Add a case to the switch instruction
    LLVMAddCase: [ ref.types.void [ LLVMValueRef LLVMValueRef LLVMBasicBlockRef ] ]
    # Add a destination to the indirectbr instruction
    LLVMAddDestination: [ ref.types.void [ LLVMValueRef LLVMBasicBlockRef ] ]
    # Add a catch or filter clause to the landingpad instruction
    LLVMAddClause: [ ref.types.void [ LLVMValueRef LLVMValueRef ] ]
    # Set the 'cleanup' flag in the landingpad instruction
    LLVMSetCleanup: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    # Arithmetic
    LLVMBuildAdd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNSWAdd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNUWAdd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFAdd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildSub: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNSWSub: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNUWSub: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFSub: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildMul: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNSWMul: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNUWMul: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFMul: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildUDiv: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildSDiv: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildExactSDiv: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFDiv: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildURem: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildSRem: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFRem: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildShl: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildLShr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildAShr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildAnd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildOr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildXor: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildBinOp: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNeg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNSWNeg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNUWNeg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFNeg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNot: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    # Memory
    LLVMBuildMalloc: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildArrayMalloc: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildAlloca: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildArrayAlloca: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFree: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMBuildLoad: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildStore: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ] ]
    LLVMBuildGEP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRefPtr ref.types.uint32 ref.types.CString ] ]
    LLVMBuildInBoundsGEP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRefPtr ref.types.uint32 ref.types.CString ] ]
    LLVMBuildStructGEP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.uint32 ref.types.CString ] ]
    LLVMBuildGlobalString: [ LLVMValueRef [ LLVMBuilderRef ref.types.CString ref.types.CString ] ]
    LLVMBuildGlobalStringPtr: [ LLVMValueRef [ LLVMBuilderRef ref.types.CString ref.types.CString ] ]
    LLVMGetVolatile: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetVolatile: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    # Casts
    LLVMBuildTrunc: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildZExt: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildSExt: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPToUI: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPToSI: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildUIToFP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildSIToFP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPTrunc: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPExt: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildPtrToInt: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildIntToPtr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildBitCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildAddrSpaceCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildZExtOrBitCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildSExtOrBitCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildTruncOrBitCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildCast: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildPointerCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildIntCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    # Comparisons
    LLVMBuildICmp: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFCmp: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMValueRef ref.types.CString ] ]
    # Miscellaneous instructions
    LLVMBuildPhi: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildCall: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRefPtr ref.types.uint32 ref.types.CString ] ]
    LLVMBuildSelect: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildVAArg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildExtractElement: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildInsertElement: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildShuffleVector: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildExtractValue: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.uint32 ref.types.CString ] ]
    LLVMBuildInsertValue: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.uint32 ref.types.CString ] ]
    LLVMBuildIsNull: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildIsNotNull: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildPtrDiff: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFence: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 ref.types.int32 ref.types.CString ] ]
    LLVMBuildAtomicRMW: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMValueRef ref.types.uint32 ref.types.int32 ] ]
    #
    # Changes the type of M so it can be passed to FunctionPassManagers and the
    # JIT.  They take ModuleProviders for historical reasons.
    #
    LLVMCreateModuleProviderForExistingModule: [ LLVMModuleProviderRef [ LLVMModuleRef ] ]
    #
    # Destroys the module M.
    #
    LLVMDisposeModuleProvider: [ ref.types.void [ LLVMModuleProviderRef ] ]
    #
    # @defgroup LLVMCCoreMemoryBuffers Memory Buffers
    #
    # @{
    #
    LLVMCreateMemoryBufferWithContentsOfFile: [ ref.types.int32 [ ref.types.CString LLVMMemoryBufferRef voidPtr ] ]
    LLVMCreateMemoryBufferWithSTDIN: [ ref.types.int32 [ LLVMMemoryBufferRefPtr voidPtr ] ]
    LLVMCreateMemoryBufferWithMemoryRange: [ LLVMMemoryBufferRef [ ref.types.CString ref.types.int32 ref.types.CString ref.types.int32 ] ]
    LLVMCreateMemoryBufferWithMemoryRangeCopy: [ LLVMMemoryBufferRef [ ref.types.CString ref.types.int32 ref.types.CString ] ]
    LLVMGetBufferStart: [ ref.types.CString [ LLVMMemoryBufferRef ] ]
    LLVMGetBufferSize: [ ref.types.int32 [ LLVMMemoryBufferRef ] ]
    LLVMDisposeMemoryBuffer: [ ref.types.void [ LLVMMemoryBufferRef ] ]
    #
    # @}
    #
    # Return the global pass registry, for use with initialization functions.
    #    @see llvm::PassRegistry::getPassRegistry
    LLVMGetGlobalPassRegistry: [ LLVMPassRegistryRef [] ]
    # Constructs a new whole-module pass pipeline. This type of pipeline is
    #    suitable for link-time optimization and whole-module transformations.
    #    @see llvm::PassManager::PassManager
    LLVMCreatePassManager: [ LLVMPassManagerRef [] ]
    # Constructs a new function-by-function pass pipeline over the module
    #    provider. It does not take ownership of the module provider. This type of
    #    pipeline is suitable for code generation and JIT compilation tasks.
    #    @see llvm::FunctionPassManager::FunctionPassManager
    LLVMCreateFunctionPassManagerForModule: [ LLVMPassManagerRef [ LLVMModuleRef ] ]
    # Deprecated: Use LLVMCreateFunctionPassManagerForModule instead.
    LLVMCreateFunctionPassManager: [ LLVMPassManagerRef [ LLVMModuleProviderRef ] ]
    # Initializes, executes on the provided module, and finalizes all of the
    #    passes scheduled in the pass manager. Returns 1 if any of the passes
    #    modified the module, 0 otherwise.
    #    @see llvm::PassManager::run(Module&)
    LLVMRunPassManager: [ ref.types.int32 [ LLVMPassManagerRef LLVMModuleRef ] ]
    # Initializes all of the function passes scheduled in the function pass
    #    manager. Returns 1 if any of the passes modified the module, 0 otherwise.
    #    @see llvm::FunctionPassManager::doInitialization
    LLVMInitializeFunctionPassManager: [ ref.types.int32 [ LLVMPassManagerRef ] ]
    # Executes all of the function passes scheduled in the function pass manager
    #    on the provided function. Returns 1 if any of the passes modified the
    #    function, false otherwise.
    #    @see llvm::FunctionPassManager::run(Function&)
    LLVMRunFunctionPassManager: [ ref.types.int32 [ LLVMPassManagerRef LLVMValueRef ] ]
    # Finalizes all of the function passes scheduled in in the function pass
    #    manager. Returns 1 if any of the passes modified the module, 0 otherwise.
    #    @see llvm::FunctionPassManager::doFinalization
    LLVMFinalizeFunctionPassManager: [ ref.types.int32 [ LLVMPassManagerRef ] ]
    # Frees the memory of a pass pipeline. For function pipelines, does not free
    #    the module provider.
    #    @see llvm::PassManagerBase::~PassManagerBase.
    LLVMDisposePassManager: [ ref.types.void [ LLVMPassManagerRef ] ]
    # Deprecated: Multi-threading can only be enabled/disabled with the compile
    #    time define LLVM_ENABLE_THREADS.  This function always returns
    #    LLVMIsMultithreaded().
    LLVMStartMultithreaded: [ ref.types.int32 [] ]
    # Deprecated: Multi-threading can only be enabled/disabled with the compile
    #    time define LLVM_ENABLE_THREADS.
    LLVMStopMultithreaded: [ ref.types.void [] ]
    # Check whether LLVM is executing in thread-safe mode or not.
    #    @see llvm::llvm_is_multithreaded
    LLVMIsMultithreaded: [ ref.types.int32 [] ]
  )('libLLVM-3.6',
    LLVMLoadLibraryPermanently: [ ref.types.int32 [ ref.types.CString ] ]
    LLVMInitializeCore: [ ref.types.void [ LLVMPassRegistryRef ] ]
    # Deallocate and destroy all ManagedStatic variables.
    # @see llvm::llvm_shutdown
    # @see ManagedStatic
    LLVMShutdown: [ ref.types.void [] ]
    # Error handling
    LLVMCreateMessage: [ ref.types.CString [ ref.types.CString ] ]
    LLVMDisposeMessage: [ ref.types.void [ ref.types.CString ] ]
    #
    # Install a fatal error handler. By default, if LLVM detects a fatal error, it
    # will call exit(1). This may not be appropriate in many contexts. For example,
    # doing exit(1) will bypass many crash reporting/tracing system tools. This
    # function allows you to install a callback that will be invoked prior to the
    # call to exit(1).
    #
    LLVMInstallFatalErrorHandler: [ ref.types.void [ LLVMFatalErrorHandler ] ]
    #
    # Reset the fatal error handler. This resets LLVM's fatal error handling
    # behavior to the default.
    #
    LLVMResetFatalErrorHandler: [ ref.types.void [] ]
    #
    # Enable LLVM's built-in stack trace code. This intercepts the OS's crash
    # signals and prints which component of LLVM you were in at the time if the
    # crash.
    #
    LLVMEnablePrettyStackTrace: [ ref.types.void [] ]
    #
    # Create a new context.
    #
    # Every call to this function should be paired with a call to
    # LLVMContextDispose() or the context will leak memory.
    #
    LLVMContextCreate: [ LLVMContextRef [] ]
    #
    # Obtain the global context instance.
    #
    LLVMGetGlobalContext: [ LLVMContextRef [] ]
    #
    # Set the diagnostic handler for this context.
    #
    LLVMContextSetDiagnosticHandler: [ ref.types.void [ LLVMContextRef LLVMDiagnosticHandler voidPtr ] ]
    #
    # Set the yield callback function for this context.
    #
    # @see LLVMContext::setYieldCallback()
    #
    LLVMContextSetYieldCallback: [ ref.types.void [ LLVMContextRef LLVMYieldCallback voidPtr ] ]
    #
    # Destroy a context instance.
    #
    # This should be called for every call to LLVMContextCreate() or memory
    # will be leaked.
    #
    LLVMContextDispose: [ ref.types.void [ LLVMContextRef ] ]
    #
    # Return a string representation of the DiagnosticInfo. Use
    # LLVMDisposeMessage to free the string.
    #
    # @see DiagnosticInfo::print()
    #
    LLVMGetDiagInfoDescription: [ ref.types.CString [ LLVMDiagnosticInfoRef ] ]
    #
    # Return an enum LLVMDiagnosticSeverity.
    #
    # @see DiagnosticInfo::getSeverity()
    #
    LLVMGetDiagInfoSeverity: [ ref.types.uint32 [ LLVMDiagnosticInfoRef ] ]
    #
    # Return an enum LLVMDiagnosticSeverity.
    #
    # @see DiagnosticInfo::getSeverity()
    #
    LLVMGetMDKindIDInContext: [ ref.types.uint32 [ LLVMContextRef ref.types.CString ref.types.uint32 ] ]
    #
    # Return an enum LLVMDiagnosticSeverity.
    #
    # @see DiagnosticInfo::getSeverity()
    #
    LLVMGetMDKindID: [ ref.types.uint32 [ ref.types.CString ref.types.uint32 ] ]
    #
    # Create a new, empty module in the global context.
    #
    # This is equivalent to calling LLVMModuleCreateWithNameInContext with
    # LLVMGetGlobalContext() as the context parameter.
    #
    # Every invocation should be paired with LLVMDisposeModule() or memory
    # will be leaked.
    #
    LLVMModuleCreateWithName: [ LLVMModuleRef [ ref.types.CString ] ]
    #
    # Create a new, empty module in the global context.
    #
    # This is equivalent to calling LLVMModuleCreateWithNameInContext with
    # LLVMGetGlobalContext() as the context parameter.
    #
    # Every invocation should be paired with LLVMDisposeModule() or memory
    # will be leaked.
    #
    LLVMModuleCreateWithNameInContext: [ LLVMModuleRef [ ref.types.CString LLVMContextRef ] ]
    #
    # Destroy a module instance.
    #
    # This must be called for every created module or memory will be
    # leaked.
    #
    LLVMDisposeModule: [ ref.types.void [ LLVMModuleRef ] ]
    #
    # Obtain the data layout for a module.
    #
    # @see Module::getDataLayout()
    #
    LLVMGetDataLayout: [ ref.types.CString [ LLVMModuleRef ] ]
    #
    # Set the data layout for a module.
    #
    # @see Module::setDataLayout()
    #
    LLVMSetDataLayout: [ ref.types.void [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain the target triple for a module.
    #
    # @see Module::getTargetTriple()
    #
    LLVMGetTarget: [ ref.types.CString [ LLVMModuleRef ] ]
    #
    # Set the target triple for a module.
    #
    # @see Module::setTargetTriple()
    #
    LLVMSetTarget: [ ref.types.void [ LLVMModuleRef ref.types.CString ] ]
    #
    # Dump a representation of a module to stderr.
    #
    # @see Module::dump()
    #
    LLVMDumpModule: [ ref.types.void [ LLVMModuleRef ] ]
    #
    # Print a representation of a module to a file. The ErrorMessage needs to be
    # disposed with LLVMDisposeMessage. Returns 0 on success, 1 otherwise.
    #
    # @see Module::print()
    #
    LLVMPrintModuleToFile: [ ref.types.int32 [ LLVMModuleRef ref.types.CString voidPtr ] ]
    #
    # Return a string representation of the module. Use
    # LLVMDisposeMessage to free the string.
    #
    # @see Module::print()
    #
    LLVMPrintModuleToString: [ ref.types.CString [ LLVMModuleRef ] ]
    #
    # Set inline assembly for a module.
    #
    # @see Module::setModuleInlineAsm()
    #
    LLVMSetModuleInlineAsm: [ ref.types.void [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain the context to which this module is associated.
    #
    # @see Module::getContext()
    #
    LLVMGetModuleContext: [ LLVMContextRef [ LLVMModuleRef ] ]
    #
    # Obtain a Type from a module by its registered name.
    #
    LLVMGetTypeByName: [ LLVMTypeRef [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain the number of operands for named metadata in a module.
    #
    # @see llvm::Module::getNamedMetadata()
    #
    LLVMGetNamedMetadataNumOperands: [ ref.types.uint32 [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain the named metadata operands for a module.
    #
    # The passed LLVMValueRef pointer should refer to an array of
    # LLVMValueRef at least LLVMGetNamedMetadataNumOperands long. This
    # array will be populated with the LLVMValueRef instances. Each
    # instance corresponds to a llvm::MDNode.
    #
    # @see llvm::Module::getNamedMetadata()
    # @see llvm::MDNode::getOperand()
    #
    LLVMGetNamedMetadataOperands: [ ref.types.void [ LLVMModuleRef ref.types.CString LLVMValueRef ] ]
    #
    # Add an operand to named metadata.
    #
    # @see llvm::Module::getNamedMetadata()
    # @see llvm::MDNode::addOperand()
    #
    LLVMAddNamedMetadataOperand: [ ref.types.void [ LLVMModuleRef ref.types.CString LLVMValueRef ] ]
    #
    # Add a function to a module under a specified name.
    #
    # @see llvm::Function::Create()
    #
    LLVMAddFunction: [ LLVMValueRef [ LLVMModuleRef ref.types.CString LLVMTypeRef ] ]
    #
    # Obtain a Function value from a Module by its name.
    #
    # The returned value corresponds to a llvm::Function value.
    #
    # @see llvm::Module::getFunction()
    #
    LLVMGetNamedFunction: [ LLVMValueRef [ LLVMModuleRef ref.types.CString ] ]
    #
    # Obtain an iterator to the first Function in a Module.
    #
    # @see llvm::Module::begin()
    #
    LLVMGetFirstFunction: [ LLVMValueRef [ LLVMModuleRef ] ]
    #
    # Obtain an iterator to the last Function in a Module.
    #
    # @see llvm::Module::end()
    #
    LLVMGetLastFunction: [ LLVMValueRef [ LLVMModuleRef ] ]
    #
    # Advance a Function iterator to the next Function.
    #
    # Returns NULL if the iterator was already at the end and there are no more
    # functions.
    #
    LLVMGetNextFunction: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Decrement a Function iterator to the previous Function.
    #
    # Returns NULL if the iterator was already at the beginning and there are
    # no previous functions.
    #
    LLVMGetPreviousFunction: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the enumerated type of a Type instance.
    #
    # @see llvm::Type:getTypeID()
    #
    LLVMGetTypeKind: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Whether the type has a known size.
    #
    # Things that don't have a size are abstract types, labels, and void.a
    #
    # @see llvm::Type::isSized()
    #
    LLVMTypeIsSized: [ ref.types.int32 [ LLVMTypeRef ] ]
    #
    # Obtain the context to which this type instance is associated.
    #
    # @see llvm::Type::getContext()
    #
    LLVMGetTypeContext: [ LLVMContextRef [ LLVMTypeRef ] ]
    #
    # Dump a representation of a type to stderr.
    #
    # @see llvm::Type::dump()
    #
    LLVMDumpType: [ ref.types.void [ LLVMTypeRef ] ]
    #
    # Return a string representation of the type. Use
    # LLVMDisposeMessage to free the string.
    #
    # @see llvm::Type::print()
    #
    LLVMPrintTypeToString: [ ref.types.CString [ LLVMTypeRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt1TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt8TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt16TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt32TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMInt64TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain an integer type from a context with specified bit width.
    #
    LLVMIntTypeInContext: [ LLVMTypeRef [ LLVMContextRef ref.types.uint32 ] ]
    #
    # Obtain an integer type from the global context with a specified bit
    # width.
    #
    LLVMInt1Type: [ LLVMTypeRef [] ]
    LLVMInt8Type: [ LLVMTypeRef [] ]
    LLVMInt16Type: [ LLVMTypeRef [] ]
    LLVMInt32Type: [ LLVMTypeRef [] ]
    LLVMInt64Type: [ LLVMTypeRef [] ]
    LLVMIntType: [ LLVMTypeRef [ ref.types.uint32 ] ]
    LLVMGetIntTypeWidth: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Obtain a 16-bit floating point type from a context.
    #
    LLVMHalfTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 32-bit floating point type from a context.
    #
    LLVMFloatTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 64-bit floating point type from a context.
    #
    LLVMDoubleTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 80-bit floating point type (X87) from a context.
    #
    LLVMX86FP80TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 128-bit floating point type (112-bit mantissa) from a
    # context.
    #
    LLVMFP128TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a 128-bit floating point type (two 64-bits) from a context.
    #
    LLVMPPCFP128TypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Obtain a floating point type from the global context.
    #
    # These map to the functions in this group of the same name.
    #
    LLVMHalfType: [ LLVMTypeRef [] ]
    LLVMFloatType: [ LLVMTypeRef [] ]
    LLVMDoubleType: [ LLVMTypeRef [] ]
    LLVMX86FP80Type: [ LLVMTypeRef [] ]
    LLVMFP128Type: [ LLVMTypeRef [] ]
    LLVMPPCFP128Type: [ LLVMTypeRef [] ]
    #
    # Obtain a function type consisting of a specified signature.
    #
    # The function is defined as a tuple of a return Type, a list of
    # parameter types, and whether the function is variadic.
    #
    LLVMFunctionType: [ LLVMTypeRef [ LLVMTypeRef LLVMTypeRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Returns whether a function type is variadic.
    #
    LLVMIsFunctionVarArg: [ ref.types.int32 [ LLVMTypeRef ] ]
    #
    # Obtain the Type this function Type returns.
    #
    LLVMGetReturnType: [ LLVMTypeRef [ LLVMTypeRef ] ]
    #
    # Obtain the number of parameters this function accepts.
    #
    LLVMCountParamTypes: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Obtain the types of a function's parameters.
    #
    # The Dest parameter should point to a pre-allocated array of
    # LLVMTypeRef at least LLVMCountParamTypes() large. On return, the
    # first LLVMCountParamTypes() entries in the array will be populated
    # with LLVMTypeRef instances.
    #
    # @param FunctionTy The function type to operate on.
    # @param Dest Memory address of an array to be filled with result.
    #
    LLVMGetParamTypes: [ ref.types.void [ LLVMTypeRef LLVMTypeRefPtr ] ]
    #
    # Create a new structure type in a context.
    #
    # A structure is specified by a list of inner elements/types and
    # whether these can be packed together.
    #
    # @see llvm::StructType::create()
    #
    LLVMStructTypeInContext: [ LLVMTypeRef [ LLVMContextRef LLVMTypeRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Create a new structure type in the global context.
    #
    # @see llvm::StructType::create()
    #
    LLVMStructType: [ LLVMTypeRef [ LLVMTypeRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Create an empty structure in a context having a specified name.
    #
    # @see llvm::StructType::create()
    #
    LLVMStructCreateNamed: [ LLVMTypeRef [ LLVMContextRef ref.types.CString ] ]
    #
    # Obtain the name of a structure.
    #
    # @see llvm::StructType::getName()
    #
    LLVMGetStructName: [ ref.types.CString [ LLVMTypeRef ] ]
    #
    # Set the contents of a structure type.
    #
    # @see llvm::StructType::setBody()
    #
    LLVMStructSetBody: [ ref.types.void [ LLVMTypeRef LLVMTypeRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Get the number of elements defined inside the structure.
    #
    # @see llvm::StructType::getNumElements()
    #
    LLVMCountStructElementTypes: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Get the elements within a structure.
    #
    # The function is passed the address of a pre-allocated array of
    # LLVMTypeRef at least LLVMCountStructElementTypes() long. After
    # invocation, this array will be populated with the structure's
    # elements. The objects in the destination array will have a lifetime
    # of the structure type itself, which is the lifetime of the context it
    # is contained in.
    #
    LLVMGetStructElementTypes: [ ref.types.void [ LLVMTypeRef LLVMTypeRefPtr ] ]
    #
    # Determine whether a structure is packed.
    #
    # @see llvm::StructType::isPacked()
    #
    LLVMIsPackedStruct: [ ref.types.int32 [ LLVMTypeRef ] ]
    #
    # Determine whether a structure is opaque.
    #
    # @see llvm::StructType::isOpaque()
    #
    LLVMIsOpaqueStruct: [ ref.types.int32 [ LLVMTypeRef ] ]
    #
    # Obtain the type of elements within a sequential type.
    #
    # This works on array, vector, and pointer types.
    #
    # @see llvm::SequentialType::getElementType()
    #
    LLVMGetElementType: [ LLVMTypeRef [ LLVMTypeRef ] ]
    #
    # Create a fixed size array type that refers to a specific type.
    #
    # The created type will exist in the context that its element type
    # exists in.
    #
    # @see llvm::ArrayType::get()
    #
    LLVMArrayType: [ LLVMTypeRef [ LLVMTypeRef ref.types.uint32 ] ]
    #
    # Obtain the length of an array type.
    #
    # This only works on types that represent arrays.
    #
    # @see llvm::ArrayType::getNumElements()
    #
    LLVMGetArrayLength: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Create a pointer type that points to a defined type.
    #
    # The created type will exist in the context that its pointee type
    # exists in.
    #
    # @see llvm::PointerType::get()
    #
    LLVMPointerType: [ LLVMTypeRef [ LLVMTypeRef ref.types.uint32 ] ]
    #
    # Obtain the address space of a pointer type.
    #
    # This only works on types that represent pointers.
    #
    # @see llvm::PointerType::getAddressSpace()
    #
    LLVMGetPointerAddressSpace: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Create a vector type that contains a defined type and has a specific
    # number of elements.
    #
    # The created type will exist in the context thats its element type
    # exists in.
    #
    # @see llvm::VectorType::get()
    #
    LLVMVectorType: [ LLVMTypeRef [ LLVMTypeRef ref.types.uint32 ] ]
    #
    # Obtain the number of elements in a vector type.
    #
    # This only works on types that represent vectors.
    #
    # @see llvm::VectorType::getNumElements()
    #
    LLVMGetVectorSize: [ ref.types.uint32 [ LLVMTypeRef ] ]
    #
    # Create a void type in a context.
    #
    LLVMVoidTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Create a label type in a context.
    #
    LLVMLabelTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # Create a X86 MMX type in a context.
    #
    LLVMX86MMXTypeInContext: [ LLVMTypeRef [ LLVMContextRef ] ]
    #
    # These are similar to the above functions except they operate on the
    # global context.
    #
    LLVMVoidType: [ LLVMTypeRef [] ]
    #
    # These are similar to the above functions except they operate on the
    # global context.
    #
    LLVMLabelType: [ LLVMTypeRef [] ]
    #
    # These are similar to the above functions except they operate on the
    # global context.
    #
    LLVMX86MMXType: [ LLVMTypeRef [] ]
    #
    # Obtain the type of a value.
    #
    # @see llvm::Value::getType()
    #
    LLVMTypeOf: [ LLVMTypeRef [ LLVMValueRef ] ]
    #
    # Obtain the string name of a value.
    #
    # @see llvm::Value::getName()
    #
    LLVMGetValueName: [ ref.types.CString [ LLVMValueRef ] ]
    #
    # Set the string name of a value.
    #
    # @see llvm::Value::setName()
    #
    LLVMSetValueName: [ ref.types.void [ LLVMValueRef ref.types.CString ] ]
    #
    # Dump a representation of a value to stderr.
    #
    # @see llvm::Value::dump()
    #
    LLVMDumpValue: [ ref.types.void [ LLVMValueRef ] ]
    #
    # Return a string representation of the value. Use
    # LLVMDisposeMessage to free the string.
    #
    # @see llvm::Value::print()
    #
    LLVMPrintValueToString: [ ref.types.CString [ LLVMValueRef ] ]
    #
    # Replace all uses of a value with another one.
    #
    # @see llvm::Value::replaceAllUsesWith()
    #
    LLVMReplaceAllUsesWith: [ ref.types.void [ LLVMValueRef LLVMValueRef ] ]
    #
    # Determine whether the specified constant instance is constant.
    #
    LLVMIsConstant: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Determine whether a value instance is undefined.
    #
    LLVMIsUndef: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # @defgroup LLVMCCoreValues Values
    #
    # The bulk of LLVM's object model consists of values, which comprise a very
    # rich type hierarchy.
    #
    # LLVMValueRef essentially represents llvm::Value. There is a rich
    # hierarchy of classes within this type. Depending on the instance
    # obtained, not all APIs are available.
    #
    # Callers can determine the type of an LLVMValueRef by calling the
    # LLVMIsA* family of functions (e.g. LLVMIsAArgument()). These
    # functions are defined by a macro, so it isn't obvious which are
    # available by looking at the Doxygen source code. Instead, look at the
    # source definition of LLVM_FOR_EACH_VALUE_SUBCLASS and note the list
    # of value names given. These value names also correspond to classes in
    # the llvm::Value hierarchy.
    #
    # @{
    #
    LLVMIsAArgument: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABasicBlock: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInlineAsm: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMDNode: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMDString: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUser: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstant: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABlockAddress: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantAggregateZero: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantArray: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantDataSequential: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantDataArray: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantDataVector: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantExpr: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantFP: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantInt: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantPointerNull: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantStruct: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAConstantVector: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGlobalValue: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGlobalAlias: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGlobalObject: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFunction: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGlobalVariable: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUndefValue: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInstruction: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABinaryOperator: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsACallInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAIntrinsicInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsADbgInfoIntrinsic: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsADbgDeclareInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMemIntrinsic: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMemCpyInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMemMoveInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAMemSetInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsACmpInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFCmpInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAICmpInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAExtractElementInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAGetElementPtrInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInsertElementInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInsertValueInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsALandingPadInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAPHINode: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsASelectInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAShuffleVectorInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAStoreInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsATerminatorInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABranchInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAIndirectBrInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAInvokeInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAReturnInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsASwitchInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUnreachableInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAResumeInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUnaryInstruction: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAAllocaInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsACastInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAAddrSpaceCastInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsABitCastInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFPExtInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFPToSIInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFPToUIInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAFPTruncInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAIntToPtrInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAPtrToIntInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsASExtInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsASIToFPInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsATruncInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAUIToFPInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAZExtInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAExtractValueInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsALoadInst: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMIsAVAArgInst: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # @defgroup LLVMCCoreValueGeneral General APIs
    #
    # Functions in this section work on all LLVMValueRef instances,
    # regardless of their sub-type. They correspond to functions available
    # on llvm::Value.
    #
    # @{
    #
    #
    # Obtain the first use of a value.
    #
    # Uses are obtained in an iterator fashion. First, call this function
    # to obtain a reference to the first use. Then, call LLVMGetNextUse()
    # on that instance and all subsequently obtained instances until
    # LLVMGetNextUse() returns NULL.
    #
    # @see llvm::Value::use_begin()
    #
    LLVMGetFirstUse: [ LLVMUseRef [ LLVMValueRef ] ]
    #
    # Obtain the next use of a value.
    #
    # This effectively advances the iterator. It returns NULL if you are on
    # the final use and no more are available.
    #
    LLVMGetNextUse: [ LLVMUseRef [ LLVMUseRef ] ]
    #
    # Obtain the user value for a user.
    #
    # The returned value corresponds to a llvm::User type.
    #
    # @see llvm::Use::getUser()
    #
    LLVMGetUser: [ LLVMValueRef [ LLVMUseRef ] ]
    #
    # Obtain the value this use corresponds to.
    #
    # @see llvm::Use::get().
    #
    LLVMGetUsedValue: [ LLVMValueRef [ LLVMUseRef ] ]
    #
    # Obtain an operand at a specific index in a llvm::User value.
    #
    # @see llvm::User::getOperand()
    #
    LLVMGetOperand: [ LLVMValueRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Set an operand at a specific index in a llvm::User value.
    #
    # @see llvm::User::setOperand()
    #
    LLVMSetOperand: [ ref.types.void [ LLVMValueRef ref.types.uint32 LLVMValueRef ] ]
    #
    # Obtain the number of operands in a llvm::User value.
    #
    # @see llvm::User::getNumOperands()
    #
    LLVMGetNumOperands: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Obtain a constant value referring to the null instance of a type.
    #
    # @see llvm::Constant::getNullValue()
    #
    LLVMConstNull: [ LLVMValueRef [ LLVMTypeRef ] ]
    #
    # Obtain a constant value referring to the instance of a type
    # consisting of all ones.
    #
    # This is only valid for integer types.
    #
    # @see llvm::Constant::getAllOnesValue()
    #
    LLVMConstAllOnes: [ LLVMValueRef [ LLVMTypeRef ] ]
    #
    # Obtain a constant value referring to an undefined value of a type.
    #
    # @see llvm::UndefValue::get()
    #
    LLVMGetUndef: [ LLVMValueRef [ LLVMTypeRef ] ]
    #
    # Determine whether a value instance is null.
    #
    # @see llvm::Constant::isNullValue()
    #
    LLVMIsNull: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Obtain a constant that is a constant pointer pointing to NULL for a
    # specified type.
    #
    LLVMConstPointerNull: [ LLVMValueRef [ LLVMTypeRef ] ]
    #
    # Obtain a constant value for an integer type.
    #
    # The returned value corresponds to a llvm::ConstantInt.
    #
    # @see llvm::ConstantInt::get()
    #
    # @param IntTy Integer type to obtain value of.
    # @param N The value the returned instance should refer to.
    # @param SignExtend Whether to sign extend the produced value.
    #
    LLVMConstInt: [ LLVMValueRef [ LLVMTypeRef ref.types.ulonglong ref.types.int32 ] ]
    #
    # Obtain a constant value for an integer parsed from a string.
    #
    # A similar API, LLVMConstIntOfStringAndSize is also available. If the
    # string's length is available, it is preferred to call that function
    # instead.
    #
    # @see llvm::ConstantInt::get()
    #
    LLVMConstIntOfString: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ref.types.uchar ] ]
    #
    # Obtain a constant value for an integer parsed from a string with
    # specified length.
    #
    # @see llvm::ConstantInt::get()
    #
    LLVMConstIntOfStringAndSize: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ref.types.uint32 ref.types.uchar ] ]
    #
    # Obtain a constant value referring to a double floating point value.
    #
    LLVMConstReal: [ LLVMValueRef [ LLVMTypeRef ref.types.double ] ]
    #
    # Obtain a constant for a floating point value parsed from a string.
    #
    # A similar API, LLVMConstRealOfStringAndSize is also available. It
    # should be used if the input string's length is known.
    #
    LLVMConstRealOfString: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ] ]
    #
    # Obtain a constant for a floating point value parsed from a string.
    #
    LLVMConstRealOfStringAndSize: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ref.types.uint32 ] ]
    #
    # Obtain the zero extended value for an integer constant value.
    #
    # @see llvm::ConstantInt::getZExtValue()
    #
    LLVMConstIntGetZExtValue: [ ref.types.ulonglong [ LLVMValueRef ] ]
    #
    # Obtain the sign extended value for an integer constant value.
    #
    # @see llvm::ConstantInt::getSExtValue()
    #
    LLVMConstIntGetSExtValue: [ ref.types.longlong [ LLVMValueRef ] ]
    #
    # Create a ConstantDataSequential and initialize it with a string.
    #
    # @see llvm::ConstantDataArray::getString()
    #
    LLVMConstStringInContext: [ LLVMValueRef [ LLVMContextRef ref.types.CString ref.types.uint32 ref.types.int32 ] ]
    #
    # Create a ConstantDataSequential with string content in the global context.
    #
    # This is the same as LLVMConstStringInContext except it operates on the
    # global context.
    #
    # @see LLVMConstStringInContext()
    # @see llvm::ConstantDataArray::getString()
    #
    LLVMConstString: [ LLVMValueRef [ ref.types.CString ref.types.uint32 ref.types.int32 ] ]
    #
    # Create an anonymous ConstantStruct with the specified values.
    #
    # @see llvm::ConstantStruct::getAnon()
    #
    LLVMConstStructInContext: [ LLVMValueRef [ LLVMContextRef LLVMValueRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Create a ConstantStruct in the global Context.
    #
    # This is the same as LLVMConstStructInContext except it operates on the
    # global Context.
    #
    # @see LLVMConstStructInContext()
    #
    LLVMConstStruct: [ LLVMValueRef [ LLVMValueRefPtr ref.types.uint32 ref.types.int32 ] ]
    #
    # Create a ConstantArray from values.
    #
    # @see llvm::ConstantArray::get()
    #
    LLVMConstArray: [ LLVMValueRef [ LLVMTypeRef LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # Create a non-anonymous ConstantStruct from values.
    #
    # @see llvm::ConstantStruct::get()
    #
    LLVMConstNamedStruct: [ LLVMValueRef [ LLVMTypeRef LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # Create a ConstantVector from values.
    #
    # @see llvm::ConstantVector::get()
    #
    LLVMConstVector: [ LLVMValueRef [ LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # @defgroup LLVMCCoreValueConstantExpressions Constant Expressions
    #
    # Functions in this group correspond to APIs on llvm::ConstantExpr.
    #
    # @see llvm::ConstantExpr.
    #
    # @{
    #
    LLVMGetConstOpcode: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMAlignOf: [ LLVMValueRef [ LLVMTypeRef ] ]
    LLVMSizeOf: [ LLVMValueRef [ LLVMTypeRef ] ]
    LLVMConstNeg: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstNSWNeg: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstNUWNeg: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstFNeg: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstNot: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMConstAdd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNSWAdd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNUWAdd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFAdd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstSub: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNSWSub: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNUWSub: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFSub: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstMul: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNSWMul: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstNUWMul: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFMul: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstUDiv: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstSDiv: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstExactSDiv: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFDiv: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstURem: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstSRem: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstFRem: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstAnd: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstOr: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstXor: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstICmp: [ LLVMValueRef [ ref.types.uint32 LLVMValueRef LLVMValueRef ] ]
    LLVMConstFCmp: [ LLVMValueRef [ ref.types.uint32 LLVMValueRef LLVMValueRef ] ]
    LLVMConstShl: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstLShr: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstAShr: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstGEP: [ LLVMValueRef [ LLVMValueRef LLVMValueRefPtr ref.types.uint32 ] ]
    LLVMConstInBoundsGEP: [ LLVMValueRef [ LLVMValueRef LLVMValueRefPtr ref.types.uint32 ] ]
    LLVMConstTrunc: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstSExt: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstZExt: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstFPTrunc: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstFPExt: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstUIToFP: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstSIToFP: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstFPToUI: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstFPToSI: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstPtrToInt: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstIntToPtr: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstBitCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstAddrSpaceCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstZExtOrBitCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstSExtOrBitCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstTruncOrBitCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstPointerCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstIntCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ref.types.int32 ] ]
    LLVMConstFPCast: [ LLVMValueRef [ LLVMValueRef LLVMTypeRef ] ]
    LLVMConstSelect: [ LLVMValueRef [ LLVMValueRef LLVMValueRef LLVMValueRef ] ]
    LLVMConstExtractElement: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ] ]
    LLVMConstInsertElement: [ LLVMValueRef [ LLVMValueRef LLVMValueRef LLVMValueRef ] ]
    LLVMConstShuffleVector: [ LLVMValueRef [ LLVMValueRef LLVMValueRef LLVMValueRef ] ]
    LLVMConstExtractValue: [ LLVMValueRef [ LLVMValueRef ref.refType(ref.types.uint32) ref.types.uint32 ] ]
    LLVMConstInsertValue: [ LLVMValueRef [ LLVMValueRef LLVMValueRef ref.refType(ref.types.uint32) ref.types.uint32 ] ]
    LLVMConstInlineAsm: [ LLVMValueRef [ LLVMTypeRef ref.types.CString ref.types.CString ref.types.int32 ref.types.int32 ] ]
    LLVMBlockAddress: [ LLVMValueRef [ LLVMValueRef LLVMBasicBlockRef ] ]
    #
    # @}
    #

    #
    # @defgroup LLVMCCoreValueConstantGlobals Global Values
    #
    # This group contains functions that operate on global values. Functions in
    # this group relate to functions in the llvm::GlobalValue class tree.
    #
    # @see llvm::GlobalValue
    #
    # @{
    #
    LLVMGetGlobalParent: [ LLVMModuleRef [ LLVMValueRef ] ]
    LLVMIsDeclaration: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMGetLinkage: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMSetLinkage: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    LLVMGetSection: [ ref.types.CString [ LLVMValueRef ] ]
    LLVMSetSection: [ ref.types.void [ LLVMValueRef ref.types.CString ] ]
    LLVMGetVisibility: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMSetVisibility: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    LLVMGetDLLStorageClass: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMSetDLLStorageClass: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    LLVMHasUnnamedAddr: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetUnnamedAddr: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]

    #
    # Obtain the preferred alignment of the value.
    # @see llvm::AllocaInst::getAlignment()
    # @see llvm::LoadInst::getAlignment()
    # @see llvm::StoreInst::getAlignment()
    # @see llvm::GlobalValue::getAlignment()
    #
    LLVMGetAlignment: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Set the preferred alignment of the value.
    # @see llvm::AllocaInst::setAlignment()
    # @see llvm::LoadInst::setAlignment()
    # @see llvm::StoreInst::setAlignment()
    # @see llvm::GlobalValue::setAlignment()
    #
    LLVMSetAlignment: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    #
    # @defgroup LLVMCoreValueConstantGlobalVariable Global Variables
    #
    # This group contains functions that operate on global variable values.
    #
    # @see llvm::GlobalVariable
    #
    # @{
    #
    LLVMAddGlobal: [ LLVMValueRef [ LLVMModuleRef LLVMTypeRef ref.types.CString ] ]
    LLVMAddGlobalInAddressSpace: [ LLVMValueRef [ LLVMModuleRef LLVMTypeRef ref.types.CString ref.types.uint32 ] ]
    LLVMGetNamedGlobal: [ LLVMValueRef [ LLVMModuleRef ref.types.CString ] ]
    LLVMGetFirstGlobal: [ LLVMValueRef [ LLVMModuleRef ] ]
    LLVMGetLastGlobal: [ LLVMValueRef [ LLVMModuleRef ] ]
    LLVMGetNextGlobal: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMGetPreviousGlobal: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMDeleteGlobal: [ ref.types.void [ LLVMValueRef ] ]
    LLVMGetInitializer: [ LLVMValueRef [ LLVMValueRef ] ]
    LLVMSetInitializer: [ ref.types.void [ LLVMValueRef LLVMValueRef ] ]
    LLVMIsThreadLocal: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetThreadLocal: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    LLVMIsGlobalConstant: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetGlobalConstant: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    LLVMGetThreadLocalMode: [ ref.types.uint32 [ LLVMValueRef ] ]
    LLVMSetThreadLocalMode: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    LLVMIsExternallyInitialized: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetExternallyInitialized: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # @}
    #
    #
    # @defgroup LLVMCoreValueConstantGlobalAlias Global Aliases
    #
    # This group contains function that operate on global alias values.
    #
    # @see llvm::GlobalAlias
    #
    # @{
    #
    LLVMAddAlias: [ LLVMValueRef [ LLVMModuleRef LLVMTypeRef LLVMValueRef ref.types.CString ] ]
    #
    # @}
    #
    #
    # @defgroup LLVMCCoreValueFunction Function values
    #
    # Functions in this group operate on LLVMValueRef instances that
    # correspond to llvm::Function instances.
    #
    # @see llvm::Function
    #
    # @{
    #
    #
    # Remove a function from its containing module and deletes it.
    #
    # @see llvm::Function::eraseFromParent()
    #
    LLVMDeleteFunction: [ ref.types.void [ LLVMValueRef ] ]
    #
    # Obtain the ID number from a function instance.
    #
    # @see llvm::Function::getIntrinsicID()
    #
    LLVMGetIntrinsicID: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the calling function of a function.
    #
    # The returned value corresponds to the LLVMCallConv enumeration.
    #
    # @see llvm::Function::getCallingConv()
    #
    LLVMGetFunctionCallConv: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Set the calling convention of a function.
    #
    # @see llvm::Function::setCallingConv()
    #
    # @param Fn Function to operate on
    # @param CC LLVMCallConv to set calling convention to
    #
    LLVMSetFunctionCallConv: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain the name of the garbage collector to use during code
    # generation.
    #
    # @see llvm::Function::getGC()
    #
    LLVMGetGC: [ ref.types.CString [ LLVMValueRef ] ]
    #
    # Define the garbage collector to use during code generation.
    #
    # @see llvm::Function::setGC()
    #
    LLVMSetGC: [ ref.types.void [ LLVMValueRef ref.types.CString ] ]
    #
    # Add an attribute to a function.
    #
    # @see llvm::Function::addAttribute()
    #
    LLVMAddFunctionAttr: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Add a target-dependent attribute to a fuction
    # @see llvm::AttrBuilder::addAttribute()
    #
    LLVMAddTargetDependentFunctionAttr: [ ref.types.void [ LLVMValueRef ref.types.CString ref.types.CString ] ]
    #
    # Obtain an attribute from a function.
    #
    # @see llvm::Function::getAttributes()
    #
    LLVMGetFunctionAttr: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Remove an attribute from a function.
    #
    LLVMRemoveFunctionAttr: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Obtain the number of parameters in a function.
    #
    # @see llvm::Function::arg_size()
    #
    LLVMCountParams: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the parameters in a function.
    #
    # The takes a pointer to a pre-allocated array of LLVMValueRef that is
    # at least LLVMCountParams() long. This array will be filled with
    # LLVMValueRef instances which correspond to the parameters the
    # function receives. Each LLVMValueRef corresponds to a llvm::Argument
    # instance.
    #
    # @see llvm::Function::arg_begin()
    #
    LLVMGetParams: [ ref.types.void [ LLVMValueRef LLVMValueRefPtr ] ]
    #
    # Obtain the parameter at the specified index.
    #
    # Parameters are indexed from 0.
    #
    # @see llvm::Function::arg_begin()
    #
    LLVMGetParam: [ LLVMValueRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain the function to which this argument belongs.
    #
    # Unlike other functions in this group, this one takes an LLVMValueRef
    # that corresponds to a llvm::Attribute.
    #
    # The returned LLVMValueRef is the llvm::Function to which this
    # argument belongs.
    #
    LLVMGetParamParent: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the first parameter to a function.
    #
    # @see llvm::Function::arg_begin()
    #
    LLVMGetFirstParam: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the last parameter to a function.
    #
    # @see llvm::Function::arg_end()
    #
    LLVMGetLastParam: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the next parameter to a function.
    #
    # This takes an LLVMValueRef obtained from LLVMGetFirstParam() (which is
    # actually a wrapped iterator) and obtains the next parameter from the
    # underlying iterator.
    #
    LLVMGetNextParam: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the previous parameter to a function.
    #
    # This is the opposite of LLVMGetNextParam().
    #
    LLVMGetPreviousParam: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Add an attribute to a function argument.
    #
    # @see llvm::Argument::addAttr()
    #
    LLVMAddAttribute: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Remove an attribute from a function argument.
    #
    # @see llvm::Argument::removeAttr()
    #
    LLVMRemoveAttribute: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Get an attribute from a function argument.
    #
    LLVMGetAttribute: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Set the alignment for a function parameter.
    #
    # @see llvm::Argument::addAttr()
    # @see llvm::AttrBuilder::addAlignmentAttr()
    #
    LLVMSetParamAlignment: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain a MDString value from a context.
    #
    # The returned instance corresponds to the llvm::MDString class.
    #
    # The instance is specified by string data of a specified length. The
    # string content is copied, so the backing memory can be freed after
    # this function returns.
    #
    LLVMMDStringInContext: [ LLVMValueRef [ LLVMContextRef ref.types.CString ref.types.uint32 ] ]
    #
    # Obtain a MDString value from the global context.
    #
    LLVMMDString: [ LLVMValueRef [ ref.types.CString ref.types.uint32 ] ]
    #
    # Obtain a MDNode value from a context.
    #
    # The returned value corresponds to the llvm::MDNode class.
    #
    LLVMMDNodeInContext: [ LLVMValueRef [ LLVMContextRef LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # Obtain a MDNode value from the global context.
    #
    LLVMMDNode: [ LLVMValueRef [ LLVMValueRefPtr ref.types.uint32 ] ]
    #
    # Obtain the underlying string from a MDString value.
    #
    # @param V Instance to obtain string from.
    # @param Len Memory address which will hold length of returned string.
    # @return String data in MDString.
    #
    LLVMGetMDString: [ ref.types.CString [ LLVMValueRef ref.refType(ref.types.uint32) ] ]
    #
    # Obtain the number of operands from an MDNode value.
    #
    # @param V MDNode to get number of operands from.
    # @return Number of operands of the MDNode.
    #
    LLVMGetMDNodeNumOperands: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the given MDNode's operands.
    #
    # The passed LLVMValueRef pointer should point to enough memory to hold all of
    # the operands of the given MDNode (see LLVMGetMDNodeNumOperands) as
    # LLVMValueRefs. This memory will be populated with the LLVMValueRefs of the
    # MDNode's operands.
    #
    # @param V MDNode to get the operands from.
    # @param Dest Destination array for operands.
    #
    LLVMGetMDNodeOperands: [ ref.types.void [ LLVMValueRef LLVMValueRefPtr ] ]
    #
    # Convert a basic block instance to a value type.
    #
    LLVMBasicBlockAsValue: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Determine whether an LLVMValueRef is itself a basic block.
    #
    LLVMValueIsBasicBlock: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Convert an LLVMValueRef to an LLVMBasicBlockRef instance.
    #
    LLVMValueAsBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Obtain the function to which a basic block belongs.
    #
    # @see llvm::BasicBlock::getParent()
    #
    LLVMGetBasicBlockParent: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Obtain the terminator instruction for a basic block.
    #
    # If the basic block does not have a terminator (it is not well-formed
    # if it doesn't), then NULL is returned.
    #
    # The returned LLVMValueRef corresponds to a llvm::TerminatorInst.
    #
    # @see llvm::BasicBlock::getTerminator()
    #
    LLVMGetBasicBlockTerminator: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Obtain the number of basic blocks in a function.
    #
    # @param Fn Function value to operate on.
    #
    LLVMCountBasicBlocks: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain all of the basic blocks in a function.
    #
    # This operates on a function value. The BasicBlocks parameter is a
    # pointer to a pre-allocated array of LLVMBasicBlockRef of at least
    # LLVMCountBasicBlocks() in length. This array is populated with
    # LLVMBasicBlockRef instances.
    #
    LLVMGetBasicBlocks: [ ref.types.void [ LLVMValueRef LLVMBasicBlockRefPtr ] ]
    #
    # Obtain the first basic block in a function.
    #
    # The returned basic block can be used as an iterator. You will likely
    # eventually call into LLVMGetNextBasicBlock() with it.
    #
    # @see llvm::Function::begin()
    #
    LLVMGetFirstBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Obtain the last basic block in a function.
    #
    # @see llvm::Function::end()
    #
    LLVMGetLastBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Advance a basic block iterator.
    #
    LLVMGetNextBasicBlock: [ LLVMBasicBlockRef [ LLVMBasicBlockRef ] ]
    #
    # Go backwards in a basic block iterator.
    #
    LLVMGetPreviousBasicBlock: [ LLVMBasicBlockRef [ LLVMBasicBlockRef ] ]
    #
    # Obtain the basic block that corresponds to the entry point of a
    # function.
    #
    # @see llvm::Function::getEntryBlock()
    #
    LLVMGetEntryBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Append a basic block to the end of a function.
    #
    # @see llvm::BasicBlock::Create()
    #
    LLVMAppendBasicBlockInContext: [ LLVMBasicBlockRef [ LLVMContextRef LLVMValueRef ref.types.CString ] ]
    #
    # Append a basic block to the end of a function using the global
    # context.
    #
    # @see llvm::BasicBlock::Create()
    #
    LLVMAppendBasicBlock: [ LLVMBasicBlockRef [ LLVMValueRef ref.types.CString ] ]
    #
    # Insert a basic block in a function before another basic block.
    #
    # The function to add to is determined by the function of the
    # passed basic block.
    #
    # @see llvm::BasicBlock::Create()
    #
    LLVMInsertBasicBlockInContext: [ LLVMBasicBlockRef [ LLVMContextRef LLVMBasicBlockRef ref.types.CString ] ]
    #
    # Insert a basic block in a function using the global context.
    #
    # @see llvm::BasicBlock::Create()
    #
    LLVMInsertBasicBlock: [ LLVMBasicBlockRef [ LLVMBasicBlockRef ref.types.CString ] ]
    #
    # Remove a basic block from a function and delete it.
    #
    # This deletes the basic block from its containing function and deletes
    # the basic block itself.
    #
    # @see llvm::BasicBlock::eraseFromParent()
    #
    LLVMDeleteBasicBlock: [ ref.types.void [ LLVMBasicBlockRef ] ]
    #
    # Remove a basic block from a function.
    #
    # This deletes the basic block from its containing function but keep
    # the basic block alive.
    #
    # @see llvm::BasicBlock::removeFromParent()
    #
    LLVMRemoveBasicBlockFromParent: [ ref.types.void [ LLVMBasicBlockRef ] ]
    #
    # Move a basic block to before another one.
    #
    # @see llvm::BasicBlock::moveBefore()
    #
    LLVMMoveBasicBlockBefore: [ ref.types.void [ LLVMBasicBlockRef LLVMBasicBlockRef ] ]
    #
    # Move a basic block to after another one.
    #
    # @see llvm::BasicBlock::moveAfter()
    #
    LLVMMoveBasicBlockAfter: [ ref.types.void [ LLVMBasicBlockRef LLVMBasicBlockRef ] ]
    #
    # Obtain the first instruction in a basic block.
    #
    # The returned LLVMValueRef corresponds to a llvm::Instruction
    # instance.
    #
    LLVMGetFirstInstruction: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Obtain the last instruction in a basic block.
    #
    # The returned LLVMValueRef corresponds to an LLVM:Instruction.
    #
    LLVMGetLastInstruction: [ LLVMValueRef [ LLVMBasicBlockRef ] ]
    #
    # Determine whether an instruction has any metadata attached.
    #
    LLVMHasMetadata: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Return metadata associated with an instruction value.
    #
    LLVMGetMetadata: [ LLVMValueRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Set metadata associated with an instruction value.
    #
    LLVMSetMetadata: [ ref.types.void [ LLVMValueRef ref.types.uint32 LLVMValueRef ] ]
    #
    # Obtain the basic block to which an instruction belongs.
    #
    # @see llvm::Instruction::getParent()
    #
    LLVMGetInstructionParent: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Obtain the instruction that occurs after the one specified.
    #
    # The next instruction will be from the same basic block.
    #
    # If this is the last instruction in a basic block, NULL will be
    # returned.
    #
    LLVMGetNextInstruction: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Obtain the instruction that occurred before this one.
    #
    # If the instruction is the first instruction in a basic block, NULL
    # will be returned.
    #
    LLVMGetPreviousInstruction: [ LLVMValueRef [ LLVMValueRef ] ]
    #
    # Remove and delete an instruction.
    #
    # The instruction specified is removed from its containing building
    # block and then deleted.
    #
    # @see llvm::Instruction::eraseFromParent()
    #
    LLVMInstructionEraseFromParent: [ ref.types.void [ LLVMValueRef ] ]
    #
    # Obtain the code opcode for an individual instruction.
    #
    # @see llvm::Instruction::getOpCode()
    #
    LLVMGetInstructionOpcode: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the predicate of an instruction.
    #
    # This is only valid for instructions that correspond to llvm::ICmpInst
    # or llvm::ConstantExpr whose opcode is llvm::Instruction::ICmp.
    #
    # @see llvm::ICmpInst::getPredicate()
    #
    LLVMGetICmpPredicate: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Set the calling convention for a call instruction.
    #
    # This expects an LLVMValueRef that corresponds to a llvm::CallInst or
    # llvm::InvokeInst.
    #
    # @see llvm::CallInst::setCallingConv()
    # @see llvm::InvokeInst::setCallingConv()
    #
    LLVMSetInstructionCallConv: [ ref.types.void [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain the calling convention for a call instruction.
    #
    # This is the opposite of LLVMSetInstructionCallConv(). Reads its
    # usage.
    #
    # @see LLVMSetInstructionCallConv()
    #
    LLVMGetInstructionCallConv: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain the calling convention for a call instruction.
    #
    # This is the opposite of LLVMSetInstructionCallConv(). Reads its
    # usage.
    #
    # @see LLVMSetInstructionCallConv()
    #
    LLVMAddInstrAttribute: [ ref.types.void [ LLVMValueRef ref.types.uint32 ref.types.int32 ] ]
    #
    # Obtain the calling convention for a call instruction.
    #
    # This is the opposite of LLVMSetInstructionCallConv(). Reads its
    # usage.
    #
    # @see LLVMSetInstructionCallConv()
    #
    LLVMRemoveInstrAttribute: [ ref.types.void [ LLVMValueRef ref.types.uint32 ref.types.int32 ] ]
    #
    # Obtain the calling convention for a call instruction.
    #
    # This is the opposite of LLVMSetInstructionCallConv(). Reads its
    # usage.
    #
    # @see LLVMSetInstructionCallConv()
    #
    LLVMSetInstrParamAlignment: [ ref.types.void [ LLVMValueRef ref.types.uint32 ref.types.uint32 ] ]
    #
    # Obtain whether a call instruction is a tail call.
    #
    # This only works on llvm::CallInst instructions.
    #
    # @see llvm::CallInst::isTailCall()
    #
    LLVMIsTailCall: [ ref.types.int32 [ LLVMValueRef ] ]
    #
    # Set whether a call instruction is a tail call.
    #
    # This only works on llvm::CallInst instructions.
    #
    # @see llvm::CallInst::setTailCall()
    #
    LLVMSetTailCall: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    #
    # Obtain the default destination basic block of a switch instruction.
    #
    # This only works on llvm::SwitchInst instructions.
    #
    # @see llvm::SwitchInst::getDefaultDest()
    #
    LLVMGetSwitchDefaultDest: [ LLVMBasicBlockRef [ LLVMValueRef ] ]
    #
    # Add an incoming value to the end of a PHI list.
    #
    LLVMAddIncoming: [ ref.types.void [ LLVMValueRef LLVMValueRefPtr LLVMBasicBlockRefPtr ref.types.uint32 ] ]
    #
    # Obtain the number of incoming basic blocks to a PHI node.
    #
    LLVMCountIncoming: [ ref.types.uint32 [ LLVMValueRef ] ]
    #
    # Obtain an incoming value to a PHI node as an LLVMValueRef.
    #
    LLVMGetIncomingValue: [ LLVMValueRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # Obtain an incoming value to a PHI node as an LLVMBasicBlockRef.
    #
    LLVMGetIncomingBlock: [ LLVMBasicBlockRef [ LLVMValueRef ref.types.uint32 ] ]
    #
    # @defgroup LLVMCCoreInstructionBuilder Instruction Builders
    #
    # An instruction builder represents a point within a basic block and is
    # the exclusive means of building instructions using the C interface.
    #
    # @{
    #
    LLVMCreateBuilderInContext: [ LLVMBuilderRef [ LLVMContextRef ] ]
    LLVMCreateBuilder: [ LLVMBuilderRef [] ]
    LLVMPositionBuilder: [ ref.types.void [ LLVMBuilderRef LLVMBasicBlockRef LLVMValueRef ] ]
    LLVMPositionBuilderBefore: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMPositionBuilderAtEnd: [ ref.types.void [ LLVMBuilderRef LLVMBasicBlockRef ] ]
    LLVMGetInsertBlock: [ LLVMBasicBlockRef [ LLVMBuilderRef ] ]
    LLVMClearInsertionPosition: [ ref.types.void [ LLVMBuilderRef ] ]
    LLVMInsertIntoBuilder: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMInsertIntoBuilderWithName: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMDisposeBuilder: [ ref.types.void [ LLVMBuilderRef ] ]
    # Metadata
    LLVMSetCurrentDebugLocation: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMGetCurrentDebugLocation: [ LLVMValueRef [ LLVMBuilderRef ] ]
    LLVMSetInstDebugLocation: [ ref.types.void [ LLVMBuilderRef LLVMValueRef ] ]
    # Terminators
    LLVMBuildRetVoid: [ LLVMValueRef [ LLVMBuilderRef ] ]
    LLVMBuildRet: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMBuildAggregateRet: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRefPtr ref.types.uint32 ] ]
    LLVMBuildBr: [ LLVMValueRef [ LLVMBuilderRef LLVMBasicBlockRef ] ]
    LLVMBuildCondBr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMBasicBlockRef LLVMBasicBlockRef ] ]
    LLVMBuildSwitch: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMBasicBlockRef ref.types.uint32 ] ]
    LLVMBuildIndirectBr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.uint32 ] ]
    LLVMBuildInvoke: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRefPtr ref.types.uint32 LLVMBasicBlockRef LLVMBasicBlockRef ref.types.CString ] ]
    LLVMBuildLandingPad: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef LLVMValueRef ref.types.uint32 ref.types.CString ] ]
    LLVMBuildResume: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMBuildUnreachable: [ LLVMValueRef [ LLVMBuilderRef ] ]
    # Add a case to the switch instruction
    LLVMAddCase: [ ref.types.void [ LLVMValueRef LLVMValueRef LLVMBasicBlockRef ] ]
    # Add a destination to the indirectbr instruction
    LLVMAddDestination: [ ref.types.void [ LLVMValueRef LLVMBasicBlockRef ] ]
    # Add a catch or filter clause to the landingpad instruction
    LLVMAddClause: [ ref.types.void [ LLVMValueRef LLVMValueRef ] ]
    # Set the 'cleanup' flag in the landingpad instruction
    LLVMSetCleanup: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    # Arithmetic
    LLVMBuildAdd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNSWAdd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNUWAdd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFAdd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildSub: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNSWSub: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNUWSub: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFSub: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildMul: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNSWMul: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNUWMul: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFMul: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildUDiv: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildSDiv: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildExactSDiv: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFDiv: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildURem: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildSRem: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFRem: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildShl: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildLShr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildAShr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildAnd: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildOr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildXor: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildBinOp: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNeg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNSWNeg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNUWNeg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFNeg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildNot: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    # Memory
    LLVMBuildMalloc: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildArrayMalloc: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildAlloca: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildArrayAlloca: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFree: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ] ]
    LLVMBuildLoad: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildStore: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ] ]
    LLVMBuildGEP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRefPtr ref.types.uint32 ref.types.CString ] ]
    LLVMBuildInBoundsGEP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRefPtr ref.types.uint32 ref.types.CString ] ]
    LLVMBuildStructGEP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.uint32 ref.types.CString ] ]
    LLVMBuildGlobalString: [ LLVMValueRef [ LLVMBuilderRef ref.types.CString ref.types.CString ] ]
    LLVMBuildGlobalStringPtr: [ LLVMValueRef [ LLVMBuilderRef ref.types.CString ref.types.CString ] ]
    LLVMGetVolatile: [ ref.types.int32 [ LLVMValueRef ] ]
    LLVMSetVolatile: [ ref.types.void [ LLVMValueRef ref.types.int32 ] ]
    # Casts
    LLVMBuildTrunc: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildZExt: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildSExt: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPToUI: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPToSI: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildUIToFP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildSIToFP: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPTrunc: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPExt: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildPtrToInt: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildIntToPtr: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildBitCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildAddrSpaceCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildZExtOrBitCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildSExtOrBitCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildTruncOrBitCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildCast: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildPointerCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildIntCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildFPCast: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    # Comparisons
    LLVMBuildICmp: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFCmp: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMValueRef ref.types.CString ] ]
    # Miscellaneous instructions
    LLVMBuildPhi: [ LLVMValueRef [ LLVMBuilderRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildCall: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRefPtr ref.types.uint32 ref.types.CString ] ]
    LLVMBuildSelect: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildVAArg: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMTypeRef ref.types.CString ] ]
    LLVMBuildExtractElement: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildInsertElement: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildShuffleVector: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildExtractValue: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.uint32 ref.types.CString ] ]
    LLVMBuildInsertValue: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.uint32 ref.types.CString ] ]
    LLVMBuildIsNull: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildIsNotNull: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildPtrDiff: [ LLVMValueRef [ LLVMBuilderRef LLVMValueRef LLVMValueRef ref.types.CString ] ]
    LLVMBuildFence: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 ref.types.int32 ref.types.CString ] ]
    LLVMBuildAtomicRMW: [ LLVMValueRef [ LLVMBuilderRef ref.types.uint32 LLVMValueRef LLVMValueRef ref.types.uint32 ref.types.int32 ] ]
    #
    # Changes the type of M so it can be passed to FunctionPassManagers and the
    # JIT.  They take ModuleProviders for historical reasons.
    #
    LLVMCreateModuleProviderForExistingModule: [ LLVMModuleProviderRef [ LLVMModuleRef ] ]
    #
    # Destroys the module M.
    #
    LLVMDisposeModuleProvider: [ ref.types.void [ LLVMModuleProviderRef ] ]
    #
    # @defgroup LLVMCCoreMemoryBuffers Memory Buffers
    #
    # @{
    #
    LLVMCreateMemoryBufferWithContentsOfFile: [ ref.types.int32 [ ref.types.CString LLVMMemoryBufferRef voidPtr ] ]
    LLVMCreateMemoryBufferWithSTDIN: [ ref.types.int32 [ LLVMMemoryBufferRefPtr voidPtr ] ]
    LLVMCreateMemoryBufferWithMemoryRange: [ LLVMMemoryBufferRef [ ref.types.CString ref.types.int32 ref.types.CString ref.types.int32 ] ]
    LLVMCreateMemoryBufferWithMemoryRangeCopy: [ LLVMMemoryBufferRef [ ref.types.CString ref.types.int32 ref.types.CString ] ]
    LLVMGetBufferStart: [ ref.types.CString [ LLVMMemoryBufferRef ] ]
    LLVMGetBufferSize: [ ref.types.int32 [ LLVMMemoryBufferRef ] ]
    LLVMDisposeMemoryBuffer: [ ref.types.void [ LLVMMemoryBufferRef ] ]
    #
    # @}
    #
    # Return the global pass registry, for use with initialization functions.
    #    @see llvm::PassRegistry::getPassRegistry
    LLVMGetGlobalPassRegistry: [ LLVMPassRegistryRef [] ]
    # Constructs a new whole-module pass pipeline. This type of pipeline is
    #    suitable for link-time optimization and whole-module transformations.
    #    @see llvm::PassManager::PassManager
    LLVMCreatePassManager: [ LLVMPassManagerRef [] ]
    # Constructs a new function-by-function pass pipeline over the module
    #    provider. It does not take ownership of the module provider. This type of
    #    pipeline is suitable for code generation and JIT compilation tasks.
    #    @see llvm::FunctionPassManager::FunctionPassManager
    LLVMCreateFunctionPassManagerForModule: [ LLVMPassManagerRef [ LLVMModuleRef ] ]
    # Deprecated: Use LLVMCreateFunctionPassManagerForModule instead.
    LLVMCreateFunctionPassManager: [ LLVMPassManagerRef [ LLVMModuleProviderRef ] ]
    # Initializes, executes on the provided module, and finalizes all of the
    #    passes scheduled in the pass manager. Returns 1 if any of the passes
    #    modified the module, 0 otherwise.
    #    @see llvm::PassManager::run(Module&)
    LLVMRunPassManager: [ ref.types.int32 [ LLVMPassManagerRef LLVMModuleRef ] ]
    # Initializes all of the function passes scheduled in the function pass
    #    manager. Returns 1 if any of the passes modified the module, 0 otherwise.
    #    @see llvm::FunctionPassManager::doInitialization
    LLVMInitializeFunctionPassManager: [ ref.types.int32 [ LLVMPassManagerRef ] ]
    # Executes all of the function passes scheduled in the function pass manager
    #    on the provided function. Returns 1 if any of the passes modified the
    #    function, false otherwise.
    #    @see llvm::FunctionPassManager::run(Function&)
    LLVMRunFunctionPassManager: [ ref.types.int32 [ LLVMPassManagerRef LLVMValueRef ] ]
    # Finalizes all of the function passes scheduled in in the function pass
    #    manager. Returns 1 if any of the passes modified the module, 0 otherwise.
    #    @see llvm::FunctionPassManager::doFinalization
    LLVMFinalizeFunctionPassManager: [ ref.types.int32 [ LLVMPassManagerRef ] ]
    # Frees the memory of a pass pipeline. For function pipelines, does not free
    #    the module provider.
    #    @see llvm::PassManagerBase::~PassManagerBase.
    LLVMDisposePassManager: [ ref.types.void [ LLVMPassManagerRef ] ]
    # Deprecated: Multi-threading can only be enabled/disabled with the compile
    #    time define LLVM_ENABLE_THREADS.  This function always returns
    #    LLVMIsMultithreaded().
    LLVMStartMultithreaded: [ ref.types.int32 [] ]
    # Deprecated: Multi-threading can only be enabled/disabled with the compile
    #    time define LLVM_ENABLE_THREADS.
    LLVMStopMultithreaded: [ ref.types.void [] ]
    # Check whether LLVM is executing in thread-safe mode or not.
    #    @see llvm::llvm_is_multithreaded
    LLVMIsMultithreaded: [ ref.types.int32 [] ]
  )
catch err
  if (/Dynamic Linking Error/.test(err.message))
    out = """Uh oh! llvm2 wasn't able to dynamically link to the LLVM library.
             Please make sure `libLLVM-3.6.dylib` is on your dynamic linker's
             search path.\n\n"""
    process.stderr.write(out)
  throw err

