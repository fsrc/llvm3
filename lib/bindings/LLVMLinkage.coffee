module.exports =
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
