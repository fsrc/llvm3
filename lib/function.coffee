lib = require("./bindings")

module.exports = (module, name, type) ->
  do (name) ->
    state =
      name : name
      type : type
      ptr : lib.LLVMAddFunction(module, name, type)

    wrapper = {}

    wrapper


