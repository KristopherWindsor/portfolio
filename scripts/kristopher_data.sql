TRUNCATE `settings`;
INSERT INTO `settings` VALUES
  ("REPORT_START_YEAR_LOOSE", "2011"),
  ("REPORT_START_YEAR_STRICT", "2014"),
  ("REPORT_END_YEAR", "2017"),
  ("REPORT_TITLE", "Kristopher &amp; Rachel Windsor&apos;s Financial Report")
;

TRUNCATE `annual_breakdown`;
INSERT INTO `annual_breakdown` VALUES
  (2011, "GROSS_INCOME",    45765),
  (2011, "SOCIAL_SEC",      8000), #est of all taxes
  (2011, "SAVINGS",         0),

  (2012, "GROSS_INCOME",    80000),
  (2012, "SOCIAL_SEC",      15000), #est of all taxes
  (2012, "SAVINGS",         17000),

  (2013, "GROSS_INCOME",    90726),
  (2013, "SOCIAL_SEC",      20000), #est of all taxes
  (2013, "SAVINGS",         20000),

  (2014, "GROSS_INCOME",    113195),
  (2014, "FEDERAL_TAXES",   12831),
  (2014, "STATE_TAXES",     4500),
  (2014, "SOCIAL_SEC",      9096),
  (2014, "DONATIONS",       12381),
  (2014, "SAVINGS",         31000),

  (2015, "GROSS_INCOME",    130601),
  (2015, "FEDERAL_TAXES",   17249),
  (2015, "STATE_TAXES",     5603),
  (2015, "SOCIAL_SEC",      9200),
  (2015, "DONATIONS",       14630),
  (2015, "SAVINGS",         39000),

  (2016, "GROSS_INCOME",    159000),
  (2016, "FEDERAL_TAXES",   14600),
  (2016, "STATE_TAXES",     5340),
  (2016, "SOCIAL_SEC",      9600),
  (2016, "DONATIONS",       16450), #10300 at end-of-year counted to next year
  (2016, "SAVINGS",         71000),

  (2017, "GROSS_INCOME",    160000),
  (2017, "FEDERAL_TAXES",   21000),
  (2017, "STATE_TAXES",     8000),
  (2017, "SOCIAL_SEC",      11000),
  (2017, "DONATIONS",       17000),
  (2017, "SAVINGS",         60000)
;

-- Keeping quarterly summary in case I put it in a table
-- Dec 2016: Full rebalancing. Repurpose 401(k) for total market funds due to fund expenses.
--     Housing fund is now all bonds instead of 50/50 bonds/cash because home buying is deferred.
--     Commodities allocation changed from 0% to 2% to support regular rebalancing.
--     Cash moved to brokerage account / stocks moved to retirement accounts.
-- Mar 2017: Regular rebalancing. Increase housing fund and commodities.
-- Jun 2017: Regular rebalancing.

TRUNCATE `savings`;
INSERT INTO `savings` VALUES
  (2016,  1,  5500), #late ira
  (2016,  2,  5000), #housing fund
  (2016,  3,  5000), #housing fund
  (2016,  4,  8500), #starting 401(k) 3k per month
  (2016,  5, 14000), #max both iras & 3k to 401(k)
  (2016,  6,  3000), #401(k)
  (2016,  7,  4500), #401(k)
  (2016,  8,  3000), #401(k)
  (2016,  9,  5500), #1.5k 401(k) & 4k housing fund
  (2016, 10,     0),
  (2016, 11, 10000), #bank to housing fund
  (2016, 12,  7000), #bank to housing fund
  (2017,  3, 14000), #9k to 401(k) (ending 3/8) + 11k (max iras) - 16k moved back to bank in dec + 10k bank to housing fund
  (2017,  6, 17000)  #9k to 401(k) + 8k bank to vanguard
;

