*&---------------------------------------------------------------------*
*& Report ZOT_08_FIBONACCI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_fibonacci.
*
PARAMETERS: p_num  TYPE i OBLIGATORY,
            p_krlm TYPE i OBLIGATORY.
*
DATA: gv_loop TYPE i,
      gv_num1 TYPE i,
      gv_num2 TYPE i VALUE 1,
      gv_res  TYPE i.

START-OF-SELECTION.

  IF p_num > 10000.

    MESSAGE: '0-10000 arası sayı giriniz!' TYPE 'I'.

  ELSE.

    WHILE gv_res LE p_num .

      CLEAR: gv_loop.

      WHILE gv_loop < p_krlm.

        gv_res = gv_num1 + gv_num2.
        gv_num1 = gv_num2.
        gv_num2 = gv_res.

        IF gv_res > p_num.

          EXIT.

        ENDIF.

        WRITE: gv_res.

        gv_loop += 1.

      ENDWHILE.

      NEW-LINE.

    ENDWHILE.

  ENDIF.
