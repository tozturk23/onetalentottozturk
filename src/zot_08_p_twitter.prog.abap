*&---------------------------------------------------------------------*
*& Report ZOT_08_P_TWITTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_twitter.

"ZOT_08_T_TW

TYPES: BEGIN OF ty_abapitter,
  tweet TYPE ZOT_08_E_TWEET,
  END OF ty_abapitter.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_twid  TYPE i,
              p_tweet TYPE char200.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS: r_rad1 RADIOBUTTON GROUP g1,
              r_rad2 RADIOBUTTON GROUP g1,
              r_rad3 RADIOBUTTON GROUP g1,
              r_rad4 RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b2.

DATA: gv_mes    TYPE char200,
      gt_table  TYPE TABLE OF zot_08_t_tw,
      gs_table  TYPE zot_08_t_tw,
      abapitter TYPE TABLE OF ty_abapitter,

START-OF-SELECTION.

  IF r_rad1 EQ abap_true.

    IF p_twid IS INITIAL.

      COMMIT WORK AND WAIT.

      MESSAGE: 'Tweet ID boş bırakılamaz' TYPE 'I'.

      ROLLBACK WORK.

    ELSE.

      IF p_tweet IS INITIAL.

        MESSAGE: 'Boş tweet atılamaz' TYPE 'I'.

      ELSE.

        SELECT * FROM zot_08_t_tw
          INTO TABLE @DATA(lt_table) WHERE tweet_id = @p_twid.

        IF sy-subrc EQ 0.

          MESSAGE 'Bu tweet ID kullanılıyor' TYPE 'I'.

        ELSE.

          gs_table-tweet_id = p_twid.
          gs_table-kullanici = sy-uname.
          gs_table-tweet = p_tweet.
          INSERT zot_08_t_tw FROM gs_table.

        ENDIF.

      ENDIF.

    ENDIF.

  ELSEIF r_rad2 EQ abap_true.

    SELECT * FROM zot_08_t_tw
      INTO TABLE @DATA(lt_table2) WHERE tweet_id = @p_twid.

    IF sy-subrc EQ 0.

      IF p_twid IS INITIAL.

        MESSAGE: 'Tweet ID boş bırakılamaz' TYPE 'I'.

      ELSE.

        IF p_tweet IS INITIAL .

          MESSAGE: 'Boş tweet atılamaz' TYPE 'I'.

        ELSE.
          gs_table-kullanici = sy-uname.
          gs_table-tweet_id  = p_twid.
          gs_table-tweet     = p_tweet.
          MODIFY zot_08_t_tw FROM gs_table.

        ENDIF.

      ENDIF.

    ENDIF.

  ELSEIF r_rad3 EQ abap_true.

    SELECT * FROM zot_08_t_tw
      INTO TABLE @DATA(lt_table3) WHERE tweet_id = @p_twid.

    IF sy-subrc EQ 0.

      IF p_twid IS INITIAL .

        MESSAGE: 'Tweet ID boş bırakılamaz' TYPE 'I'.

      ELSE.

        DELETE FROM zot_08_t_tw WHERE tweet_id = p_twid.

      ENDIF.

    ELSE.

      MESSAGE: 'Tweet ID yi kontrol ediniz!' TYPE 'I'.

    ENDIF.

  ELSEIF r_rad4 EQ abap_true.

    SELECT tweet FROM zot_08_t_tw
      INTO TABLE @abapitter WHERE kullanici = @sy-uname.

    cl_demo_output=>write( ABAPITTER ).

    cl_demo_output=>display( ).

  ENDIF.
