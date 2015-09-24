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

    lib.func.LLVMPositionBuilderAtEnd(state.builder, state.ptr)


    wrapper =
      ptr : () -> state.ptr
      ret : (value) -> lib.func.LLVMBuildRet(state.builder, value)
      br  : (block) -> lib.func.LLVMBuildBr(state.builder, block.ptr())
      condBr : (ifblk, thenblk, elseblk) ->
        lib.func.LLVMBuildCondBr(state.builder, ifblk.ptr(), thenblk.ptr(), elseblk.ptr())

      # Exception handled code?
      #invoke : () ->

      indirectBr : () ->
        # LLVMAddDestination (subpart of indirectbr)

      switch : () ->
        # LLVMAddCase (subpart of switch)

      # Arithmetic
      add : (a, b, tmpName) -> lib.func.LLVMBuildAdd(state.builder, a, b, tmpName)
      sub : (a, b, tmpName) -> lib.func.LLVMBuildSub(state.builder, a, b, tmpName)
      mul : (a, b, tmpName) -> lib.func.LLVMBuildMul(state.builder, a, b, tmpName)
      div : (a, b, tmpName) -> lib.func.LLVMBuildSDiv(state.builder, a, b, tmpName)
      rem : (a, b, tmpName) -> lib.func.LLVMBuildSRem(state.builder, a, b, tmpName)
      shl : (a, b, tmpName) -> lib.func.LLVMBuildShl(state.builder, a, b, tmpName)
      shr : (a, b, tmpName) -> lib.func.LLVMBuildAShr(state.builder, a, b, tmpName)
      and : (a, b, tmpName) -> lib.func.LLVMBuildAnd(state.builder, a, b, tmpName)
      or  : (a, b, tmpName) -> lib.func.LLVMBuildOr(state.builder, a, b, tmpName)
      xor : (a, b, tmpName) -> lib.func.LLVMBuildXor(state.builder, a, b, tmpName)

      neg : (a, tmpName) -> lib.func.LLVMBuildNeg(state.builder, a, tmpName)
      not : (a, tmpName) -> lib.func.LLVMBuildNot(state.builder, a, tmpName)

      # Memory
      malloc : (type, tmpName) -> lib.func.LLVMBuildMalloc(state.builder, type, tmpName)
      arrayMalloc : (type, length, tmpName) -> lib.func.LLVMBuildMalloc(state.builder, type, length, tmpName)
      free : (addr) -> lib.func.LLVMBuildFree(state.builder, addr)
      load : (type, addr, tmpName) -> lib.func.LLVMBuildLoad(state.builder, addr, tmpName)
      store : (value, addr) -> lib.func.LLVMBuildStore(state.builder, value, addr)
      GEP : () ->
      inBoundsGEP : () ->
      structGEP : () ->
      globalString : (str, name) -> lib.func.LLVMBuildGlobalString(state.builder, str, name)
      globalStringPtr : (str, name) -> lib.func.LLVMBuildGlobalStringPtr(state.builder, str, name)
      getVolatile : (addr) -> lib.func.LLVMGetVolatile(addr)
      setVolatile : (addr, value) -> lib.func.LLVMSetVolatile(addr, value)

      # Casts
      trunc : (value, type, tmpName) -> lib.func.LLVMBuildTrunc(state.builder, value, type, tmpName)

      # Comparisons
      iCmp : (intPredicate, a, b, tmpName) ->
        lib.func.LLVMBuildICmp(state.builder, intPredicate, a, b, tmpName)
      fCmp : (intPredicate, a, b, tmpName) ->
        lib.func.LLVMBuildFCmp(state.builder, intPredicate, a, b, tmpName)

      # Miscellaneous instructions
      phi : () ->
      call : (fn, args, name) ->
        lib.func.LLVMBuildCall(state.builder, fn.ptr(), arrayToArgRefArray(args), args.length, name)
      select : (ifblk, thenblk, elseblk, name) ->
        lib.func.LLVMBuildSelect(state.builder, fn.ptr(), ifblk.ptr(), thenblk.ptr(), elseblk.ptr(), name)

      extractElement : (vector, index, name) ->
        lib.func.LLVMBuildExtractElement(state.builder, vector, index, name)
      insertElement : (vector, value, index, name) ->
        lib.func.LLVMBuildInsertElement(state.builder, vector, value, index, name)

      isNull : () ->
      isNotNull : () ->

    wrapper

