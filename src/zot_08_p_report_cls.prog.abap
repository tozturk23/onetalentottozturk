*&---------------------------------------------------------------------*
*& Include          ZOT_08_P_REPORT_CLS
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
    DATA: lv_text TYPE sdydo_text_element.

    CONCATENATE sy-repid sy-uname sy-datum sy-uzeit INTO lv_text SEPARATED BY space.

    CALL METHOD go_document->add_text
      EXPORTING
        text          = lv_text
        sap_style     = cl_dd_document=>heading.

    CALL METHOD go_document->display_document
      EXPORTING
        parent             = go_sub1.

  ENDMETHOD.   "handle_top_of_page

  METHOD handle_hotspot_click.
    BREAK-POINT.
  ENDMETHOD.   "handle_hotspot_click

  METHOD handle_double_click.
    BREAK-POINT.
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
