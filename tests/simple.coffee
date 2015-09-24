llvm = require("../index")

llvm.module('mymod')
  .addFunction('myfun', llvm.types.int, [llvm.types.int], (myfun) ->
    myfun.addBlock('entry', (blk) ->
      blk.add(myfun.getParam(0), myfun.getParam(0), 'tmp')))
  .dump()
console.log("; End")
