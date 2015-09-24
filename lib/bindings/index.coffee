_   = require('lodash')
FFI = require('ffi')

exports.LLVMAtomicOrdering = require('./LLVMAtomicOrdering')
exports.LLVMAtomicRMwBinOp = require('./LLVMAtomicRMwBinOp')
exports.LLVMAttribute = require('./LLVMAttribute')
exports.LLVMDiagnosticSeverity = require('./LLVMDiagnosticSeverity')
exports.LLVMDLLStorageClass = require('./LLVMDLLStorageClass')
exports.LLVMIntPredicate = require('./LLVMIntPredicate')
exports.LLVMLinkage = require('./LLVMLinkage')
exports.LLVMOpcode = require('./LLVMOpcode')
exports.LLVMRealPredicate = require('./LLVMRealPredicate')
exports.LLVMThreadLocalMode = require('./LLVMThreadLocalMode')
exports.LLVMTypeKind = require('./LLVMTypeKind')
exports.LLVMVisibility = require('./LLVMVisibility')

_.assign(module.exports, require('./LLVMRefTypes'))

exports.func = new (FFI.Library)('libLLVM-3.6', require('./LLVMFunctions'))

