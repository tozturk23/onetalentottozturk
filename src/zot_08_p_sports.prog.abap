*&---------------------------------------------------------------------*
*& Report ZOT_08_P_SPORTS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_p_sports.

TYPES: BEGIN OF gty_grup,
         takim TYPE char20,
         ulke  TYPE char2,
       END OF gty_grup.

DATA: gt_grup1  TYPE TABLE OF gty_grup,
      gs_grup1  TYPE gty_grup,
      gt_grup2  TYPE TABLE OF gty_grup,
      gs_grup2  TYPE gty_grup,
      gt_grup3  TYPE TABLE OF gty_grup,
      gs_grup3  TYPE gty_grup,
      gt_grup4  TYPE TABLE OF gty_grup,
      gs_grup4  TYPE gty_grup,
      gt_main1  TYPE TABLE OF gty_grup,
      gs_main1  TYPE gty_grup,
      gt_main2  TYPE TABLE OF gty_grup,
      gs_main2  TYPE gty_grup,
      gt_main3  TYPE TABLE OF gty_grup,
      gs_main3  TYPE gty_grup,
      gt_main4  TYPE TABLE OF gty_grup,
      gs_main4  TYPE gty_grup,
      gv_maxt   TYPE qfranint,
      gv_maxg   TYPE qfranint,
      gv_min    TYPE qfranint,
      gv_random TYPE qfranint,
      lv_grup1  TYPE char20,
      lv_grup2  TYPE char20,
      lv_grup3  TYPE char20,
      lv_grup4  TYPE char20.

