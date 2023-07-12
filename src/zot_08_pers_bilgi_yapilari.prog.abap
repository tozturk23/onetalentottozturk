*&---------------------------------------------------------------------*
*& Report ZOT_08_PERS_BILGI_YAPILARI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_08_PERS_BILGI_YAPILARI.

PARAMETERS: p_persno TYPE zot_08_e_personel_no,
            r_rad1   RADIOBUTTON GROUP g1,
            r_rad2   RADIOBUTTON GROUP g1,
            r_rad3   RADIOBUTTON GROUP g1,
            r_rad4   RADIOBUTTON GROUP g1.

DATA: gs_layout TYPE SLIS_LAYOUT_ALV,
      gt_fcat   TYPE SLIS_T_FIELDCAT_ALV,
      gs_fcat   TYPE SLIS_FIELDCAT_ALV,
      gt_master TYPE TABLE OF ZOT_00_T_P_MASTR,
      gs_master TYPE ZOT_00_T_P_MASTR.


START-OF-SELECTION.

SELECT * FROM ZOT_00_T_P_MASTR
  INTO TABLE gt_master WHERE personel_no = p_persno.

IF r_rad1 EQ abap_true.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
*   I_CALLBACK_PROGRAM                = ' '
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
   I_STRUCTURE_NAME                  = 'ZOT_00_T_P_MASTR'
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
   IS_LAYOUT                         = gs_layout
   IT_FIELDCAT                       = gt_fcat
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT                           =
*   IT_FILTER                         =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
*   I_SAVE                            = ' '
*   IS_VARIANT                        =
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT                          =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
*   O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab                          = gt_master
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
 EXPORTING
*   I_PROGRAM_NAME               =
*   I_INTERNAL_TABNAME           =
   I_STRUCTURE_NAME             = 'ZOT_00_T_P_MASTR'
*   I_CLIENT_NEVER_DISPLAY       = 'X'
*   I_INCLNAME                   =
*   I_BYPASSING_BUFFER           =
*   I_BUFFER_ACTIVE              =
  CHANGING
    ct_fieldcat                  = gt_fcat
* EXCEPTIONS
*   INCONSISTENT_INTERFACE       = 1
*   PROGRAM_ERROR                = 2
*   OTHERS                       = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CLEAR gs_layout.
gs_layout-zebra = abap_true.
ENDIF.
