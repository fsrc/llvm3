module.exports =
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