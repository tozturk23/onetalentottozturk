*&---------------------------------------------------------------------*
*& Report ZOT_08_P_SIP_KIRILIM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_sip_kirilim.

INCLUDE zot_08_p_sip_kirilim_top.
INCLUDE zot_08_p_sip_kirilim_cls.
INCLUDE zot_08_p_sip_kirilim_pbo.
INCLUDE zot_08_p_sip_kirilim_pai.
INCLUDE zot_08_p_sip_kirilim_frm.

START-OF-SELECTION.

PERFORM get_data.

PERFORM set_cbox.

CALL SCREEN 0100.
