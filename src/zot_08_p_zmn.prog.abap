*&---------------------------------------------------------------------*
*& Report ZOT_08_P_ZMN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_zmn.

TABLES: zot_08_t_zmn.

DATA: gt_alv    TYPE TABLE OF ZOT_08_S_ZMN,
      gs_alv    TYPE ZOT_08_S_ZMN,
      gv_days   TYPE i,
      gv_days2  TYPE i,
      gv_months TYPE i,
      gv_years  TYPE i,
      gv_time   TYPE sytime,
      gt_fcat   TYPE SLIS_T_FIELDCAT_ALV,
      gs_fcat   TYPE SLIS_FIELDCAT_ALV.

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
        no_year  = gv_years
*       NO_CAL_DAY          =
* EXCEPTIONS
*       DATEINT_ERROR       = 1
*       OTHERS   = 2
      .
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.


    CALL FUNCTION 'SCOV_TIME_DIFF_46B'
      EXPORTING
        im_date1 = ls_table-baslangic_tarihi
        im_date2 = ls_table-bitis_tarihi
        im_time1 = ls_table-baslangic_saati
        im_time2 = ls_table-bitis_saati
      IMPORTING
        ex_days  = gv_days2
        ex_time  = gv_time
* EXCEPTIONS
*       START_LARGER_THAN_END       = 1
*       OTHERS   = 2
      .
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.


    gs_alv-syindex = ls_table-syindex.

    IF gv_days = 1 AND gv_months = 0.

      gs_alv-gun = 0.
      gs_alv-ay = gv_months - 1.

      IF gs_alv-yil EQ 0.

        gs_alv-yil = gv_years.

      ELSE.

        gs_alv-yil = gv_years - 1.

      ENDIF.


    ELSEIF gv_days = 1 AND gv_months NE 0.

      IF ls_table-baslangic_saati > ls_table-bitis_saati.
        gs_alv-gun = gv_days.
      ELSE.
        gs_alv-gun = gv_days - 1.
      ENDIF.

      gs_alv-ay = gv_months - 1.

      IF gs_alv-yil EQ 0.

        gs_alv-yil = gv_years.

      ELSE.

        gs_alv-yil = gv_years - 1.

      ENDIF.

    ELSEIF gv_months = 1 AND gv_days NE 1.

      IF ls_table-baslangic_saati > ls_table-bitis_saati.
        gs_alv-gun = gv_days - 2.
      ELSE.
        gs_alv-gun = gv_days - 1.
      ENDIF.

      gs_alv-ay = 0.

      IF gs_alv-yil EQ 0.

        gs_alv-yil = gv_years.

      ELSE.

        gs_alv-yil = gv_years - 1.

      ENDIF.

    ELSEIF gv_months = 1 AND gv_days EQ 1.

      IF ls_table-baslangic_saati > ls_table-bitis_saati.
        gs_alv-gun = gv_days2.
      ELSE.
        gs_alv-gun = gv_days2 + 1.
      ENDIF.

      gs_alv-ay = 0.

      IF gs_alv-yil EQ 0.

        gs_alv-yil = gv_years.

      ELSE.

        gs_alv-yil = gv_years - 1.

      ENDIF.

    ELSE.

      IF ls_table-baslangic_saati > ls_table-bitis_saati.
        gs_alv-gun = gv_days - 2.
      ELSE.
        gs_alv-gun = gv_days - 1.
      ENDIF.

      gs_alv-ay = gv_months.

      IF gs_alv-yil EQ 0.

        gs_alv-yil = gv_years.

      ELSE.

        gs_alv-yil = gv_years - 1.

      ENDIF.

    ENDIF.

    gs_alv-saniye = gv_time+4(2).
    gs_alv-dakika = gv_time+2(2).
    gs_alv-saat = gv_time+0(2).
    APPEND gs_alv TO gt_alv.



  ENDLOOP.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
   EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                   = ' '
*     I_CALLBACK_PROGRAM                = ' '
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
     I_STRUCTURE_NAME                  = 'ZOT_08_S_ZMN'
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
*     IS_LAYOUT                         =
     IT_FIELDCAT                       = gt_fcat
*     IT_EXCLUDING                      =
*     IT_SPECIAL_GROUPS                 =
*     IT_SORT                           =
*     IT_FILTER                         =
*     IS_SEL_HIDE                       =
*     I_DEFAULT                         = 'X'
*     I_SAVE                            = ' '
*     IS_VARIANT                        =
*     IT_EVENTS                         =
*     IT_EVENT_EXIT                     =
*     IS_PRINT                          =
*     IS_REPREP_ID                      =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   =
*     IT_HYPERLINK                      =
*     IT_ADD_FIELDCAT                   =
*     IT_EXCEPT_QINFO                   =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER           =
*   IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      t_outtab                          = gt_alv
*   EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS                            = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
   EXPORTING
*     I_PROGRAM_NAME               =
*     I_INTERNAL_TABNAME           =
     I_STRUCTURE_NAME             = 'ZOT_08_S_ZMN'
*     I_CLIENT_NEVER_DISPLAY       = 'X'
*     I_INCLNAME                   =
*     I_BYPASSING_BUFFER           =
*     I_BUFFER_ACTIVE              =
    CHANGING
      ct_fieldcat                  = gt_fcat
*   EXCEPTIONS
*     INCONSISTENT_INTERFACE       = 1
*     PROGRAM_ERROR                = 2
*     OTHERS                       = 3
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
