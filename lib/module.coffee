# Module
lib = require("./bindings")
func = require("./function")

module.exports = (name) ->
  do (name) ->
    state =
      ptr : lib.func.LLVMModuleCreateWithName(name)
      name : name

    wrapper =
      ptr : () -> state.ptr
      validate : () ->
        wrapper
      dump : () ->
        lib.func.LLVMDumpModule(state.ptr)
        wrapper

      writeBitcodeToFile : (path) ->
        lib.func.LLVMWriteBitcodeToFile(state.ptr, path)
        wrapper

      addFunction : (name, returnType, argumentTypes, cb) ->
        cb(func(wrapper, name, returnType, argumentTypes))
        wrapper

    wrapper