START-OF-SELECTION.

  gv_maxt = 4.
  gv_maxg = 4.
  gv_min = 1.

  gs_grup1-takim    = 'Liverpool'.
  gs_grup1-ulke     = 'EN'.
  APPEND gs_grup1 TO gt_grup1.

  gs_grup1-takim    = 'Bayern Münih'.
  gs_grup1-ulke     = 'DE'.
  APPEND gs_grup1 TO gt_grup1.

  gs_grup1-takim    = 'İnter'.
  gs_grup1-ulke     = 'IT'.
  APPEND gs_grup1 TO gt_grup1.

  gs_grup1-takim    = 'PSG'.
  gs_grup1-ulke     = 'FR'.
  APPEND gs_grup1 TO gt_grup1.

  gs_grup2-takim    = 'Manchester City'.
  gs_grup2-ulke     = 'EN'.
  APPEND gs_grup2 TO gt_grup2.

  gs_grup2-takim    = 'PSV'.
  gs_grup2-ulke     = 'NE'.
  APPEND gs_grup2 TO gt_grup2.


  gs_grup2-takim    = 'Port'.
  gs_grup2-ulke     = 'PO'.
  APPEND gs_grup2 TO gt_grup2.

  gs_grup2-takim    = 'Real Madrid'.
  gs_grup2-ulke     = 'ES'.
  APPEND gs_grup2 TO gt_grup2.

  gs_grup3-takim    = 'Dortmund'.
  gs_grup3-ulke     = 'DE'.
  APPEND gs_grup3 TO gt_grup3.

  gs_grup3-takim    = 'Galatasaray'.
  gs_grup3-ulke     = 'TR'.
  APPEND gs_grup3 TO gt_grup3.

  gs_grup3-takim    = 'Marsilia'.
  gs_grup3-ulke     = 'FR'.
  APPEND gs_grup3 TO gt_grup3.

  gs_grup3-takim    = 'Ajax'.
  gs_grup3-ulke     = 'NE'.
  APPEND gs_grup3 TO gt_grup3.

  gs_grup4-takim    = 'AEK'.
  gs_grup4-ulke     = 'GR'.
  APPEND gs_grup4 TO gt_grup4.

  gs_grup4-takim    = 'Roma'.
  gs_grup4-ulke     = 'IT'.
  APPEND gs_grup4 TO gt_grup4.

  gs_grup4-takim    = 'STA Bükreş'.
  gs_grup4-ulke     = 'RO'.
  APPEND gs_grup4 TO gt_grup4.

  gs_grup4-takim    = 'Atletico Madrid'.
  gs_grup4-ulke     = 'ES'.
  APPEND gs_grup4 TO gt_grup4.

  DO gv_maxt TIMES.

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
      EXPORTING
        ran_int_max = gv_maxt
        ran_int_min = gv_min
      IMPORTING
        ran_int     = gv_random.

    CASE gv_random.

      WHEN 1.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main1 IS INITIAL.

          READ TABLE gt_grup1 INTO gs_grup1 INDEX gv_random.

          APPEND gs_grup1 TO gt_main1.
          DELETE gt_grup1 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

            APPEND gs_grup1 TO gt_main1.
            DELETE gt_grup1 INDEX gv_random.

          gv_maxg -= 1.

        ENDIF.

      WHEN 2.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main2 IS INITIAL.

          READ TABLE gt_grup2 INTO gs_grup2 INDEX gv_random.

          APPEND gs_grup2 TO gt_main2.
          DELETE gt_grup2 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup2 INTO gs_grup2 WHERE ulke NE gs_grup1.

            APPEND gs_grup2 TO gt_main2.
            DELETE gt_grup2 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 3.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.


        IF gt_main3 IS INITIAL.

          READ TABLE gt_grup3 INTO gs_grup3 INDEX gv_random.

          APPEND gs_grup3 TO gt_main3.
          DELETE gt_grup3 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup3 INTO gs_grup3 WHERE ulke NE gs_grup1.

            APPEND gs_grup3 TO gt_main3.
            DELETE gt_grup3 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 4.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main4 IS INITIAL.

          READ TABLE gt_grup4 INTO gs_grup4 INDEX gv_random.

          APPEND gs_grup4 TO gt_main4.
          DELETE gt_grup4 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup4 INTO gs_grup4 WHERE ulke NE gs_grup1.

            APPEND gs_grup4 TO gt_main4.
            DELETE gt_grup4 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

    ENDCASE.

  ENDDO.

  gv_maxg = 4.

  DO gv_maxt TIMES.

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
      EXPORTING
        ran_int_max = gv_maxt
        ran_int_min = gv_min
      IMPORTING
        ran_int     = gv_random.

    CASE gv_random.

      WHEN 1.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main1 IS INITIAL.

          READ TABLE gt_grup1 INTO gs_grup1 INDEX gv_random.

          APPEND gs_grup1 TO gt_main1.
          DELETE gt_grup1 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup1 INTO gs_grup1 WHERE ulke NE gs_grup1.

            APPEND gs_grup1 TO gt_main1.
            DELETE gt_grup1 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 2.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main2 IS INITIAL.

          READ TABLE gt_grup2 INTO gs_grup2 INDEX gv_random.

          APPEND gs_grup2 TO gt_main2.
          DELETE gt_grup2 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup2 INTO gs_grup2 WHERE ulke NE gs_grup1.

            APPEND gs_grup2 TO gt_main2.
            DELETE gt_grup2 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 3.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.


        IF gt_main3 IS INITIAL.

          READ TABLE gt_grup3 INTO gs_grup3 INDEX gv_random.

          APPEND gs_grup3 TO gt_main3.
          DELETE gt_grup3 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup3 INTO gs_grup3 WHERE ulke NE gs_grup1.

            APPEND gs_grup3 TO gt_main3.
            DELETE gt_grup3 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 4.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main4 IS INITIAL.

          READ TABLE gt_grup4 INTO gs_grup4 INDEX gv_random.

          APPEND gs_grup4 TO gt_main4.
          DELETE gt_grup4 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup4 INTO gs_grup4 WHERE ulke NE gs_grup1.

            APPEND gs_grup4 TO gt_main4.
            DELETE gt_grup4 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

    ENDCASE.

  ENDDO.

  gv_maxg = 4.

  DO gv_maxt TIMES.

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
      EXPORTING
        ran_int_max = gv_maxt
        ran_int_min = gv_min
      IMPORTING
        ran_int     = gv_random.

    CASE gv_random.

      WHEN 1.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main1 IS INITIAL.

          READ TABLE gt_grup1 INTO gs_grup1 INDEX gv_random.

          APPEND gs_grup1 TO gt_main1.
          DELETE gt_grup1 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup1 INTO gs_grup1 WHERE ulke NE gs_grup1.

            APPEND gs_grup1 TO gt_main1.
            DELETE gt_grup1 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 2.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.


        IF gt_main2 IS INITIAL.

          READ TABLE gt_grup2 INTO gs_grup2 INDEX gv_random.

          APPEND gs_grup2 TO gt_main2.
          DELETE gt_grup2 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup2 INTO gs_grup2 WHERE ulke NE gs_grup1.

            APPEND gs_grup2 TO gt_main2.
            DELETE gt_grup2 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 3.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.


        IF gt_main3 IS INITIAL.

          READ TABLE gt_grup3 INTO gs_grup3 INDEX gv_random.

          APPEND gs_grup3 TO gt_main3.
          DELETE gt_grup3 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup3 INTO gs_grup3 WHERE ulke NE gs_grup1.

            APPEND gs_grup3 TO gt_main3.
            DELETE gt_grup3 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 4.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main4 IS INITIAL.

          READ TABLE gt_grup4 INTO gs_grup4 INDEX gv_random.

          APPEND gs_grup4 TO gt_main4.
          DELETE gt_grup4 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup4 INTO gs_grup4 WHERE ulke NE gs_grup1.

            APPEND gs_grup4 TO gt_main4.
            DELETE gt_grup4 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

    ENDCASE.

  ENDDO.

  gv_maxg = 4.

  DO gv_maxt TIMES.

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
      EXPORTING
        ran_int_max = gv_maxt
        ran_int_min = gv_min
      IMPORTING
        ran_int     = gv_random.

    CASE gv_random.

      WHEN 1.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main1 IS INITIAL.

          READ TABLE gt_grup1 INTO gs_grup1 INDEX gv_random.

          APPEND gs_grup1 TO gt_main1.
          DELETE gt_grup1 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup1 INTO gs_grup1 WHERE ulke NE gs_grup1.

            APPEND gs_grup1 TO gt_main1.
            DELETE gt_grup1 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 2.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.


        IF gt_main2 IS INITIAL.

          READ TABLE gt_grup2 INTO gs_grup2 INDEX gv_random.

          APPEND gs_grup2 TO gt_main2.
          DELETE gt_grup2 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup2 INTO gs_grup2 WHERE ulke NE gs_grup1.

            APPEND gs_grup2 TO gt_main2.
            DELETE gt_grup2 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 3.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main3 IS INITIAL.

          READ TABLE gt_grup3 INTO gs_grup3 INDEX gv_random.

          APPEND gs_grup3 TO gt_main3.
          DELETE gt_grup3 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup3 INTO gs_grup3 WHERE ulke NE gs_grup1.

            APPEND gs_grup3 TO gt_main3.
            DELETE gt_grup3 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

      WHEN 4.

        CALL FUNCTION 'QF05_RANDOM_INTEGER'
          EXPORTING
            ran_int_max = gv_maxg
            ran_int_min = gv_min
          IMPORTING
            ran_int     = gv_random.

        IF gt_main4 IS INITIAL.

          READ TABLE gt_grup4 INTO gs_grup4 INDEX gv_random.

          APPEND gs_grup4 TO gt_main4.
          DELETE gt_grup4 INDEX gv_random.

          gv_maxg -= 1.

        ELSE.

          LOOP AT gt_grup4 INTO gs_grup4 WHERE ulke NE gs_grup1.

            APPEND gs_grup4 TO gt_main4.
            DELETE gt_grup4 INDEX gv_random.

          ENDLOOP.

          gv_maxg -= 1.

        ENDIF.

    ENDCASE.

  ENDDO.

  gv_maxg = 4.

  BREAK ottozturk.
