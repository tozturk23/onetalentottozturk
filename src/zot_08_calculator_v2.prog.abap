*&---------------------------------------------------------------------*
*& Report zot_08_calculator_v2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_calculator_v2.

PARAMETERS: p_val1 TYPE i,
            p_val2 TYPE i,
            p_op   TYPE c OBLIGATORY.

DATA: gv_res TYPE p DECIMALS 5 .

START-OF-SELECTION.

  cl_demo_output=>display( COND #( WHEN p_op = '+' THEN |Sonuç = { p_val1 + p_val2 }|
                                   WHEN p_op = '-' THEN |Sonuç = { p_val1 - p_val2 }|
                                   WHEN p_op = '*' THEN |Sonuç = { p_val1 * p_val2 }|
                                   WHEN p_op = '/' AND p_val2 EQ 0 THEN 'HATA'
                                   WHEN p_op = '/' THEN |Sonuç = { p_val1 / p_val2 }| ) ) .
