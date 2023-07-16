*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_00_T_P_MASTR................................*
DATA:  BEGIN OF STATUS_ZOT_00_T_P_MASTR              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_00_T_P_MASTR              .
CONTROLS: TCTRL_ZOT_00_T_P_MASTR
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZOT_08_T_PERS...................................*
DATA:  BEGIN OF STATUS_ZOT_08_T_PERS                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_08_T_PERS                 .
CONTROLS: TCTRL_ZOT_08_T_PERS
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZOT_08_T_P_AILE.................................*
DATA:  BEGIN OF STATUS_ZOT_08_T_P_AILE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_08_T_P_AILE               .
CONTROLS: TCTRL_ZOT_08_T_P_AILE
            TYPE TABLEVIEW USING SCREEN '0006'.
*...processing: ZOT_08_T_P_ATUR.................................*
DATA:  BEGIN OF STATUS_ZOT_08_T_P_ATUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_08_T_P_ATUR               .
CONTROLS: TCTRL_ZOT_08_T_P_ATUR
            TYPE TABLEVIEW USING SCREEN '0007'.
*...processing: ZOT_08_T_P_ETUR.................................*
DATA:  BEGIN OF STATUS_ZOT_08_T_P_ETUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_08_T_P_ETUR               .
CONTROLS: TCTRL_ZOT_08_T_P_ETUR
            TYPE TABLEVIEW USING SCREEN '0008'.
*...processing: ZOT_08_T_P_ITUR.................................*
DATA:  BEGIN OF STATUS_ZOT_08_T_P_ITUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_08_T_P_ITUR               .
CONTROLS: TCTRL_ZOT_08_T_P_ITUR
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: ZOT_08_T_P_MASTR................................*
DATA:  BEGIN OF STATUS_ZOT_08_T_P_MASTR              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_08_T_P_MASTR              .
CONTROLS: TCTRL_ZOT_08_T_P_MASTR
            TYPE TABLEVIEW USING SCREEN '0004'.
*...processing: ZOT_08_T_UNVAN..................................*
DATA:  BEGIN OF STATUS_ZOT_08_T_UNVAN                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_08_T_UNVAN                .
CONTROLS: TCTRL_ZOT_08_T_UNVAN
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZOT_08_T_ZMN....................................*
DATA:  BEGIN OF STATUS_ZOT_08_T_ZMN                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_08_T_ZMN                  .
CONTROLS: TCTRL_ZOT_08_T_ZMN
            TYPE TABLEVIEW USING SCREEN '0009'.
*.........table declarations:.................................*
TABLES: *ZOT_00_T_P_MASTR              .
TABLES: *ZOT_08_T_PERS                 .
TABLES: *ZOT_08_T_P_AILE               .
TABLES: *ZOT_08_T_P_ATUR               .
TABLES: *ZOT_08_T_P_ETUR               .
TABLES: *ZOT_08_T_P_ITUR               .
TABLES: *ZOT_08_T_P_MASTR              .
TABLES: *ZOT_08_T_UNVAN                .
TABLES: *ZOT_08_T_ZMN                  .
TABLES: ZOT_00_T_P_MASTR               .
TABLES: ZOT_08_T_PERS                  .
TABLES: ZOT_08_T_P_AILE                .
TABLES: ZOT_08_T_P_ATUR                .
TABLES: ZOT_08_T_P_ETUR                .
TABLES: ZOT_08_T_P_ITUR                .
TABLES: ZOT_08_T_P_MASTR               .
TABLES: ZOT_08_T_UNVAN                 .
TABLES: ZOT_08_T_ZMN                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
