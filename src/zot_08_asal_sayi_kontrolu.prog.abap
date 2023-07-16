*&---------------------------------------------------------------------*
*& Report ZOT_08_ASAL_SAYI_KONTROLU
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_08_ASAL_SAYI_KONTROLU.

PARAMETERS: p_num TYPE numc5 OBLIGATORY.

DATA: gv_res TYPE p,
      gv_mod TYPE i,
      gv_num TYPE p,
      gv_tag TYPE i.

START-OF-SELECTION.

IF p_num > 10000.

MESSAGE: '0-10000 arasında bir sayı giriniz!' TYPE 'I'.

ELSE.

gv_num = 2.

WHILE gv_num LE p_num.

gv_mod = 2.

gv_tag = 0.

WHILE gv_mod < gv_num.

gv_res = gv_num MOD gv_mod.

IF gv_res EQ 0.

WRITE: / gv_num.

WRITE: 'Asal sayı değildir'.

gv_tag = 1.

EXIT.

ENDIF.

gv_mod += 1.

ENDWHILE.

IF gv_tag = 0.

WRITE: / gv_num.

WRITE: 'Asal Sayıdır'.

ENDIF.

gv_num += 1.

ENDWHILE.

ENDIF.
