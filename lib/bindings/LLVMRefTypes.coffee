_         = require('lodash')
FFI       = require('ffi')
ref       = require('ref')
refArray  = require('ref-array')

arrayToRefArray = (type, arr) ->
  _.reduce(arr, (ref, itm, index) ->
    ref[index] = itm
    ref
  , new type(arr.length))

exports.voidPtr = voidPtr = ref.refType(ref.types.void)

exports.LLVMPassRegistryRef      = voidPtr
exports.LLVMPassRegistryRefPtr   = ref.refType(exports.LLVMPassRegistryRef)
exports.LLVMFatalErrorHandler    = FFI.Function(ref.types.void, [ ref.types.CString ])
exports.LLVMFatalErrorHandlerPtr = ref.refType(exports.LLVMFatalErrorHandler)
exports.LLVMContextRef           = voidPtr
exports.LLVMContextRefPtr        = ref.refType(exports.LLVMContextRef)
#exports.LLVMDiagnosticHandler    = FFI.Function(ref.types.void, [ voidPtr voidPtr ])
#exports.LLVMDiagnosticHandlerPtr = ref.refType(exports.LLVMDiagnosticHandler)
#exports.LLVMYieldCallback        = FFI.Function(ref.types.void, [ voidPtr voidPtr ])
#exports.LLVMYieldCallbackPtr     = ref.refType(exports.LLVMYieldCallback)
exports.LLVMDiagnosticInfoRef    = voidPtr
exports.LLVMDiagnosticInfoRefPtr = ref.refType(exports.LLVMDiagnosticInfoRef)
exports.LLVMModuleRef            = voidPtr
exports.LLVMModuleRefPtr         = ref.refType(exports.LLVMModuleRef)
exports.LLVMTypeRef              = voidPtr
exports.LLVMTypeRefPtr           = refArray(exports.LLVMTypeRef)
exports.LLVMTypeRefArray         = _.partial(arrayToRefArray, exports.LLVMTypeRefPtr)
exports.LLVMValueRef             = voidPtr
exports.LLVMValueRefPtr          = ref.refType(exports.LLVMValueRef)
exports.LLVMUseRef               = voidPtr
exports.LLVMUseRefPtr            = ref.refType(exports.LLVMUseRef)
exports.LLVMBasicBlockRef        = voidPtr
exports.LLVMBasicBlockRefPtr     = ref.refType(exports.LLVMBasicBlockRef)
exports.LLVMBuilderRef           = voidPtr
exports.LLVMBuilderRefPtr        = ref.refType(exports.LLVMBuilderRef)
exports.LLVMModuleProviderRef    = voidPtr
exports.LLVMModuleProviderRefPtr = ref.refType(exports.LLVMModuleProviderRef)
exports.LLVMMemoryBufferRef      = voidPtr
exports.LLVMMemoryBufferRefPtr   = ref.refType(exports.LLVMMemoryBufferRef)
exports.LLVMPassManagerRef       = voidPtr
exports.LLVMPassManagerRefPtr    = ref.refType(exports.LLVMPassManagerRef)
