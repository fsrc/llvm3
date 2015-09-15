FFI = require('ffi')
ArrayType = require('ref-array')
Struct = require('ref-struct')
ref = require('ref')
voidPtr = ref.refType(ref.types.void)
exports.CONSTANTS = '':
  LLVMDSError                    : 0
  LLVMDSWarning                  : 1
  LLVMDSRemark                   : 2
  LLVMDSNote                     : 3
  LLVMVoidTypeKind               : 0
  LLVMHalfTypeKind               : 1
  LLVMFloatTypeKind              : 2
  LLVMDoubleTypeKind             : 3
  LLVMX86_FP80TypeKind           : 4
  LLVMFP128TypeKind              : 5
  LLVMPPC_FP128TypeKind          : 6
  LLVMLabelTypeKind              : 7
  LLVMIntegerTypeKind            : 8
  LLVMFunctionTypeKind           : 9
  LLVMStructTypeKind             : 10
  LLVMArrayTypeKind              : 11
  LLVMPointerTypeKind            : 12
  LLVMVectorTypeKind             : 13
  LLVMMetadataTypeKind           : 14
  LLVMX86_MMXTypeKind            : 15
  LLVMRet                        : 1
  LLVMBr                         : 2
  LLVMSwitch                     : 3
  LLVMIndirectBr                 : 4
  LLVMInvoke                     : 5
  LLVMUnreachable                : 7
  LLVMAdd                        : 8
  LLVMFAdd                       : 9
  LLVMSub                        : 10
  LLVMFSub                       : 11
  LLVMMul                        : 12
  LLVMFMul                       : 13
  LLVMUDiv                       : 14
  LLVMSDiv                       : 15
  LLVMFDiv                       : 16
  LLVMURem                       : 17
  LLVMSRem                       : 18
  LLVMFRem                       : 19
  LLVMShl                        : 20
  LLVMLShr                       : 21
  LLVMAShr                       : 22
  LLVMAnd                        : 23
  LLVMOr                         : 24
  LLVMXor                        : 25
  LLVMAlloca                     : 26
  LLVMLoad                       : 27
  LLVMStore                      : 28
  LLVMGetElementPtr              : 29
  LLVMTrunc                      : 30
  LLVMZExt                       : 31
  LLVMSExt                       : 32
  LLVMFPToUI                     : 33
  LLVMFPToSI                     : 34
  LLVMUIToFP                     : 35
  LLVMSIToFP                     : 36
  LLVMFPTrunc                    : 37
  LLVMFPExt                      : 38
  LLVMPtrToInt                   : 39
  LLVMIntToPtr                   : 40
  LLVMBitCast                    : 41
  LLVMAddrSpaceCast              : 60
  LLVMICmp                       : 42
  LLVMFCmp                       : 43
  LLVMPHI                        : 44
  LLVMCall                       : 45
  LLVMSelect                     : 46
  LLVMUserOp1                    : 47
  LLVMUserOp2                    : 48
  LLVMVAArg                      : 49
  LLVMExtractElement             : 50
  LLVMInsertElement              : 51
  LLVMShuffleVector              : 52
  LLVMExtractValue               : 53
  LLVMInsertValue                : 54
  LLVMFence                      : 55
  LLVMAtomicCmpXchg              : 56
  LLVMAtomicRMW                  : 57
  LLVMResume                     : 58
  LLVMLandingPad                 : 59
  LLVMIntEQ                      : 32
  LLVMIntNE                      : 33
  LLVMIntUGT                     : 34
  LLVMIntUGE                     : 35
  LLVMIntULT                     : 36
  LLVMIntULE                     : 37
  LLVMIntSGT                     : 38
  LLVMIntSGE                     : 39
  LLVMIntSLT                     : 40
  LLVMIntSLE                     : 41
  LLVMRealPredicateFalse         : 0
  LLVMRealOEQ                    : 1
  LLVMRealOGT                    : 2
  LLVMRealOGE                    : 3
  LLVMRealOLT                    : 4
  LLVMRealOLE                    : 5
  LLVMRealONE                    : 6
  LLVMRealORD                    : 7
  LLVMRealUNO                    : 8
  LLVMRealUEQ                    : 9
  LLVMRealUGT                    : 10
  LLVMRealUGE                    : 11
  LLVMRealULT                    : 12
  LLVMRealULE                    : 13
  LLVMRealUNE                    : 14
  LLVMRealPredicateTrue          : 15
  LLVMExternalLinkage            : 0
  LLVMAvailableExternallyLinkage : 1
  LLVMLinkOnceAnyLinkage         : 2
  LLVMLinkOnceODRLinkage         : 3
  LLVMLinkOnceODRAutoHideLinkage : 4
  LLVMWeakAnyLinkage             : 5
  LLVMWeakODRLinkage             : 6
  LLVMAppendingLinkage           : 7
  LLVMInternalLinkage            : 8
  LLVMPrivateLinkage             : 9
  LLVMDLLImportLinkage           : 10
  LLVMDLLExportLinkage           : 11
  LLVMExternalWeakLinkage        : 12
  LLVMGhostLinkage               : 13
  LLVMCommonLinkage              : 14
  LLVMLinkerPrivateLinkage       : 15
  LLVMLinkerPrivateWeakLinkage   : 16
  LLVMDefaultVisibility          : 0
  LLVMHiddenVisibility           : 1
  LLVMProtectedVisibility        : 2
  LLVMDefaultStorageClass        : 0
  LLVMDLLImportStorageClass      : 1
  LLVMDLLExportStorageClass      : 2
  LLVMNotThreadLocal             : 0
  LLVMGeneralDynamicTLSModel     : 1
  LLVMLocalDynamicTLSModel       : 2
  LLVMInitialExecTLSModel        : 3
  LLVMLocalExecTLSModel          : 4
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

  LLVMAtomicOrderingNotAtomic              : 0
  LLVMAtomicOrderingUnordered              : 1
  LLVMAtomicOrderingMonotonic              : 2
  LLVMAtomicOrderingAcquire                : 4
  LLVMAtomicOrderingRelease                : 5
  LLVMAtomicOrderingAcquireRelease         : 6
  LLVMAtomicOrderingSequentiallyConsistent : 7
  LLVMAtomicRMWBinOpXchg                   : 0
  LLVMAtomicRMWBinOpAdd                    : 1
  LLVMAtomicRMWBinOpSub                    : 2
  LLVMAtomicRMWBinOpAnd                    : 3
  LLVMAtomicRMWBinOpNand                   : 4
  LLVMAtomicRMWBinOpOr                     : 5
  LLVMAtomicRMWBinOpXor                    : 6
  LLVMAtomicRMWBinOpMax                    : 7
  LLVMAtomicRMWBinOpMin                    : 8
  LLVMAtomicRMWBinOpUMax                   : 9
  LLVMAtomicRMWBinOpUMin                   : 10

  '0'           : 'LLVMDSError'
  '1'           : 'LLVMDSWarning'
  '2'           : 'LLVMDSRemark'
  '3'           : 'LLVMDSNote'

  '0'           : 'LLVMVoidTypeKind'
  '1'           : 'LLVMHalfTypeKind'
  '2'           : 'LLVMFloatTypeKind'
  '3'           : 'LLVMDoubleTypeKind'
  '4'           : 'LLVMX86_FP80TypeKind'
  '5'           : 'LLVMFP128TypeKind'
  '6'           : 'LLVMPPC_FP128TypeKind'
  '7'           : 'LLVMLabelTypeKind'
  '8'           : 'LLVMIntegerTypeKind'
  '9'           : 'LLVMFunctionTypeKind'
  '10'          : 'LLVMStructTypeKind'
  '11'          : 'LLVMArrayTypeKind'
  '12'          : 'LLVMPointerTypeKind'
  '13'          : 'LLVMVectorTypeKind'
  '14'          : 'LLVMMetadataTypeKind'
  '15'          : 'LLVMX86_MMXTypeKind'

  '1'           : 'LLVMRet'
  '2'           : 'LLVMBr'
  '3'           : 'LLVMSwitch'
  '4'           : 'LLVMIndirectBr'
  '5'           : 'LLVMInvoke'
  '7'           : 'LLVMUnreachable'
  '8'           : 'LLVMAdd'
  '9'           : 'LLVMFAdd'
  '10'          : 'LLVMSub'
  '11'          : 'LLVMFSub'
  '12'          : 'LLVMMul'
  '13'          : 'LLVMFMul'
  '14'          : 'LLVMUDiv'
  '15'          : 'LLVMSDiv'
  '16'          : 'LLVMFDiv'
  '17'          : 'LLVMURem'
  '18'          : 'LLVMSRem'
  '19'          : 'LLVMFRem'
  '20'          : 'LLVMShl'
  '21'          : 'LLVMLShr'
  '22'          : 'LLVMAShr'
  '23'          : 'LLVMAnd'
  '24'          : 'LLVMOr'
  '25'          : 'LLVMXor'
  '26'          : 'LLVMAlloca'
  '27'          : 'LLVMLoad'
  '28'          : 'LLVMStore'
  '29'          : 'LLVMGetElementPtr'
  '30'          : 'LLVMTrunc'
  '31'          : 'LLVMZExt'
  '32'          : 'LLVMSExt'
  '33'          : 'LLVMFPToUI'
  '34'          : 'LLVMFPToSI'
  '35'          : 'LLVMUIToFP'
  '36'          : 'LLVMSIToFP'
  '37'          : 'LLVMFPTrunc'
  '38'          : 'LLVMFPExt'
  '39'          : 'LLVMPtrToInt'
  '40'          : 'LLVMIntToPtr'
  '41'          : 'LLVMBitCast'
  '60'          : 'LLVMAddrSpaceCast'
  '42'          : 'LLVMICmp'
  '43'          : 'LLVMFCmp'
  '44'          : 'LLVMPHI'
  '45'          : 'LLVMCall'
  '46'          : 'LLVMSelect'
  '47'          : 'LLVMUserOp1'
  '48'          : 'LLVMUserOp2'
  '49'          : 'LLVMVAArg'
  '50'          : 'LLVMExtractElement'
  '51'          : 'LLVMInsertElement'
  '52'          : 'LLVMShuffleVector'
  '53'          : 'LLVMExtractValue'
  '54'          : 'LLVMInsertValue'
  '55'          : 'LLVMFence'
  '56'          : 'LLVMAtomicCmpXchg'
  '57'          : 'LLVMAtomicRMW'
  '58'          : 'LLVMResume'
  '59'          : 'LLVMLandingPad'
  '32'          : 'LLVMIntEQ'
  '33'          : 'LLVMIntNE'
  '34'          : 'LLVMIntUGT'
  '35'          : 'LLVMIntUGE'
  '36'          : 'LLVMIntULT'
  '37'          : 'LLVMIntULE'
  '38'          : 'LLVMIntSGT'
  '39'          : 'LLVMIntSGE'
  '40'          : 'LLVMIntSLT'
  '41'          : 'LLVMIntSLE'
  '0'           : 'LLVMRealPredicateFalse'
  '1'           : 'LLVMRealOEQ'
  '2'           : 'LLVMRealOGT'
  '3'           : 'LLVMRealOGE'
  '4'           : 'LLVMRealOLT'
  '5'           : 'LLVMRealOLE'
  '6'           : 'LLVMRealONE'
  '7'           : 'LLVMRealORD'
  '8'           : 'LLVMRealUNO'
  '9'           : 'LLVMRealUEQ'
  '10'          : 'LLVMRealUGT'
  '11'          : 'LLVMRealUGE'
  '12'          : 'LLVMRealULT'
  '13'          : 'LLVMRealULE'
  '14'          : 'LLVMRealUNE'
  '15'          : 'LLVMRealPredicateTrue'

  '0'           : 'LLVMExternalLinkage'
  '1'           : 'LLVMAvailableExternallyLinkage'
  '2'           : 'LLVMLinkOnceAnyLinkage'
  '3'           : 'LLVMLinkOnceODRLinkage'
  '4'           : 'LLVMLinkOnceODRAutoHideLinkage'
  '5'           : 'LLVMWeakAnyLinkage'
  '6'           : 'LLVMWeakODRLinkage'
  '7'           : 'LLVMAppendingLinkage'
  '8'           : 'LLVMInternalLinkage'
  '9'           : 'LLVMPrivateLinkage'
  '10'          : 'LLVMDLLImportLinkage'
  '11'          : 'LLVMDLLExportLinkage'
  '12'          : 'LLVMExternalWeakLinkage'
  '13'          : 'LLVMGhostLinkage'
  '14'          : 'LLVMCommonLinkage'
  '15'          : 'LLVMLinkerPrivateLinkage'
  '16'          : 'LLVMLinkerPrivateWeakLinkage'

  '0'           : 'LLVMDefaultVisibility'
  '1'           : 'LLVMHiddenVisibility'
  '2'           : 'LLVMProtectedVisibility'
  '0'           : 'LLVMDefaultStorageClass'
  '1'           : 'LLVMDLLImportStorageClass'
  '2'           : 'LLVMDLLExportStorageClass'
  '0'           : 'LLVMNotThreadLocal'
  '1'           : 'LLVMGeneralDynamicTLSModel'
  '2'           : 'LLVMLocalDynamicTLSModel'
  '3'           : 'LLVMInitialExecTLSModel'
  '4'           : 'LLVMLocalExecTLSModel'
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

  '0'           : 'LLVMAtomicOrderingNotAtomic'
  '1'           : 'LLVMAtomicOrderingUnordered'
  '2'           : 'LLVMAtomicOrderingMonotonic'
  '4'           : 'LLVMAtomicOrderingAcquire'
  '5'           : 'LLVMAtomicOrderingRelease'
  '6'           : 'LLVMAtomicOrderingAcquireRelease'
  '7'           : 'LLVMAtomicOrderingSequentiallyConsistent'
  '0'           : 'LLVMAtomicRMWBinOpXchg'
  '1'           : 'LLVMAtomicRMWBinOpAdd'
  '2'           : 'LLVMAtomicRMWBinOpSub'
  '3'           : 'LLVMAtomicRMWBinOpAnd'
  '4'           : 'LLVMAtomicRMWBinOpNand'
  '5'           : 'LLVMAtomicRMWBinOpOr'
  '6'           : 'LLVMAtomicRMWBinOpXor'
  '7'           : 'LLVMAtomicRMWBinOpMax'
  '8'           : 'LLVMAtomicRMWBinOpMin'
  '9'           : 'LLVMAtomicRMWBinOpUMax'
  '10'          : 'LLVMAtomicRMWBinOpUMin'

