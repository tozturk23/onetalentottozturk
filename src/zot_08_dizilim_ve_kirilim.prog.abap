*&---------------------------------------------------------------------*
*& Report ZOT_08_DIZILIM_VE_KIRILIM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_08_DIZILIM_VE_KIRILIM.

PARAMETERS: p_num1 TYPE numc3 OBLIGATORY,
            p_num2 TYPE numc1 OBLIGATORY.

DATA: gv_num  TYPE i,
      gv_loop TYPE i.

START-OF-SELECTION.

  IF p_num1 > 100.

    COMMIT WORK AND WAIT.

    MESSAGE: 'Lütfen 0-100 arası bir sayı giriniz!' TYPE 'E'.

    ROLLBACK WORK.

  ENDIF.

  IF p_num2 = 0.

    TRY.

      CATCH cx_sy_zerodivide.

    ENDTRY.

  ENDIF.

    DO p_num1 TIMES.

    gv_num = gv_num + 1.

    IF gv_loop < p_num2.

    WRITE: gv_num.

    ELSE.

    WRITE: / gv_num.

    CLEAR: gv_loop.

*    gv_loop = 1.

    ENDIF.

    gv_loop = gv_loop + 1.

    ENDDO.
*
*    WHILE gv_num LE p_num1.
