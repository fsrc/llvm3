module.exports =
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
