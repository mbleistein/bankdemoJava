      *   Rocket COBOL  12.0.00230
      *   BMS Screen Painter
      *   MapSet Name   DFHZSGM
      *   Date Created  10/02/2026
      *   Time Created  14:32:27

      *  Input Data For Map CSGM
         01 CSGMI REDEFINES MAPAREA.
            03 FILLER                         PIC X(12).
            03 VAR01L                         PIC S9(4) COMP.
            03 VAR01F                         PIC X.
            03 FILLER REDEFINES VAR01F.
               05 VAR01A                         PIC X.
            03 FILLER                         PIC X(4).
            03 VAR01I                         PIC X(20).
            03 TXT00L                         PIC S9(4) COMP.
            03 TXT00F                         PIC X.
            03 FILLER REDEFINES TXT00F.
               05 TXT00A                         PIC X.
            03 FILLER                         PIC X(4).
            03 TXT00I                         PIC X(39).
            03 TXT06L                         PIC S9(4) COMP.
            03 TXT06F                         PIC X.
            03 FILLER REDEFINES TXT06F.
               05 TXT06A                         PIC X.
            03 FILLER                         PIC X(4).
            03 TXT06I                         PIC X(61).

      *  Output Data For Map CSGM
         01 CSGMO REDEFINES CSGMI.
            03 FILLER                         PIC X(12).
            03 FILLER                         PIC X(3).
            03 VAR01C                         PIC X.
            03 VAR01P                         PIC X.
            03 VAR01H                         PIC X.
            03 VAR01V                         PIC X.
            03 VAR01O                         PIC X(20).
            03 FILLER                         PIC X(3).
            03 TXT00C                         PIC X.
            03 TXT00P                         PIC X.
            03 TXT00H                         PIC X.
            03 TXT00V                         PIC X.
            03 TXT00O                         PIC X(39).
            03 FILLER                         PIC X(3).
            03 TXT06C                         PIC X.
            03 TXT06P                         PIC X.
            03 TXT06H                         PIC X.
            03 TXT06V                         PIC X.
            03 TXT06O                         PIC X(61).

