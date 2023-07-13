*&---------------------------------------------------------------------*
*& Report ZOT_08_TARIH_SAAT_FARK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_tarih_saat_fark.

PARAMETERS: p_s_date TYPE d OBLIGATORY,
            p_e_date TYPE d OBLIGATORY,
            p_s_time TYPE t OBLIGATORY,
            p_e_time TYPE t OBLIGATORY.

START-OF-SELECTION.

  IF p_e_date IS INITIAL .

    p_e_date = sy-datum.

  ELSE.

    DATA(lv_year_diff) = p_e_date+0(4) - p_s_date+0(4).

    DATA(lv_month_diff) = p_e_date+4(2) - p_s_date+4(2).

    lv_month_diff = lv_year_diff * 12 + lv_month_diff.

    DATA(lv_day_diff) = p_e_date+6(2) - p_s_date+6(2).

    lv_day_diff = lv_year_diff * 12 + lv_month_diff * 30 + lv_day_diff.

    cl_Demo_output=>write( | Yaşadığı Gün =  { lv_day_diff } | && | Yaşadığı Ay = { lv_month_diff } | && | Yaşadığı Yıl = { lv_year_diff } | ).

    DATA(lv_hour_diff) = p_e_time+0(2) - p_s_time+0(2).

    lv_hour_diff = lv_hour_diff * lv_year_diff * 24 + lv_hour_diff.

    DATA(lv_minute_diff) = p_e_time+2(2) - p_s_time+2(2).

    lv_minute_diff = lv_hour_diff * lv_year_diff * 24 + lv_minute_diff * lv_day_diff * 60.

    DATA(lv_second_diff) = p_e_time+4(2) - p_s_time+4(2).

    lv_second_diff = lv_hour_diff * lv_year_diff * 24 + lv_minute_diff * lv_day_diff * 60 + lv_second_diff * lv_day_diff * 3600.

    cl_Demo_output=>write( | Yaşadığı Saniye =  { lv_second_diff } | && | Yaşadığı Dakika = { lv_minute_diff } | && | Yaşadığı Saat = { lv_hour_diff } | ).

    cl_demo_output=>display( ).

  ENDIF.
