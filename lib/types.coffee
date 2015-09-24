_   = require('lodash')
lib = require('./bindings')


module.exports =
  int : lib.func.LLVMInt64Type
  num : lib.func.LLVMFloatType
  struct : lib.func.LLVMStructType
  array :  lib.func.LLVMArrayType
  ptr : lib.func.LLVMPtrToInt
  vect : lib.func.LLVMVectorType

module.exports.fun = (ret, args) ->
  lib.func.LLVMFunctionType(ret(), lib.arrayToRefArray(_.map(args, (arg) -> arg())), args.length, false)
