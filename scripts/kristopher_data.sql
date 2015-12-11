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
  (2014, "INVESTMENTS",     25000),

  (2015, "GROSS_INCOME",    130000),
  (2015, "FEDERAL_TAXES",   14000),
  (2015, "STATE_TAXES",     5000),
  (2015, "DONATIONS",       13000),
  (2015, "INVESTMENTS",     35000),

  (2016, "GROSS_INCOME",    160000),
  (2016, "FEDERAL_TAXES",   17000),
  (2016, "STATE_TAXES",     6000),
  (2016, "DONATIONS",       16000),
  (2016, "INVESTMENTS",     55000)
;

TRUNCATE `investment_category`;
INSERT INTO `investment_category` VALUES
  ("EMERGENCY", "Emergency fund (est)", 9, "/images/icons/emergency.svg",
    "Approximately, money in the bank less credit card balances. Includes cash for emergencies such as a broken car"),
  ("CASH", "Cash", 8, "/images/icons/cash.svg",
    "This cash is ready to be invested (might be in a money market)"),
  ("HOUSING", "Housing fund", 7, "/images/icons/house.svg",
    "Funds set aside for a house downpayment in cash/bonds. The target is $80,000"),
  ("REAL_EST", "Real estate", 6, "/images/icons/house.svg",
    "Funds in a real estate investment trust (REIT) or REIT index. May be used for actual real estate later"),
  ("LC", "Lending Club", 5, "/images/icons/peer-lending.svg",
    "Funds invested through Lending Club, a peer-to-peer lending service expected to earn 5-10% annual interest. Repayments are automatically lent out to new borrowers, so the funds are not immediately available"),
  ("MISC_STOCK", "Other Stocks", 4, "/images/icons/stock.svg",
    "Funds in misc things such as commodities or individual (hand-picked) companies"),
  ("SMALL_CAP", "US Small-cap", 3, "/images/icons/stock.svg",
    "Funds in small and medium-sized US-based companies"),
  ("INTL_STOCK", "International Stocks", 2, "/images/icons/stock.svg",
    "Funds in internationally-based companies"),
  ("LARGE_CAP", "US Total Stock Market", 1, "/images/icons/stock.svg",
    "Funds in US-based companies, with heavy weighting for the largest companies")
;

TRUNCATE `investment_target`;
INSERT INTO `investment_target` VALUES
  ("HOUSING",    35),
  ("LARGE_CAP",  25),
  ("INTL_STOCK", 20),
  ("REAL_EST",    5),
  ("SMALL_CAP",  10),
  ("LC",          5),
  ("MISC_STOCK",  0),
  ("CASH",        0)
 ;

