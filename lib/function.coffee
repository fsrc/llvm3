# Function
lib = require("./bindings")
types = require("./types")
block = require("./block")

module.exports = (module, name, returnType, argumentTypes) ->
  do (name) ->
    type = types.fun(returnType, argumentTypes)
    state =
      module : module
      name : name
      ptr : lib.func.LLVMAddFunction(module.ptr(), name, type)

    wrapper =
      ptr : () -> state.ptr
      addBlock : (label, cb) ->
        cb(block(wrapper, label))
      getParam : (index) ->
        lib.func.LLVMGetParam(state.ptr, index)

    wrapper

