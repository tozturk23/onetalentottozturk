*&---------------------------------------------------------------------*
*& Report ZOT_08_P_INTERNAL_TABLES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_internal_tables.

TYPES: BEGIN OF gty_table,
         matnr TYPE matnr,
         maktx TYPE maktx,
         matkl TYPE matkl,
         menge TYPE menge_d,
         meins TYPE meins,
       END OF gty_table.

TYPES: BEGIN OF gty_sum,
         matkl TYPE matkl,
         menge TYPE menge_d,
       END OF gty_sum.

DATA: gt_material TYPE TABLE OF zot_00_t_materia,
      gs_material TYPE zot_00_t_materia,
      gt_table    TYPE TABLE OF gty_Table,
      gs_table    TYPE gty_table,
      gt_new      TYPE TABLE OF gty_table,
      gs_new      TYPE gty_table,
      gt_sum      TYPE TABLE OF gty_sum,
      gs_sum      TYPE gty_sum.

START-OF-SELECTION.

  SELECT * FROM zot_00_t_materia
    INTO TABLE gt_material.

  SORT gt_material BY matnr DESCENDING.

  READ TABLE gt_material INTO gs_material INDEX 1.

  gt_table = VALUE #( BASE gt_table ( matnr = '000000000000000011'
                                      maktx = 'Ana kart'
                                      matkl = 'C'
                                      menge = 16
                                      meins = 'ST') ).

  gt_table = VALUE #( BASE gt_table ( matnr = '000000000000000012'
                                      maktx = 'Ekran Kartı'
                                      matkl = 'C'
                                      menge = 4
                                      meins = 'ST') ).

  gt_table = VALUE #( BASE gt_table ( matnr = '000000000000000013'
                                      maktx = 'Sıvı soğutma'
                                      matkl = 'C'
                                      menge = 28
                                      meins = 'ST') ).

  gt_table = VALUE #( BASE gt_table ( matnr = '000000000000000014'
                                      maktx = 'İşlemci'
                                      matkl = 'C'
                                      menge = 13
                                      meins = 'ST') ).

  gt_table = VALUE #( BASE gt_table ( matnr = '000000000000000015'
                                      maktx = 'Stok Fan'
                                      matkl = 'C'
                                      menge = 50
                                      meins = 'ST') ).

  LOOP AT gt_material INTO gs_material.

    READ TABLE gt_table INTO gs_table WITH KEY meins = gs_material-meins.

    IF sy-subrc = 0.

      gs_material-menge += 10.

      MODIFY gt_material FROM gs_material.

    ENDIF.

  ENDLOOP.

  MOVE-CORRESPONDING gt_material TO gt_new.

  SORT gt_new BY matnr ASCENDING.

  LOOP AT gt_table INTO gs_table.

    INSERT gs_table INTO TABLE gt_new.

  ENDLOOP.

MOVE-CORRESPONDING gt_new TO gt_sum.

  COLLECT gs_sum INTO gt_sum.

  BREAK-POINT.
