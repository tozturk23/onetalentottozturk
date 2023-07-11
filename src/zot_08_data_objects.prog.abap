*&---------------------------------------------------------------------*
*& Report zot_08_data_objects
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_data_objects.

*DATA: gv_ogr_ad(10) TYPE c,      "Predefined
*      gv_ogr_soyad  TYPE char12, "Data Element
*      gv_dogum_yili TYPE sy-datum.
*
*gv_ogr_ad        = 'Taha'.
*gv_ogr_soyad     = 'Öztürk'.
*gv_dogum_yili    = '20030307'.
*
*cl_demo_output=>write( gv_ogr_ad ).
*cl_demo_output=>write( gv_ogr_soyad ).
*cl_demo_output=>write( gv_dogum_yili ).
*
*TYPES: gty_char TYPE c LENGTH 50.
*
*DATA: gv_char TYPE gty_char.
*
*DATA: gv_langu TYPE sy-langu.
*
*gv_langu = sy-langu.
*
*IF gv_langu = 'T'.
*
*  cl_demo_output=>write('Merhaba Dünya').
*
*ELSEIF gv_langu = 'E'.
*
*  cl_demo_output=>write('Hello World').
*
*ELSE.
*
*  cl_demo_output=>write('Başka dil bilmiyorum').
*
*ENDIF.
*
*CASE gv_langu.
*
*  WHEN 'T'.
*
*    cl_demo_output=>write('Merhaba Dünya').
*
*  WHEN 'E'.
*
*    cl_demo_output=>write('Hello World').
*
*ENDCASE.
*
*DATA: gv_text TYPE char12.
*
*gv_text = 'Hello World'.
*
*DATA(lv_num) = strlen( gv_text ).
*
*DO lv_num TIMES.
*
*  cl_demo_output=>write( gv_text ).
*
*ENDDO.
*
*WHILE lv_num > 0.
*
*  cl_demo_output=>write( sy-index ).
*
*  lv_num = lv_num - 1.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
DATA: lv_num1 TYPE i VALUE 18,
      lv_num2 TYPE i VALUE 2,
      lv_op   TYPE c VALUE '/'.
*      lv_result TYPE i.

*DATA(lv_toplama) = lv_num1 + lv_num2.
*DATA(lv_cikarma) = lv_num1 - lv_num2.
*DATA(lv_carpma)  = lv_num1 * lv_num2.
*DATA(lv_bolme)   = lv_num1 / lv_num2.
*
*cl_demo_output=>write( |{ lv_num1 } + { lv_num2 } = { lv_toplama }| ).
*cl_demo_output=>write( |{ lv_num1 } - { lv_num2 } = { lv_cikarma }| ).
*cl_demo_output=>write( |{ lv_num1 } * { lv_num2 } = { lv_carpma }| ).
*cl_demo_output=>write( |{ lv_num1 } / { lv_num2 } = { lv_bolme }| ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*CALL FUNCTION 'ZOT_08_DO_MATH_OPS'
*  EXPORTING
*    iv_num1      = lv_num1
*    iv_num2      = lv_num2
*    iv_operation = lv_op
*  IMPORTING
*    ev_result    = lv_result.
**                   EXCEPTIONS
**                   cx_sy_zerodivide = 1.
**                  cx_sy_assign_cast_error.
*cl_demo_output=>write( |{ lv_num1 } { lv_op } { lv_num2 } = { lv_result }| ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*DATA(lo_math) = NEW zcl_ot_08_math_operations( ).
*
*lo_math->calculate_result(
*  EXPORTING
*    iv_num1      = lv_num1
*    iv_num2      = lv_num2
*    iv_operation = lv_op
*  IMPORTING
*    ev_result    = DATA(lv_result)
*).
*
*cl_demo_output=>write( |{ lv_num1 } { lv_op } { lv_num2 } = { lv_result }| ).

*TYPES: gty_tip TYPE c LENGTH 12.
*
*TYPES: BEGIN OF gty_komplex,
*         alan1 TYPE c LENGTH 10,
*         alan2 TYPE c LENGTH 12,
*         alan3 TYPE i,
*       END OF gty_komplex.
*
*TYPES: BEGIN OF gty_student,
*         name  TYPE c LENGTH 10,
*         age   TYPE i,
*         id    TYPE c LENGTH 10,
*         bolum TYPE c LENGTH 20,
*       END OF gty_student.
*
*DATA: gv_alan1   TYPE gty_tip,
*      gs_komplex TYPE gty_komplex,
*      gt_komplex TYPE TABLE OF gty_komplex,
*      gv_alan2   TYPE gty_komplex-alan2.
*
*gv_alan1 = 'Hello World'.
*
*gs_komplex-alan1 = 'One'.
*gs_komplex-alan2 = 'Talent'.
*gs_komplex-alan3 = '2023'.
*
*gt_komplex = VALUE #( ( alan1 = 'Taha'
*                        alan2 = 'Öztürk'
*                        alan3 = 20 )
*
*                      ( alan1 = 'Öner'
*                        alan2 = 'Öztürk'
*                        alan3 = 30 ) ).
*
*APPEND VALUE #(  alan1 = 'Ahmet'
*                  alan2 = 'Ezdesir'
*                  alan3 = 21 ) TO gt_komplex.
*
*APPEND gs_komplex TO gt_komplex.
*
*cl_demo_output=>write( gt_komplex ).

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE i OBLIGATORY,
              p_val2 TYPE i OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS: r_topla RADIOBUTTON GROUP grp1,
              r_cikar RADIOBUTTON GROUP grp1,
              r_carp  RADIOBUTTON GROUP grp1,
              r_bol   RADIOBUTTON GROUP grp1.

SELECTION-SCREEN END OF BLOCK b2.

DATA: gv_res TYPE p DECIMALS 2.

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

    TRY.

        gv_Res = p_val1 / p_val2.

      CATCH cx_sy_zerodivide.

    cl_demo_output=>write( | { p_val1 } / { p_val2 } = { gv_res } | ).

    ENDTRY.


  ENDIF.

  cl_demo_output=>display( ).
