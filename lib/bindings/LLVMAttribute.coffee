module.exports =
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