TRUNCATE `investment_category`;
INSERT INTO `investment_category` VALUES
  ("EMERGENCY", "Emergency fund (est)", 9, "/images/icons/emergency.svg",
    "Approximately, money in the bank less credit card balances. Includes cash for emergencies such as a broken car"),
  ("CASH", "Cash", 8, "/images/icons/cash.svg",
    "This cash is ready to be invested (might be in a money market or temporarily in bonds)"),
  ("HOUSING", "Housing fund", 7, "/images/icons/house.svg",
    "Funds set aside for a house downpayment in cash/bonds. The target is $80,000"),
  ("HIGH_ERN", "High earnings fund", 6, "/images/icons/stock.svg",
    "Funds that are high leverage, high earning, and high yielding. These are high risk, high profit, individually selected stocks, currently IRT, F, and GM"),
  ("LC", "Lending Club", 5, "/images/icons/peer-lending.svg",
    "Funds invested through Lending Club, a peer-to-peer lending service expected to earn 5-10% annual interest. Repayments are automatically lent out to new borrowers, so the funds are not immediately available"),
  ("COMMOD", "Commodities", 4, "/images/icons/commodities.svg",
    "Commodities can include gas / oil, precious metals, water, and investments in raw manufacturing materials, among others"),
  ("SMALL_CAP", "US Small-cap", 3, "/images/icons/startup.svg",
    "Funds in small and medium-sized US-based companies"),
  ("INTL_STOCK", "International Stocks", 2, "/images/icons/world.svg",
    "Funds in internationally-based companies"),
  ("LARGE_CAP", "US Total Stock Market", 1, "/images/icons/usa.svg",
    "Funds in US-based companies, with heavy weighting for the largest companies")
;

TRUNCATE `investment_target`;
INSERT INTO `investment_target` VALUES
  ("LARGE_CAP",  23),
  ("HOUSING",    23),
  ("INTL_STOCK", 18),
  ("HIGH_ERN",   15),
  ("SMALL_CAP",   9),
  ("CASH",        9), # NOT including emergency fund
  ("COMMOD",      3),
  ("LC",          0)
 ;