TRUNCATE `investments`;
INSERT INTO `investments` VALUES
  (2014, 12, "EMERGENCY",  20000, 0,     0),
  (2014, 12, "HOUSING",    0,     0,     0),
  (2014, 12, "LC",         0,     0,     0),
  (2014, 12, "CASH",       0, 21106, 19745),
  (2014, 12, "MISC_STOCK", 0,     0,  4674),
  (2014, 12, "REAL_EST",   0,     0,     0),
  (2014, 12, "SMALL_CAP",  0,     0,  4651),
  (2014, 12, "INTL_STOCK", 0,     0,     0),
  (2014, 12, "LARGE_CAP",  0,     0,     0),

  (2015,  1, "EMERGENCY",  20000, 0,     0),
  (2015,  1, "HOUSING",    0,     0,     0),
  (2015,  1, "LC",         0,     0,     0),
  (2015,  1, "CASH",       0, 21106, 14553),
  (2015,  1, "MISC_STOCK", 0,     0,  4674),
  (2015,  1, "REAL_EST",   0,     0,     0),
  (2015,  1, "SMALL_CAP",  0,     0,  4763),
  (2015,  1, "INTL_STOCK", 0,     0,     0),
  (2015,  1, "LARGE_CAP",  0,     0,  5111),

  (2015,  2, "EMERGENCY",  20000, 0,     0),
  (2015,  2, "HOUSING",    0,     0,     0),
  (2015,  2, "LC",         5000,  0,     0),
  (2015,  2, "CASH",       0, 21106,  9570),
  (2015,  2, "MISC_STOCK", 0,     0,  4637),
  (2015,  2, "REAL_EST",   0,     0,     0),
  (2015,  2, "SMALL_CAP",  0,     0,  4874),
  (2015,  2, "INTL_STOCK", 0,     0,     0),
  (2015,  2, "LARGE_CAP",  0,     0, 10158),

  (2015,  3, "EMERGENCY",  20000, 0,     0),
  (2015,  3, "HOUSING",    0,     0,     0),
  (2015,  3, "LC",         5030,  0,     0),
  (2015,  3, "CASH",       0, 21106, 13549),
  (2015,  3, "MISC_STOCK", 0,     0,     0),
  (2015,  3, "REAL_EST",   0,     0,     0),
  (2015,  3, "SMALL_CAP",  0,     0,  6114),
  (2015,  3, "INTL_STOCK", 0,     0,     0),
  (2015,  3, "LARGE_CAP",  0,     0, 14051),

  (2015,  4, "EMERGENCY",  10000, 0,     0),
  (2015,  4, "HOUSING",    20114, 0,     0),
  (2015,  4, "LC",         5065,  0,     0),
  (2015,  4, "CASH",       0, 21106, 10869),
  (2015,  4, "MISC_STOCK", 0,     0,  2048),
  (2015,  4, "REAL_EST",   0,     0,     0),
  (2015,  4, "SMALL_CAP",  0,     0,  6241),
  (2015,  4, "INTL_STOCK", 0,     0,     0),
  (2015,  4, "LARGE_CAP",  0,     0, 17760),

  (2015,  5, "EMERGENCY",  8000,  0,     0),
  (2015,  5, "HOUSING",    24861, 0,     0),
  (2015,  5, "LC",         5105,  0,     0),
  (2015,  5, "CASH",       0, 21106,  6610),
  (2015,  5, "MISC_STOCK", 0,     0,  2194),
  (2015,  5, "REAL_EST",   0,     0,     0),
  (2015,  5, "SMALL_CAP",  0,     0,  6138),
  (2015,  5, "INTL_STOCK", 0,     0,     0),
  (2015,  5, "LARGE_CAP",  0,     0, 22961),

  (2015,  6, "EMERGENCY",  8000,  0,     0),
  (2015,  6, "HOUSING",    24690, 0,     0),
  (2015,  6, "LC",         5150,  0,     0),
  (2015,  6, "CASH",       0, 16167,  7360),
  (2015,  6, "MISC_STOCK", 0,     0,  2218),
  (2015,  6, "REAL_EST",   0,     0,     0),
  (2015,  6, "SMALL_CAP",  0,  4960,  6260),
  (2015,  6, "INTL_STOCK", 0,     0,     0),
  (2015,  6, "LARGE_CAP",  0,     0, 22730),

  (2015,  7, "EMERGENCY",  8000,  0,     0),
  (2015,  7, "HOUSING",    24722, 0,     0),
  (2015,  7, "LC",         5200,  0,     0),
  (2015,  7, "CASH",       0, 12760,  7360),
  (2015,  7, "MISC_STOCK", 0,     0,  2214),
  (2015,  7, "REAL_EST",   0,     0,     0),
  (2015,  7, "SMALL_CAP",  0,  4942,  6236),
  (2015,  7, "INTL_STOCK", 0,  4849,     0),
  (2015,  7, "LARGE_CAP",  0,     0, 22657),

  (2015,  8, "EMERGENCY",  8000,  0,     0),
  (2015,  8, "HOUSING",    24752, 0,     0),
  (2015,  8, "LC",         5225,  0,     0),
  (2015,  8, "CASH",       0, 19245,  3000),
  (2015,  8, "MISC_STOCK", 0,     0,  1888),
  (2015,  8, "REAL_EST",   0,     0,     0),
  (2015,  8, "SMALL_CAP",  0,  4836,  6103),
  (2015,  8, "INTL_STOCK", 0,  4820,  4360),
  (2015,  8, "LARGE_CAP",  0,     0, 22658),

  (2015,  9, "EMERGENCY",  8000,  0,     0),
  (2015,  9, "HOUSING",    24766, 0,     0),
  (2015,  9, "LC",         5237,  0,     0),
  (2015,  9, "CASH",       0, 14245,  3000),
  (2015,  9, "MISC_STOCK", 0,     0,  1819),
  (2015,  9, "REAL_EST",   0,     0,     0),
  (2015,  9, "SMALL_CAP",  0,  4560,  5754),
  (2015,  9, "INTL_STOCK", 0,  9350,  3858),
  (2015,  9, "LARGE_CAP",  0,     0, 21040),

  (2015, 10, "EMERGENCY",  8000,  0,     0),
  (2015, 10, "HOUSING",    24904, 0,     0),
  (2015, 10, "LC",         5248,  0,     0),
  (2015, 10, "CASH",       0, 14878,  1927),
  (2015, 10, "MISC_STOCK", 0,     0,  1859),
  (2015, 10, "REAL_EST",   0,     0,     0),
  (2015, 10, "SMALL_CAP",  0,  4500,  5834),
  (2015, 10, "INTL_STOCK", 0, 14761,  4018),
  (2015, 10, "LARGE_CAP",  0,     0, 21598),

  (2015, 11, "EMERGENCY",  8000,  0,     0),
  (2015, 11, "HOUSING",    27184, 0,     0),
  (2015, 11, "LC",         5273,  0,     0),
  (2015, 11, "CASH",       0,  9888,  1927),
  (2015, 11, "MISC_STOCK", 0,     0,  1775),
  (2015, 11, "REAL_EST",   0,     0,     0),
  (2015, 11, "SMALL_CAP",  0, 10760,  6187),
  (2015, 11, "INTL_STOCK", 0, 14956,  4086),
  (2015, 11, "LARGE_CAP",  0,  5000, 22862),

  (2015, 12, "EMERGENCY",  10000, 0,     0),
  (2015, 12, "HOUSING",    27247, 0,     0),
  (2015, 12, "LC",         5332,  0,     0),
  (2015, 12, "CASH",       0,  4889,  1927),
  (2015, 12, "MISC_STOCK", 0,     0,  1569),
  (2015, 12, "REAL_EST",   0,     0,     0),
  (2015, 12, "SMALL_CAP",  0,  9137,  6036),
  (2015, 12, "INTL_STOCK", 0, 19685,  4015),
  (2015, 12, "LARGE_CAP",  0,  4989, 22588)
;
