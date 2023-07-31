*&---------------------------------------------------------------------*
*& Report ZOT_08_P_ZMN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_zmn.

TABLES: zot_08_t_zmn.

DATA: gt_alv    TYPE TABLE OF zot_08_s_zmn,
      gs_alv    TYPE zot_08_s_zmn,
      gv_days   TYPE i,
      gv_days2  TYPE i,
      gv_months TYPE i,
      gv_years  TYPE i,
      gv_time   TYPE sytime,
      gt_fcat   TYPE slis_t_fieldcat_alv,
      gs_fcat   TYPE slis_fieldcat_alv.

SELECT-OPTIONS: s_index FOR zot_08_t_zmn-syindex NO INTERVALS.

START-OF-SELECTION.

  SELECT * FROM zot_08_t_zmn
    INTO TABLE @DATA(lt_table) WHERE syindex IN @s_index.

  LOOP AT lt_table INTO DATA(ls_table).

    CALL FUNCTION 'HR_SGPBS_YRS_MTHS_DAYS'
      EXPORTING
        beg_da   = ls_table-baslangic_tarihi
        end_da   = ls_table-bitis_tarihi
      IMPORTING
        no_day   = gv_days
        no_month = gv_months
        no_year  = gv_years.

    CALL FUNCTION 'SCOV_TIME_DIFF_46B'
      EXPORTING
        im_date1 = ls_table-baslangic_tarihi
        im_date2 = ls_table-bitis_tarihi
        im_time1 = ls_table-baslangic_saati
        im_time2 = ls_table-bitis_saati
      IMPORTING
        ex_days  = gv_days2
        ex_time  = gv_time.

    gs_alv-syindex     = ls_table-syindex.
    gs_alv-yil         = gv_years.
    IF ls_table-bitis_tarihi - ls_table-baslangic_tarihi = 30 AND ls_table-baslangic_saati > ls_table-bitis_saati.
      gs_alv-ay        = gv_months - 1.
    ELSE.
      gs_alv-ay        = gv_months.
    ENDIF.
    gs_alv-ay          = gv_months.
    IF ls_table-baslangic_saati > ls_table-bitis_saati AND ls_table-baslangic_tarihi+4(2) NE 2.
      gs_alv-gun         = gv_days - 1 .
    ELSEIF ls_table-baslangic_saati > ls_table-bitis_saati AND ls_table-baslangic_tarihi+4(2) EQ 2.
      gs_alv-gun         = gv_days.
    ELSE.
      gs_alv-gun         = gv_days - 1.
    ENDIF.
    gs_alv-saat        = gv_time+0(2).
    gs_alv-dakika      = gv_time+2(2).
    gs_alv-saniye      = gv_time+4(2).
    APPEND gs_alv TO gt_alv.

  ENDLOOP.

  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'ZOT_08_S_ZMN'
    CHANGING
      ct_fieldcat      = gt_fcat.

  gs_fcat-no_zero = abap_true.
  APPEND gs_fcat TO gt_fcat.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_structure_name = 'ZOT_08_S_ZMN'
    TABLES
      t_outtab         = gt_alv.
