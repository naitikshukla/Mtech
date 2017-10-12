PROJECT {
  NAME       = fuzzy-CA-2B-fangming.ftl;
  TITLE      = untitled;
  SHELL      = ON_LINE;
  AUDIT { TIMESTAMP = 1506679488; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {Created} }
  AUDIT { TIMESTAMP = 1506682654; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {Last Edit} }
  SHELLOPTIONS {
    ONLINE_CODE         = ON;
    ONLINE_TRACE_BUFFER = (OFF, PAR(0));
    COMMENTS            = ON;
    FTL_BUFFER          = (OFF, PAR(1));
    PASSWORD            = OFF;
    PUBLIC_IO           = ON;
    FAST_CMBF           = OFF;
    BTYPE               = DOUBLE;
    C_TYPE              = ANSI;
  } /* SHELLOPTIONS */
  MODEL {
    VARIABLE_SECTION {
      LVAR {
        NAME       = age;
        BASEVAR    = years;
        LVRANGE    = MIN(0.18), MAX(1.0), MINDEF(0), MAXDEF(65535), DEFAULT(0.18);
        RESOLUTION = XGRID(0.082), YGRID(0.1), SNAPTOGRID(OFF);
        COLOR      = RED (0), GREEN (128), BLUE (0);
        INPUT      = CMBF;
        POS        = -1480, -1174;
        TERM {
          TERMNAME = young;
          POINTS   = (0.18, 1.0),
                     (0.344, 1.0),
                     (0.508, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (255), GREEN (0), BLUE (0);
        }
        TERM {
          TERMNAME = middle;
          POINTS   = (0.18, 0.0),
                     (0.344, 0.0),
                     (0.508, 1.0),
                     (0.672, 0.0),
                     (1.0, 0.0);
          SHAPE    = (S_SHAPE, PAR (0.5));
          COLOR    = RED (0), GREEN (128), BLUE (0);
        }
        TERM {
          TERMNAME = old;
          POINTS   = (0.18, 0.0),
                     (0.508, 0.0),
                     (0.68378, 1.0),
                     (0.88006, 0.0),
                     (1.0, 0.0);
          SHAPE    = (S_SHAPE, PAR (0.67));
          COLOR    = RED (0), GREEN (0), BLUE (255);
        }
        TERM {
          TERMNAME = very_old;
          POINTS   = (0.18, 0.0),
                     (0.74048, 0.0),
                     (0.836, 1.0),
                     (1.0, 1.0);
          SHAPE    = LINEAR;
          COLOR    = RED (128), GREEN (0), BLUE (0);
        }
      }  /* LVAR */
      LVAR {
        NAME       = avtrans;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(1.0), MINDEF(0), MAXDEF(65535), DEFAULT(0.0);
        RESOLUTION = XGRID(0.1), YGRID(0.1), SNAPTOGRID(OFF);
        COLOR      = RED (255), GREEN (0), BLUE (0);
        INPUT      = CMBF;
        POS        = -1487, -1477;
        TERM {
          TERMNAME = low;
          POINTS   = (0.0, 1.0),
                     (0.25248, 1.0),
                     (0.5, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (255), GREEN (0), BLUE (0);
        }
        TERM {
          TERMNAME = medium;
          POINTS   = (0.0, 0.0),
                     (0.2, 0.0),
                     (0.55934, 1.0),
                     (0.75, 0.0),
                     (1.0, 0.0);
          SHAPE    = (S_SHAPE, PAR (0.56));
          COLOR    = RED (0), GREEN (128), BLUE (0);
        }
        TERM {
          TERMNAME = high;
          POINTS   = (0.0, 0.0),
                     (0.5, 0.0),
                     (0.75, 1.0),
                     (1.0, 1.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (0), BLUE (255);
        }
      }  /* LVAR */
      LVAR {
        NAME       = education;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(3.0), MINDEF(0), MAXDEF(3), DEFAULT(0.0);
        COLOR      = RED (255), GREEN (0), BLUE (255);
        INPUT      = CATEGORICAL;
        POS        = -1485, -1216;
        TERM {
          TERMNAME = postgrad;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = professional;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = secondary;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = tertiary;
          LEVEL    = 1;
        }
      }  /* LVAR */
      LVAR {
        NAME       = gender;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(1.0), MINDEF(0), MAXDEF(1), DEFAULT(0.0);
        COLOR      = RED (0), GREEN (0), BLUE (128);
        INPUT      = CATEGORICAL;
        POS        = -1483, -1296;
        TERM {
          TERMNAME = Male;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = Female;
          LEVEL    = 1;
        }
      }  /* LVAR */
      LVAR {
        NAME       = income;
        BASEVAR    = SGD;
        LVRANGE    = MIN(0.0), MAX(1.0), MINDEF(0), MAXDEF(65535), DEFAULT(0.0);
        RESOLUTION = XGRID(0.1), YGRID(0.1), SNAPTOGRID(OFF);
        COLOR      = RED (128), GREEN (255), BLUE (0);
        INPUT      = CMBF;
        POS        = -1480, -1127;
        TERM {
          TERMNAME = low;
          POINTS   = (0.0, 1.0),
                     (0.25, 1.0),
                     (0.5, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (255), GREEN (0), BLUE (0);
        }
        TERM {
          TERMNAME = medium;
          POINTS   = (0.0, 0.0),
                     (0.25, 0.0),
                     (0.49364, 1.0),
                     (0.7659, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (128), BLUE (0);
        }
        TERM {
          TERMNAME = high;
          POINTS   = (0.0, 0.0),
                     (0.47328, 0.0),
                     (0.75, 1.0),
                     (1.0, 1.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (0), BLUE (255);
        }
      }  /* LVAR */
      LVAR {
        NAME       = mstatus;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(3.0), MINDEF(0), MAXDEF(3), DEFAULT(0.0);
        COLOR      = RED (255), GREEN (0), BLUE (128);
        INPUT      = CATEGORICAL;
        POS        = -1484, -1252;
        TERM {
          TERMNAME = married;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = widow;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = single;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = divorced;
          LEVEL    = 1;
        }
      }  /* LVAR */
      LVAR {
        NAME       = mthly_bal;
        BASEVAR    = SGD;
        LVRANGE    = MIN(0.0), MAX(1.0), MINDEF(0), MAXDEF(65535), DEFAULT(0.0);
        RESOLUTION = XGRID(0.1), YGRID(0.1), SNAPTOGRID(OFF);
        COLOR      = RED (0), GREEN (0), BLUE (255);
        INPUT      = CMBF;
        POS        = -1485, -1431;
        TERM {
          TERMNAME = low;
          POINTS   = (0.0, 1.0),
                     (0.25, 1.0),
                     (0.5, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (255), GREEN (0), BLUE (0);
        }
        TERM {
          TERMNAME = medium;
          POINTS   = (0.0, 0.0),
                     (0.25, 0.0),
                     (0.5, 1.0),
                     (0.75, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (128), BLUE (0);
        }
        TERM {
          TERMNAME = high;
          POINTS   = (0.0, 0.0),
                     (0.5, 0.0),
                     (0.75, 1.0),
                     (1.0, 1.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (0), BLUE (255);
        }
      }  /* LVAR */
      LVAR {
        NAME       = occupation;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(7.0), MINDEF(0), MAXDEF(7), DEFAULT(0.0);
        COLOR      = RED (0), GREEN (128), BLUE (128);
        INPUT      = CATEGORICAL;
        POS        = -1486, -1334;
        TERM {
          TERMNAME = construct;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = finance;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = government;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = IT;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = legal;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = manuf;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = medicine;
          LEVEL    = 1;
        }
        TERM {
          TERMNAME = retired;
          LEVEL    = 1;
        }
      }  /* LVAR */
      LVAR {
        NAME       = Acct_Activity;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(1.0), MINDEF(0), MAXDEF(65535), DEFAULT(0.0);
        RESOLUTION = XGRID(0.1), YGRID(0.1), SNAPTOGRID(OFF);
        COLOR      = RED (128), GREEN (0), BLUE (0);
        OUTPUT     = HYPERCOM;
        POS        = -858, -1448;
        TERM {
          TERMNAME = low;
          POINTS   = (0.0, 1.0),
                     (0.25, 1.0),
                     (0.5, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (255), GREEN (0), BLUE (0);
        }
        TERM {
          TERMNAME = medium;
          POINTS   = (0.0, 0.0),
                     (0.25, 0.0),
                     (0.5, 1.0),
                     (0.75, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (128), BLUE (0);
        }
        TERM {
          TERMNAME = high;
          POINTS   = (0.0, 0.0),
                     (0.5, 0.0),
                     (0.75, 1.0),
                     (1.0, 1.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (0), BLUE (255);
        }
      }  /* LVAR */
      LVAR {
        NAME       = edu_age_inc;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(1.0), MINDEF(0), MAXDEF(65535), DEFAULT(0.0);
        RESOLUTION = XGRID(0.1), YGRID(0.1), SNAPTOGRID(OFF);
        COLOR      = RED (128), GREEN (128), BLUE (128);
        OUTPUT     = HYPERCOM;
        POS        = -1079, -1166;
        TERM {
          TERMNAME = low;
          POINTS   = (0.0, 1.0),
                     (0.25, 1.0),
                     (0.5, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (255), GREEN (0), BLUE (0);
        }
        TERM {
          TERMNAME = medium;
          POINTS   = (0.0, 0.0),
                     (0.25, 0.0),
                     (0.5, 1.0),
                     (0.75, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (128), BLUE (0);
        }
        TERM {
          TERMNAME = high;
          POINTS   = (0.0, 0.0),
                     (0.5, 0.0),
                     (0.75, 1.0),
                     (1.0, 1.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (0), BLUE (255);
        }
      }  /* LVAR */
      LVAR {
        NAME       = gender_mstats;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(1.0), MINDEF(0), MAXDEF(65535), DEFAULT(0.0);
        RESOLUTION = XGRID(0.1), YGRID(0.1), SNAPTOGRID(OFF);
        COLOR      = RED (0), GREEN (0), BLUE (0);
        OUTPUT     = HYPERCOM;
        POS        = -1077, -1272;
        TERM {
          TERMNAME = low;
          POINTS   = (0.0, 1.0),
                     (0.25, 1.0),
                     (0.5, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (255), GREEN (0), BLUE (0);
        }
        TERM {
          TERMNAME = medium;
          POINTS   = (0.0, 0.0),
                     (0.25, 0.0),
                     (0.5, 1.0),
                     (0.75, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (128), BLUE (0);
        }
        TERM {
          TERMNAME = high;
          POINTS   = (0.0, 0.0),
                     (0.5, 0.0),
                     (0.75, 1.0),
                     (1.0, 1.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (0), BLUE (255);
        }
      }  /* LVAR */
      LVAR {
        NAME       = Inv_Pot;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(1.0), MINDEF(0), MAXDEF(65535), DEFAULT(0.0);
        RESOLUTION = XGRID(0.1), YGRID(0.1), SNAPTOGRID(OFF);
        COLOR      = RED (255), GREEN (255), BLUE (0);
        OUTPUT     = HYPERCOM;
        POS        = -649, -1400;
        TERM {
          TERMNAME = low;
          POINTS   = (0.0, 1.0),
                     (0.25, 1.0),
                     (0.5, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (255), GREEN (0), BLUE (0);
        }
        TERM {
          TERMNAME = medium;
          POINTS   = (0.0, 0.0),
                     (0.25, 0.0),
                     (0.5, 1.0),
                     (0.75, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (128), BLUE (0);
        }
        TERM {
          TERMNAME = high;
          POINTS   = (0.0, 0.0),
                     (0.5, 0.0),
                     (0.75, 1.0),
                     (1.0, 1.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (0), BLUE (255);
        }
      }  /* LVAR */
      LVAR {
        NAME       = personal_Attrib;
        BASEVAR    = Units;
        LVRANGE    = MIN(0.0), MAX(1.0), MINDEF(0), MAXDEF(65535), DEFAULT(0.0);
        RESOLUTION = XGRID(0.1), YGRID(0.1), SNAPTOGRID(OFF);
        COLOR      = RED (0), GREEN (255), BLUE (255);
        OUTPUT     = HYPERCOM;
        POS        = -859, -1352;
        TERM {
          TERMNAME = low;
          POINTS   = (0.0, 1.0),
                     (0.25, 1.0),
                     (0.5, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (255), GREEN (0), BLUE (0);
        }
        TERM {
          TERMNAME = medium;
          POINTS   = (0.0, 0.0),
                     (0.25, 0.0),
                     (0.5, 1.0),
                     (0.75, 0.0),
                     (1.0, 0.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (128), BLUE (0);
        }
        TERM {
          TERMNAME = high;
          POINTS   = (0.0, 0.0),
                     (0.5, 0.0),
                     (0.75, 1.0),
                     (1.0, 1.0);
          SHAPE    = LINEAR;
          COLOR    = RED (0), GREEN (0), BLUE (255);
        }
      }  /* LVAR */
    }  /* VARIABLE_SECTION */

    OBJECT_SECTION {
      RULEBLOCK {
        GUID = {C20AE0EC-784A-4AAC-BD22-DFF621CA1C1D};
        NAME = RB1;
        COLOR = RED (135), GREEN (206), BLUE (250);
        AUDIT { TIMESTAMP = 1506679681; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleBlock()} }
        AUDIT { TIMESTAMP = 1506679684; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetPosition(-1302, -1472)} }
        AUDIT { TIMESTAMP = 1506679693; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('avtrans', 1)} }
        AUDIT { TIMESTAMP = 1506679750; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('mthly_bal', 2)} }
        AUDIT { TIMESTAMP = 1506679837; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertOutputAt('Acct_Activity', 1)} }
        AUDIT { TIMESTAMP = 1506680558; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetColor(Blue)} }
        AUDIT { TIMESTAMP = 1506681364; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleGroupAt(G1 - 84A42860-989B-457F-91C6-64BBE161F06D)} }
        AUDIT { TIMESTAMP = 1506681507; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRuleGroup(G1 - 84A42860-989B-457F-91C6-64BBE161F06D)} }
        INPUT  = avtrans, mthly_bal;
        OUTPUT = Acct_Activity;
        AGGREGATION = (MIN_MAX, PAR (0.0));
        RESULT_AGGR = MAX;
        POS = -1302, -1472;
        RULEGROUP {
          GUID = {84A42860-989B-457F-91C6-64BBE161F06D};
          NAME = activity;
          AUDIT { TIMESTAMP = 1506681364; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleGroup()} }
          AUDIT { TIMESTAMP = 1506681364; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetName('activity')} }
          AUDIT { TIMESTAMP = 1506681383; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R1 - D783322F-E03C-455C-93F5-78E12A56D32E)} }
          AUDIT { TIMESTAMP = 1506681394; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R1 - D783322F-E03C-455C-93F5-78E12A56D32E)} }
          AUDIT { TIMESTAMP = 1506681404; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R2 - C7BCEFD2-A0D2-4D68-964A-F0151F0DB6F7)} }
          AUDIT { TIMESTAMP = 1506681407; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R2 - C7BCEFD2-A0D2-4D68-964A-F0151F0DB6F7)} }
          AUDIT { TIMESTAMP = 1506681416; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R3 - A123E3D9-96EB-4A80-884C-93BD15FF60EB)} }
          AUDIT { TIMESTAMP = 1506681418; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R3 - A123E3D9-96EB-4A80-884C-93BD15FF60EB)} }
          AUDIT { TIMESTAMP = 1506681427; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R4 - AF99D850-3913-4B6D-ACAC-F73FA7670533)} }
          AUDIT { TIMESTAMP = 1506681432; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R4 - AF99D850-3913-4B6D-ACAC-F73FA7670533)} }
          AUDIT { TIMESTAMP = 1506681442; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R5 - 8EE6AB9A-4E65-4CF8-8028-D63186593757)} }
          AUDIT { TIMESTAMP = 1506681446; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R5 - 8EE6AB9A-4E65-4CF8-8028-D63186593757)} }
          AUDIT { TIMESTAMP = 1506681456; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R6 - C237BBBC-C7CF-4564-A7F4-1F45807153DB)} }
          AUDIT { TIMESTAMP = 1506681466; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R6 - C237BBBC-C7CF-4564-A7F4-1F45807153DB)} }
          AUDIT { TIMESTAMP = 1506681473; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R7 - 4D6136FE-0F00-4A67-AA0E-C2861C2300D6)} }
          AUDIT { TIMESTAMP = 1506681476; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R7 - 4D6136FE-0F00-4A67-AA0E-C2861C2300D6)} }
          AUDIT { TIMESTAMP = 1506681484; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R8 - 993F9E15-2238-4A27-B293-AF7FD20E372A)} }
          AUDIT { TIMESTAMP = 1506681495; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R8 - 993F9E15-2238-4A27-B293-AF7FD20E372A)} }
          AUDIT { TIMESTAMP = 1506681499; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R9 - FFE20601-F45B-424E-A7FA-9C2DE849DD71)} }
          AUDIT { TIMESTAMP = 1506681507; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R9 - FFE20601-F45B-424E-A7FA-9C2DE849DD71)} }
          RULE {
            GUID = {D783322F-E03C-455C-93F5-78E12A56D32E};
            AUDIT { TIMESTAMP = 1506681383; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681383; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('avtrans.high')} }
            AUDIT { TIMESTAMP = 1506681389; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mthly_bal.high')} }
            AUDIT { TIMESTAMP = 1506681394; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Acct_Activity.high')} }
            IF    avtrans = high
              AND mthly_bal = high
            THEN  Acct_Activity = high;
          }  /* RULE */
          RULE {
            GUID = {C7BCEFD2-A0D2-4D68-964A-F0151F0DB6F7};
            AUDIT { TIMESTAMP = 1506681404; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681404; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('avtrans.medium')} }
            AUDIT { TIMESTAMP = 1506681405; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mthly_bal.medium')} }
            AUDIT { TIMESTAMP = 1506681407; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Acct_Activity.medium')} }
            IF    avtrans = medium
              AND mthly_bal = medium
            THEN  Acct_Activity = medium;
          }  /* RULE */
          RULE {
            GUID = {A123E3D9-96EB-4A80-884C-93BD15FF60EB};
            AUDIT { TIMESTAMP = 1506681416; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681416; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('avtrans.low')} }
            AUDIT { TIMESTAMP = 1506681417; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mthly_bal.low')} }
            AUDIT { TIMESTAMP = 1506681418; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Acct_Activity.low')} }
            IF    avtrans = low
              AND mthly_bal = low
            THEN  Acct_Activity = low;
          }  /* RULE */
          RULE {
            GUID = {AF99D850-3913-4B6D-ACAC-F73FA7670533};
            AUDIT { TIMESTAMP = 1506681427; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681427; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('avtrans.high')} }
            AUDIT { TIMESTAMP = 1506681429; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mthly_bal.medium')} }
            AUDIT { TIMESTAMP = 1506681432; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Acct_Activity.medium')} }
            IF    avtrans = high
              AND mthly_bal = medium
            THEN  Acct_Activity = medium;
          }  /* RULE */
          RULE {
            GUID = {8EE6AB9A-4E65-4CF8-8028-D63186593757};
            AUDIT { TIMESTAMP = 1506681442; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681442; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('avtrans.medium')} }
            AUDIT { TIMESTAMP = 1506681444; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mthly_bal.high')} }
            AUDIT { TIMESTAMP = 1506681446; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Acct_Activity.high')} }
            IF    avtrans = medium
              AND mthly_bal = high
            THEN  Acct_Activity = high;
          }  /* RULE */
          RULE {
            GUID = {C237BBBC-C7CF-4564-A7F4-1F45807153DB};
            AUDIT { TIMESTAMP = 1506681456; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681456; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('avtrans.low')} }
            AUDIT { TIMESTAMP = 1506681458; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mthly_bal.high')} }
            AUDIT { TIMESTAMP = 1506681460; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Acct_Activity.low')} }
            AUDIT { TIMESTAMP = 1506681466; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('Acct_Activity.low' with 70)} }
            IF    avtrans = low
              AND mthly_bal = high
            THEN  Acct_Activity = low WITH 0.700;
          }  /* RULE */
          RULE {
            GUID = {4D6136FE-0F00-4A67-AA0E-C2861C2300D6};
            AUDIT { TIMESTAMP = 1506681473; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681473; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('avtrans.low')} }
            AUDIT { TIMESTAMP = 1506681475; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mthly_bal.medium')} }
            AUDIT { TIMESTAMP = 1506681476; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Acct_Activity.low')} }
            IF    avtrans = low
              AND mthly_bal = medium
            THEN  Acct_Activity = low;
          }  /* RULE */
          RULE {
            GUID = {993F9E15-2238-4A27-B293-AF7FD20E372A};
            AUDIT { TIMESTAMP = 1506681484; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681484; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('avtrans.high')} }
            AUDIT { TIMESTAMP = 1506681485; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mthly_bal.low')} }
            AUDIT { TIMESTAMP = 1506681488; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Acct_Activity.low')} }
            AUDIT { TIMESTAMP = 1506681495; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('Acct_Activity.low' with 70)} }
            IF    avtrans = high
              AND mthly_bal = low
            THEN  Acct_Activity = low WITH 0.700;
          }  /* RULE */
          RULE {
            GUID = {FFE20601-F45B-424E-A7FA-9C2DE849DD71};
            AUDIT { TIMESTAMP = 1506681499; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681499; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('avtrans.high')} }
            AUDIT { TIMESTAMP = 1506681502; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {ReplacePremiseTerms('avtrans.high' with 'avtrans.medium')} }
            AUDIT { TIMESTAMP = 1506681504; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mthly_bal.low')} }
            AUDIT { TIMESTAMP = 1506681507; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Acct_Activity.low')} }
            IF    avtrans = medium
              AND mthly_bal = low
            THEN  Acct_Activity = low;
          }  /* RULE */
        }  /* RULEGROUP */
      }  /* RULEBLOCK */
      RULEBLOCK {
        GUID = {7C9AB3C2-68E4-42E8-9A90-A3B17B238769};
        NAME = RB2;
        COLOR = RED (135), GREEN (206), BLUE (250);
        AUDIT { TIMESTAMP = 1506680030; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleBlock()} }
        AUDIT { TIMESTAMP = 1506680041; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetPosition(-1304, -1294)} }
        AUDIT { TIMESTAMP = 1506680044; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('gender', 1)} }
        AUDIT { TIMESTAMP = 1506680050; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('mstatus', 2)} }
        AUDIT { TIMESTAMP = 1506680083; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertOutputAt('gender_mstats', 1)} }
        AUDIT { TIMESTAMP = 1506680561; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetColor(Blue)} }
        AUDIT { TIMESTAMP = 1506681527; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleGroupAt(G1 - F9AAC3D0-8523-4B54-8259-937C8E586A1B)} }
        AUDIT { TIMESTAMP = 1506681935; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRuleGroup(G1 - F9AAC3D0-8523-4B54-8259-937C8E586A1B)} }
        INPUT  = gender, mstatus;
        OUTPUT = gender_mstats;
        AGGREGATION = (MIN_MAX, PAR (0.0));
        RESULT_AGGR = MAX;
        POS = -1304, -1294;
        RULEGROUP {
          GUID = {F9AAC3D0-8523-4B54-8259-937C8E586A1B};
          NAME = rules;
          AUDIT { TIMESTAMP = 1506681527; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleGroup()} }
          AUDIT { TIMESTAMP = 1506681527; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetName('rules')} }
          AUDIT { TIMESTAMP = 1506681802; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R1 - 8B7A3E8F-4CF6-4F82-95E7-E5AEFD112FAB)} }
          AUDIT { TIMESTAMP = 1506681841; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R1 - 8B7A3E8F-4CF6-4F82-95E7-E5AEFD112FAB)} }
          AUDIT { TIMESTAMP = 1506681848; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R2 - F16FD266-96A3-468E-98B2-EE8EEC54EF1F)} }
          AUDIT { TIMESTAMP = 1506681852; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R2 - F16FD266-96A3-468E-98B2-EE8EEC54EF1F)} }
          AUDIT { TIMESTAMP = 1506681862; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R3 - 1A704B02-BFAB-4BE6-9A62-C4FCE83A7347)} }
          AUDIT { TIMESTAMP = 1506681866; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R3 - 1A704B02-BFAB-4BE6-9A62-C4FCE83A7347)} }
          AUDIT { TIMESTAMP = 1506681874; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R4 - A5714E78-3B5B-46E2-B8D7-28EE1AA1A7ED)} }
          AUDIT { TIMESTAMP = 1506681883; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R4 - A5714E78-3B5B-46E2-B8D7-28EE1AA1A7ED)} }
          AUDIT { TIMESTAMP = 1506681890; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R5 - 8F1570A1-1899-47C5-AC9C-6197E3E81D52)} }
          AUDIT { TIMESTAMP = 1506681905; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R5 - 8F1570A1-1899-47C5-AC9C-6197E3E81D52)} }
          AUDIT { TIMESTAMP = 1506681906; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R6 - 976816E8-222C-4F7F-B3F9-AC0F731758F3)} }
          AUDIT { TIMESTAMP = 1506681909; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R6 - 976816E8-222C-4F7F-B3F9-AC0F731758F3)} }
          AUDIT { TIMESTAMP = 1506681915; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R7 - 25742146-18D2-4C47-BFE2-07E67F0A9DE4)} }
          AUDIT { TIMESTAMP = 1506681920; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R7 - 25742146-18D2-4C47-BFE2-07E67F0A9DE4)} }
          AUDIT { TIMESTAMP = 1506681928; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R8 - 1239C559-F452-4E1C-8843-B227A0C6CD64)} }
          AUDIT { TIMESTAMP = 1506681935; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R8 - 1239C559-F452-4E1C-8843-B227A0C6CD64)} }
          RULE {
            GUID = {8B7A3E8F-4CF6-4F82-95E7-E5AEFD112FAB};
            AUDIT { TIMESTAMP = 1506681802; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681802; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender.Male')} }
            AUDIT { TIMESTAMP = 1506681824; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mstatus.married')} }
            AUDIT { TIMESTAMP = 1506681837; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('gender_mstats.medium')} }
            AUDIT { TIMESTAMP = 1506681841; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('gender_mstats.medium' with 90)} }
            IF    gender = Male
              AND mstatus = married
            THEN  gender_mstats = medium WITH 0.900;
          }  /* RULE */
          RULE {
            GUID = {F16FD266-96A3-468E-98B2-EE8EEC54EF1F};
            AUDIT { TIMESTAMP = 1506681848; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681848; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender.Male')} }
            AUDIT { TIMESTAMP = 1506681850; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mstatus.single')} }
            AUDIT { TIMESTAMP = 1506681852; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('gender_mstats.high')} }
            IF    gender = Male
              AND mstatus = single
            THEN  gender_mstats = high;
          }  /* RULE */
          RULE {
            GUID = {1A704B02-BFAB-4BE6-9A62-C4FCE83A7347};
            AUDIT { TIMESTAMP = 1506681862; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681862; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender.Male')} }
            AUDIT { TIMESTAMP = 1506681864; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mstatus.widow')} }
            AUDIT { TIMESTAMP = 1506681866; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('gender_mstats.high')} }
            IF    gender = Male
              AND mstatus = widow
            THEN  gender_mstats = high;
          }  /* RULE */
          RULE {
            GUID = {A5714E78-3B5B-46E2-B8D7-28EE1AA1A7ED};
            AUDIT { TIMESTAMP = 1506681874; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681874; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender.Male')} }
            AUDIT { TIMESTAMP = 1506681876; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mstatus.divorced')} }
            AUDIT { TIMESTAMP = 1506681879; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('gender_mstats.high')} }
            AUDIT { TIMESTAMP = 1506681883; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('gender_mstats.high' with 80)} }
            IF    gender = Male
              AND mstatus = divorced
            THEN  gender_mstats = high WITH 0.800;
          }  /* RULE */
          RULE {
            GUID = {8F1570A1-1899-47C5-AC9C-6197E3E81D52};
            AUDIT { TIMESTAMP = 1506681890; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681890; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender.Female')} }
            AUDIT { TIMESTAMP = 1506681892; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mstatus.single')} }
            AUDIT { TIMESTAMP = 1506681894; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('gender_mstats.high')} }
            AUDIT { TIMESTAMP = 1506681905; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('gender_mstats.high' with 80)} }
            IF    gender = Female
              AND mstatus = single
            THEN  gender_mstats = high WITH 0.800;
          }  /* RULE */
          RULE {
            GUID = {976816E8-222C-4F7F-B3F9-AC0F731758F3};
            AUDIT { TIMESTAMP = 1506681906; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681906; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender.Female')} }
            AUDIT { TIMESTAMP = 1506681908; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mstatus.married')} }
            AUDIT { TIMESTAMP = 1506681909; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('gender_mstats.low')} }
            IF    gender = Female
              AND mstatus = married
            THEN  gender_mstats = low;
          }  /* RULE */
          RULE {
            GUID = {25742146-18D2-4C47-BFE2-07E67F0A9DE4};
            AUDIT { TIMESTAMP = 1506681915; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681915; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender.Female')} }
            AUDIT { TIMESTAMP = 1506681918; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mstatus.divorced')} }
            AUDIT { TIMESTAMP = 1506681920; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('gender_mstats.medium')} }
            IF    gender = Female
              AND mstatus = divorced
            THEN  gender_mstats = medium;
          }  /* RULE */
          RULE {
            GUID = {1239C559-F452-4E1C-8843-B227A0C6CD64};
            AUDIT { TIMESTAMP = 1506681928; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681928; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender.Female')} }
            AUDIT { TIMESTAMP = 1506681930; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('mstatus.widow')} }
            AUDIT { TIMESTAMP = 1506681932; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('gender_mstats.high')} }
            AUDIT { TIMESTAMP = 1506681935; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('gender_mstats.high' with 70)} }
            IF    gender = Female
              AND mstatus = widow
            THEN  gender_mstats = high WITH 0.700;
          }  /* RULE */
        }  /* RULEGROUP */
      }  /* RULEBLOCK */
      RULEBLOCK {
        GUID = {8F11F7C3-D7AC-4DF1-844A-0073EED4ADB1};
        NAME = RB3;
        COLOR = RED (135), GREEN (206), BLUE (250);
        AUDIT { TIMESTAMP = 1506680090; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleBlock()} }
        AUDIT { TIMESTAMP = 1506680094; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetPosition(-1304, -1192)} }
        AUDIT { TIMESTAMP = 1506680098; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('education', 1)} }
        AUDIT { TIMESTAMP = 1506680101; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('age', 2)} }
        AUDIT { TIMESTAMP = 1506680104; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('income', 3)} }
        AUDIT { TIMESTAMP = 1506680151; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertOutputAt('edu_age_inc', 1)} }
        AUDIT { TIMESTAMP = 1506680564; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetColor(Blue)} }
        AUDIT { TIMESTAMP = 1506681956; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleGroupAt(G1 - 92206A1F-8671-4FA1-AB3F-880EB9F231F2)} }
        AUDIT { TIMESTAMP = 1506682187; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRuleGroup(G1 - 92206A1F-8671-4FA1-AB3F-880EB9F231F2)} }
        INPUT  = education, age, income;
        OUTPUT = edu_age_inc;
        AGGREGATION = (MIN_MAX, PAR (0.0));
        RESULT_AGGR = MAX;
        POS = -1304, -1192;
        RULEGROUP {
          GUID = {92206A1F-8671-4FA1-AB3F-880EB9F231F2};
          NAME = rules;
          AUDIT { TIMESTAMP = 1506681956; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleGroup()} }
          AUDIT { TIMESTAMP = 1506681956; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetName('rules')} }
          AUDIT { TIMESTAMP = 1506681973; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R1 - 1D32EE0F-5E9A-47FD-80FE-E993FA5CFBA3)} }
          AUDIT { TIMESTAMP = 1506681994; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R1 - 1D32EE0F-5E9A-47FD-80FE-E993FA5CFBA3)} }
          AUDIT { TIMESTAMP = 1506682008; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R2 - 332F96FC-64B9-4EDB-BD22-0996E998A5AD)} }
          AUDIT { TIMESTAMP = 1506682019; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R2 - 332F96FC-64B9-4EDB-BD22-0996E998A5AD)} }
          AUDIT { TIMESTAMP = 1506682026; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R3 - 184D230E-7163-472F-8246-0AEDA7A4CF06)} }
          AUDIT { TIMESTAMP = 1506682031; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R3 - 184D230E-7163-472F-8246-0AEDA7A4CF06)} }
          AUDIT { TIMESTAMP = 1506682043; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R4 - ACF6F16E-A2D2-404D-8F28-76C17F101121)} }
          AUDIT { TIMESTAMP = 1506682049; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R4 - ACF6F16E-A2D2-404D-8F28-76C17F101121)} }
          AUDIT { TIMESTAMP = 1506682058; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R5 - AFEE30A7-8F94-4092-B260-0FC44488544C)} }
          AUDIT { TIMESTAMP = 1506682067; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R5 - AFEE30A7-8F94-4092-B260-0FC44488544C)} }
          AUDIT { TIMESTAMP = 1506682084; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R6 - 0607C79F-D4BF-48EA-BC30-8BE2C967A1E4)} }
          AUDIT { TIMESTAMP = 1506682091; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R6 - 0607C79F-D4BF-48EA-BC30-8BE2C967A1E4)} }
          AUDIT { TIMESTAMP = 1506682099; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R7 - 93B7CA13-AC38-464E-80CF-7AA3740EB53E)} }
          AUDIT { TIMESTAMP = 1506682103; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R7 - 93B7CA13-AC38-464E-80CF-7AA3740EB53E)} }
          AUDIT { TIMESTAMP = 1506682111; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R8 - 0FAE3990-2978-4861-82D1-98A7E86C418A)} }
          AUDIT { TIMESTAMP = 1506682123; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R8 - 0FAE3990-2978-4861-82D1-98A7E86C418A)} }
          AUDIT { TIMESTAMP = 1506682127; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R9 - 6E1FDF09-7E7B-469B-A5E0-A189F5AB514E)} }
          AUDIT { TIMESTAMP = 1506682138; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R9 - 6E1FDF09-7E7B-469B-A5E0-A189F5AB514E)} }
          AUDIT { TIMESTAMP = 1506682145; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R10 - F1D61BC4-B6DF-419E-8BD9-4C548C4D518A)} }
          AUDIT { TIMESTAMP = 1506682151; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R10 - F1D61BC4-B6DF-419E-8BD9-4C548C4D518A)} }
          AUDIT { TIMESTAMP = 1506682158; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R11 - 6CB7273B-B2A6-482C-8681-724DEDFCE0FD)} }
          AUDIT { TIMESTAMP = 1506682165; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R11 - 6CB7273B-B2A6-482C-8681-724DEDFCE0FD)} }
          AUDIT { TIMESTAMP = 1506682172; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R12 - 3F4F583A-F1DD-4FC9-93B5-029E031FB6D0)} }
          AUDIT { TIMESTAMP = 1506682178; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R12 - 3F4F583A-F1DD-4FC9-93B5-029E031FB6D0)} }
          AUDIT { TIMESTAMP = 1506682184; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R13 - 45BFA167-0E78-4684-BFB6-04DCCBBB60F0)} }
          AUDIT { TIMESTAMP = 1506682187; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R13 - 45BFA167-0E78-4684-BFB6-04DCCBBB60F0)} }
          RULE {
            GUID = {1D32EE0F-5E9A-47FD-80FE-E993FA5CFBA3};
            AUDIT { TIMESTAMP = 1506681973; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506681973; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('education.postgrad')} }
            AUDIT { TIMESTAMP = 1506681975; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.middle')} }
            AUDIT { TIMESTAMP = 1506681977; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.high')} }
            AUDIT { TIMESTAMP = 1506681994; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.high')} }
            IF    age = middle
              AND education = postgrad
              AND income = high
            THEN  edu_age_inc = high;
          }  /* RULE */
          RULE {
            GUID = {332F96FC-64B9-4EDB-BD22-0996E998A5AD};
            AUDIT { TIMESTAMP = 1506682008; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682008; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('education.professional')} }
            AUDIT { TIMESTAMP = 1506682010; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.middle')} }
            AUDIT { TIMESTAMP = 1506682013; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.high')} }
            AUDIT { TIMESTAMP = 1506682014; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.high')} }
            AUDIT { TIMESTAMP = 1506682019; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('edu_age_inc.high' with 90)} }
            IF    age = middle
              AND education = professional
              AND income = high
            THEN  edu_age_inc = high WITH 0.900;
          }  /* RULE */
          RULE {
            GUID = {184D230E-7163-472F-8246-0AEDA7A4CF06};
            AUDIT { TIMESTAMP = 1506682026; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682026; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('education.secondary')} }
            AUDIT { TIMESTAMP = 1506682027; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.middle')} }
            AUDIT { TIMESTAMP = 1506682029; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.high')} }
            AUDIT { TIMESTAMP = 1506682031; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.medium')} }
            IF    age = middle
              AND education = secondary
              AND income = high
            THEN  edu_age_inc = medium;
          }  /* RULE */
          RULE {
            GUID = {ACF6F16E-A2D2-404D-8F28-76C17F101121};
            AUDIT { TIMESTAMP = 1506682043; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682043; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('education.tertiary')} }
            AUDIT { TIMESTAMP = 1506682045; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.middle')} }
            AUDIT { TIMESTAMP = 1506682049; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.low')} }
            IF    age = middle
              AND education = tertiary
            THEN  edu_age_inc = low;
          }  /* RULE */
          RULE {
            GUID = {AFEE30A7-8F94-4092-B260-0FC44488544C};
            AUDIT { TIMESTAMP = 1506682058; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682058; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.old')} }
            AUDIT { TIMESTAMP = 1506682060; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.high')} }
            AUDIT { TIMESTAMP = 1506682067; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.high')} }
            IF    age = old
              AND income = high
            THEN  edu_age_inc = high;
          }  /* RULE */
          RULE {
            GUID = {0607C79F-D4BF-48EA-BC30-8BE2C967A1E4};
            AUDIT { TIMESTAMP = 1506682084; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682084; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.old')} }
            AUDIT { TIMESTAMP = 1506682086; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.medium')} }
            AUDIT { TIMESTAMP = 1506682091; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.medium')} }
            IF    age = old
              AND income = medium
            THEN  edu_age_inc = medium;
          }  /* RULE */
          RULE {
            GUID = {93B7CA13-AC38-464E-80CF-7AA3740EB53E};
            AUDIT { TIMESTAMP = 1506682099; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682099; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.old')} }
            AUDIT { TIMESTAMP = 1506682101; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.low')} }
            AUDIT { TIMESTAMP = 1506682103; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.low')} }
            IF    age = old
              AND income = low
            THEN  edu_age_inc = low;
          }  /* RULE */
          RULE {
            GUID = {0FAE3990-2978-4861-82D1-98A7E86C418A};
            AUDIT { TIMESTAMP = 1506682111; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682111; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.very_old')} }
            AUDIT { TIMESTAMP = 1506682112; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.high')} }
            AUDIT { TIMESTAMP = 1506682117; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.medium')} }
            AUDIT { TIMESTAMP = 1506682123; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('edu_age_inc.medium' with 90)} }
            IF    age = very_old
              AND income = high
            THEN  edu_age_inc = medium WITH 0.900;
          }  /* RULE */
          RULE {
            GUID = {6E1FDF09-7E7B-469B-A5E0-A189F5AB514E};
            AUDIT { TIMESTAMP = 1506682127; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682127; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.very_old')} }
            AUDIT { TIMESTAMP = 1506682129; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.medium')} }
            AUDIT { TIMESTAMP = 1506682131; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.low')} }
            AUDIT { TIMESTAMP = 1506682138; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('edu_age_inc.low' with 80)} }
            IF    age = very_old
              AND income = medium
            THEN  edu_age_inc = low WITH 0.800;
          }  /* RULE */
          RULE {
            GUID = {F1D61BC4-B6DF-419E-8BD9-4C548C4D518A};
            AUDIT { TIMESTAMP = 1506682145; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682145; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.old')} }
            AUDIT { TIMESTAMP = 1506682148; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {ReplacePremiseTerms('age.old' with 'age.very_old')} }
            AUDIT { TIMESTAMP = 1506682149; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.low')} }
            AUDIT { TIMESTAMP = 1506682151; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.low')} }
            IF    age = very_old
              AND income = low
            THEN  edu_age_inc = low;
          }  /* RULE */
          RULE {
            GUID = {6CB7273B-B2A6-482C-8681-724DEDFCE0FD};
            AUDIT { TIMESTAMP = 1506682158; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682158; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.young')} }
            AUDIT { TIMESTAMP = 1506682160; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.high')} }
            AUDIT { TIMESTAMP = 1506682165; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.high')} }
            IF    age = young
              AND income = high
            THEN  edu_age_inc = high;
          }  /* RULE */
          RULE {
            GUID = {3F4F583A-F1DD-4FC9-93B5-029E031FB6D0};
            AUDIT { TIMESTAMP = 1506682172; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682172; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.young')} }
            AUDIT { TIMESTAMP = 1506682173; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.medium')} }
            AUDIT { TIMESTAMP = 1506682175; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.medium')} }
            AUDIT { TIMESTAMP = 1506682178; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('edu_age_inc.medium' with 80)} }
            IF    age = young
              AND income = medium
            THEN  edu_age_inc = medium WITH 0.800;
          }  /* RULE */
          RULE {
            GUID = {45BFA167-0E78-4684-BFB6-04DCCBBB60F0};
            AUDIT { TIMESTAMP = 1506682184; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682184; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('age.young')} }
            AUDIT { TIMESTAMP = 1506682185; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('income.low')} }
            AUDIT { TIMESTAMP = 1506682187; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('edu_age_inc.low')} }
            IF    age = young
              AND income = low
            THEN  edu_age_inc = low;
          }  /* RULE */
        }  /* RULEGROUP */
      }  /* RULEBLOCK */
      RULEBLOCK {
        GUID = {92718B7A-11CC-4456-BAAB-3619FD7FE6F1};
        NAME = RB4;
        COLOR = RED (144), GREEN (238), BLUE (144);
        AUDIT { TIMESTAMP = 1506680176; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleBlock()} }
        AUDIT { TIMESTAMP = 1506680186; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('Acct_Activity', 1)} }
        AUDIT { TIMESTAMP = 1506680195; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('personal_Attrib', 2)} }
        AUDIT { TIMESTAMP = 1506680211; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {RemoveInput('personal_Attrib')} }
        AUDIT { TIMESTAMP = 1506680213; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {RemoveInput('Acct_Activity')} }
        AUDIT { TIMESTAMP = 1506680224; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('gender_mstats', 1)} }
        AUDIT { TIMESTAMP = 1506680230; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('occupation', 2)} }
        AUDIT { TIMESTAMP = 1506680234; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {RemoveInput('gender_mstats')} }
        AUDIT { TIMESTAMP = 1506680237; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('gender_mstats', 2)} }
        AUDIT { TIMESTAMP = 1506680242; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('edu_age_inc', 3)} }
        AUDIT { TIMESTAMP = 1506680244; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetPosition(-1087, -1377)} }
        AUDIT { TIMESTAMP = 1506680248; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertOutputAt('personal_Attrib', 1)} }
        AUDIT { TIMESTAMP = 1506680569; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetColor(Green)} }
        AUDIT { TIMESTAMP = 1506682206; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleGroupAt(G1 - 2AEEB147-F900-42FC-9399-854B88678783)} }
        AUDIT { TIMESTAMP = 1506682456; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRuleGroup(G1 - 2AEEB147-F900-42FC-9399-854B88678783)} }
        INPUT  = occupation, gender_mstats, edu_age_inc;
        OUTPUT = personal_Attrib;
        AGGREGATION = (MIN_MAX, PAR (0.0));
        RESULT_AGGR = MAX;
        POS = -1087, -1377;
        RULEGROUP {
          GUID = {2AEEB147-F900-42FC-9399-854B88678783};
          NAME = fin;
          AUDIT { TIMESTAMP = 1506682206; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleGroup()} }
          AUDIT { TIMESTAMP = 1506682206; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetName('fin')} }
          AUDIT { TIMESTAMP = 1506682215; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R1 - F8F00E2C-987E-42B6-A2FF-AC811DA9746C)} }
          AUDIT { TIMESTAMP = 1506682219; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R1 - F8F00E2C-987E-42B6-A2FF-AC811DA9746C)} }
          AUDIT { TIMESTAMP = 1506682236; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R2 - 90EEA616-A36D-475E-A1B2-963E3F378087)} }
          AUDIT { TIMESTAMP = 1506682239; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R2 - 90EEA616-A36D-475E-A1B2-963E3F378087)} }
          AUDIT { TIMESTAMP = 1506682249; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R3 - CDD2189D-08A8-4D72-856E-DA73332E7926)} }
          AUDIT { TIMESTAMP = 1506682251; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R3 - CDD2189D-08A8-4D72-856E-DA73332E7926)} }
          AUDIT { TIMESTAMP = 1506682258; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R4 - 8FD83F37-F3BC-4181-9558-674F23B5031E)} }
          AUDIT { TIMESTAMP = 1506682260; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R4 - 8FD83F37-F3BC-4181-9558-674F23B5031E)} }
          AUDIT { TIMESTAMP = 1506682271; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R5 - 6368A5E6-6B44-4A14-BA42-83AFA99E5E19)} }
          AUDIT { TIMESTAMP = 1506682280; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R5 - 6368A5E6-6B44-4A14-BA42-83AFA99E5E19)} }
          AUDIT { TIMESTAMP = 1506682292; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R6 - 81C91F26-B418-42A6-B845-F8F12AA367B1)} }
          AUDIT { TIMESTAMP = 1506682300; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R6 - 81C91F26-B418-42A6-B845-F8F12AA367B1)} }
          AUDIT { TIMESTAMP = 1506682310; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R7 - 9D9A8670-3D6C-425E-AB49-0F0B1C7E7175)} }
          AUDIT { TIMESTAMP = 1506682313; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R7 - 9D9A8670-3D6C-425E-AB49-0F0B1C7E7175)} }
          AUDIT { TIMESTAMP = 1506682322; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R8 - E02C03DC-ABB6-4602-8370-29339EDED40A)} }
          AUDIT { TIMESTAMP = 1506682328; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R8 - E02C03DC-ABB6-4602-8370-29339EDED40A)} }
          AUDIT { TIMESTAMP = 1506682378; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R9 - 46D2DA5F-1C8C-4F21-AAB5-65F76287F4A5)} }
          AUDIT { TIMESTAMP = 1506682389; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R9 - 46D2DA5F-1C8C-4F21-AAB5-65F76287F4A5)} }
          AUDIT { TIMESTAMP = 1506682396; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R10 - D30804C0-FDCE-4962-A3A8-0DF6D9A68C82)} }
          AUDIT { TIMESTAMP = 1506682406; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R10 - D30804C0-FDCE-4962-A3A8-0DF6D9A68C82)} }
          AUDIT { TIMESTAMP = 1506682422; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R11 - 89AB22A5-7246-4688-95F3-64F573A7B0B2)} }
          AUDIT { TIMESTAMP = 1506682432; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R11 - 89AB22A5-7246-4688-95F3-64F573A7B0B2)} }
          AUDIT { TIMESTAMP = 1506682446; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R12 - 816159E3-AA12-4127-80EB-7676F248E486)} }
          AUDIT { TIMESTAMP = 1506682456; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R12 - 816159E3-AA12-4127-80EB-7676F248E486)} }
          RULE {
            GUID = {F8F00E2C-987E-42B6-A2FF-AC811DA9746C};
            AUDIT { TIMESTAMP = 1506682215; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682215; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('occupation.retired')} }
            AUDIT { TIMESTAMP = 1506682219; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.low')} }
            IF    occupation = retired
            THEN  personal_Attrib = low;
          }  /* RULE */
          RULE {
            GUID = {90EEA616-A36D-475E-A1B2-963E3F378087};
            AUDIT { TIMESTAMP = 1506682236; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682236; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('occupation.IT')} }
            AUDIT { TIMESTAMP = 1506682239; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.high')} }
            IF    occupation = IT
            THEN  personal_Attrib = high;
          }  /* RULE */
          RULE {
            GUID = {CDD2189D-08A8-4D72-856E-DA73332E7926};
            AUDIT { TIMESTAMP = 1506682249; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682249; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('occupation.medicine')} }
            AUDIT { TIMESTAMP = 1506682251; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.high')} }
            IF    occupation = medicine
            THEN  personal_Attrib = high;
          }  /* RULE */
          RULE {
            GUID = {8FD83F37-F3BC-4181-9558-674F23B5031E};
            AUDIT { TIMESTAMP = 1506682258; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682258; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('occupation.legal')} }
            AUDIT { TIMESTAMP = 1506682260; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.high')} }
            IF    occupation = legal
            THEN  personal_Attrib = high;
          }  /* RULE */
          RULE {
            GUID = {6368A5E6-6B44-4A14-BA42-83AFA99E5E19};
            AUDIT { TIMESTAMP = 1506682271; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682271; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender_mstats.high')} }
            AUDIT { TIMESTAMP = 1506682272; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('edu_age_inc.medium')} }
            AUDIT { TIMESTAMP = 1506682275; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.high')} }
            AUDIT { TIMESTAMP = 1506682280; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('personal_Attrib.high' with 80)} }
            IF    edu_age_inc = medium
              AND gender_mstats = high
            THEN  personal_Attrib = high WITH 0.800;
          }  /* RULE */
          RULE {
            GUID = {81C91F26-B418-42A6-B845-F8F12AA367B1};
            AUDIT { TIMESTAMP = 1506682292; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682292; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender_mstats.high')} }
            AUDIT { TIMESTAMP = 1506682293; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('edu_age_inc.low')} }
            AUDIT { TIMESTAMP = 1506682296; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.low')} }
            AUDIT { TIMESTAMP = 1506682300; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('personal_Attrib.low' with 70)} }
            IF    edu_age_inc = low
              AND gender_mstats = high
            THEN  personal_Attrib = low WITH 0.700;
          }  /* RULE */
          RULE {
            GUID = {9D9A8670-3D6C-425E-AB49-0F0B1C7E7175};
            AUDIT { TIMESTAMP = 1506682310; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682310; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender_mstats.high')} }
            AUDIT { TIMESTAMP = 1506682311; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('edu_age_inc.high')} }
            AUDIT { TIMESTAMP = 1506682313; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.high')} }
            IF    edu_age_inc = high
              AND gender_mstats = high
            THEN  personal_Attrib = high;
          }  /* RULE */
          RULE {
            GUID = {E02C03DC-ABB6-4602-8370-29339EDED40A};
            AUDIT { TIMESTAMP = 1506682322; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682322; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender_mstats.medium')} }
            AUDIT { TIMESTAMP = 1506682323; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('edu_age_inc.high')} }
            AUDIT { TIMESTAMP = 1506682325; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.high')} }
            AUDIT { TIMESTAMP = 1506682328; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('personal_Attrib.high' with 80)} }
            IF    edu_age_inc = high
              AND gender_mstats = medium
            THEN  personal_Attrib = high WITH 0.800;
          }  /* RULE */
          RULE {
            GUID = {46D2DA5F-1C8C-4F21-AAB5-65F76287F4A5};
            AUDIT { TIMESTAMP = 1506682378; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682378; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender_mstats.medium')} }
            AUDIT { TIMESTAMP = 1506682379; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('edu_age_inc.medium')} }
            AUDIT { TIMESTAMP = 1506682384; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.medium')} }
            AUDIT { TIMESTAMP = 1506682389; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('personal_Attrib.medium' with 90)} }
            IF    edu_age_inc = medium
              AND gender_mstats = medium
            THEN  personal_Attrib = medium WITH 0.900;
          }  /* RULE */
          RULE {
            GUID = {D30804C0-FDCE-4962-A3A8-0DF6D9A68C82};
            AUDIT { TIMESTAMP = 1506682396; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682396; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender_mstats.low')} }
            AUDIT { TIMESTAMP = 1506682399; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('edu_age_inc.medium')} }
            AUDIT { TIMESTAMP = 1506682402; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.low')} }
            AUDIT { TIMESTAMP = 1506682406; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('personal_Attrib.low' with 90)} }
            IF    edu_age_inc = medium
              AND gender_mstats = low
            THEN  personal_Attrib = low WITH 0.900;
          }  /* RULE */
          RULE {
            GUID = {89AB22A5-7246-4688-95F3-64F573A7B0B2};
            AUDIT { TIMESTAMP = 1506682422; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682422; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('edu_age_inc.low')} }
            AUDIT { TIMESTAMP = 1506682424; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender_mstats.medium')} }
            AUDIT { TIMESTAMP = 1506682426; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.low')} }
            AUDIT { TIMESTAMP = 1506682432; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('personal_Attrib.low' with 90)} }
            IF    edu_age_inc = low
              AND gender_mstats = medium
            THEN  personal_Attrib = low WITH 0.900;
          }  /* RULE */
          RULE {
            GUID = {816159E3-AA12-4127-80EB-7676F248E486};
            AUDIT { TIMESTAMP = 1506682446; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682446; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('occupation.construct')} }
            AUDIT { TIMESTAMP = 1506682451; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('edu_age_inc.medium')} }
            AUDIT { TIMESTAMP = 1506682454; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('gender_mstats.medium')} }
            AUDIT { TIMESTAMP = 1506682456; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('personal_Attrib.medium')} }
            IF    occupation = construct
              AND edu_age_inc = medium
              AND gender_mstats = medium
            THEN  personal_Attrib = medium;
          }  /* RULE */
        }  /* RULEGROUP */
      }  /* RULEBLOCK */
      RULEBLOCK {
        GUID = {4CC8AA15-0289-4685-A72D-F308DE959126};
        NAME = RB5;
        COLOR = RED (255), GREEN (99), BLUE (71);
        AUDIT { TIMESTAMP = 1506680267; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleBlock()} }
        AUDIT { TIMESTAMP = 1506680276; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('Acct_Activity', 1)} }
        AUDIT { TIMESTAMP = 1506680282; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertInputAt('personal_Attrib', 2)} }
        AUDIT { TIMESTAMP = 1506680318; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertOutputAt('Inv_Pot', 1)} }
        AUDIT { TIMESTAMP = 1506680573; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetColor(Red)} }
        AUDIT { TIMESTAMP = 1506680585; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetPosition(-863, -1419)} }
        AUDIT { TIMESTAMP = 1506682472; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleGroupAt(G1 - 2C9866EF-4876-480B-868B-69EC29C31B37)} }
        AUDIT { TIMESTAMP = 1506682559; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRuleGroup(G1 - 2C9866EF-4876-480B-868B-69EC29C31B37)} }
        INPUT  = Acct_Activity, personal_Attrib;
        OUTPUT = Inv_Pot;
        AGGREGATION = (MIN_MAX, PAR (0.0));
        RESULT_AGGR = MAX;
        POS = -863, -1419;
        RULEGROUP {
          GUID = {2C9866EF-4876-480B-868B-69EC29C31B37};
          NAME = grand;
          AUDIT { TIMESTAMP = 1506682472; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRuleGroup()} }
          AUDIT { TIMESTAMP = 1506682472; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetName('grand')} }
          AUDIT { TIMESTAMP = 1506682476; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R1 - 008EB3D3-9FAF-4CC9-8464-37DC8A064C13)} }
          AUDIT { TIMESTAMP = 1506682482; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R1 - 008EB3D3-9FAF-4CC9-8464-37DC8A064C13)} }
          AUDIT { TIMESTAMP = 1506682488; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R2 - 5423C5C9-73B9-4CA5-A82D-3C69729451C7)} }
          AUDIT { TIMESTAMP = 1506682491; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R2 - 5423C5C9-73B9-4CA5-A82D-3C69729451C7)} }
          AUDIT { TIMESTAMP = 1506682499; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R3 - A9108167-D647-4F09-B87A-3D9AF0CEFC2D)} }
          AUDIT { TIMESTAMP = 1506682512; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R3 - A9108167-D647-4F09-B87A-3D9AF0CEFC2D)} }
          AUDIT { TIMESTAMP = 1506682517; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R4 - B2F2E6F2-0B4D-44D4-AC95-08AF39ECB109)} }
          AUDIT { TIMESTAMP = 1506682520; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R4 - B2F2E6F2-0B4D-44D4-AC95-08AF39ECB109)} }
          AUDIT { TIMESTAMP = 1506682527; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R5 - 632A577A-9D1A-48B6-8D2E-A118F455654C)} }
          AUDIT { TIMESTAMP = 1506682531; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R5 - 632A577A-9D1A-48B6-8D2E-A118F455654C)} }
          AUDIT { TIMESTAMP = 1506682537; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R6 - 7C79D5DF-5B0E-4F02-A413-570AE58F4F34)} }
          AUDIT { TIMESTAMP = 1506682545; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R6 - 7C79D5DF-5B0E-4F02-A413-570AE58F4F34)} }
          AUDIT { TIMESTAMP = 1506682552; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertRuleAt(R7 - 92BA37F4-7ADA-4791-9C35-D53890F55ECB)} }
          AUDIT { TIMESTAMP = 1506682559; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {EditRule(R7 - 92BA37F4-7ADA-4791-9C35-D53890F55ECB)} }
          RULE {
            GUID = {008EB3D3-9FAF-4CC9-8464-37DC8A064C13};
            AUDIT { TIMESTAMP = 1506682476; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682476; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('Acct_Activity.high')} }
            AUDIT { TIMESTAMP = 1506682480; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('personal_Attrib.high')} }
            AUDIT { TIMESTAMP = 1506682482; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Inv_Pot.high')} }
            IF    Acct_Activity = high
              AND personal_Attrib = high
            THEN  Inv_Pot = high;
          }  /* RULE */
          RULE {
            GUID = {5423C5C9-73B9-4CA5-A82D-3C69729451C7};
            AUDIT { TIMESTAMP = 1506682488; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682488; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('Acct_Activity.high')} }
            AUDIT { TIMESTAMP = 1506682490; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('personal_Attrib.medium')} }
            AUDIT { TIMESTAMP = 1506682491; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Inv_Pot.high')} }
            IF    Acct_Activity = high
              AND personal_Attrib = medium
            THEN  Inv_Pot = high;
          }  /* RULE */
          RULE {
            GUID = {A9108167-D647-4F09-B87A-3D9AF0CEFC2D};
            AUDIT { TIMESTAMP = 1506682499; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682499; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('Acct_Activity.medium')} }
            AUDIT { TIMESTAMP = 1506682501; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('personal_Attrib.high')} }
            AUDIT { TIMESTAMP = 1506682502; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Inv_Pot.high')} }
            AUDIT { TIMESTAMP = 1506682512; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('Inv_Pot.high' with 80)} }
            IF    Acct_Activity = medium
              AND personal_Attrib = high
            THEN  Inv_Pot = high WITH 0.800;
          }  /* RULE */
          RULE {
            GUID = {B2F2E6F2-0B4D-44D4-AC95-08AF39ECB109};
            AUDIT { TIMESTAMP = 1506682517; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682517; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('Acct_Activity.medium')} }
            AUDIT { TIMESTAMP = 1506682518; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('personal_Attrib.medium')} }
            AUDIT { TIMESTAMP = 1506682520; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Inv_Pot.medium')} }
            IF    Acct_Activity = medium
              AND personal_Attrib = medium
            THEN  Inv_Pot = medium;
          }  /* RULE */
          RULE {
            GUID = {632A577A-9D1A-48B6-8D2E-A118F455654C};
            AUDIT { TIMESTAMP = 1506682527; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682527; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('Acct_Activity.low')} }
            AUDIT { TIMESTAMP = 1506682528; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('personal_Attrib.low')} }
            AUDIT { TIMESTAMP = 1506682531; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Inv_Pot.low')} }
            IF    Acct_Activity = low
              AND personal_Attrib = low
            THEN  Inv_Pot = low;
          }  /* RULE */
          RULE {
            GUID = {7C79D5DF-5B0E-4F02-A413-570AE58F4F34};
            AUDIT { TIMESTAMP = 1506682537; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682537; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('Acct_Activity.low')} }
            AUDIT { TIMESTAMP = 1506682539; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('personal_Attrib.medium')} }
            AUDIT { TIMESTAMP = 1506682540; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Inv_Pot.low')} }
            AUDIT { TIMESTAMP = 1506682545; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('Inv_Pot.low' with 80)} }
            IF    Acct_Activity = low
              AND personal_Attrib = medium
            THEN  Inv_Pot = low WITH 0.800;
          }  /* RULE */
          RULE {
            GUID = {92BA37F4-7ADA-4791-9C35-D53890F55ECB};
            AUDIT { TIMESTAMP = 1506682552; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {CreateRule()} }
            AUDIT { TIMESTAMP = 1506682552; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('Acct_Activity.low')} }
            AUDIT { TIMESTAMP = 1506682553; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertPremiseTerms('personal_Attrib.high')} }
            AUDIT { TIMESTAMP = 1506682555; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {InsertConclusionTerms('Inv_Pot.medium')} }
            AUDIT { TIMESTAMP = 1506682559; NAME = E0146990; LICENSE = FT 10006 26 HS; RELEASE = 6.06a; COMMENT {SetConclusionTermDoS('Inv_Pot.medium' with 70)} }
            IF    Acct_Activity = low
              AND personal_Attrib = high
            THEN  Inv_Pot = medium WITH 0.700;
          }  /* RULE */
        }  /* RULEGROUP */
      }  /* RULEBLOCK */
    }  /* OBJECT_SECTION */
  }  /* MODEL */
}  /* PROJECT */ 
/* fuzzyTECH 6.06a Professional Edition */
/* FT 10006 26 HS */
ONLINE {
  TIMESTAMP = 20170929105734UT;
}  /* ONLINE */