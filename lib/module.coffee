lib = require("./bindings")
func = require("./function")

module.exports = (name) ->
  do (name) ->
    state =
      name : name
      ptr : lib.LLVMModuleCreateWithName(name)

    wrapper =
      dump : () ->
        lib.LLVMDumpModule(state.ptr)
        wrapper

      writeBitcodeToFile : (path) ->
        lib.LLVMWriteBitcodeToFile(this.ptr, path)
        wrapper

      addFunction : (name, type, cb) ->
        cb(func(state.ptr, name, type))
        wrapper

    wrapper

