*&---------------------------------------------------------------------*
*& Report zot_08_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_calculator.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE p DECIMALS 2 OBLIGATORY,
              p_val2 TYPE p DECIMALS 2 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS: r_topla RADIOBUTTON GROUP grp1,
              r_cikar RADIOBUTTON GROUP grp1,
              r_carp  RADIOBUTTON GROUP grp1,
              r_bol   RADIOBUTTON GROUP grp1.

SELECTION-SCREEN END OF BLOCK b2.

DATA: gv_res TYPE p DECIMALS 5 .

START-OF-SELECTION.

  IF r_topla EQ abap_true.

    gv_Res = p_val1 + p_val2.

    cl_demo_output=>write( | { p_val1 } + { p_val2 } = { gv_res } | ).

  ELSEIF r_cikar EQ abap_true.

    gv_res = p_val1 - p_val2.

    cl_demo_output=>write( | { p_val1 } - { p_val2 } = { gv_res } | ).

  ELSEIF r_carp EQ abap_true.

    gv_Res = p_val1 * p_val2.

    cl_demo_output=>write( | { p_val1 } * { p_val2 } = { gv_res } | ).

  ELSEIF r_bol EQ abap_true.

    IF p_val2 EQ 0.

      TRY.

          gv_Res = p_val1 / p_val2.

        CATCH cx_sy_zerodivide.

          cl_demo_output=>write( | Sıfıra bölünemez! | ).

      ENDTRY.

    ELSE.

      gv_res = p_val1 / p_val2.

      cl_demo_output=>write( | { p_val1 } / { p_val2 } = { gv_res } | ).

    ENDIF.

  ENDIF.

  cl_demo_output=>display( ).
