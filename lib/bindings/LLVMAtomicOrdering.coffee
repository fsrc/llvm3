module.exports =
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