LLVMPassRegistryRef = exports.LLVMPassRegistryRef = voidPtr
LLVMPassRegistryRefPtr = exports.LLVMPassRegistryRefPtr = ref.refType(LLVMPassRegistryRef)
LLVMFatalErrorHandler = exports.LLVMFatalErrorHandler = FFI.Function(ref.types.void, [ ref.types.CString ])
LLVMFatalErrorHandlerPtr = exports.LLVMFatalErrorHandlerPtr = ref.refType(LLVMFatalErrorHandler)
LLVMContextRef = exports.LLVMContextRef = voidPtr
LLVMContextRefPtr = exports.LLVMContextRefPtr = ref.refType(LLVMContextRef)
LLVMDiagnosticHandler = exports.LLVMDiagnosticHandler = FFI.Function(ref.types.void, [
  voidPtr
  voidPtr
])
LLVMDiagnosticHandlerPtr = exports.LLVMDiagnosticHandlerPtr = ref.refType(LLVMDiagnosticHandler)
LLVMYieldCallback = exports.LLVMYieldCallback = FFI.Function(ref.types.void, [
  voidPtr
  voidPtr
])
LLVMYieldCallbackPtr = exports.LLVMYieldCallbackPtr = ref.refType(LLVMYieldCallback)
LLVMDiagnosticInfoRef = exports.LLVMDiagnosticInfoRef = voidPtr
LLVMDiagnosticInfoRefPtr = exports.LLVMDiagnosticInfoRefPtr = ref.refType(LLVMDiagnosticInfoRef)
LLVMModuleRef = exports.LLVMModuleRef = voidPtr
LLVMModuleRefPtr = exports.LLVMModuleRefPtr = ref.refType(LLVMModuleRef)
LLVMTypeRef = exports.LLVMTypeRef = voidPtr
LLVMTypeRefPtr = exports.LLVMTypeRefPtr = ref.refType(LLVMTypeRef)
LLVMValueRef = exports.LLVMValueRef = voidPtr
LLVMValueRefPtr = exports.LLVMValueRefPtr = ref.refType(LLVMValueRef)
LLVMUseRef = exports.LLVMUseRef = voidPtr
LLVMUseRefPtr = exports.LLVMUseRefPtr = ref.refType(LLVMUseRef)
LLVMBasicBlockRef = exports.LLVMBasicBlockRef = voidPtr
LLVMBasicBlockRefPtr = exports.LLVMBasicBlockRefPtr = ref.refType(LLVMBasicBlockRef)
LLVMBuilderRef = exports.LLVMBuilderRef = voidPtr
LLVMBuilderRefPtr = exports.LLVMBuilderRefPtr = ref.refType(LLVMBuilderRef)
LLVMModuleProviderRef = exports.LLVMModuleProviderRef = voidPtr
LLVMModuleProviderRefPtr = exports.LLVMModuleProviderRefPtr = ref.refType(LLVMModuleProviderRef)
LLVMMemoryBufferRef = exports.LLVMMemoryBufferRef = voidPtr
LLVMMemoryBufferRefPtr = exports.LLVMMemoryBufferRefPtr = ref.refType(LLVMMemoryBufferRef)
LLVMPassManagerRef = exports.LLVMPassManagerRef = voidPtr
LLVMPassManagerRefPtr = exports.LLVMPassManagerRefPtr = ref.refType(LLVMPassManagerRef)
exports.library = new (FFI.Library)('libLLVM-3.6',
  LLVMLoadLibraryPermanently: [
    ref.types.int32
    [ ref.types.CString ]
  ]
  LLVMInitializeCore: [
    ref.types.void
    [ LLVMPassRegistryRef ]
  ]
  LLVMShutdown: [
    ref.types.void
    []
  ]
  LLVMCreateMessage: [
    ref.types.CString
    [ ref.types.CString ]
  ]
  LLVMDisposeMessage: [
    ref.types.void
    [ ref.types.CString ]
  ]
  LLVMInstallFatalErrorHandler: [
    ref.types.void
    [ LLVMFatalErrorHandler ]
  ]
  LLVMResetFatalErrorHandler: [
    ref.types.void
    []
  ]
  LLVMEnablePrettyStackTrace: [
    ref.types.void
    []
  ]
  LLVMContextCreate: [
    LLVMContextRef
    []
  ]
  LLVMGetGlobalContext: [
    LLVMContextRef
    []
  ]
  LLVMContextSetDiagnosticHandler: [
    ref.types.void
    [
      LLVMContextRef
      LLVMDiagnosticHandler
      voidPtr
    ]
  ]
  LLVMContextSetYieldCallback: [
    ref.types.void
    [
      LLVMContextRef
      LLVMYieldCallback
      voidPtr
    ]
  ]
  LLVMContextDispose: [
    ref.types.void
    [ LLVMContextRef ]
  ]
  LLVMGetDiagInfoDescription: [
    ref.types.CString
    [ LLVMDiagnosticInfoRef ]
  ]
  LLVMGetDiagInfoSeverity: [
    ref.types.uint32
    [ LLVMDiagnosticInfoRef ]
  ]
  LLVMGetMDKindIDInContext: [
    ref.types.uint32
    [
      LLVMContextRef
      ref.types.CString
      ref.types.uint32
    ]
  ]
  LLVMGetMDKindID: [
    ref.types.uint32
    [
      ref.types.CString
      ref.types.uint32
    ]
  ]
  LLVMModuleCreateWithName: [
    LLVMModuleRef
    [ ref.types.CString ]
  ]
  LLVMModuleCreateWithNameInContext: [
    LLVMModuleRef
    [
      ref.types.CString
      LLVMContextRef
    ]
  ]
  LLVMDisposeModule: [
    ref.types.void
    [ LLVMModuleRef ]
  ]
  LLVMGetDataLayout: [
    ref.types.CString
    [ LLVMModuleRef ]
  ]
  LLVMSetDataLayout: [
    ref.types.void
    [
      LLVMModuleRef
      ref.types.CString
    ]
  ]
  LLVMGetTarget: [
    ref.types.CString
    [ LLVMModuleRef ]
  ]
  LLVMSetTarget: [
    ref.types.void
    [
      LLVMModuleRef
      ref.types.CString
    ]
  ]
  LLVMDumpModule: [
    ref.types.void
    [ LLVMModuleRef ]
  ]
  LLVMPrintModuleToFile: [
    ref.types.int32
    [
      LLVMModuleRef
      ref.types.CString
      voidPtr
    ]
  ]
  LLVMPrintModuleToString: [
    ref.types.CString
    [ LLVMModuleRef ]
  ]
  LLVMSetModuleInlineAsm: [
    ref.types.void
    [
      LLVMModuleRef
      ref.types.CString
    ]
  ]
  LLVMGetModuleContext: [
    LLVMContextRef
    [ LLVMModuleRef ]
  ]
  LLVMGetTypeByName: [
    LLVMTypeRef
    [
      LLVMModuleRef
      ref.types.CString
    ]
  ]
  LLVMGetNamedMetadataNumOperands: [
    ref.types.uint32
    [
      LLVMModuleRef
      ref.types.CString
    ]
  ]
  LLVMGetNamedMetadataOperands: [
    ref.types.void
    [
      LLVMModuleRef
      ref.types.CString
      LLVMValueRef
    ]
  ]
  LLVMAddNamedMetadataOperand: [
    ref.types.void
    [
      LLVMModuleRef
      ref.types.CString
      LLVMValueRef
    ]
  ]
  LLVMAddFunction: [
    LLVMValueRef
    [
      LLVMModuleRef
      ref.types.CString
      LLVMTypeRef
    ]
  ]
  LLVMGetNamedFunction: [
    LLVMValueRef
    [
      LLVMModuleRef
      ref.types.CString
    ]
  ]
  LLVMGetFirstFunction: [
    LLVMValueRef
    [ LLVMModuleRef ]
  ]
  LLVMGetLastFunction: [
    LLVMValueRef
    [ LLVMModuleRef ]
  ]
  LLVMGetNextFunction: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMGetPreviousFunction: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMGetTypeKind: [
    ref.types.uint32
    [ LLVMTypeRef ]
  ]
  LLVMTypeIsSized: [
    ref.types.int32
    [ LLVMTypeRef ]
  ]
  LLVMGetTypeContext: [
    LLVMContextRef
    [ LLVMTypeRef ]
  ]
  LLVMDumpType: [
    ref.types.void
    [ LLVMTypeRef ]
  ]
  LLVMPrintTypeToString: [
    ref.types.CString
    [ LLVMTypeRef ]
  ]
  LLVMInt1TypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMInt8TypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMInt16TypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMInt32TypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMInt64TypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMIntTypeInContext: [
    LLVMTypeRef
    [
      LLVMContextRef
      ref.types.uint32
    ]
  ]
  LLVMInt1Type: [
    LLVMTypeRef
    []
  ]
  LLVMInt8Type: [
    LLVMTypeRef
    []
  ]
  LLVMInt16Type: [
    LLVMTypeRef
    []
  ]
  LLVMInt32Type: [
    LLVMTypeRef
    []
  ]
  LLVMInt64Type: [
    LLVMTypeRef
    []
  ]
  LLVMIntType: [
    LLVMTypeRef
    [ ref.types.uint32 ]
  ]
  LLVMGetIntTypeWidth: [
    ref.types.uint32
    [ LLVMTypeRef ]
  ]
  LLVMHalfTypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMFloatTypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMDoubleTypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMX86FP80TypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMFP128TypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMPPCFP128TypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMHalfType: [
    LLVMTypeRef
    []
  ]
  LLVMFloatType: [
    LLVMTypeRef
    []
  ]
  LLVMDoubleType: [
    LLVMTypeRef
    []
  ]
  LLVMX86FP80Type: [
    LLVMTypeRef
    []
  ]
  LLVMFP128Type: [
    LLVMTypeRef
    []
  ]
  LLVMPPCFP128Type: [
    LLVMTypeRef
    []
  ]
  LLVMFunctionType: [
    LLVMTypeRef
    [
      LLVMTypeRef
      LLVMTypeRefPtr
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMIsFunctionVarArg: [
    ref.types.int32
    [ LLVMTypeRef ]
  ]
  LLVMGetReturnType: [
    LLVMTypeRef
    [ LLVMTypeRef ]
  ]
  LLVMCountParamTypes: [
    ref.types.uint32
    [ LLVMTypeRef ]
  ]
  LLVMGetParamTypes: [
    ref.types.void
    [
      LLVMTypeRef
      LLVMTypeRefPtr
    ]
  ]
  LLVMStructTypeInContext: [
    LLVMTypeRef
    [
      LLVMContextRef
      LLVMTypeRefPtr
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMStructType: [
    LLVMTypeRef
    [
      LLVMTypeRefPtr
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMStructCreateNamed: [
    LLVMTypeRef
    [
      LLVMContextRef
      ref.types.CString
    ]
  ]
  LLVMGetStructName: [
    ref.types.CString
    [ LLVMTypeRef ]
  ]
  LLVMStructSetBody: [
    ref.types.void
    [
      LLVMTypeRef
      LLVMTypeRefPtr
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMCountStructElementTypes: [
    ref.types.uint32
    [ LLVMTypeRef ]
  ]
  LLVMGetStructElementTypes: [
    ref.types.void
    [
      LLVMTypeRef
      LLVMTypeRefPtr
    ]
  ]
  LLVMIsPackedStruct: [
    ref.types.int32
    [ LLVMTypeRef ]
  ]
  LLVMIsOpaqueStruct: [
    ref.types.int32
    [ LLVMTypeRef ]
  ]
  LLVMGetElementType: [
    LLVMTypeRef
    [ LLVMTypeRef ]
  ]
  LLVMArrayType: [
    LLVMTypeRef
    [
      LLVMTypeRef
      ref.types.uint32
    ]
  ]
  LLVMGetArrayLength: [
    ref.types.uint32
    [ LLVMTypeRef ]
  ]
  LLVMPointerType: [
    LLVMTypeRef
    [
      LLVMTypeRef
      ref.types.uint32
    ]
  ]
  LLVMGetPointerAddressSpace: [
    ref.types.uint32
    [ LLVMTypeRef ]
  ]
  LLVMVectorType: [
    LLVMTypeRef
    [
      LLVMTypeRef
      ref.types.uint32
    ]
  ]
  LLVMGetVectorSize: [
    ref.types.uint32
    [ LLVMTypeRef ]
  ]
  LLVMVoidTypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMLabelTypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMX86MMXTypeInContext: [
    LLVMTypeRef
    [ LLVMContextRef ]
  ]
  LLVMVoidType: [
    LLVMTypeRef
    []
  ]
  LLVMLabelType: [
    LLVMTypeRef
    []
  ]
  LLVMX86MMXType: [
    LLVMTypeRef
    []
  ]
  LLVMTypeOf: [
    LLVMTypeRef
    [ LLVMValueRef ]
  ]
  LLVMGetValueName: [
    ref.types.CString
    [ LLVMValueRef ]
  ]
  LLVMSetValueName: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMDumpValue: [
    ref.types.void
    [ LLVMValueRef ]
  ]
  LLVMPrintValueToString: [
    ref.types.CString
    [ LLVMValueRef ]
  ]
  LLVMReplaceAllUsesWith: [
    ref.types.void
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMIsConstant: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMIsUndef: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMIsAArgument: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsABasicBlock: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAInlineAsm: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAMDNode: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAMDString: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAUser: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstant: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsABlockAddress: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantAggregateZero: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantArray: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantDataSequential: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantDataArray: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantDataVector: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantExpr: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantFP: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantInt: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantPointerNull: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantStruct: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAConstantVector: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAGlobalValue: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAGlobalAlias: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAGlobalObject: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAFunction: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAGlobalVariable: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAUndefValue: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAInstruction: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsABinaryOperator: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsACallInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAIntrinsicInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsADbgInfoIntrinsic: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsADbgDeclareInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAMemIntrinsic: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAMemCpyInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAMemMoveInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAMemSetInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsACmpInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAFCmpInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAICmpInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAExtractElementInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAGetElementPtrInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAInsertElementInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAInsertValueInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsALandingPadInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAPHINode: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsASelectInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAShuffleVectorInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAStoreInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsATerminatorInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsABranchInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAIndirectBrInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAInvokeInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAReturnInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsASwitchInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAUnreachableInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAResumeInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAUnaryInstruction: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAAllocaInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsACastInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAAddrSpaceCastInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsABitCastInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAFPExtInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAFPToSIInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAFPToUIInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAFPTruncInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAIntToPtrInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAPtrToIntInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsASExtInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsASIToFPInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsATruncInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAUIToFPInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAZExtInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAExtractValueInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsALoadInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMIsAVAArgInst: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMGetFirstUse: [
    LLVMUseRef
    [ LLVMValueRef ]
  ]
  LLVMGetNextUse: [
    LLVMUseRef
    [ LLVMUseRef ]
  ]
  LLVMGetUser: [
    LLVMValueRef
    [ LLVMUseRef ]
  ]
  LLVMGetUsedValue: [
    LLVMValueRef
    [ LLVMUseRef ]
  ]
  LLVMGetOperand: [
    LLVMValueRef
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMSetOperand: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
      LLVMValueRef
    ]
  ]
  LLVMGetNumOperands: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMConstNull: [
    LLVMValueRef
    [ LLVMTypeRef ]
  ]
  LLVMConstAllOnes: [
    LLVMValueRef
    [ LLVMTypeRef ]
  ]
  LLVMGetUndef: [
    LLVMValueRef
    [ LLVMTypeRef ]
  ]
  LLVMIsNull: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMConstPointerNull: [
    LLVMValueRef
    [ LLVMTypeRef ]
  ]
  LLVMConstInt: [
    LLVMValueRef
    [
      LLVMTypeRef
      ref.types.ulonglong
      ref.types.int32
    ]
  ]
  LLVMConstIntOfString: [
    LLVMValueRef
    [
      LLVMTypeRef
      ref.types.CString
      ref.types.uchar
    ]
  ]
  LLVMConstIntOfStringAndSize: [
    LLVMValueRef
    [
      LLVMTypeRef
      ref.types.CString
      ref.types.uint32
      ref.types.uchar
    ]
  ]
  LLVMConstReal: [
    LLVMValueRef
    [
      LLVMTypeRef
      ref.types.double
    ]
  ]
  LLVMConstRealOfString: [
    LLVMValueRef
    [
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMConstRealOfStringAndSize: [
    LLVMValueRef
    [
      LLVMTypeRef
      ref.types.CString
      ref.types.uint32
    ]
  ]
  LLVMConstIntGetZExtValue: [
    ref.types.ulonglong
    [ LLVMValueRef ]
  ]
  LLVMConstIntGetSExtValue: [
    ref.types.longlong
    [ LLVMValueRef ]
  ]
  LLVMConstStringInContext: [
    LLVMValueRef
    [
      LLVMContextRef
      ref.types.CString
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMConstString: [
    LLVMValueRef
    [
      ref.types.CString
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMConstStructInContext: [
    LLVMValueRef
    [
      LLVMContextRef
      LLVMValueRefPtr
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMConstStruct: [
    LLVMValueRef
    [
      LLVMValueRefPtr
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMConstArray: [
    LLVMValueRef
    [
      LLVMTypeRef
      LLVMValueRefPtr
      ref.types.uint32
    ]
  ]
  LLVMConstNamedStruct: [
    LLVMValueRef
    [
      LLVMTypeRef
      LLVMValueRefPtr
      ref.types.uint32
    ]
  ]
  LLVMConstVector: [
    LLVMValueRef
    [
      LLVMValueRefPtr
      ref.types.uint32
    ]
  ]
  LLVMGetConstOpcode: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMAlignOf: [
    LLVMValueRef
    [ LLVMTypeRef ]
  ]
  LLVMSizeOf: [
    LLVMValueRef
    [ LLVMTypeRef ]
  ]
  LLVMConstNeg: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMConstNSWNeg: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMConstNUWNeg: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMConstFNeg: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMConstNot: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMConstAdd: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstNSWAdd: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstNUWAdd: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstFAdd: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstSub: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstNSWSub: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstNUWSub: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstFSub: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstMul: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstNSWMul: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstNUWMul: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstFMul: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstUDiv: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstSDiv: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstExactSDiv: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstFDiv: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstURem: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstSRem: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstFRem: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstAnd: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstOr: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstXor: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstICmp: [
    LLVMValueRef
    [
      ref.types.uint32
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstFCmp: [
    LLVMValueRef
    [
      ref.types.uint32
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstShl: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstLShr: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstAShr: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstGEP: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRefPtr
      ref.types.uint32
    ]
  ]
  LLVMConstInBoundsGEP: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRefPtr
      ref.types.uint32
    ]
  ]
  LLVMConstTrunc: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstSExt: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstZExt: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstFPTrunc: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstFPExt: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstUIToFP: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstSIToFP: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstFPToUI: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstFPToSI: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstPtrToInt: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstIntToPtr: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstBitCast: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstAddrSpaceCast: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstZExtOrBitCast: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstSExtOrBitCast: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstTruncOrBitCast: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstPointerCast: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstIntCast: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
      ref.types.int32
    ]
  ]
  LLVMConstFPCast: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMTypeRef
    ]
  ]
  LLVMConstSelect: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstExtractElement: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstInsertElement: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstShuffleVector: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMConstExtractValue: [
    LLVMValueRef
    [
      LLVMValueRef
      ref.refType(ref.types.uint32)
      ref.types.uint32
    ]
  ]
  LLVMConstInsertValue: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMValueRef
      ref.refType(ref.types.uint32)
      ref.types.uint32
    ]
  ]
  LLVMConstInlineAsm: [
    LLVMValueRef
    [
      LLVMTypeRef
      ref.types.CString
      ref.types.CString
      ref.types.int32
      ref.types.int32
    ]
  ]
  LLVMBlockAddress: [
    LLVMValueRef
    [
      LLVMValueRef
      LLVMBasicBlockRef
    ]
  ]
  LLVMGetGlobalParent: [
    LLVMModuleRef
    [ LLVMValueRef ]
  ]
  LLVMIsDeclaration: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMGetLinkage: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMSetLinkage: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMGetSection: [
    ref.types.CString
    [ LLVMValueRef ]
  ]
  LLVMSetSection: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMGetVisibility: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMSetVisibility: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMGetDLLStorageClass: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMSetDLLStorageClass: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMHasUnnamedAddr: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMSetUnnamedAddr: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMGetAlignment: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMSetAlignment: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMAddGlobal: [
    LLVMValueRef
    [
      LLVMModuleRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMAddGlobalInAddressSpace: [
    LLVMValueRef
    [
      LLVMModuleRef
      LLVMTypeRef
      ref.types.CString
      ref.types.uint32
    ]
  ]
  LLVMGetNamedGlobal: [
    LLVMValueRef
    [
      LLVMModuleRef
      ref.types.CString
    ]
  ]
  LLVMGetFirstGlobal: [
    LLVMValueRef
    [ LLVMModuleRef ]
  ]
  LLVMGetLastGlobal: [
    LLVMValueRef
    [ LLVMModuleRef ]
  ]
  LLVMGetNextGlobal: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMGetPreviousGlobal: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMDeleteGlobal: [
    ref.types.void
    [ LLVMValueRef ]
  ]
  LLVMGetInitializer: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMSetInitializer: [
    ref.types.void
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMIsThreadLocal: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMSetThreadLocal: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMIsGlobalConstant: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMSetGlobalConstant: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMGetThreadLocalMode: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMSetThreadLocalMode: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMIsExternallyInitialized: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMSetExternallyInitialized: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMAddAlias: [
    LLVMValueRef
    [
      LLVMModuleRef
      LLVMTypeRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMDeleteFunction: [
    ref.types.void
    [ LLVMValueRef ]
  ]
  LLVMGetIntrinsicID: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMGetFunctionCallConv: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMSetFunctionCallConv: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMGetGC: [
    ref.types.CString
    [ LLVMValueRef ]
  ]
  LLVMSetGC: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMAddFunctionAttr: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMAddTargetDependentFunctionAttr: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.CString
      ref.types.CString
    ]
  ]
  LLVMGetFunctionAttr: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMRemoveFunctionAttr: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMCountParams: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMGetParams: [
    ref.types.void
    [
      LLVMValueRef
      LLVMValueRefPtr
    ]
  ]
  LLVMGetParam: [
    LLVMValueRef
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMGetParamParent: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMGetFirstParam: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMGetLastParam: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMGetNextParam: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMGetPreviousParam: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMAddAttribute: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMRemoveAttribute: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMGetAttribute: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMSetParamAlignment: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMMDStringInContext: [
    LLVMValueRef
    [
      LLVMContextRef
      ref.types.CString
      ref.types.uint32
    ]
  ]
  LLVMMDString: [
    LLVMValueRef
    [
      ref.types.CString
      ref.types.uint32
    ]
  ]
  LLVMMDNodeInContext: [
    LLVMValueRef
    [
      LLVMContextRef
      LLVMValueRefPtr
      ref.types.uint32
    ]
  ]
  LLVMMDNode: [
    LLVMValueRef
    [
      LLVMValueRefPtr
      ref.types.uint32
    ]
  ]
  LLVMGetMDString: [
    ref.types.CString
    [
      LLVMValueRef
      ref.refType(ref.types.uint32)
    ]
  ]
  LLVMGetMDNodeNumOperands: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMGetMDNodeOperands: [
    ref.types.void
    [
      LLVMValueRef
      LLVMValueRefPtr
    ]
  ]
  LLVMBasicBlockAsValue: [
    LLVMValueRef
    [ LLVMBasicBlockRef ]
  ]
  LLVMValueIsBasicBlock: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMValueAsBasicBlock: [
    LLVMBasicBlockRef
    [ LLVMValueRef ]
  ]
  LLVMGetBasicBlockParent: [
    LLVMValueRef
    [ LLVMBasicBlockRef ]
  ]
  LLVMGetBasicBlockTerminator: [
    LLVMValueRef
    [ LLVMBasicBlockRef ]
  ]
  LLVMCountBasicBlocks: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMGetBasicBlocks: [
    ref.types.void
    [
      LLVMValueRef
      LLVMBasicBlockRefPtr
    ]
  ]
  LLVMGetFirstBasicBlock: [
    LLVMBasicBlockRef
    [ LLVMValueRef ]
  ]
  LLVMGetLastBasicBlock: [
    LLVMBasicBlockRef
    [ LLVMValueRef ]
  ]
  LLVMGetNextBasicBlock: [
    LLVMBasicBlockRef
    [ LLVMBasicBlockRef ]
  ]
  LLVMGetPreviousBasicBlock: [
    LLVMBasicBlockRef
    [ LLVMBasicBlockRef ]
  ]
  LLVMGetEntryBasicBlock: [
    LLVMBasicBlockRef
    [ LLVMValueRef ]
  ]
  LLVMAppendBasicBlockInContext: [
    LLVMBasicBlockRef
    [
      LLVMContextRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMAppendBasicBlock: [
    LLVMBasicBlockRef
    [
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMInsertBasicBlockInContext: [
    LLVMBasicBlockRef
    [
      LLVMContextRef
      LLVMBasicBlockRef
      ref.types.CString
    ]
  ]
  LLVMInsertBasicBlock: [
    LLVMBasicBlockRef
    [
      LLVMBasicBlockRef
      ref.types.CString
    ]
  ]
  LLVMDeleteBasicBlock: [
    ref.types.void
    [ LLVMBasicBlockRef ]
  ]
  LLVMRemoveBasicBlockFromParent: [
    ref.types.void
    [ LLVMBasicBlockRef ]
  ]
  LLVMMoveBasicBlockBefore: [
    ref.types.void
    [
      LLVMBasicBlockRef
      LLVMBasicBlockRef
    ]
  ]
  LLVMMoveBasicBlockAfter: [
    ref.types.void
    [
      LLVMBasicBlockRef
      LLVMBasicBlockRef
    ]
  ]
  LLVMGetFirstInstruction: [
    LLVMValueRef
    [ LLVMBasicBlockRef ]
  ]
  LLVMGetLastInstruction: [
    LLVMValueRef
    [ LLVMBasicBlockRef ]
  ]
  LLVMHasMetadata: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMGetMetadata: [
    LLVMValueRef
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMSetMetadata: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
      LLVMValueRef
    ]
  ]
  LLVMGetInstructionParent: [
    LLVMBasicBlockRef
    [ LLVMValueRef ]
  ]
  LLVMGetNextInstruction: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMGetPreviousInstruction: [
    LLVMValueRef
    [ LLVMValueRef ]
  ]
  LLVMInstructionEraseFromParent: [
    ref.types.void
    [ LLVMValueRef ]
  ]
  LLVMGetInstructionOpcode: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMGetICmpPredicate: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMSetInstructionCallConv: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMGetInstructionCallConv: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMAddInstrAttribute: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMRemoveInstrAttribute: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMSetInstrParamAlignment: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.uint32
      ref.types.uint32
    ]
  ]
  LLVMIsTailCall: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMSetTailCall: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMGetSwitchDefaultDest: [
    LLVMBasicBlockRef
    [ LLVMValueRef ]
  ]
  LLVMAddIncoming: [
    ref.types.void
    [
      LLVMValueRef
      LLVMValueRefPtr
      LLVMBasicBlockRefPtr
      ref.types.uint32
    ]
  ]
  LLVMCountIncoming: [
    ref.types.uint32
    [ LLVMValueRef ]
  ]
  LLVMGetIncomingValue: [
    LLVMValueRef
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMGetIncomingBlock: [
    LLVMBasicBlockRef
    [
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMCreateBuilderInContext: [
    LLVMBuilderRef
    [ LLVMContextRef ]
  ]
  LLVMCreateBuilder: [
    LLVMBuilderRef
    []
  ]
  LLVMPositionBuilder: [
    ref.types.void
    [
      LLVMBuilderRef
      LLVMBasicBlockRef
      LLVMValueRef
    ]
  ]
  LLVMPositionBuilderBefore: [
    ref.types.void
    [
      LLVMBuilderRef
      LLVMValueRef
    ]
  ]
  LLVMPositionBuilderAtEnd: [
    ref.types.void
    [
      LLVMBuilderRef
      LLVMBasicBlockRef
    ]
  ]
  LLVMGetInsertBlock: [
    LLVMBasicBlockRef
    [ LLVMBuilderRef ]
  ]
  LLVMClearInsertionPosition: [
    ref.types.void
    [ LLVMBuilderRef ]
  ]
  LLVMInsertIntoBuilder: [
    ref.types.void
    [
      LLVMBuilderRef
      LLVMValueRef
    ]
  ]
  LLVMInsertIntoBuilderWithName: [
    ref.types.void
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMDisposeBuilder: [
    ref.types.void
    [ LLVMBuilderRef ]
  ]
  LLVMSetCurrentDebugLocation: [
    ref.types.void
    [
      LLVMBuilderRef
      LLVMValueRef
    ]
  ]
  LLVMGetCurrentDebugLocation: [
    LLVMValueRef
    [ LLVMBuilderRef ]
  ]
  LLVMSetInstDebugLocation: [
    ref.types.void
    [
      LLVMBuilderRef
      LLVMValueRef
    ]
  ]
  LLVMBuildRetVoid: [
    LLVMValueRef
    [ LLVMBuilderRef ]
  ]
  LLVMBuildRet: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
    ]
  ]
  LLVMBuildAggregateRet: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRefPtr
      ref.types.uint32
    ]
  ]
  LLVMBuildBr: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMBasicBlockRef
    ]
  ]
  LLVMBuildCondBr: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMBasicBlockRef
      LLVMBasicBlockRef
    ]
  ]
  LLVMBuildSwitch: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMBasicBlockRef
      ref.types.uint32
    ]
  ]
  LLVMBuildIndirectBr: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.uint32
    ]
  ]
  LLVMBuildInvoke: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRefPtr
      ref.types.uint32
      LLVMBasicBlockRef
      LLVMBasicBlockRef
      ref.types.CString
    ]
  ]
  LLVMBuildLandingPad: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMTypeRef
      LLVMValueRef
      ref.types.uint32
      ref.types.CString
    ]
  ]
  LLVMBuildResume: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
    ]
  ]
  LLVMBuildUnreachable: [
    LLVMValueRef
    [ LLVMBuilderRef ]
  ]
  LLVMAddCase: [
    ref.types.void
    [
      LLVMValueRef
      LLVMValueRef
      LLVMBasicBlockRef
    ]
  ]
  LLVMAddDestination: [
    ref.types.void
    [
      LLVMValueRef
      LLVMBasicBlockRef
    ]
  ]
  LLVMAddClause: [
    ref.types.void
    [
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMSetCleanup: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMBuildAdd: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNSWAdd: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNUWAdd: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildFAdd: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildSub: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNSWSub: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNUWSub: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildFSub: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildMul: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNSWMul: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNUWMul: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildFMul: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildUDiv: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildSDiv: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildExactSDiv: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildFDiv: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildURem: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildSRem: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildFRem: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildShl: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildLShr: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildAShr: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildAnd: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildOr: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildXor: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildBinOp: [
    LLVMValueRef
    [
      LLVMBuilderRef
      ref.types.uint32
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNeg: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNSWNeg: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNUWNeg: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildFNeg: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildNot: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildMalloc: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildArrayMalloc: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMTypeRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildAlloca: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildArrayAlloca: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMTypeRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildFree: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
    ]
  ]
  LLVMBuildLoad: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildStore: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
    ]
  ]
  LLVMBuildGEP: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRefPtr
      ref.types.uint32
      ref.types.CString
    ]
  ]
  LLVMBuildInBoundsGEP: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRefPtr
      ref.types.uint32
      ref.types.CString
    ]
  ]
  LLVMBuildStructGEP: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.uint32
      ref.types.CString
    ]
  ]
  LLVMBuildGlobalString: [
    LLVMValueRef
    [
      LLVMBuilderRef
      ref.types.CString
      ref.types.CString
    ]
  ]
  LLVMBuildGlobalStringPtr: [
    LLVMValueRef
    [
      LLVMBuilderRef
      ref.types.CString
      ref.types.CString
    ]
  ]
  LLVMGetVolatile: [
    ref.types.int32
    [ LLVMValueRef ]
  ]
  LLVMSetVolatile: [
    ref.types.void
    [
      LLVMValueRef
      ref.types.int32
    ]
  ]
  LLVMBuildTrunc: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildZExt: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildSExt: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildFPToUI: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildFPToSI: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildUIToFP: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildSIToFP: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildFPTrunc: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildFPExt: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildPtrToInt: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildIntToPtr: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildBitCast: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildAddrSpaceCast: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildZExtOrBitCast: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildSExtOrBitCast: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildTruncOrBitCast: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildCast: [
    LLVMValueRef
    [
      LLVMBuilderRef
      ref.types.uint32
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildPointerCast: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildIntCast: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildFPCast: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildICmp: [
    LLVMValueRef
    [
      LLVMBuilderRef
      ref.types.uint32
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildFCmp: [
    LLVMValueRef
    [
      LLVMBuilderRef
      ref.types.uint32
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildPhi: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildCall: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRefPtr
      ref.types.uint32
      ref.types.CString
    ]
  ]
  LLVMBuildSelect: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildVAArg: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMTypeRef
      ref.types.CString
    ]
  ]
  LLVMBuildExtractElement: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildInsertElement: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildShuffleVector: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildExtractValue: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.uint32
      ref.types.CString
    ]
  ]
  LLVMBuildInsertValue: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.uint32
      ref.types.CString
    ]
  ]
  LLVMBuildIsNull: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildIsNotNull: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildPtrDiff: [
    LLVMValueRef
    [
      LLVMBuilderRef
      LLVMValueRef
      LLVMValueRef
      ref.types.CString
    ]
  ]
  LLVMBuildFence: [
    LLVMValueRef
    [
      LLVMBuilderRef
      ref.types.uint32
      ref.types.int32
      ref.types.CString
    ]
  ]
  LLVMBuildAtomicRMW: [
    LLVMValueRef
    [
      LLVMBuilderRef
      ref.types.uint32
      LLVMValueRef
      LLVMValueRef
      ref.types.uint32
      ref.types.int32
    ]
  ]
  LLVMCreateModuleProviderForExistingModule: [
    LLVMModuleProviderRef
    [ LLVMModuleRef ]
  ]
  LLVMDisposeModuleProvider: [
    ref.types.void
    [ LLVMModuleProviderRef ]
  ]
  LLVMCreateMemoryBufferWithContentsOfFile: [
    ref.types.int32
    [
      ref.types.CString
      LLVMMemoryBufferRef
      voidPtr
    ]
  ]
  LLVMCreateMemoryBufferWithSTDIN: [
    ref.types.int32
    [
      LLVMMemoryBufferRefPtr
      voidPtr
    ]
  ]
  LLVMCreateMemoryBufferWithMemoryRange: [
    LLVMMemoryBufferRef
    [
      ref.types.CString
      ref.types.int32
      ref.types.CString
      ref.types.int32
    ]
  ]
  LLVMCreateMemoryBufferWithMemoryRangeCopy: [
    LLVMMemoryBufferRef
    [
      ref.types.CString
      ref.types.int32
      ref.types.CString
    ]
  ]
  LLVMGetBufferStart: [
    ref.types.CString
    [ LLVMMemoryBufferRef ]
  ]
  LLVMGetBufferSize: [
    ref.types.int32
    [ LLVMMemoryBufferRef ]
  ]
  LLVMDisposeMemoryBuffer: [
    ref.types.void
    [ LLVMMemoryBufferRef ]
  ]
  LLVMGetGlobalPassRegistry: [
    LLVMPassRegistryRef
    []
  ]
  LLVMCreatePassManager: [
    LLVMPassManagerRef
    []
  ]
  LLVMCreateFunctionPassManagerForModule: [
    LLVMPassManagerRef
    [ LLVMModuleRef ]
  ]
  LLVMCreateFunctionPassManager: [
    LLVMPassManagerRef
    [ LLVMModuleProviderRef ]
  ]
  LLVMRunPassManager: [
    ref.types.int32
    [
      LLVMPassManagerRef
      LLVMModuleRef
    ]
  ]
  LLVMInitializeFunctionPassManager: [
    ref.types.int32
    [ LLVMPassManagerRef ]
  ]
  LLVMRunFunctionPassManager: [
    ref.types.int32
    [
      LLVMPassManagerRef
      LLVMValueRef
    ]
  ]
  LLVMFinalizeFunctionPassManager: [
    ref.types.int32
    [ LLVMPassManagerRef ]
  ]
  LLVMDisposePassManager: [
    ref.types.void
    [ LLVMPassManagerRef ]
  ]
  LLVMStartMultithreaded: [
    ref.types.int32
    []
  ]
  LLVMStopMultithreaded: [
    ref.types.void
    []
  ]
  LLVMIsMultithreaded: [
    ref.types.int32
    []
  ])