TRUNCATE `investments`;
INSERT INTO `investments` VALUES
  (2014, 12, "EMERGENCY",  20000, 0,     0),
  (2014, 12, "HOUSING",    0,     0,     0),
  (2014, 12, "LC",         0,     0,     0),
  (2014, 12, "CASH",       0, 21106, 24419),
  (2014, 12, "COMMOD",     0,     0,     0),
  (2014, 12, "HIGH_ERN",   0,     0,     0),
  (2014, 12, "SMALL_CAP",  0,     0,  4651),
  (2014, 12, "INTL_STOCK", 0,     0,     0),
  (2014, 12, "LARGE_CAP",  0,     0,     0),

  (2015,  1, "EMERGENCY",  20000, 0,     0),
  (2015,  1, "HOUSING",    0,     0,     0),
  (2015,  1, "LC",         0,     0,     0),
  (2015,  1, "CASH",       0, 21106, 19227),
  (2015,  1, "COMMOD",     0,     0,     0),
  (2015,  1, "HIGH_ERN",   0,     0,     0),
  (2015,  1, "SMALL_CAP",  0,     0,  4763),
  (2015,  1, "INTL_STOCK", 0,     0,     0),
  (2015,  1, "LARGE_CAP",  0,     0,  5111),

  (2015,  2, "EMERGENCY",  20000, 0,     0),
  (2015,  2, "HOUSING",    0,     0,     0),
  (2015,  2, "LC",         5000,  0,     0),
  (2015,  2, "CASH",       0, 21106, 14207),
  (2015,  2, "COMMOD",     0,     0,     0),
  (2015,  2, "HIGH_ERN",   0,     0,     0),
  (2015,  2, "SMALL_CAP",  0,     0,  4874),
  (2015,  2, "INTL_STOCK", 0,     0,     0),
  (2015,  2, "LARGE_CAP",  0,     0, 10158),

  (2015,  3, "EMERGENCY",  20000, 0,     0),
  (2015,  3, "HOUSING",    0,     0,     0),
  (2015,  3, "LC",         5030,  0,     0),
  (2015,  3, "CASH",       0, 21106, 13549),
  (2015,  3, "COMMOD",     0,     0,     0),
  (2015,  3, "HIGH_ERN",   0,     0,     0),
  (2015,  3, "SMALL_CAP",  0,     0,  6114),
  (2015,  3, "INTL_STOCK", 0,     0,     0),
  (2015,  3, "LARGE_CAP",  0,     0, 14051),

  (2015,  4, "EMERGENCY",  10000, 0,     0),
  (2015,  4, "HOUSING",    20114, 0,     0),
  (2015,  4, "LC",         5065,  0,     0),
  (2015,  4, "CASH",       0, 21106, 10869),
  (2015,  4, "COMMOD",     0,     0,  2048),
  (2015,  4, "HIGH_ERN",   0,     0,     0),
  (2015,  4, "SMALL_CAP",  0,     0,  6241),
  (2015,  4, "INTL_STOCK", 0,     0,     0),
  (2015,  4, "LARGE_CAP",  0,     0, 17760),

  (2015,  5, "EMERGENCY",  8000,  0,     0),
  (2015,  5, "HOUSING",    24861, 0,     0),
  (2015,  5, "LC",         5105,  0,     0),
  (2015,  5, "CASH",       0, 21106,  6610),
  (2015,  5, "COMMOD",     0,     0,  2194),
  (2015,  5, "HIGH_ERN",   0,     0,     0),
  (2015,  5, "SMALL_CAP",  0,     0,  6138),
  (2015,  5, "INTL_STOCK", 0,     0,     0),
  (2015,  5, "LARGE_CAP",  0,     0, 22961),

  (2015,  6, "EMERGENCY",  8000,  0,     0),
  (2015,  6, "HOUSING",    24690, 0,     0),
  (2015,  6, "LC",         5150,  0,     0),
  (2015,  6, "CASH",       0, 16167,  7360),
  (2015,  6, "COMMOD",     0,     0,  2218),
  (2015,  6, "HIGH_ERN",   0,     0,     0),
  (2015,  6, "SMALL_CAP",  0,  4960,  6260),
  (2015,  6, "INTL_STOCK", 0,     0,     0),
  (2015,  6, "LARGE_CAP",  0,     0, 22730),

  (2015,  7, "EMERGENCY",  8000,  0,     0),
  (2015,  7, "HOUSING",    24722, 0,     0),
  (2015,  7, "LC",         5200,  0,     0),
  (2015,  7, "CASH",       0, 12760,  7360),
  (2015,  7, "COMMOD",     0,     0,  2214),
  (2015,  7, "HIGH_ERN",   0,     0,     0),
  (2015,  7, "SMALL_CAP",  0,  4942,  6236),
  (2015,  7, "INTL_STOCK", 0,  4849,     0),
  (2015,  7, "LARGE_CAP",  0,     0, 22657),

  (2015,  8, "EMERGENCY",  8000,  0,     0),
  (2015,  8, "HOUSING",    24752, 0,     0),
  (2015,  8, "LC",         5225,  0,     0),
  (2015,  8, "CASH",       0, 19245,  3000),
  (2015,  8, "COMMOD",     0,     0,  1888),
  (2015,  8, "HIGH_ERN",   0,     0,     0),
  (2015,  8, "SMALL_CAP",  0,  4836,  6103),
  (2015,  8, "INTL_STOCK", 0,  4820,  4360),
  (2015,  8, "LARGE_CAP",  0,     0, 22658),

  (2015,  9, "EMERGENCY",  8000,  0,     0),
  (2015,  9, "HOUSING",    24766, 0,     0),
  (2015,  9, "LC",         5237,  0,     0),
  (2015,  9, "CASH",       0, 14245,  3000),
  (2015,  9, "COMMOD",     0,     0,  1819),
  (2015,  9, "HIGH_ERN",   0,     0,     0),
  (2015,  9, "SMALL_CAP",  0,  4560,  5754),
  (2015,  9, "INTL_STOCK", 0,  9350,  3858),
  (2015,  9, "LARGE_CAP",  0,     0, 21040),

  (2015, 10, "EMERGENCY",  8000,  0,     0),
  (2015, 10, "HOUSING",    24904, 0,     0),
  (2015, 10, "LC",         5248,  0,     0),
  (2015, 10, "CASH",       0, 14878,  1927),
  (2015, 10, "COMMOD",     0,     0,  1859),
  (2015, 10, "HIGH_ERN",   0,     0,     0),
  (2015, 10, "SMALL_CAP",  0,  4500,  5834),
  (2015, 10, "INTL_STOCK", 0, 14761,  4018),
  (2015, 10, "LARGE_CAP",  0,     0, 21598),

  (2015, 11, "EMERGENCY",  8000,  0,     0),
  (2015, 11, "HOUSING",    27184, 0,     0),
  (2015, 11, "LC",         5273,  0,     0),
  (2015, 11, "CASH",       0,  9888,  1927),
  (2015, 11, "COMMOD",     0,     0,  1775),
  (2015, 11, "HIGH_ERN",   0,     0,     0),
  (2015, 11, "SMALL_CAP",  0, 10760,  6187),
  (2015, 11, "INTL_STOCK", 0, 14956,  4086),
  (2015, 11, "LARGE_CAP",  0,  5000, 22862),

  (2015, 12, "EMERGENCY",  10000, 0,     0),
  (2015, 12, "HOUSING",    27247, 0,     0),
  (2015, 12, "LC",         5332,  0,     0),
  (2015, 12, "CASH",       0,  4889,  1927),
  (2015, 12, "COMMOD",     0,     0,  1569),
  (2015, 12, "HIGH_ERN",   0,     0,     0),
  (2015, 12, "SMALL_CAP",  0,  9137,  6036),
  (2015, 12, "INTL_STOCK", 0, 19685,  4015),
  (2015, 12, "LARGE_CAP",  0,  4989, 22588),

  (2016,  1, "EMERGENCY",  10000, 0,     0),
  (2016,  1, "HOUSING",    27373, 0,     0),
  (2016,  1, "LC",         5375,  0,     0),
  (2016,  1, "CASH",       0,  5189,  1927),
  (2016,  1, "COMMOD",     0,     0,  1487),
  (2016,  1, "HIGH_ERN",   0,  5124,     0),
  (2016,  1, "SMALL_CAP",  0,  8332,  5550),
  (2016,  1, "INTL_STOCK", 0, 18422,  3740),
  (2016,  1, "LARGE_CAP",  0,  4666, 21126),

  (2016,  2, "EMERGENCY",  10000, 0,     0),
  (2016,  2, "HOUSING",    32615, 0,     0),
  (2016,  2, "LC",         5399,  0,     0),
  (2016,  2, "CASH",       0,   191,  1928),
  (2016,  2, "COMMOD",     0,     0,  1247),
  (2016,  2, "HIGH_ERN",   0,  4592,     0),
  (2016,  2, "SMALL_CAP",  0,  8021,  5310),
  (2016,  2, "INTL_STOCK", 0, 17958,  3645),
  (2016,  2, "LARGE_CAP",  0,  9487, 20307),

  (2016,  3, "EMERGENCY",  10000,    0,     0),
  (2016,  3, "HOUSING",    33995,    0,     0),
  (2016,  3, "LC",         5394,     0,     0),
  (2016,  3, "CASH",       0,      191,   554),
  (2016,  3, "COMMOD",     0,        0,  1357),
  (2016,  3, "HIGH_ERN",   0,     4783,  5000),
  (2016,  3, "SMALL_CAP",  0,     8926,  5829),
  (2016,  3, "INTL_STOCK", 3867, 18988,     0),
  (2016,  3, "LARGE_CAP",  0,    10252, 21759),

  (2016,  4, "EMERGENCY",   8000,     0,     0),
  (2016,  4, "HOUSING",    34345,     0,     0),
  (2016,  4, "LC",          4455,     0,     0),
  (2016,  4, "CASH",           0,  4700,  6044),
  (2016,  4, "COMMOD",         0,     0,  1368),
  (2016,  4, "HIGH_ERN",       0,  4960,  5178),
  (2016,  4, "SMALL_CAP",      0,  7500,  5985),
  (2016,  4, "INTL_STOCK",  3920, 19182,     0),
  (2016,  4, "LARGE_CAP",      0, 10596, 22495),

  (2016,  5, "EMERGENCY",   8000,     0,     0),
  (2016,  5, "HOUSING",    34511,     0,     0),
  (2016,  5, "LC",          4474,     0,     0),
  (2016,  5, "CASH",           0,  7721,  9040),
  (2016,  5, "COMMOD",         0,     0,  1472),
  (2016,  5, "HIGH_ERN",       0,  5471, 11038),
  (2016,  5, "SMALL_CAP",      0,  7540,  6051),
  (2016,  5, "INTL_STOCK",  3956, 19359,  3000),
  (2016,  5, "LARGE_CAP",      0,  5004, 28065),

  (2016,  6, "EMERGENCY",   8000,     0,     0),
  (2016,  6, "HOUSING",    34587,     0,     0),
  (2016,  6, "LC",          3973,     0,     0),
  (2016,  6, "CASH",           0, 10733,  3995),
  (2016,  6, "COMMOD",         0,     0,  1554),
  (2016,  6, "HIGH_ERN",       0,  5470, 16003),
  (2016,  6, "SMALL_CAP",      0,  7886,  6321),
  (2016,  6, "INTL_STOCK",  4080, 19963,  3156),
  (2016,  6, "LARGE_CAP",      0,  5161, 28941),

  (2016,  7, "EMERGENCY",   8000,     0,     0),
  (2016,  7, "HOUSING",    35001,     0,     0),
  (2016,  7, "LC",          3985,     0,     0),
  (2016,  7, "CASH",           0, 15283,    47),
  (2016,  7, "COMMOD",         0,     0,  1475),
  (2016,  7, "HIGH_ERN",       0,  6046, 17040),
  (2016,  7, "SMALL_CAP",      0,  7625,  6260),
  (2016,  7, "INTL_STOCK",  3990, 19530,  6037),
  (2016,  7, "LARGE_CAP",      0,  5145, 29835),

  (2016,  8, "EMERGENCY",  10000,     0,     0),
  (2016,  8, "HOUSING",    34983,     0,     0),
  (2016,  8, "LC",          3640,     0,     0),
  (2016,  8, "CASH",           0, 18279,     0),
  (2016,  8, "COMMOD",         0,     0,  1306),
  (2016,  8, "HIGH_ERN",       0,  7038, 19371),
  (2016,  8, "SMALL_CAP",      0,  7928,  6586),
  (2016,  8, "INTL_STOCK",  4159, 20370,  6358),
  (2016,  8, "LARGE_CAP",      0,  5355, 31114),

  (2016,  9, "EMERGENCY",  10000,     0,     0),
  (2016,  9, "HOUSING",    39096,     0,     0),
  (2016,  9, "LC",          3191,     0,     0),
  (2016,  9, "CASH",           0, 15495,     0),
  (2016,  9, "COMMOD",         0,     0,  1321),
  (2016,  9, "HIGH_ERN",       0,  7415, 20338),
  (2016,  9, "SMALL_CAP",      0,  7978,  6723),
  (2016,  9, "INTL_STOCK",  4299, 21046,  6571),
  (2016,  9, "LARGE_CAP",      0,  9692, 31329),

  (2016, 10, "EMERGENCY",  12000,     0,     0),
  (2016, 10, "HOUSING",    38816,     0,     0),
  (2016, 10, "LC",          2986,     0,     0),
  (2016, 10, "CASH",           0, 15495,     0),
  (2016, 10, "COMMOD",         0,     0,  1594),
  (2016, 10, "HIGH_ERN",       0,  6403, 18437),
  (2016, 10, "SMALL_CAP",      0,  8032,  6683),
  (2016, 10, "INTL_STOCK",  4233, 20727,  6470),
  (2016, 10, "LARGE_CAP",      0,  9593, 31023),

  (2016, 11, "EMERGENCY",   8000,     0,     0),
  (2016, 11, "HOUSING",    48803,     0,     0),
  (2016, 11, "LC",          2990,     0,     0),
  (2016, 11, "CASH",           0, 15524,     0),
  (2016, 11, "COMMOD",         0,     0,  1486),
  (2016, 11, "HIGH_ERN",       0,  6094, 17583),
  (2016, 11, "SMALL_CAP",      0,  7604,  6264),
  (2016, 11, "INTL_STOCK",  4085, 19997,  6244),
  (2016, 11, "LARGE_CAP",      0,  9232, 29857),

  (2016, 12, "EMERGENCY",  10000,     0,     0),
  (2016, 12, "HOUSING",    40530,     0,     0),
  (2016, 12, "LC",          2604,     0,     0),
  (2016, 12, "CASH",        9960,  1550,   358),
  (2016, 12, "COMMOD",         0,     0,  3820),
  (2016, 12, "HIGH_ERN",       0,  6573, 23271),
  (2016, 12, "SMALL_CAP",   4230,     0, 15642),
  (2016, 12, "INTL_STOCK",  4194, 24722,  6411),
  (2016, 12, "LARGE_CAP",      0, 28971, 18460),

  (2017,  3, "EMERGENCY",   8000,     0,     0),
  (2017,  3, "HOUSING",    43586,     0,  4000),
  (2017,  3, "LC",          2017,     0,     0),
  (2017,  3, "CASH",         885,  1551, 14988),
  (2017,  3, "COMMOD",         0,     0,  6221),
  (2017,  3, "HIGH_ERN",       0,  6667, 24536),
  (2017,  3, "SMALL_CAP",   4107,     0, 15189),
  (2017,  3, "INTL_STOCK",  4407, 25988,  6737),
  (2017,  3, "LARGE_CAP",      0, 39473,  7767),

  (2017,  6, "EMERGENCY",   8000,     0,     0),
  (2017,  6, "HOUSING",    45916,     0,  4000),
  (2017,  6, "LC",          1995,     0,     0),
  (2017,  6, "CASH",           0,  9667, 16164),
  (2017,  6, "COMMOD",         0,     0,  5614),
  (2017,  6, "HIGH_ERN",       0,  7892, 26170),
  (2017,  6, "SMALL_CAP",   4234,     0, 15658),
  (2017,  6, "INTL_STOCK",  4762, 28078,  7281),
  (2017,  6, "LARGE_CAP",      0, 41750,  8035)
;
