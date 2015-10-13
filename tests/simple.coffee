llvm = require("../index")

llvm.module('mymod')
  .addFunction('myfun', llvm.types.int, [llvm.types.int, llvm.types.int], (myfun) ->
    myfun.addBlock('entry', (blk) ->
      blk
        .add(myfun.getParam(0), myfun.getParam(1), 'tmp')
        .sub(blk.var('tmp'), myfun.getParam(0), 't2')
        .ret(blk.var('t2'))))
  .dump()
