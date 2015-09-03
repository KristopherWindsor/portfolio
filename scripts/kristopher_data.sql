INSERT INTO `settings` VALUES
  ("REPORT_START_YEAR_LOOSE", "2011"),
  ("REPORT_START_YEAR_STRICT", "2014"),
  ("REPORT_END_YEAR", "2016"),
  ("REPORT_TITLE", "Kristopher &amp; Rachel Windsor&apos;s Financial Report")
;

INSERT INTO `annual_breakdown` VALUES
  (2011, "GROSS_INCOME",    45765),
  (2011, "INVESTMENTS",     0),

  (2012, "GROSS_INCOME",    80000),
  (2012, "INVESTMENTS",     17000),

  (2013, "GROSS_INCOME",    90647),
  (2013, "INVESTMENTS",     20000),

  (2014, "GROSS_INCOME",    113757),
  (2014, "FEDERAL_TAXES",   12831),
  (2014, "STATE_TAXES",     4500),
  (2014, "DONATIONS",       12381),
  (2014, "INVESTMENTS",     5000),
  (2014, "CASH_GROWTH",     20000),

  (2015, "GROSS_INCOME",    130000),
  (2015, "FEDERAL_TAXES",   14000),
  (2015, "STATE_TAXES",     5000),
  (2015, "DONATIONS",       13000),
  (2015, "INVESTMENTS",     35000),
  (2015, "CASH_GROWTH",     0),

  (2016, "GROSS_INCOME",    160000),
  (2016, "FEDERAL_TAXES",   17000),
  (2016, "STATE_TAXES",     6000),
  (2016, "DONATIONS",       16000),
  (2016, "INVESTMENTS",     55000),
  (2016, "CASH_GROWTH",     0)
;

INSERT INTO `investment_category` VALUES
  ("HOUSING", "Housing fund", 8,
    "Funds set aside for a house downpayment in stocks/bonds. The target is $80,000"),
  ("LC", "Lending Club", 7,
    "Funds invested through Lending Club, a peer-to-peer lending service expected to earn 5-10% annual interest. Repayments are automatically lent out to new borrowers, so the funds are not immediately available"),
  ("CASH_RET", "Cash (retirement)", 6,
    "This cash is in retirement accounts, uninvested"),
  ("MM_RET", "Cash (restricted)", 5,
    "Funds restricted to an employer's 401(k) plan, with limited investment options. Typically it is placed in a low-interest money market"),
  ("MISC_RET", "Other Stocks", 4,
    "Funds in misc things such as commodities or individual (hand-picked) companies"),
  ("SCAP_RET", "US Small-cap", 3,
    "Funds in small and medium-sized US-based companies"),
  ("GLOBAL_RET", "International Stocks", 2,
    "Funds in internationally-based companies"),
  ("LCAP_RET", "US Total Stock Market", 1,
    "Funds in US-based companies, with heavy weighting for the largest companies")
;

INSERT INTO `investment_target` VALUES
  ("HOUSING",    40),
  ("LC",          5),
  ("SCAP_RET",   10),
  ("GLOBAL_RET", 20),
  ("LCAP_RET",   25)
 ;

