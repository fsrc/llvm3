# Types
_   = require('lodash')
lib = require('./bindings')


module.exports =
  int    : lib.func.LLVMInt64Type
  num    : lib.func.LLVMFloatType
  struct : lib.func.LLVMStructType
  array  : lib.func.LLVMArrayType
  ptr    : lib.func.LLVMPtrToInt
  vect   : lib.func.LLVMVectorType

module.exports.fun = (ret, args) ->
  retType = ret()
  argTypes = _.map(args, (arg) -> arg())
  refArray = lib.LLVMTypeRefArray(argTypes)
  lib.func.LLVMFunctionType(
    retType,
    refArray,
    args.length,
    false)
