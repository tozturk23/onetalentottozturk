*&---------------------------------------------------------------------*
*& Report ZOT_08_P_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_report.

INCLUDE zot_08_p_report_top.
*INCLUDE zot_08_p_report_cls.
INCLUDE zot_08_p_report_pbo.
INCLUDE zot_08_p_report_pai.
INCLUDE zot_08_p_report_frm.

START-OF-SELECTION.

PERFORM get_data.

PERFORM set_fcat.

PERFORM set_layout.

CALL SCREEN 0100.
