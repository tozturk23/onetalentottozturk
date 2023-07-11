FUNCTION ZOT_08_DO_MATH_OPS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_NUM1) TYPE  I
*"     VALUE(IV_NUM2) TYPE  I
*"     VALUE(IV_OPERATION) TYPE  C
*"  EXPORTING
*"     REFERENCE(EV_RESULT) TYPE  I
*"  RAISING
*"      CX_SY_ZERODIVIDE
*"     RESUMABLE(CX_SY_ASSIGN_CAST_ERROR)
*"----------------------------------------------------------------------
case iv_operation.
  when '+'.
   ev_result = iv_num1 + iv_num2.
   WHEN '-'.
   ev_result = iv_num1 - iv_num2.
   WHEN '*'.
   ev_result = iv_num1 * iv_num2.
   WHEN '/'.
   ev_result = iv_num1 / iv_num2.
endcase.






ENDFUNCTION.
