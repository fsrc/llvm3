# Block
lib = require("./bindings")

module.exports = (func, label) ->
  do (func, label) ->
    console.dir func
    state =
      label : label
      func : func
      ptr : lib.func.LLVMAppendBasicBlock(func.ptr(), label)
      builder : lib.func.LLVMCreateBuilder()
      vars : {}

    lib.func.LLVMPositionBuilderAtEnd(state.builder, state.ptr)

    funABVarName = (name, a, b, variableName) ->
      fullName = "LLVMBuild" + name
      variable = lib.func[fullName](state.builder, a, b, variableName)
      state.vars[variableName] = variable
      wrapper


    wrapper =
      var : (name) -> state.vars[name]
      ptr : () -> state.ptr
      ret : (value) -> lib.func.LLVMBuildRet(state.builder, value) ; wrapper
      br  : (block) -> lib.func.LLVMBuildBr(state.builder, block.ptr()) ; wrapper
      condBr : (ifblk, thenblk, elseblk) ->
        lib.func.LLVMBuildCondBr(state.builder, ifblk.ptr(), thenblk.ptr(), elseblk.ptr())
        wrapper

      # Exception handled code?
      #invoke : () ->

      indirectBr : () ->
        # LLVMAddDestination (subpart of indirectbr)

      switch : () ->
        # LLVMAddCase (subpart of switch)

      # Arithmetic
      add : (a, b, tmpName) -> funABVarName('Add', a, b, tmpName)
      add : (a, b, tmpName) -> funABVarName('Add', a, b, tmpName)
      sub : (a, b, tmpName) -> funABVarName('Sub', a, b, tmpName)
      mul : (a, b, tmpName) -> funABVarName('Mul', a, b, tmpName)
      div : (a, b, tmpName) -> funABVarName('SDiv', a, b, tmpName)
      rem : (a, b, tmpName) -> funABVarName('SRem', a, b, tmpName)
      shl : (a, b, tmpName) -> funABVarName('Shl', a, b, tmpName)
      shr : (a, b, tmpName) -> funABVarName('AShr', a, b, tmpName)
      and : (a, b, tmpName) -> funABVarName('And', a, b, tmpName)
      or  : (a, b, tmpName) -> funABVarName('Or', a, b, tmpName)
      xor : (a, b, tmpName) -> funABVarName('Xor', a, b, tmpName)

      neg : (a, tmpName) -> lib.func.LLVMBuildNeg(state.builder, a, tmpName) ; wrapper
      not : (a, tmpName) -> lib.func.LLVMBuildNot(state.builder, a, tmpName) ; wrapper

      # Memory
      malloc : (type, tmpName) -> lib.func.LLVMBuildMalloc(state.builder, type, tmpName) ; wrapper
      arrayMalloc : (type, length, tmpName) -> lib.func.LLVMBuildMalloc(state.builder, type, length, tmpName) ; wrapper
      free : (addr) -> lib.func.LLVMBuildFree(state.builder, addr) ; wrapper
      load : (type, addr, tmpName) -> lib.func.LLVMBuildLoad(state.builder, addr, tmpName) ; wrapper
      store : (value, addr) -> lib.func.LLVMBuildStore(state.builder, value, addr) ; wrapper
      GEP : () ->
      inBoundsGEP : () ->
      structGEP : () ->
      globalString : (str, name) -> lib.func.LLVMBuildGlobalString(state.builder, str, name) ; wrapper
      globalStringPtr : (str, name) -> lib.func.LLVMBuildGlobalStringPtr(state.builder, str, name) ; wrapper
      getVolatile : (addr) -> lib.func.LLVMGetVolatile(addr) ; wrapper
      setVolatile : (addr, value) -> lib.func.LLVMSetVolatile(addr, value) ; wrapper

      # Casts
      trunc : (value, type, tmpName) -> lib.func.LLVMBuildTrunc(state.builder, value, type, tmpName) ; wrapper

      # Comparisons
      iCmp : (intPredicate, a, b, tmpName) ->
        lib.func.LLVMBuildICmp(state.builder, intPredicate, a, b, tmpName)
        wrapper
      fCmp : (intPredicate, a, b, tmpName) ->
        lib.func.LLVMBuildFCmp(state.builder, intPredicate, a, b, tmpName)
        wrapper

      # Miscellaneous instructions
      phi : () ->
      call : (fn, args, name) ->
        lib.func.LLVMBuildCall(state.builder, fn.ptr(), arrayToArgRefArray(args), args.length, name)
        wrapper
      select : (ifblk, thenblk, elseblk, name) ->
        lib.func.LLVMBuildSelect(state.builder, fn.ptr(), ifblk.ptr(), thenblk.ptr(), elseblk.ptr(), name)
        wrapper

      extractElement : (vector, index, name) ->
        lib.func.LLVMBuildExtractElement(state.builder, vector, index, name)
        wrapper
      insertElement : (vector, value, index, name) ->
        lib.func.LLVMBuildInsertElement(state.builder, vector, value, index, name)
        wrapper

      isNull : () ->
      isNotNull : () ->

    wrapper

