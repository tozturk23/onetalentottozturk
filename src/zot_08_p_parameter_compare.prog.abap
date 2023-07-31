*&---------------------------------------------------------------------*
*& Report ZOT_08_P_PARAMETER_COMPARE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_parameter_compare.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_p1 TYPE char6 OBLIGATORY,
              p_p2 TYPE char6 OBLIGATORY,
              p_p3 TYPE char6 OBLIGATORY,
              p_p4 TYPE char6 OBLIGATORY,
              p_p5 TYPE char6 OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

TYPES: BEGIN OF gty_table,
  col1 TYPE char1,
  col2 TYPE char1,
  col3 TYPE char1,
  col4 TYPE char1,
  col5 TYPE char1,
  col6 TYPE char1,
END OF gty_table.

DATA: gt_table TYPE TABLE OF gty_table,
      gs_table TYPE gty_table.

START-OF-SELECTION.

gt_table = VALUE #( BASE gt_table ( col1 = p_p1+0(1)
                                    col2 = p_p1+1(1)
                                    col3 = p_p1+2(1)
                                    col4 = p_p1+3(1)
                                    col5 = p_p1+4(1)
                                    col6 = p_p1+5(1) ) ).

gt_table = VALUE #( BASE gt_table ( col1 = p_p2+0(1)
                                    col2 = p_p2+1(1)
                                    col3 = p_p2+2(1)
                                    col4 = p_p2+3(1)
                                    col5 = p_p2+4(1)
                                    col6 = p_p2+5(1) ) ).

gt_table = VALUE #( BASE gt_table ( col1 = p_p3+0(1)
                                    col2 = p_p3+1(1)
                                    col3 = p_p3+2(1)
                                    col4 = p_p3+3(1)
                                    col5 = p_p3+4(1)
                                    col6 = p_p3+5(1) ) ).

gt_table = VALUE #( BASE gt_table ( col1 = p_p4+0(1)
                                    col2 = p_p4+1(1)
                                    col3 = p_p4+2(1)
                                    col4 = p_p4+3(1)
                                    col5 = p_p4+4(1)
                                    col6 = p_p4+5(1) ) ).

gt_table = VALUE #( BASE gt_table ( col1 = p_p5+0(1)
                                    col2 = p_p5+1(1)
                                    col3 = p_p5+2(1)
                                    col4 = p_p5+3(1)
                                    col5 = p_p5+4(1)
                                    col6 = p_p5+5(1) ) ).

READ TABLE gt_table INTO gs_table INDEX 1.

LOOP AT gt_table INTO gs_table.

ENDLOOP.

BREAK ottozturk.
