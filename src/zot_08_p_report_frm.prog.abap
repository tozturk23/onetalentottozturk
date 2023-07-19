*&---------------------------------------------------------------------*
*& Include          ZOT_08_P_REPORT_FRM
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .

  IF r_rad1 EQ abap_true.

    SELECT banfn,
           bnfpo,
           matkl,
           matnr,
           menge,
           meins
     FROM eban INTO TABLE @gt_eban WHERE banfn IN @s_banfn AND bnfpo IN @s_bnfpo.

  ELSEIF r_rad2 EQ abap_true.

    SELECT ebeln,
           ebelp,
           matkl,
           matnr,
           menge,
           meins
    FROM ekpo INTO TABLE @gt_ekpo WHERE ebeln IN @s_ebeln AND matkl IN @s_matkl.

  ENDIF.

LOOP AT gt_eban ASSIGNING <gfs_eban>.

  IF <gfs_eban>-menge > 10.

  <gfs_eban>-line_color = 'C500'.

  ENDIF.

ENDLOOP.

LOOP AT gt_ekpo ASSIGNING <gfs_ekpo>.

  IF <gfs_ekpo>-menge > 10.

  <gfs_ekpo>-line_color = 'C500'.

  ENDIF.

ENDLOOP.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form set_fcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_fcat .
IF r_rad1 EQ abap_true.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
*     I_BUFFER_ACTIVE  =
      i_structure_name = 'ZOT_08_S_EBAN'
*     I_CLIENT_NEVER_DISPLAY       = 'X'
*     I_BYPASSING_BUFFER           =
*     I_INTERNAL_TABNAME           =
    CHANGING
      ct_fieldcat      = gt_fcat
* EXCEPTIONS
*     INCONSISTENT_INTERFACE       = 1
*     PROGRAM_ERROR    = 2
*     OTHERS           = 3
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
*     I_BUFFER_ACTIVE  =
      i_structure_name = 'ZOT_08_S_EKPO'
*     I_CLIENT_NEVER_DISPLAY       = 'X'
*     I_BYPASSING_BUFFER           =
*     I_INTERNAL_TABNAME           =
    CHANGING
      ct_fieldcat      = gt_fcat
* EXCEPTIONS
*     INCONSISTENT_INTERFACE       = 1
*     PROGRAM_ERROR    = 2
*     OTHERS           = 3
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

ENDIF.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form display_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_alv .

  CREATE OBJECT go_custom
    EXPORTING
      container_name = 'CC_ALV'.

  CREATE OBJECT go_grid
    EXPORTING
      i_parent = go_custom.

  IF r_rad1 EQ abap_true.

  CALL METHOD go_grid->set_table_for_first_display
    EXPORTING
      i_structure_name = 'ZOT_08_S_EBAN'
      is_layout        = gs_layout
    CHANGING
      it_outtab        = gt_eban
      it_fieldcatalog  = gt_fcat.

  ELSEIF r_rad2 EQ abap_true.

  CALL METHOD go_grid->set_table_for_first_display
    EXPORTING
      i_structure_name = 'ZOT_08_S_EKPO'
      is_layout        = gs_layout
    CHANGING
      it_outtab        = gt_ekpo
      it_fieldcatalog  = gt_fcat.

  ENDIF.


ENDFORM.

*&---------------------------------------------------------------------*
*& Form set_layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_layout .

CLEAR: gs_layout.
gs_layout-info_fname = 'LINE_COLOR'.

ENDFORM.
