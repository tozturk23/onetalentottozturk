*&---------------------------------------------------------------------*
*& Report ZOT_08_P_DENEME01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_deneme01.

TYPES: BEGIN OF gty_collect,
         carrid TYPE s_carr_id,
         price  TYPE s_price,
       END OF gty_collect.


DATA: gt_table   TYPE TABLE OF gty_collect,
      gt_collect TYPE TABLE OF gty_collect,
      gs_table   TYPE gty_collect.

START-OF-SELECTION.

  SELECT carrid,
         price FROM sflight
    INTO TABLE @gt_table.

  LOOP AT gt_table INTO gs_table.

    COLLECT gs_table INTO gt_collect.

  ENDLOOP.

  BREAK-POINT.
