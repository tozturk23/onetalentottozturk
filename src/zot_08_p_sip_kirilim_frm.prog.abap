*&---------------------------------------------------------------------*
*& Include          ZOT_08_P_SIP_KIRILIM_FRM
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

  SELECT v1~vbeln,
         v1~kunnr,
         v1~auart,
         v1~audat,
         v2~matnr,
         v2~werks,
         v2~pstyv,
         v2~matkl,
         v2~charg,
         v1~netwr,
         v1~waerk
     FROM vbak AS v1
    INNER JOIN vbap AS v2 ON v1~vbeln = v2~vbeln
    INTO TABLE @gt_select WHERE v1~vbeln IN @s_vbeln AND v1~kunnr IN @s_kunnr AND v1~auart IN @s_auart AND v1~audat IN @s_audat
    AND v2~matnr IN @s_matnr AND v2~werks IN @s_werks AND v2~pstyv IN @s_pstyv AND v2~matkl IN @s_matkl AND v2~charg IN @s_charg.

  SORT gt_select BY vbeln ASCENDING.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form set_cbox
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_cbox .

  LOOP AT SCREEN.

    IF c_box1 EQ abap_true.

      gv_mark += 1.

    ENDIF.

    IF c_box2 EQ abap_true.

      gv_mark += 1.

    ENDIF.

    IF c_box3 EQ abap_true.

      gv_mark += 1.

    ENDIF.

    IF c_box4 EQ abap_true.

      gv_mark += 1.

    ENDIF.

    IF c_box5 EQ abap_true.

      gv_mark += 1.

    ENDIF.

  ENDLOOP.

  IF gv_mark < 2 OR gv_mark > 2.

    MESSAGE: 'Sadece 2 adet kırılım seçebilirsiniz!' TYPE 'E'.

  ELSE.

    IF c_box1 EQ abap_true AND c_box2 EQ abap_true.
      LOOP AT gt_select ASSIGNING FIELD-SYMBOL(<lfs_collect>).
        IF <lfs_collect> IS ASSIGNED.
          ls_collect1-auart = <lfs_collect>-auart.
          ls_collect1-matnr = <lfs_collect>-matnr.
          ls_collect1-netwr = <lfs_collect>-netwr.
          ls_collect1-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect1 INTO gt_table1.
          SORT gt_table1 BY auart matnr.
        ENDIF.
      ENDLOOP.
    ELSEIF c_box1 EQ abap_true AND c_box3 EQ abap_true.
      LOOP AT gt_select ASSIGNING <lfs_collect>.
        IF <lfs_collect> IS ASSIGNED.
          ls_collect2-auart = <lfs_collect>-auart.
          ls_collect2-kunnr = <lfs_collect>-kunnr.
          ls_collect2-netwr = <lfs_collect>-netwr.
          ls_collect2-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect2 INTO gt_table2.
          SORT gt_table2 BY auart kunnr.
        ENDIF.
      ENDLOOP.
    ELSEIF c_box1 EQ abap_true AND c_box4 EQ abap_true.
      LOOP AT gt_select ASSIGNING <lfs_collect>.
        IF <lfs_collect> IS ASSIGNED.
          ls_collect3-auart = <lfs_collect>-auart.
          ls_collect3-matkl = <lfs_collect>-matkl.
          ls_collect3-netwr = <lfs_collect>-netwr.
          ls_collect3-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect3 INTO gt_table3.
          SORT gt_table3 BY auart matkl.
        ENDIF.
      ENDLOOP.
    ELSEIF c_box1 EQ abap_true AND c_box5 EQ abap_true.
      LOOP AT gt_select ASSIGNING <lfs_collect>.
        IF <lfs_collect> IS ASSIGNED.
          ls_collect4-auart = <lfs_collect>-auart.
          ls_collect4-charg = <lfs_collect>-charg.
          ls_collect4-netwr = <lfs_collect>-netwr.
          ls_collect4-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect4 INTO gt_table4.
          SORT gt_table4 BY auart charg.
        ENDIF.
      ENDLOOP.
    ELSEIF c_box2 EQ abap_true AND c_box3 EQ abap_true.
      LOOP AT gt_select ASSIGNING <lfs_collect>.
        IF <lfs_collect> IS ASSIGNED.
          ls_collect5-matnr = <lfs_collect>-matnr.
          ls_collect5-kunnr = <lfs_collect>-kunnr.
          ls_collect5-netwr = <lfs_collect>-netwr.
          ls_collect5-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect5 INTO gt_table5.
          SORT gt_table5 BY matnr kunnr.
        ENDIF.
      ENDLOOP.
    ELSEIF c_box2 EQ abap_true AND c_box4 EQ abap_true.
      LOOP AT gt_select ASSIGNING <lfs_collect>.
        IF <lfs_collect> IS ASSIGNED.
          ls_collect6-matnr = <lfs_collect>-matnr.
          ls_collect6-matkl = <lfs_collect>-matkl.
          ls_collect6-netwr = <lfs_collect>-netwr.
          ls_collect6-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect6 INTO gt_table6.
          SORT gt_table6 BY matnr matkl.
        ENDIF.
      ENDLOOP.
    ELSEIF c_box2 EQ abap_true AND c_box5 EQ abap_true.
      LOOP AT gt_select ASSIGNING <lfs_collect>.
        IF <lfs_collect> IS ASSIGNED.
          ls_collect7-matnr = <lfs_collect>-matnr.
          ls_collect7-charg = <lfs_collect>-charg.
          ls_collect7-netwr = <lfs_collect>-netwr.
          ls_collect7-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect7 INTO gt_table7.
          SORT gt_table7 BY matnr charg.
        ENDIF.
      ENDLOOP.
    ELSEIF c_box3 EQ abap_true AND c_box4 EQ abap_true.
      LOOP AT gt_select ASSIGNING <lfs_collect>.
        IF <lfs_collect> IS ASSIGNED.
          ls_collect8-kunnr = <lfs_collect>-kunnr.
          ls_collect8-matkl = <lfs_collect>-matkl.
          ls_collect8-netwr = <lfs_collect>-netwr.
          ls_collect8-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect8 INTO gt_table8.
          SORT gt_table8 BY kunnr matkl.
        ENDIF.
      ENDLOOP.
    ELSEIF c_box3 EQ abap_true AND c_box5 EQ abap_true.
      LOOP AT gt_select ASSIGNING <lfs_collect>.
        IF <lfs_collect> IS ASSIGNED.
          ls_collect9-kunnr = <lfs_collect>-kunnr.
          ls_collect9-charg = <lfs_collect>-charg.
          ls_collect9-netwr = <lfs_collect>-netwr.
          ls_collect9-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect9 INTO gt_table9.
          SORT gt_table9 BY kunnr charg.
        ENDIF.
      ENDLOOP.
    ELSEIF c_box4 EQ abap_true AND c_box5 EQ abap_true.
      LOOP AT gt_select ASSIGNING <lfs_collect>.
        IF <lfs_collect> IS ASSIGNED.
          ls_collect10-matkl = <lfs_collect>-matkl.
          ls_collect10-charg = <lfs_collect>-charg.
          ls_collect10-netwr = <lfs_collect>-netwr.
          ls_collect10-waerk = <lfs_collect>-waerk.
          COLLECT ls_collect10 INTO  gt_table10.
          SORT gt_table10 BY matkl charg.
        ENDIF.
      ENDLOOP.
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

  CREATE OBJECT go_cont
    EXPORTING
      container_name = 'CC_ALV'.              " Name of the Screen CustCtrl Name to Link Container To

  CREATE OBJECT go_alv
    EXPORTING
      i_parent = go_cont.         " Parent Container

  CREATE OBJECT go_event_receiver.

  SET HANDLER go_event_receiver->handle_double_click FOR go_alv.

  IF c_box1 EQ abap_true AND c_box2 EQ abap_true.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL1'
      CHANGING
        ct_fieldcat      = gt_fcat.


    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL1'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table1             " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ELSEIF c_box1 EQ abap_true AND c_box3 EQ abap_true.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL2'
      CHANGING
        ct_fieldcat      = gt_fcat.

    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL2'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table2             " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ELSEIF c_box1 EQ abap_true AND c_box4 EQ abap_true.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL3'
      CHANGING
        ct_fieldcat      = gt_fcat.

    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL3'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table3           " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ELSEIF c_box1 EQ abap_true AND c_box5 EQ abap_true.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL4'
      CHANGING
        ct_fieldcat      = gt_fcat.
    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL4'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table4             " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ELSEIF c_box2 EQ abap_true AND c_box3 EQ abap_true.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL5'
      CHANGING
        ct_fieldcat      = gt_fcat.

    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL5'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table5             " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ELSEIF c_box2 EQ abap_true AND c_box4 EQ abap_true.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL6'
      CHANGING
        ct_fieldcat      = gt_fcat.

    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL6'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table6             " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ELSEIF c_box2 EQ abap_true AND c_box5 EQ abap_true.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL7'
      CHANGING
        ct_fieldcat      = gt_fcat.

    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL7'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table7             " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ELSEIF c_box3 EQ abap_true AND c_box4 EQ abap_true.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL8'
      CHANGING
        ct_fieldcat      = gt_fcat.

    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL8'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table8             " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ELSEIF c_box3 EQ abap_true AND c_box5 EQ abap_true.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL9'
      CHANGING
        ct_fieldcat      = gt_fcat.

    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL9'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table9             " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ELSEIF c_box4 EQ abap_true AND c_box5 EQ abap_true.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL10'
      CHANGING
        ct_fieldcat      = gt_fcat.

    go_alv->set_table_for_first_display(
      EXPORTING
        i_structure_name = 'ZOT_08_S_SEL10'              " Internal Output Table Structure Name
      CHANGING
        it_outtab        = gt_table10             " Output Table
        it_fieldcatalog  = gt_fcat              " Field Catalog
    ).

  ENDIF.

ENDFORM.
