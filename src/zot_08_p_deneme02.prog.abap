*&---------------------------------------------------------------------*
*& Report ZOT_08_P_DENEME02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_deneme02.

TYPE-POOLS: slis.

FIELD-SYMBOLS: <dyn_table> TYPE STANDARD TABLE,

               <dyn_wa>.

DATA: alv_fldcat TYPE slis_t_fieldcat_alv,

      it_fldcat  TYPE lvc_t_fcat.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_flds(5) TYPE c.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

*build the dynamic internal table

  PERFORM build_dyn_itab.

*write 5 records to the alv grid

  DO 5 TIMES.

    PERFORM build_report.

  ENDDO.

*call the alv grid.

  PERFORM call_alv.

************************************************************************

*Build_dyn_itab

************************************************************************

FORM build_dyn_itab.

  DATA: new_table    TYPE REF TO data,

        new_line     TYPE REF TO data,

        wa_it_fldcat TYPE lvc_s_fcat.

*Create fields .

  CLEAR wa_it_fldcat.

  wa_it_fldcat-fieldname = 'name1'.

  wa_it_fldcat-datatype = 'mara-matnr'.

  wa_it_fldcat-intlen = 5.

  APPEND wa_it_fldcat TO it_fldcat .

*

*clear wa_it_fldcat.

  wa_it_fldcat-fieldname = sy-index.

  wa_it_fldcat-datatype = 'CHAR'.

  wa_it_fldcat-intlen = 5.

  APPEND wa_it_fldcat TO it_fldcat .

*

  DO p_flds TIMES.

    CLEAR wa_it_fldcat.

    wa_it_fldcat-fieldname = sy-index.

    wa_it_fldcat-datatype = 'CHAR'.

    wa_it_fldcat-intlen = 6.

    APPEND wa_it_fldcat TO it_fldcat .

  ENDDO.

*Create dynamic internal table and assign to FS

  CALL METHOD cl_alv_table_create=>create_dynamic_table
    EXPORTING
      it_fieldcatalog = it_fldcat
    IMPORTING
      ep_table        = new_table.

  ASSIGN new_table->* TO <dyn_table>.

*Create dynamic work area and assign to FS

  CREATE DATA new_line LIKE LINE OF <dyn_table>.

  ASSIGN new_line->* TO <dyn_wa>.

ENDFORM.

*********************************************************************

*Form build_report

*********************************************************************

FORM build_report.

  DATA: fieldname(20) TYPE c.

  DATA: fieldvalue(5) TYPE c.

  DATA: index(3) TYPE c.

  FIELD-SYMBOLS: <fs1>.

  DO p_flds TIMES.

    index = sy-index.

*Set up fieldvalue

    CONCATENATE 'FLD' index INTO

    fieldvalue.

    CONDENSE fieldvalue NO-GAPS.

    ASSIGN COMPONENT index OF STRUCTURE <dyn_wa> TO <fs1>.

    <fs1> = fieldvalue.

  ENDDO.

*Append to the dynamic internal table

  APPEND <dyn_wa> TO <dyn_table>.

ENDFORM.

************************************************************************

*CALL_ALV

************************************************************************

FORM call_alv.

  DATA: wa_cat LIKE LINE OF alv_fldcat.

  DO p_flds TIMES.

    CLEAR wa_cat.

    wa_cat-fieldname = sy-index.

    wa_cat-seltext_s = sy-index.

    wa_cat-outputlen = '6'.

    APPEND wa_cat TO alv_fldcat.

  ENDDO.

*Call ABAP List Viewer (ALV)

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      it_fieldcat = alv_fldcat
    TABLES
      t_outtab    = <dyn_table>.

ENDFORM.
