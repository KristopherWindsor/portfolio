INSERT INTO `report` VALUES
  ("ALL", 2014, 2015)
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
  ("CASH_LIQD", "Cash (housing fund)", 9, "LIQUID"),
  ("BONDS_LIQD", "Bonds (housing fund)", 8, "LIQUID"),
  ("LC_LIQD", "Lending Club", 7, "LIQUID"),
  ("CASH_RET", "Cash (retirement)", 6, "RETIREMENT"),
  ("MM_RET", "Cash (restricted)", 5, "RETIREMENT"),
  ("MISC_RET", "Other Stocks", 4, "RETIREMENT"),
  ("SCAP_RET", "US Small-cap", 3, "RETIREMENT"),
  ("GLOBAL_RET", "International Stocks", 2, "RETIREMENT"),
  ("LCAP_RET", "US Total Stock Market", 1, "RETIREMENT")
;

INSERT INTO `investment_target` VALUES
  ("CASH_LIQD",  20),
  ("BONDS_LIQD", 20),
  ("LC_LIQD",     5),
  ("SCAP_RET",   10),
  ("GLOBAL_RET", 20),
  ("LCAP_RET",   25)
 ;

INSERT INTO `investments` VALUES
  (2014, 12, "CASH_LIQD",  0),
  (2014, 12, "BONDS_LIQD", 0),
  (2014, 12, "LC_LIQD",    0),
  (2014, 12, "CASH_RET",   40851),
  (2014, 12, "MM_RET",     0),
  (2014, 12, "MISC_RET",   4674),
  (2014, 12, "SCAP_RET",   4651),
  (2014, 12, "GLOBAL_RET", 0),
  (2014, 12, "LCAP_RET",   0),

  (2015,  1, "CASH_LIQD",  0),
  (2015,  1, "BONDS_LIQD", 0),
  (2015,  1, "LC_LIQD",    0),
  (2015,  1, "CASH_RET",   35659),
  (2015,  1, "MM_RET",     0),
  (2015,  1, "MISC_RET",   4674),
  (2015,  1, "SCAP_RET",   4763),
  (2015,  1, "GLOBAL_RET", 0),
  (2015,  1, "LCAP_RET",   5111),

  (2015,  2, "CASH_LIQD",  0),
  (2015,  2, "BONDS_LIQD", 0),
  (2015,  2, "LC_LIQD",    5000),
  (2015,  2, "CASH_RET",   30676),
  (2015,  2, "MM_RET",     0),
  (2015,  2, "MISC_RET",   4637),
  (2015,  2, "SCAP_RET",   4874),
  (2015,  2, "GLOBAL_RET", 0),
  (2015,  2, "LCAP_RET",   10158),

  (2015,  3, "CASH_LIQD",  0),
  (2015,  3, "BONDS_LIQD", 0),
  (2015,  3, "LC_LIQD",    5030),
  (2015,  3, "CASH_RET",   33905),
  (2015,  3, "MM_RET",     750),
  (2015,  3, "MISC_RET",   0),
  (2015,  3, "SCAP_RET",   6114),
  (2015,  3, "GLOBAL_RET", 0),
  (2015,  3, "LCAP_RET",   14051),

  (2015,  4, "CASH_LIQD",  4245),
  (2015,  4, "BONDS_LIQD", 15869),
  (2015,  4, "LC_LIQD",    5065),
  (2015,  4, "CASH_RET",   30475),
  (2015,  4, "MM_RET",     1500),
  (2015,  4, "MISC_RET",   2048),
  (2015,  4, "SCAP_RET",   6241),
  (2015,  4, "GLOBAL_RET", 0),
  (2015,  4, "LCAP_RET",   17760),

  (2015,  5, "CASH_LIQD",  9245),
  (2015,  5, "BONDS_LIQD", 15616),
  (2015,  5, "LC_LIQD",    5105),
  (2015,  5, "CASH_RET",   25466),
  (2015,  5, "MM_RET",     2250),
  (2015,  5, "MISC_RET",   2194),
  (2015,  5, "SCAP_RET",   6138),
  (2015,  5, "GLOBAL_RET", 0),
  (2015,  5, "LCAP_RET",   22961),

  (2015,  6, "CASH_LIQD",  9245),
  (2015,  6, "BONDS_LIQD", 15445),
  (2015,  6, "LC_LIQD",    5150),
  (2015,  6, "CASH_RET",   20527),
  (2015,  6, "MM_RET",     3000),
  (2015,  6, "MISC_RET",   2218),
  (2015,  6, "SCAP_RET",   11220),
  (2015,  6, "GLOBAL_RET", 0),
  (2015,  6, "LCAP_RET",   22730),

  (2015,  7, "CASH_LIQD",  9245),
  (2015,  7, "BONDS_LIQD", 15477),
  (2015,  7, "LC_LIQD",    5200),
  (2015,  7, "CASH_RET",   15560),
  (2015,  7, "MM_RET",     4560),
  (2015,  7, "MISC_RET",   2214),
  (2015,  7, "SCAP_RET",   11178),
  (2015,  7, "GLOBAL_RET", 4849),
  (2015,  7, "LCAP_RET",   22657),

  (2015,  8, "CASH_LIQD",  9185),
  (2015,  8, "BONDS_LIQD", 15567),
  (2015,  8, "LC_LIQD",    5225),
  (2015,  8, "CASH_RET",   11200),
  (2015,  8, "MM_RET",     11045),
  (2015,  8, "MISC_RET",   1888),
  (2015,  8, "SCAP_RET",   10939),
  (2015,  8, "GLOBAL_RET", 9180),
  (2015,  8, "LCAP_RET",   22658)
;
