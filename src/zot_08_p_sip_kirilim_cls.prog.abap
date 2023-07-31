*&---------------------------------------------------------------------*
*& Include          ZOT_08_P_SIP_KIRILIM_CLS
*&---------------------------------------------------------------------*

CLASS cl_event_receiver DEFINITION.

  PUBLIC SECTION.
    METHODS handle_top_of_page 	"TOP_OF_PAGE
      FOR EVENT top_of_page OF cl_gui_alv_grid
      IMPORTING
        e_dyndoc_id
        table_index.

    METHODS handle_hotspot_click 	"HOTSPOT_CLICK
      FOR EVENT hotspot_click OF cl_gui_alv_grid
      IMPORTING
        e_row_id
        e_column_id.
    METHODS handle_double_click   "DOUBLE_CLİCK
      FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING
        e_row
        e_column
        es_row_no.
    METHODS handle_data_changed   "DATA_CHANGED
      FOR EVENT data_changed OF cl_gui_alv_grid
      IMPORTING
        er_data_changed
        e_onf4
        e_onf4_before
        e_onf4_after
        e_ucomm.
    METHODS handle_onf4     "ONF4
      FOR EVENT onf4 OF cl_gui_alv_grid
      IMPORTING
        e_fieldname
        e_fieldvalue
        es_row_no
        er_event_data
        et_bad_cells
        e_display.
    METHODS handle_button_click   "BUTTON_CLİCK
      FOR EVENT button_click OF cl_gui_alv_grid
      IMPORTING
        es_col_id
        es_row_no.
    METHODS handle_toolbar  "TOOLBAR
      FOR EVENT toolbar OF cl_gui_alv_grid
      IMPORTING
        e_interactive
        e_object.
    METHODS handle_user_command   "USER_COMMAND
      FOR EVENT user_command OF cl_gui_alv_grid
      IMPORTING
        e_ucomm.
ENDCLASS.

CLASS cl_event_receiver IMPLEMENTATION.
  METHOD handle_top_of_page.
    BREAK-POINT.
  ENDMETHOD.   "handle_top_of_page

  METHOD handle_hotspot_click.
    BREAK-POINT.
  ENDMETHOD.   "handle_hotspot_click

  METHOD handle_double_click.

    IF c_box1 EQ abap_true AND c_box2 EQ abap_true.

      READ TABLE gt_table1 INTO gs_table1 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v1~auart = @gs_table1-auart
     INTO TABLE @DATA(gt_demo1).

      cl_demo_output=>display( gt_demo1 ).

    ELSEIF c_box1 EQ abap_true AND c_box3 EQ abap_true.

      READ TABLE gt_table2 INTO gs_table2 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v1~auart = @gs_table2-auart
     INTO TABLE @DATA(gt_demo2).

      cl_demo_output=>display( gt_demo2 ).

    ELSEIF c_box1 EQ abap_true AND c_box4 EQ abap_true.

      READ TABLE gt_table3 INTO gs_table3 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v1~auart = @gs_table3-auart
     INTO TABLE @DATA(gt_demo3).

      cl_demo_output=>display( gt_demo3 ).

    ELSEIF c_box1 EQ abap_true AND c_box5 EQ abap_true.

      READ TABLE gt_table4 INTO gs_table4 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v1~auart = @gs_table4-auart
     INTO TABLE @DATA(gt_demo4).

      cl_demo_output=>display( gt_demo4 ).

    ELSEIF c_box2 EQ abap_true AND c_box3 EQ abap_true.

      READ TABLE gt_table5 INTO gs_table5 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v2~matnr = @gs_table5-matnr
     INTO TABLE @DATA(gt_demo5).

      cl_demo_output=>display( gt_demo5 ).

    ELSEIF c_box2 EQ abap_true AND c_box4 EQ abap_true.

      READ TABLE gt_table6 INTO gs_table6 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v2~matnr = @gs_table6-matnr
     INTO TABLE @DATA(gt_demo6).

      cl_demo_output=>display( gt_demo6 ).

    ELSEIF c_box2 EQ abap_true AND c_box5 EQ abap_true.

      READ TABLE gt_table7 INTO gs_table7 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v2~matnr = @gs_table7-matnr
     INTO TABLE @DATA(gt_demo7).

      cl_demo_output=>display( gt_demo7 ).

    ELSEIF c_box3 EQ abap_true AND c_box4 EQ abap_true.

      READ TABLE gt_table8 INTO gs_table8 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v1~kunnr = @gs_table8-kunnr
     INTO TABLE @DATA(gt_demo8).

      cl_demo_output=>display( gt_demo8 ).

    ELSEIF c_box3 EQ abap_true AND c_box5 EQ abap_true.

      READ TABLE gt_table9 INTO gs_table9 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v1~kunnr = @gs_table9-kunnr
     INTO TABLE @DATA(gt_demo9).

      cl_demo_output=>display( gt_demo9 ).

    ELSEIF c_box4 EQ abap_true AND c_box5 EQ abap_true.

      READ TABLE gt_table10 INTO gs_table10 INDEX e_row-index.

      SELECT v1~vbeln,
             v1~kunnr,
             v1~bname,
             v1~auart,
             v1~audat,
             v2~pstyv,
             v2~matnr,
             v2~matkl,
             v2~zmeng,
             v2~zieme,
             v2~stman,
             v1~waerk,
             v2~werks,
             v1~ktext,
             v2~lgort,
             v2~charg
     FROM vbak AS v1
     INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln WHERE v2~matkl = @gs_table10-matkl
     INTO TABLE @DATA(gt_demo10).

      cl_demo_output=>display( gt_demo10 ).

    ENDIF.

  ENDMETHOD.

  METHOD handle_data_changed.
    BREAK-POINT.
  ENDMETHOD.   "handle_data_changed

  METHOD handle_onf4.
    BREAK-POINT.
  ENDMETHOD.   "handle_onf4

  METHOD handle_button_click.
    BREAK-POINT.
  ENDMETHOD.

  METHOD handle_toolbar.
    BREAK-POINT.
  ENDMETHOD.

  METHOD handle_user_command.
    BREAK-POINT.
  ENDMETHOD.

ENDCLASS.
