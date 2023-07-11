CLASS zcl_ot_08_math_operations DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS calculate_result
      IMPORTING iv_num1      TYPE i
                iv_num2      TYPE i
                iv_operation TYPE c
      EXPORTING ev_result    TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ot_08_math_operations IMPLEMENTATION.

  METHOD  calculate_result.

    CASE iv_operation.
      WHEN '+'.
        ev_result = iv_num1 + iv_num2.
      WHEN '-'.
        ev_result = iv_num1 - iv_num2.
      WHEN '*'.
        ev_result = iv_num1 * iv_num2.
      WHEN '/'.
        ev_result = iv_num1 / iv_num2.
    ENDCASE.


  ENDMETHOD.

ENDCLASS.
