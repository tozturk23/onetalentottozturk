*&---------------------------------------------------------------------*
*& Include          ZOT_08_P_SIP_KIRILIM_TOP
*&---------------------------------------------------------------------*

TABLES: vbak,
        vbap.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_vbeln FOR vbak-vbeln NO INTERVALS,
                  s_kunnr FOR vbak-kunnr NO INTERVALS,
                  s_auart FOR vbak-auart NO INTERVALS,
                  s_audat FOR vbak-audat NO INTERVALS.

SELECTION-SCREEN END OF BLOCK b1.


SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS :s_matnr FOR vbap-matnr NO INTERVALS,
                  s_werks FOR vbap-werks NO INTERVALS,
                  s_pstyv FOR vbap-pstyv NO INTERVALS,
                  s_matkl FOR vbap-matkl NO INTERVALS,
                  s_charg FOR vbap-charg NO INTERVALS.
SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-002.

  PARAMETERS: c_box1 AS CHECKBOX,
              c_box2 AS CHECKBOX,
              c_box3 AS CHECKBOX,
              c_box4 AS CHECKBOX,
              c_box5 AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK b3.

CLASS cl_event_receiver DEFINITION DEFERRED.

DATA: gv_mark           TYPE i,
      gt_fcat           TYPE lvc_t_fcat,
      gs_fcat           TYPE lvc_s_fcat,
      gt_table1         TYPE TABLE OF zot_08_s_sel1,
      gs_table1         TYPE zot_08_s_sel1,
      gt_table2         TYPE TABLE OF zot_08_s_sel2,
      gs_table2         TYPE zot_08_s_sel2,
      gt_table3         TYPE TABLE OF zot_08_s_sel3,
      gs_table3         TYPE  zot_08_s_sel3,
      gt_table4         TYPE TABLE OF zot_08_s_sel4,
      gs_table4         TYPE  zot_08_s_sel4,
      gt_table5         TYPE TABLE OF zot_08_s_sel6,
      gs_table5         TYPE  zot_08_s_sel6,
      gt_table6         TYPE TABLE OF zot_08_s_sel7,
      gs_table6         TYPE  zot_08_s_sel7,
      gt_table7         TYPE TABLE OF zot_08_s_sel8,
      gs_table7         TYPE  zot_08_s_sel8,
      gt_table8         TYPE TABLE OF zot_08_s_sel11,
      gs_table8         TYPE  zot_08_s_sel11,
      gt_table9         TYPE TABLE OF zot_08_s_sel12,
      gs_table9         TYPE  zot_08_s_sel12,
      gt_table10        TYPE TABLE OF zot_08_s_sel16,
      gs_table10        TYPE  zot_08_s_sel16,
      gt_select         TYPE TABLE OF zot_08_s_sip,
      gs_select         TYPE zot_08_s_sip,
      gs_table          TYPE zot_08_s_sip,
      ls_collect1       TYPE zot_08_s_sel1,
      ls_collect2       TYPE zot_08_s_sel2,
      ls_collect3       TYPE zot_08_s_sel3,
      ls_collect4       TYPE zot_08_s_sel4,
      ls_collect5       TYPE zot_08_s_sel6,
      ls_collect6       TYPE zot_08_s_sel7,
      ls_collect7       TYPE zot_08_s_sel8,
      ls_collect8       TYPE zot_08_s_sel11,
      ls_collect9       TYPE zot_08_s_sel12,
      ls_collect10      TYPE zot_08_s_sel16,
      go_alv            TYPE REF TO cl_gui_alv_grid,
      go_cont           TYPE REF TO cl_gui_custom_container,
      go_event_receiver TYPE REF TO cl_event_receiver.
