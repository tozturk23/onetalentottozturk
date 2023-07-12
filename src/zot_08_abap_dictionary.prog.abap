*&---------------------------------------------------------------------*
*& Report zot_08_abap_dictionary
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_08_abap_dictionary.

*TYPES: BEGIN OF lty_personel,
*         id        TYPE zot_08_e_id,
*         ad        TYPE zot_08_e_ad,
*         departman TYPE zot_08_e_departman,
*         unvan     TYPE zot_08_e_unvan,
*       END OF lty_personel.
*
*DATA: ls_personel_1 TYPE lty_personel,
*DATA: lt_personel_2 TYPE TABLE OF zot_08_s_personel,
*      ls_personel_2 TYPE zot_08_s_personel.
*      lt_personel_3 TYPE zot_08_tt_personel,
*      lt_personel_4 TYPE TABLE OF zot_08_tt_personel.
*
*DATA: ls_personel_n TYPE ZOT_08_TT_PERSONEL,
*      lt_personel_n TYPE TABLE OF ZOT_08_TT_PERSONEL.
*
*lt_personel_2 = VALUE #( (  id = 1
*                         ad = 'Sena Süyün'
*                         yas = 18
*                         departman = 'Stajyer'
*                         ekip = VALUE zot_08_tt_ekip( ( id = 2
*                                                        ad = 'Yusuf Yüksel'  )
*                                                      ( id = 3
*                                                        ad = 'Taha Öztürk'   ) ) ) ).

DATA(lt_personel) = VALUE zot_08_tt_personel( (  id = 1
                         ad = 'Sena Süyün'
                         yas = 18
                         departman = 'Stajyer'
                         ekip = VALUE zot_08_tt_ekip( ( id = 2
                                                        ad = 'Yusuf Yüksel'  )
                                                      ( id = 3
                                                        ad = 'Taha Öztürk'   ) ) ) ).


BREAK ottozturk.