INSERT INTO `investments` VALUES
  (2014, 12, "HOUSING",    0,     0,     0),
  (2014, 12, "LC",         0,     0,     0),
  (2014, 12, "CASH_RET",   0, 21106, 19745),
  (2014, 12, "MM_RET",     0,     0,     0),
  (2014, 12, "MISC_RET",   0,     0,  4674),
  (2014, 12, "SCAP_RET",   0,     0,  4651),
  (2014, 12, "GLOBAL_RET", 0,     0,     0),
  (2014, 12, "LCAP_RET",   0,     0,     0),

  (2015,  1, "HOUSING",    0,     0,     0),
  (2015,  1, "LC",         0,     0,     0),
  (2015,  1, "CASH_RET",   0, 21106, 14553),
  (2015,  1, "MM_RET",     0,     0,     0),
  (2015,  1, "MISC_RET",   0,     0,  4674),
  (2015,  1, "SCAP_RET",   0,     0,  4763),
  (2015,  1, "GLOBAL_RET", 0,     0,     0),
  (2015,  1, "LCAP_RET",   0,     0,  5111),

  (2015,  2, "HOUSING",    0,     0,     0),
  (2015,  2, "LC",         5000,  0,     0),
  (2015,  2, "CASH_RET",   0, 21106,  9570),
  (2015,  2, "MM_RET",     0,     0,     0),
  (2015,  2, "MISC_RET",   0,     0,  4637),
  (2015,  2, "SCAP_RET",   0,     0,  4874),
  (2015,  2, "GLOBAL_RET", 0,     0,     0),
  (2015,  2, "LCAP_RET",   0,     0, 10158),

  (2015,  3, "HOUSING",    0,     0,     0),
  (2015,  3, "LC",         5030,  0,     0),
  (2015,  3, "CASH_RET",   0, 21106, 12799),
  (2015,  3, "MM_RET",     0,     0,   750),
  (2015,  3, "MISC_RET",   0,     0,     0),
  (2015,  3, "SCAP_RET",   0,     0,  6114),
  (2015,  3, "GLOBAL_RET", 0,     0,     0),
  (2015,  3, "LCAP_RET",   0,     0, 14051),

  (2015,  4, "HOUSING",    20114, 0,     0),
  (2015,  4, "LC",         5065,  0,     0),
  (2015,  4, "CASH_RET",   0, 21106,  9369),
  (2015,  4, "MM_RET",     0,     0,  1500),
  (2015,  4, "MISC_RET",   0,     0,  2048),
  (2015,  4, "SCAP_RET",   0,     0,  6241),
  (2015,  4, "GLOBAL_RET", 0,     0,     0),
  (2015,  4, "LCAP_RET",   0,     0, 17760),

  (2015,  5, "HOUSING",    24861, 0,     0),
  (2015,  5, "LC",         5105,  0,     0),
  (2015,  5, "CASH_RET",   0, 21106,  4360),
  (2015,  5, "MM_RET",     0,     0,  2250),
  (2015,  5, "MISC_RET",   0,     0,  2194),
  (2015,  5, "SCAP_RET",   0,     0,  6138),
  (2015,  5, "GLOBAL_RET", 0,     0,     0),
  (2015,  5, "LCAP_RET",   0,     0, 22961),

  (2015,  6, "HOUSING",    24690, 0,     0),
  (2015,  6, "LC",         5150,  0,     0),
  (2015,  6, "CASH_RET",   0, 16167,  4360),
  (2015,  6, "MM_RET",     0,     0,  3000),
  (2015,  6, "MISC_RET",   0,     0,  2218),
  (2015,  6, "SCAP_RET",   0,  4960,  6260),
  (2015,  6, "GLOBAL_RET", 0,     0,     0),
  (2015,  6, "LCAP_RET",   0,     0, 22730),

  (2015,  7, "HOUSING",    24722, 0,     0),
  (2015,  7, "LC",         5200,  0,     0),
  (2015,  7, "CASH_RET",   0, 11200,  4360),
  (2015,  7, "MM_RET",     0,  1560,  3000),
  (2015,  7, "MISC_RET",   0,     0,  2214),
  (2015,  7, "SCAP_RET",   0,  4942,  6236),
  (2015,  7, "GLOBAL_RET", 0,  4849,     0),
  (2015,  7, "LCAP_RET",   0,     0, 22657),

  (2015,  8, "HOUSING",    24752, 0,     0),
  (2015,  8, "LC",         5225,  0,     0),
  (2015,  8, "CASH_RET",   0, 11200,     0),
  (2015,  8, "MM_RET",     0,  8045,  3000),
  (2015,  8, "MISC_RET",   0,     0,  1888),
  (2015,  8, "SCAP_RET",   0,  4836,  6103),
  (2015,  8, "GLOBAL_RET", 0,  4820,  4360),
  (2015,  8, "LCAP_RET",   0,     0, 22658)
;
