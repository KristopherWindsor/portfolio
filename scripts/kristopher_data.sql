TRUNCATE `settings`;
INSERT INTO `settings` VALUES
  ("REPORT_START_YEAR_LOOSE", "2011"),
  ("REPORT_START_YEAR_STRICT", "2014"),
  ("REPORT_END_YEAR", "2016"),
  ("REPORT_TITLE", "Kristopher &amp; Rachel Windsor&apos;s Financial Report")
;

TRUNCATE `annual_breakdown`;
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

TRUNCATE `investment_category`;
INSERT INTO `investment_category` VALUES
  ("HOUSING", "Housing fund", 8,
    "Funds set aside for a house downpayment in stocks/bonds. The target is $80,000"),
  ("LC", "Lending Club", 7,
    "Funds invested through Lending Club, a peer-to-peer lending service expected to earn 5-10% annual interest. Repayments are automatically lent out to new borrowers, so the funds are not immediately available"),
  ("CASH", "Cash", 6,
    "This cash is ready to be invested (may be in a money market)"),
  ("MM_RET", "Cash (restricted)", 5,
    "Funds restricted to an employer's 401(k) plan, with limited investment options. Typically it is placed in a low-interest money market"),
  ("MISC_STOCK", "Other Stocks", 4,
    "Funds in misc things such as commodities or individual (hand-picked) companies"),
  ("SMALL_CAP", "US Small-cap", 3,
    "Funds in small and medium-sized US-based companies"),
  ("INTL_STOCK", "International Stocks", 2,
    "Funds in internationally-based companies"),
  ("LARGE_CAP", "US Total Stock Market", 1,
    "Funds in US-based companies, with heavy weighting for the largest companies")
;

TRUNCATE `investment_target`;
INSERT INTO `investment_target` VALUES
  ("HOUSING",    40),
  ("LC",          5),
  ("SMALL_CAP",   10),
  ("INTL_STOCK", 20),
  ("LARGE_CAP",   25)
 ;

TRUNCATE `investments`;
INSERT INTO `investments` VALUES
  (2014, 12, "HOUSING",    0,     0,     0),
  (2014, 12, "LC",         0,     0,     0),
  (2014, 12, "CASH",       0, 21106, 19745),
  (2014, 12, "MM_RET",     0,     0,     0),
  (2014, 12, "MISC_STOCK", 0,     0,  4674),
  (2014, 12, "SMALL_CAP",  0,     0,  4651),
  (2014, 12, "INTL_STOCK", 0,     0,     0),
  (2014, 12, "LARGE_CAP",  0,     0,     0),

  (2015,  1, "HOUSING",    0,     0,     0),
  (2015,  1, "LC",         0,     0,     0),
  (2015,  1, "CASH",       0, 21106, 14553),
  (2015,  1, "MM_RET",     0,     0,     0),
  (2015,  1, "MISC_STOCK", 0,     0,  4674),
  (2015,  1, "SMALL_CAP",  0,     0,  4763),
  (2015,  1, "INTL_STOCK", 0,     0,     0),
  (2015,  1, "LARGE_CAP",  0,     0,  5111),

  (2015,  2, "HOUSING",    0,     0,     0),
  (2015,  2, "LC",         5000,  0,     0),
  (2015,  2, "CASH",       0, 21106,  9570),
  (2015,  2, "MM_RET",     0,     0,     0),
  (2015,  2, "MISC_STOCK", 0,     0,  4637),
  (2015,  2, "SMALL_CAP",  0,     0,  4874),
  (2015,  2, "INTL_STOCK", 0,     0,     0),
  (2015,  2, "LARGE_CAP",  0,     0, 10158),

  (2015,  3, "HOUSING",    0,     0,     0),
  (2015,  3, "LC",         5030,  0,     0),
  (2015,  3, "CASH",       0, 21106, 12799),
  (2015,  3, "MM_RET",     0,     0,   750),
  (2015,  3, "MISC_STOCK", 0,     0,     0),
  (2015,  3, "SMALL_CAP",  0,     0,  6114),
  (2015,  3, "INTL_STOCK", 0,     0,     0),
  (2015,  3, "LARGE_CAP",  0,     0, 14051),

  (2015,  4, "HOUSING",    20114, 0,     0),
  (2015,  4, "LC",         5065,  0,     0),
  (2015,  4, "CASH",       0, 21106,  9369),
  (2015,  4, "MM_RET",     0,     0,  1500),
  (2015,  4, "MISC_STOCK", 0,     0,  2048),
  (2015,  4, "SMALL_CAP",  0,     0,  6241),
  (2015,  4, "INTL_STOCK", 0,     0,     0),
  (2015,  4, "LARGE_CAP",  0,     0, 17760),

  (2015,  5, "HOUSING",    24861, 0,     0),
  (2015,  5, "LC",         5105,  0,     0),
  (2015,  5, "CASH",       0, 21106,  4360),
  (2015,  5, "MM_RET",     0,     0,  2250),
  (2015,  5, "MISC_STOCK", 0,     0,  2194),
  (2015,  5, "SMALL_CAP",  0,     0,  6138),
  (2015,  5, "INTL_STOCK", 0,     0,     0),
  (2015,  5, "LARGE_CAP",  0,     0, 22961),

  (2015,  6, "HOUSING",    24690, 0,     0),
  (2015,  6, "LC",         5150,  0,     0),
  (2015,  6, "CASH",       0, 16167,  4360),
  (2015,  6, "MM_RET",     0,     0,  3000),
  (2015,  6, "MISC_STOCK", 0,     0,  2218),
  (2015,  6, "SMALL_CAP",  0,  4960,  6260),
  (2015,  6, "INTL_STOCK", 0,     0,     0),
  (2015,  6, "LARGE_CAP",  0,     0, 22730),

  (2015,  7, "HOUSING",    24722, 0,     0),
  (2015,  7, "LC",         5200,  0,     0),
  (2015,  7, "CASH",       0, 11200,  4360),
  (2015,  7, "MM_RET",     0,  1560,  3000),
  (2015,  7, "MISC_STOCK", 0,     0,  2214),
  (2015,  7, "SMALL_CAP",  0,  4942,  6236),
  (2015,  7, "INTL_STOCK", 0,  4849,     0),
  (2015,  7, "LARGE_CAP",  0,     0, 22657),

  (2015,  8, "HOUSING",    24752, 0,     0),
  (2015,  8, "LC",         5225,  0,     0),
  (2015,  8, "CASH",       0, 11200,     0),
  (2015,  8, "MM_RET",     0,  8045,  3000),
  (2015,  8, "MISC_STOCK", 0,     0,  1888),
  (2015,  8, "SMALL_CAP",  0,  4836,  6103),
  (2015,  8, "INTL_STOCK", 0,  4820,  4360),
  (2015,  8, "LARGE_CAP",  0,     0, 22658),

  (2015,  9, "HOUSING",    24766, 0,     0),
  (2015,  9, "LC",         5237,  0,     0),
  (2015,  9, "CASH",       0, 10200,     0),
  (2015,  9, "MM_RET",     0,  8045,  3000),
  (2015,  9, "MISC_STOCK", 0,     0,  1819),
  (2015,  9, "SMALL_CAP",  0,  4560,  5754),
  (2015,  9, "INTL_STOCK", 0,  9350,  3858),
  (2015,  9, "LARGE_CAP",  0,     0, 21040)
;
