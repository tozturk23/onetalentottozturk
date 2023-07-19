*&---------------------------------------------------------------------*
*& Include          ZOT_08_P_REPORT_PBO
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS '0100'.

 CONCATENATE sy-repid sy-uname sy-cdate sy-uzeit INTO gv_title SEPARATED BY space.

 SET TITLEBAR 'GV_TITLE'.

PERFORM display_alv.

ENDMODULE.
