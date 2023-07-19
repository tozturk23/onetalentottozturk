*&---------------------------------------------------------------------*
*& Report ZOT_08_DENEME_P1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_08_DENEME_P1.

DATA: gv_numc TYPE n,
      gv_quan TYPE quant,
      gv_i TYPE i,
      gv_p TYPE p,
      gv_str TYPE string,
      gv_x TYPE x,
      gv_d TYPE d,
      lv_date1 TYPE sy-datum,
      lv_date2 TYPE sy-datum.

START-OF-SELECTION.

lv_date1 = '20231231'.
lv_date2 = '20030307'.
*
gv_i = 5.
gv_p = 3.
*gv_str = 'jdıosajdıosagyuodıoşdsaydhıosahgudosauhpeyeyyeqwoıyqueoısadogsaydsdrtfgyhujıhuygtrfde6rfthyujııjhuytrfdftgyhujkooesayueıwqgudhsadhusaodusghjdkgsahjdkgsahudywqquydusaıohdusalhjdklhdjskahduwuqıdhuskaldhsjkaldhwuqıhdskaldhskalçmvljşklşdajdsadj'.
*gv_x = 99999999.
*gv_x = 100000000.
*gv_d = 2.
*
*DATA(lv_res) = lv_date1+0(4) - lv_date2+0(4).
*
*lv_date2 += 1.
*
*WRITE: lv_date2.

DATA(gv_res) = lv_date1 - lv_date2 + 1.

WRITE: gv_res.
