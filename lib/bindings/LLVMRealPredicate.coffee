module.exports =
  LLVMRealPredicateFalse : 0   #< Always false (always folded)
  LLVMRealOEQ            : 1   #< True if ordered and equal
  LLVMRealOGT            : 2   #< True if ordered and greater than
  LLVMRealOGE            : 3   #< True if ordered and greater than or equal
  LLVMRealOLT            : 4   #< True if ordered and less than
  LLVMRealOLE            : 5   #< True if ordered and less than or equal
  LLVMRealONE            : 6   #< True if ordered and operands are unequal
  LLVMRealORD            : 7   #< True if ordered (no nans)
  LLVMRealUNO            : 8   #< True if unordered: isnan(X) | isnan(Y)
  LLVMRealUEQ            : 9   #< True if unordered or equal
  LLVMRealUGT            : 10   #< True if unordered or greater than
  LLVMRealUGE            : 11   #< True if unordered, greater than, or equal
  LLVMRealULT            : 12   #< True if unordered or less than
  LLVMRealULE            : 13   #< True if unordered, less than, or equal
  LLVMRealUNE            : 14   #< True if unordered or not equal
  LLVMRealPredicateTrue  : 15   #< Always true (always folded)
  '0'  : 'LLVMRealPredicateFalse'
  '1'  : 'LLVMRealOEQ'
  '2'  : 'LLVMRealOGT'
  '3'  : 'LLVMRealOGE'
  '4'  : 'LLVMRealOLT'
  '5'  : 'LLVMRealOLE'
  '6'  : 'LLVMRealONE'
  '7'  : 'LLVMRealORD'
  '8'  : 'LLVMRealUNO'
  '9'  : 'LLVMRealUEQ'
  '10' : 'LLVMRealUGT'
  '11' : 'LLVMRealUGE'
  '12' : 'LLVMRealULT'
  '13' : 'LLVMRealULE'
  '14' : 'LLVMRealUNE'
  '15' : 'LLVMRealPredicateTrue'
