000100***************************************************************** scustomp
000200*                                                               * scustomp
000300*   Copyright (C) 1998-2010 Micro Focus. All Rights Reserved.   * scustomp
000400*   This demonstration program is provided for use by users     * scustomp
000500*   of Micro Focus products and may be used, modified and       * scustomp
000600*   distributed as part of your application provided that       * scustomp
000700*   you properly acknowledge the copyright of Micro Focus       * scustomp
000800*   in this material.                                           * scustomp
000900*                                                               * scustomp
001000***************************************************************** scustomp
001100                                                                  scustomp
001200***************************************************************** scustomp
001300* Program:     SCUSTOMP.CBL                                     * scustomp
001400* Layer:       Screen handling                                  * scustomp
001500* Function:    Populate screen titles                           * scustomp
001600***************************************************************** scustomp
001700                                                                  scustomp
001800 IDENTIFICATION DIVISION.                                         scustomp
001900 PROGRAM-ID.                                                      scustomp
002000     SCUSTOMP.                                                    scustomp
002100 DATE-WRITTEN.                                                    scustomp
002200     September 2002.                                              scustomp
002300 DATE-COMPILED.                                                   scustomp
002400     Today.                                                       scustomp
002500                                                                  scustomp
002600 ENVIRONMENT DIVISION.                                            scustomp
002700                                                                  scustomp
002800 DATA DIVISION.                                                   scustomp
002900 WORKING-STORAGE SECTION.                                         scustomp
003000***************************************************************** scustomp
003100* Headings for screens                                          * scustomp
003200*---------------------------------------------------------------* scustomp
003300* The screens have space for two titles, one on the top line,   * scustomp
003400* one on the second line. Each is 50 bytes long and is centered * scustomp
003500* on the line.                                                  * scustomp
003600***************************************************************** scustomp
003700 01  SCREEN-TITLES.                                               scustomp
003800   05  SCREEN-TITLE1                         PIC X(50)            scustomp
003900       VALUE '         Enterprise Developer - BANKDEMO          '.
004000*             00000000011111111112222222222333333333344444444445'.scustomp
004100*      VALUE '12345678901234567890123456789012345678901234567890'.scustomp
004200   05  SCREEN-TITLE2                         PIC X(50)            scustomp
004300       VALUE '         *******************************          '.scustomp
004400*             00000000011111111112222222222333333333344444444445'.scustomp
004500*      VALUE '12345678901234567890123456789012345678901234567890'.scustomp
004600                                                                  scustomp
004700 LINKAGE SECTION.                                                 scustomp
004800 01  LK-SCREEN-TITLES.                                            scustomp
004900   05  LK-SCREEN-TITLE1                      PIC X(50).           scustomp
005000   05  LK-SCREEN-TITLE2                      PIC X(50).           scustomp
005100                                                                  scustomp
005200 PROCEDURE DIVISION USING LK-SCREEN-TITLES.                       scustomp
005300***************************************************************** scustomp
005400* Move the titles from our area to the passed area              * scustomp
005500***************************************************************** scustomp
005600     MOVE SCREEN-TITLES TO LK-SCREEN-TITLES.                      scustomp
005700     GOBACK.                                                      scustomp
005800                                                                  scustomp
005900* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     scustomp
