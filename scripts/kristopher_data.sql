TRUNCATE `settings`;
INSERT INTO `settings` VALUES
  ("REPORT_START_YEAR_LOOSE", "2011"),
  ("REPORT_START_YEAR_STRICT", "2014"),
  ("REPORT_END_YEAR", "2023"),
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

  (2017, "GROSS_INCOME",    170700),
  (2017, "FEDERAL_TAXES",   18400),
  (2017, "STATE_TAXES",     6532),
  (2017, "SOCIAL_SEC",      10363), #Including Medicare
  (2017, "DONATIONS",       24780), #17000 at end-of-year counted to next year
  (2017, "SAVINGS",         42000),

  (2018, "GROSS_INCOME",    180000),
  (2018, "FEDERAL_TAXES",   22200),
  (2018, "STATE_TAXES",     8400),
  (2018, "SOCIAL_SEC",      10400), #Including Medicare
  (2018, "DONATIONS",       20700), #Includes 16700 donated January 2019
  (2018, "SAVINGS",         64100),

  # New accounting starting this year: instead of counting savings and then assuming remainder=expenses, get expenses from YNAB, and solve for savings.
  # This will fix some accounting issues: 1) accumulating money one year and then counting it as savings for another year 2) tax dues and refunds crossing years.
	# The only downside is that unreported expenses are counted as savings. The `savings` table approach should be kept for catching discrepancies.
	# `savings` table includes 401k and HSA employer contributions whereas `SAVINGS` column does not.
  (2019, "GROSS_INCOME",    265000), #W2 income + paid family leave (so not the same as AGI)
  (2019, "FEDERAL_TAXES",   39445),
  (2019, "STATE_TAXES",     15155),
  (2019, "SOCIAL_SEC",      12250), #8500 SS, 3750 Medicare
  (2019, "DONATIONS",       18000),
  (2019, "SAVINGS",         107450), # Vs. 87650 from old calculation, which was missing a ~$18k 2019 tax refund. Based on YNAB expenses of 72700.

  (2020, "GROSS_INCOME",    420000),
  (2020, "FEDERAL_TAXES",   76800),
  (2020, "STATE_TAXES",     28700),
  (2020, "SOCIAL_SEC",      19500), #8500 SS, 6700 Medicare, 3500 SS, 800 Medicare
  (2020, "DONATIONS",       15900),
  (2020, "SAVINGS",         210800), # Vs. 238500 from `savings` table; difference is due to ~$18k 2019 tax refund and employer contributions. Based on YNAB expenses of 68300.

  (2021, "GROSS_INCOME",    648000),
  (2021, "FEDERAL_TAXES",   158000),
  (2021, "STATE_TAXES",     51000),
  (2021, "SOCIAL_SEC",      28000), #Including Medicare
  (2021, "DONATIONS",       15000),
  (2021, "SAVINGS",         300000),

  (2022, "GROSS_INCOME",    654000), #Adjusted gross income
  (2022, "FEDERAL_TAXES",   168500),
  (2022, "STATE_TAXES",     53600),
  (2022, "SOCIAL_SEC",      29000), #9100 SS, 11200 M, ~8k for rachel
  (2022, "DONATIONS",       5000), #iirc
  (2022, "SAVINGS",         315665),

  #Forecast
  (2023, "GROSS_INCOME",    550000),
  (2023, "FEDERAL_TAXES",   150000),
  (2023, "STATE_TAXES",     50000),
  (2023, "SOCIAL_SEC",      20000), #Including Medicare
  (2023, "DONATIONS",       10000),
  (2023, "SAVINGS",         200000)
;

-- Keeping quarterly summary in case I put it in a table
-- Dec 2016: Full rebalancing. Repurpose 401(k) for total market funds due to fund expenses.
--     Housing fund is now all bonds instead of 50/50 bonds/cash because home buying is deferred.
--     Commodities allocation changed from 0% to 2% to support regular rebalancing.
--     Cash moved to brokerage account / stocks moved to retirement accounts.
-- Mar 2017: Regular rebalancing. Increase housing fund and commodities.
-- Jun 2017: Regular rebalancing.
-- Sep 2017: Rebalancing. ($3k goes off the books for 2018 tithe, $2k goes off the books for car purchase. $7k in bank = $4k emergency fund + $3k saved)
-- Dec 2017: Rebalancing. Paying tithe for second half of 2017 and advancing tithe for all of 2018 ($24k). $3k off the books for car purchase. $10k in bank (less credit cards) = $4k emergency fund + $8k saved
-- Mar 2018: Rebalancing. Tax refund applied. $6k in bank + cash covers new car purchase but nothing more.
-- Jun 2018: Rebalancing. 2 week late. $3k off books for annual tithe.
-- Sep 2018: Rebalancing. 1 week early. $10k off books for annual tithe.
-- Dec 2018: Rebalancing. First time using YNAB and having a 529. $16.5k off books for tithe. Housing fund locked in 12-month CD so it is overweight.
-- Mar 2019: Rebalancing.
-- Jun 2019: Rebalancing. Divesting $UGA (target is 0%) and housing fund (target is ~20%).
--     Keeping more emergency fund due to potential job change coming soon.
--     Trouble buying stocks due to no 401(k)/IRA contributions this year, so increasing cash position.
-- Sep 2019: Joining Google: add signing bonus, 401(k) match, annual HSA employer contribution; exercise Pinger stock (equity not tracked here).
--     IRT position reduced due to yield being low. Adding new category BONDS because Vanguard funds include bonds. Doing two rollovers.
--     Continuing to reduce housing target allocation due to increased income (can save a downpayment more quickly when I want to buy now).
--     HSA investments will be grouped into the pre-tax retirement accounts for accounting.
--     Emergency fund amount will now be calculated directly from YNAB.
-- Dec 2019: Sold all IRT. Holding some vested GOOG due to autosale rules.
--     Now have one bank account for income and one for expenses (Chase bank which I've had). Money should be moved from the "income" account to the "saved money" account each quarter.
--     I will count the "income" account balance (if any) as part of the emergency fund.
-- Mar 2020: Stocks are down. Taxes not filed yet so no refund. No tithe yet this year.
-- Jun 2020: Up due to savings, tax refund, and stock recovery. Ramping up housing fund with a goal to reach $200k.
-- Dec 2020: Removing housing fund from target allocations and will set a target dollar amount instead. This is because the amount depends on the target house price, not net worth.
--     Corrected an issue where RSU money was moved right from Schwab to "account of saved money" and not counted in savings. Also changed 529 contributions to come from "account of saved money"
--     (instead of from "income goes here") so that all savings must go from "income goes here" account to "account of saved money" (excluding 401/hsa contributions).
-- Mar 2021: Reduce housing fund by $10k given how much stock is available in brokerage in case more is needed and given that it is unlikely to buy a house in the next quarter.
--     This is the first March I am doing the portfolio update before taxes. $GOOG cannot be sold for the last 2 months due to technical issues.
-- Jun 2021: no allocation or contribution changes. Paid ~$8k in income taxes. Resolved $GOOG issue from last quarter.
-- Sep 2021: increase housing fund based on new plans. No other changes.
-- Dec 2021: bought house, so now any remainder of the money saved for a downpayment goes back into the regular asset allocation.
-- Mar 2022: Reduce small cap AA by 1pp. Adjust cash/bond AA to match reality.
--     Counting Feb GOOG vest which will should happen next week. Counting 401k rollover money ($40k) which is currently in flight.
-- Jun 2022: nothing special.
-- Sep 2022: nothing special. Did update one week late. Moved home eq to the top of the graph because it's the most volatile.
-- Dec 2022: nothing special.
-- Mar 2023: Reduce small cap AA by 1pp.
-- Jun 2023: Start saving for rental property.
-- Sep 2023: Pause saving for rental property -- lack of inventory. Drop small cap AA (ahead of schedule) due to the amount of cash saved this quarter.

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
  (2017,  6, 17000), #9k to 401(k) + 8k bank to vanguard
  (2017,  9,  3000), #3k bank to vanguard
  (2017, 12,  8000), #8k bank to vanguard
  (2018,  3, 34500), #11k (max iras), 7.5k (401k), 16k to brokerage account
  (2018,  6, 21000), #11k (401k), 10k to brokerage account
  (2018,  9,  3000), #3k bank to 529 account
  (2018, 12,  8600), #8500 brokerage account, 100 for the 529
  (2019,  3, 14000), #14000 brokerage account
  (2019,  6,  9000), #9000 ally "account of saved money"
  (2019,  9, 36000), #30,000 unsaved. $300 saved. $2,000 to 529. $0 to HSA. $49,200 to 401(k) including employer match. $16,500 for Pinger stock.
  (2019, 12, 28650), #$12,000 to IRAs. $6,800 to 401(k). $5,750 to HSA. $2,000 to 529. $2,100 savings/brokerage.
  (2020,  3, 67430), #$30,500 401k. $6,250 HSA. $3,000 529. $27,680 savings/brokerage (includes RSU grants from last Nov & Dec that couldn't be sold).
  (2020,  6, 56200), #$20k from RSUs, $18k from tax refund, -$3k from paycheck minus expenses (being cautious here leaving about $9k for future expenses), $14,600 my 401k (Mar 20 - May 29), $600 HSA, $6k Rachel's 401k
  (2020,  9, 66900), #$43.8k from RSU + paycheck minus expenses, $11350 401k (maxed now), $600 HSA, $11150 Rachel's 401k
  (2020, 12, 47950), #$45k from RSU + paycheck minus expenses, $700 HSA ($6900 contributed so far this year), $2350 Rachel's 401k (year max minus contributions from previous two quarters)
  (2021,  3, 84810), #$35k moved to "account of saved money," $37250 my 401k, $9560 Rachel's 401k, $3k HSA. Note: $25k in newly-vested $GOOG cannot be sold or counted as saved.
  (2021,  6, 73800), #$56k moved to "saved money", $14k my 401k ($51250 ytd), $2600 Rachel's 401k ($12160 ytd), $1200 HSA ($4200 ytd).
  (2021,  9, 69850), #$60k moved to "saved money", $6750 my 401k ($58000 ytd), $1700 Rachel's new 401k, $1400 HSA ($5600 ytd).
  (2021, 12, 71450), #$60k, 10250 Rachel's 401k (11950 ytd), $1200 HSA ($6800 ytd).
  (2022,  3, 98615), #$50k, $37250 my 401k ($8k after tax ytd), $3500 Rachel's old 401k in 2021, $4650 Rachel's old 401k in 2022 (new 401k shows no contributions yet), $2815 2022 HSA + $400 2021 HSA
  (2022,  6, 89150), #$65k, $14k my 401k ($22k after tax ytd), 8750 (8750 ytd) rachel's 401k, $1400 HSA ($4242 ytd)
  (2022,  9, 69631), #$50k, $9250 my 401k ($30250 after tax ytd, plus $1000 pre), $8750 (17500 ytd) rachel's 401k, $1631 HSA (5873 ytd)
  (2022, 12, 58269), #$51k, $6250 (23750 ytd) rachel's 401k, $1019 HSA (6892 ytd)
  (2023,  3, 94177), #$42k, $43750 my 401k, $3427 HSA ($408 for last year, $3019 ytd), $5k rachel's 401k
  (2023,  6, 110723), #$90k, $12k my 401k ($55750 ytd), $1223 HSA ($4242 ytd), $7.5k rachel's 401k ($10k + $2.5k employer match ytd)
  (2023,  9, 136753)  #$115k, $10250 my 401k ($66000 ytd), $1253 HSA ($5495 contributions less dist ytd), $10250 rachel's 401k ($18.2k + $4550 employer match ytd)
;

TRUNCATE `investment_category`;
INSERT INTO `investment_category` VALUES
  ("EMERGENCY", "Emergency fund (est)", 10, "/images/icons/emergency.svg",
    "Money in the bank plus household cash, less credit card balances. Includes cash for emergencies such as a broken car."),
  ("CASH", "Cash", 9, "/images/icons/cash.svg",
    "Cash or money market balance."),
  ("HOUSING", "Housing fund", 11, "/images/icons/house.svg",
    "Funds set aside for a house downpayment in cash/bonds."),
  ("HOME_EQ", "Home Equity", 12, "/images/icons/house.svg",
    "Home value (per Zillow estimate, etc) minus loan amount(s)."),
  ("HIGH_ERN", "High earnings fund", 8, "/images/icons/stock.svg",
    "Stock picked based on value and fundamentals. Past or present stocks: GM, IRT, and GOOG (vested but in cool-off / blackout)."),
  ("LC", "Lending Club", 7, "/images/icons/peer-lending.svg",
    "Funds invested through Lending Club, a peer-to-peer lending service expected to earn 5-10% annually. Loans are repaid over 3-5 years, so the funds are not immediately available"),
  ("COMMOD", "Commodities", 6, "/images/icons/commodities.svg",
    "Commodities can include gas / oil, precious metals, water, and investments in raw manufacturing materials, among others. Purpose of this investment was not clear."),
  ("BONDS", "Bonds", 5, "/images/icons/cash.svg",
    "Public and private, US and international bonds of all durations -- no futures"),
  ("THE_529", "529 College Savings Plan", 4, "/images/icons/stock.svg",
    "College savings plan invested in US and international stocks"),
  ("SMALL_CAP", "US Small-cap", 3, "/images/icons/startup.svg",
    "Funds in small and medium-sized US-based companies"),
  ("INTL_STOCK", "International Stocks", 2, "/images/icons/world.svg",
    "Funds in internationally-based companies"),
  ("LARGE_CAP", "US Total Stock Market", 1, "/images/icons/usa.svg",
    "Funds in US-based companies, with heavy weighting for the largest companies")
;

# THE_529 not included here as it may not be my money in the future.
# Housing fund not included here as it has a dollar target amount instead (which fluctuates significantly).
TRUNCATE `investment_target`;
INSERT INTO `investment_target` VALUES
  ("LARGE_CAP",  41),
  ("INTL_STOCK", 32),
  ("SMALL_CAP",  17),
  ("CASH",        2), # NOT including emergency fund (one month of expenses)
  ("BONDS",       8)
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

  (2017,  6, "EMERGENCY",   4000,     0,     0),
  (2017,  6, "HOUSING",    45916,     0,  6300), -- Note: should not have counted retirement $$ as housing fund
  (2017,  6, "LC",          1995,     0,     0),
  (2017,  6, "CASH",           0,  7167, 12664),
  (2017,  6, "COMMOD",         0,     0,  6814),
  (2017,  6, "HIGH_ERN",       0,  7892, 26170),
  (2017,  6, "SMALL_CAP",   4234,     0, 15658),
  (2017,  6, "INTL_STOCK",  4762, 28078,  7281),
  (2017,  6, "LARGE_CAP",      0, 44250,  8035),

  (2017,  9, "EMERGENCY",   4000,     0,     0),
  (2017,  9, "HOUSING",    54401,     0,     0),
  (2017,  9, "LC",           967,     0,     0),
  (2017,  9, "CASH",          19,  7186, 12412),
  (2017,  9, "COMMOD",         0,     0,  8386),
  (2017,  9, "HIGH_ERN",       0,  8146, 27364),
  (2017,  9, "SMALL_CAP",   4179,     0, 17153),
  (2017,  9, "INTL_STOCK",  5009, 29542,  7656),
  (2017,  9, "LARGE_CAP",      0, 41429, 13048),

  (2017, 12, "EMERGENCY",   4000,     0,     0),
  (2017, 12, "HOUSING",    61835,     0,     0),
  (2017, 12, "LC",           516,     0,     0),
  (2017, 12, "CASH",        3429,  7185, 15701),
  (2017, 12, "COMMOD",         0,     0,  8752),
  (2017, 12, "HIGH_ERN",       0,  8363, 28349),
  (2017, 12, "SMALL_CAP",   4658,     0, 18765),
  (2017, 12, "INTL_STOCK",  5179, 30544,  9417),
  (2017, 12, "LARGE_CAP",      0, 49011, 10709),

  (2018,  3, "EMERGENCY",      0,     0,     0),
  (2018,  3, "HOUSING",    68005,     0,     0), #7580 is in cash; rest is in bonds
  (2018,  3, "LC",           301,     0,     0),
  (2018,  3, "CASH",       11859,  9215,  5174),
  (2018,  3, "COMMOD",         0,     0,  8916),
  (2018,  3, "HIGH_ERN",       0,  7140, 37227),
  (2018,  3, "SMALL_CAP",   4868,     0, 21761),
  (2018,  3, "INTL_STOCK",  5376, 31719, 16130),
  (2018,  3, "LARGE_CAP",      0, 56771, 11226),

  (2018,  6, "EMERGENCY",   1000,     0,     0),
  (2018,  6, "HOUSING",    72987,     0,     0), #12480 is in cash; rest is in bonds
  (2018,  6, "LC",           195,     0,     0),
  (2018,  6, "CASH",       14034,  6004,  5233),
  (2018,  6, "COMMOD",         0,     0,  9678),
  (2018,  6, "HIGH_ERN",       0,  3470, 44735),
  (2018,  6, "SMALL_CAP",   5248,     0, 23461),
  (2018,  6, "INTL_STOCK",  5171, 35624, 15503),
  (2018,  6, "LARGE_CAP",      0, 61735, 11253),

  (2018,  9, "EMERGENCY",   1000,     0,     0),
  (2018,  9, "HOUSING",    73618,     0,     0), #12480 is in cash; rest is in bonds
  (2018,  9, "LC",           123,     0,     0),
  (2018,  9, "CASH",       17115,  5011,  8549),
  (2018,  9, "COMMOD",         0,     0, 10018),
  (2018,  9, "HIGH_ERN",       0,  3555, 50043),
  (2018,  9, "SMALL_CAP",   5513,     0, 24648),
  (2018,  9, "INTL_STOCK",  5177, 37250, 17324),
  (2018,  9, "LARGE_CAP",      0, 74522,  2527),

  (2014, 12, "THE_529", 0, 0, 0),
  (2015,  1, "THE_529", 0, 0, 0),
  (2015,  2, "THE_529", 0, 0, 0),
  (2015,  3, "THE_529", 0, 0, 0),
  (2015,  4, "THE_529", 0, 0, 0),
  (2015,  5, "THE_529", 0, 0, 0),
  (2015,  6, "THE_529", 0, 0, 0),
  (2015,  7, "THE_529", 0, 0, 0),
  (2015,  8, "THE_529", 0, 0, 0),
  (2015,  9, "THE_529", 0, 0, 0),
  (2015, 10, "THE_529", 0, 0, 0),
  (2015, 11, "THE_529", 0, 0, 0),
  (2015, 12, "THE_529", 0, 0, 0),
  (2016,  1, "THE_529", 0, 0, 0),
  (2016,  2, "THE_529", 0, 0, 0),
  (2016,  3, "THE_529", 0, 0, 0),
  (2016,  4, "THE_529", 0, 0, 0),
  (2016,  5, "THE_529", 0, 0, 0),
  (2016,  6, "THE_529", 0, 0, 0),
  (2016,  7, "THE_529", 0, 0, 0),
  (2016,  8, "THE_529", 0, 0, 0),
  (2016,  9, "THE_529", 0, 0, 0),
  (2016, 10, "THE_529", 0, 0, 0),
  (2016, 11, "THE_529", 0, 0, 0),
  (2016, 12, "THE_529", 0, 0, 0),
  (2017,  3, "THE_529", 0, 0, 0),
  (2017,  6, "THE_529", 0, 0, 0),
  (2017,  9, "THE_529", 0, 0, 0),
  (2017, 12, "THE_529", 0, 0, 0),
  (2018,  3, "THE_529", 0, 0, 0),
  (2018,  6, "THE_529", 0, 0, 0),
  (2018,  9, "THE_529", 0, 0, 0),

  (2018, 12, "EMERGENCY",   8000,     0,     0),
  (2018, 12, "HOUSING",    80207,     0,     0),
  (2018, 12, "LC",           125,     0,     0),
  (2018, 12, "CASH",       15700,   485,  4610),
  (2018, 12, "COMMOD",         0,     0,  7562),
  (2018, 12, "HIGH_ERN",       0,   691, 50983),
  (2018, 12, "THE_529",     2850,     0,     0),
  (2018, 12, "SMALL_CAP",   4586,     0, 24451),
  (2018, 12, "INTL_STOCK",  7619, 36198, 15456),
  (2018, 12, "LARGE_CAP",      0, 71908,  2291),

  (2019, 03, "EMERGENCY",   8000,     0,     0),
  (2019, 03, "HOUSING",    80674,     0,     0),
  (2019, 03, "LC",           127,     0,     0),
  (2019, 03, "CASH",       23345,   498,   189),
  (2019, 03, "COMMOD",         0,     0,  7984),
  (2019, 03, "HIGH_ERN",       0,   696, 54991),
  (2019, 03, "THE_529",     3069,     0,     0),
  (2019, 03, "SMALL_CAP",   4970,     0, 30192),
  (2019, 03, "INTL_STOCK", 10952, 39093, 16678),
  (2019, 03, "LARGE_CAP",   3738, 77061,     0),

  (2019, 06, "EMERGENCY",  12000,     0,     0),
  (2019, 06, "HOUSING",    81341,     0,     0),
  (2019, 06, "LC",           132,     0,     0),
  (2019, 06, "CASH",       35505-1959-539,   35,   188),
  (2019, 06, "COMMOD",         0,     0,  8720-3000),
  (2019, 06, "HIGH_ERN",       0,   815, 64331-3490),
  (2019, 06, "THE_529",     3200,     0,     0),
  (2019, 06, "SMALL_CAP",   4792+539,     0, 29111+3000),
  (2019, 06, "INTL_STOCK", 11253, 40124, 17118+3483),
  (2019, 06, "LARGE_CAP",   3954+1959, 81703,     0),

  (2014, 12, "BONDS", 0, 0, 0),
  (2015,  1, "BONDS", 0, 0, 0),
  (2015,  2, "BONDS", 0, 0, 0),
  (2015,  3, "BONDS", 0, 0, 0),
  (2015,  4, "BONDS", 0, 0, 0),
  (2015,  5, "BONDS", 0, 0, 0),
  (2015,  6, "BONDS", 0, 0, 0),
  (2015,  7, "BONDS", 0, 0, 0),
  (2015,  8, "BONDS", 0, 0, 0),
  (2015,  9, "BONDS", 0, 0, 0),
  (2015, 10, "BONDS", 0, 0, 0),
  (2015, 11, "BONDS", 0, 0, 0),
  (2015, 12, "BONDS", 0, 0, 0),
  (2016,  1, "BONDS", 0, 0, 0),
  (2016,  2, "BONDS", 0, 0, 0),
  (2016,  3, "BONDS", 0, 0, 0),
  (2016,  4, "BONDS", 0, 0, 0),
  (2016,  5, "BONDS", 0, 0, 0),
  (2016,  6, "BONDS", 0, 0, 0),
  (2016,  7, "BONDS", 0, 0, 0),
  (2016,  8, "BONDS", 0, 0, 0),
  (2016,  9, "BONDS", 0, 0, 0),
  (2016, 10, "BONDS", 0, 0, 0),
  (2016, 11, "BONDS", 0, 0, 0),
  (2016, 12, "BONDS", 0, 0, 0),
  (2017,  3, "BONDS", 0, 0, 0),
  (2017,  6, "BONDS", 0, 0, 0),
  (2017,  9, "BONDS", 0, 0, 0),
  (2017, 12, "BONDS", 0, 0, 0),
  (2018,  3, "BONDS", 0, 0, 0),
  (2018,  6, "BONDS", 0, 0, 0),
  (2018,  9, "BONDS", 0, 0, 0),
  (2018, 12, "BONDS", 0, 0, 0),
  (2019,  3, "BONDS", 0, 0, 0),
  (2019,  6, "BONDS", 0, 0, 0),

  (2019, 09, "EMERGENCY",  14234,     0,     0),
  (2019, 09, "HOUSING",    81791+3000,     0,     0),
  (2019, 09, "LC",           130,     0,     0),
  (2019, 09, "CASH",        3435-3000,  0, 27828+5562+6500-4500-10029),
  (2019, 09, "COMMOD",         0,     0,  5562-5562),
  (2019, 09, "HIGH_ERN",       0,     0, 44148),
  (2019, 09, "BONDS",          0, 12013,  5139),
  (2019, 09, "THE_529",     5270,     0,     0),
  (2019, 09, "SMALL_CAP",   5304,     0, 31953+10029),
  (2019, 09, "INTL_STOCK", 11050, 42818, 38581-6500),
  (2019, 09, "LARGE_CAP",   5951, 64108, 27425+4500),

  # Note: my 401k target retirement fund is 54% large cap, 36% international, 10% bonds

  (2019, 12, "EMERGENCY",  10012,     0,     0),
  (2019, 12, "HOUSING",    85120,     0,     0),
  (2019, 12, "LC",           127,     0,     0),
  (2019, 12, "CASH",        3146,   500, 84310-20500-25000-12750), #500 is HSA
  (2019, 12, "COMMOD",         0,     0,     0),
  (2019, 12, "HIGH_ERN",    7145,     0,     0),
  (2019, 12, "BONDS",          0, 12340,  6029),
  (2019, 12, "THE_529",     7513,     0,     0),
  (2019, 12, "SMALL_CAP",   5646,  6520, 44689+12750), #6520 is HSA
  (2019, 12, "INTL_STOCK", 11614, 44423, 36183+20500),
  (2019, 12, "LARGE_CAP",   6253, 66634, 37280+25000),

  # 401k: 134463 pretax, 47779 posttax
  (2020,  3, "EMERGENCY",  13546,     0,      0),
  (2020,  3, "HOUSING",    85752,     0,      0),
  (2020,  3, "LC",             0,     0,      0),
  (2020,  3, "CASH",        29364-5000, 500, 26136-5170-11190-8700), #500 is HSA
  (2020,  3, "COMMOD",         0,     0,      0),
  (2020,  3, "HIGH_ERN",       0,     0,      0),
  (2020,  3, "BONDS",          0, 13446,   4778),
  (2020,  3, "THE_529",     8922,     0,      0),
  (2020,  3, "SMALL_CAP",   4156,  9645, 42279+11190), #9645 is HSA
  (2020,  3, "INTL_STOCK",  9336+5000, 48407, 45296+8700),
  (2020,  3, "LARGE_CAP",   5387, 72610, 51375+5170),

  # my 401k: 164326 pretax, 68288 posttax
  # $41k from "account of saved money" is for the housing fund.
  (2020,  6, "EMERGENCY",  16000,     0,      0), #Emergency is approx because of a YNAB issue
  (2020,  6, "HOUSING",    86158+41000,     0,      0),
  (2020,  6, "LC",             0,     0,      0),
  (2020,  6, "CASH",        57170+1325-41000, 500, 6980+6032-6300), #500 is HSA
  (2020,  6, "COMMOD",         0,     0,      0),
  (2020,  6, "HIGH_ERN",       0,     0,      0),
  (2020,  6, "BONDS",          0, 16433,   6829),
  (2020,  6, "THE_529",    10671,     0,      0),
  (2020,  6, "SMALL_CAP",   5192,  7050+12806,  68130+6300), #12806 is HSA
  (2020,  6, "INTL_STOCK", 17753, 164326*.36, 68288*.36+5308+39695),
  (2020,  6, "LARGE_CAP",   6446, 164326*.54, 68288*.54+37700),

  # my 401k: 174216 pretax, 84412 posttax
  # $62k from "account of saved money" is for the housing fund.
  (2020,  9, "EMERGENCY",  12300,     0,      0),
  (2020,  9, "HOUSING",    85120+62000,     0,      0),
  (2020,  9, "LC",             0,     0,      0),
  (2020,  9, "CASH",       92108+1326-62000, 500, 6034+578-6030+10800-9000), #500 is HSA
  (2020,  9, "COMMOD",         0,     0,      0),
  (2020,  9, "HIGH_ERN",       0,     0,      0),
  (2020,  9, "BONDS",          0, 17422,   8441),
  (2020,  9, "THE_529",    11354,     0,      0),
  (2020,  9, "SMALL_CAP",   5170,  13638+18506,  74095-10800), #13638 is HSA
  (2020,  9, "INTL_STOCK", 18599, 174216*.36, 41588+5561+84412*.36+6030+2000),
  (2020,  9, "LARGE_CAP",   6937, 174216*.54, 40546+84412*.54+7000),

  # my 401k: 190854 pretax, 92474 posttax
  # $150k from "account of saved money" is for the housing fund.
  (2020, 12, "EMERGENCY",  17300,     0,      0),
  (2020, 12, "HOUSING",   150000,     0,      0),
  (2020, 12, "LC",             0,     0,      0),
  (2020, 12, "CASH",       232296-150000+1326-2500-27000-19000, 500, 2376-2370), #500 is HSA
  (2020, 12, "COMMOD",         0,     0,      0),
  (2020, 12, "HIGH_ERN",       0,     0,      0),
  (2020, 12, "BONDS",          0, 19085,   9247),
  (2020, 12, "THE_529",    12673,     0,      0),
  (2020, 12, "SMALL_CAP",   6308+2500,  17049+24927,  77066), #17049 is HSA
  (2020, 12, "INTL_STOCK", 21014+19000, 190854*.36, 92474*.36+53891+8571),
  (2020, 12, "LARGE_CAP",   7689+27000, 190854*.54, 92474*.54+52925+2370),

  # my 401k: 227979 pretax, 104143 posttax
  # $140k from "account of saved money" is for the housing fund.
  (2021,  3, "EMERGENCY",  19946,     0,      0),
  (2021,  3, "HOUSING",   140000,     0,      0),
  (2021,  3, "LC",             0,     0,      0),
  (2021,  3, "CASH",       198455-140000+7741-22000, 500, 12000-12000), #500 is HSA
  (2021,  3, "COMMOD",         0,     0,      0),
  (2021,  3, "HIGH_ERN",       24978+138,     0,      0), # Includes vested $GOOG
  (2021,  3, "BONDS",          0, 22798,   10414),
  (2021,  3, "THE_529",    14400,     0,      0),
  (2021,  3, "SMALL_CAP",   10488,  22099+39585,  92726-9000), #22099 is HSA
  (2021,  3, "INTL_STOCK", 42256, 227979*.36, 104143*.36+56850+9041+12000+9000),
  (2021,  3, "LARGE_CAP",   36311+22000, 227979*.54, 104143*.54+58213),

  # my 401k: 248071 pretax, 127740 posttax
  # $140k from "account of saved money" is for the housing fund.
  (2021,  6, "EMERGENCY",  17817,     0,      0),
  (2021,  6, "HOUSING",   140000,     0,      0),
  (2021,  6, "LC",             0,     0,      0),
  (2021,  6, "CASH",       55604+175192+10790+738-140000-17650-18810-12610, 500, 93), #500 is HSA
  (2021,  6, "COMMOD",         0,     0,      0),
  (2021,  6, "HIGH_ERN", 14284+222,   0,      0), # Includes vested $GOOG
  (2021,  6, "BONDS",          0, 24807,   12774),
  (2021,  6, "THE_529",    16625,     0,      0),
  (2021,  6, "SMALL_CAP",  11084+12610,  25373+45317,  88486), #25373 is HSA
  (2021,  6, "INTL_STOCK", 45220+18810, 248071*.36, 127740*.36+67339+25927),
  (2021,  6, "LARGE_CAP",  63426+17650, 248071*.54, 127740*.54+63433),

  (2014, 12, "HOME_EQ", 0, 0, 0),
  (2015,  1, "HOME_EQ", 0, 0, 0),
  (2015,  2, "HOME_EQ", 0, 0, 0),
  (2015,  3, "HOME_EQ", 0, 0, 0),
  (2015,  4, "HOME_EQ", 0, 0, 0),
  (2015,  5, "HOME_EQ", 0, 0, 0),
  (2015,  6, "HOME_EQ", 0, 0, 0),
  (2015,  7, "HOME_EQ", 0, 0, 0),
  (2015,  8, "HOME_EQ", 0, 0, 0),
  (2015,  9, "HOME_EQ", 0, 0, 0),
  (2015, 10, "HOME_EQ", 0, 0, 0),
  (2015, 11, "HOME_EQ", 0, 0, 0),
  (2015, 12, "HOME_EQ", 0, 0, 0),
  (2016,  1, "HOME_EQ", 0, 0, 0),
  (2016,  2, "HOME_EQ", 0, 0, 0),
  (2016,  3, "HOME_EQ", 0, 0, 0),
  (2016,  4, "HOME_EQ", 0, 0, 0),
  (2016,  5, "HOME_EQ", 0, 0, 0),
  (2016,  6, "HOME_EQ", 0, 0, 0),
  (2016,  7, "HOME_EQ", 0, 0, 0),
  (2016,  8, "HOME_EQ", 0, 0, 0),
  (2016,  9, "HOME_EQ", 0, 0, 0),
  (2016, 10, "HOME_EQ", 0, 0, 0),
  (2016, 11, "HOME_EQ", 0, 0, 0),
  (2016, 12, "HOME_EQ", 0, 0, 0),
  (2017,  3, "HOME_EQ", 0, 0, 0),
  (2017,  6, "HOME_EQ", 0, 0, 0),
  (2017,  9, "HOME_EQ", 0, 0, 0),
  (2017, 12, "HOME_EQ", 0, 0, 0),
  (2018,  3, "HOME_EQ", 0, 0, 0),
  (2018,  6, "HOME_EQ", 0, 0, 0),
  (2018,  9, "HOME_EQ", 0, 0, 0),
  (2018, 12, "HOME_EQ", 0, 0, 0),
  (2019,  3, "HOME_EQ", 0, 0, 0),
  (2019,  6, "HOME_EQ", 0, 0, 0),
  (2019,  9, "HOME_EQ", 0, 0, 0),
  (2019, 12, "HOME_EQ", 0, 0, 0),
  (2020,  3, "HOME_EQ", 0, 0, 0),
  (2020,  6, "HOME_EQ", 0, 0, 0),
  (2020,  9, "HOME_EQ", 0, 0, 0),
  (2020, 12, "HOME_EQ", 0, 0, 0),
  (2021,  3, "HOME_EQ", 0, 0, 0),
  (2021,  6, "HOME_EQ", 0, 0, 0),

  # my 401k: 258013 pretax, 139763 posttax
  # r's fidelity 401k: 849 pretax, 849 posttax (approx)
  # both 401k combined: 258862 pretax, 140612 posttax
  # $170k from "account of saved money" is for the housing fund.
  (2021,  9, "EMERGENCY",  14137,     0,      0),
  (2021,  9, "HOUSING",   170000,     0,      0),
  (2021,  9, "HOME_EQ",        0,     0,      0),
  (2021,  9, "LC",             0,     0,      0),
  (2021,  9, "CASH",     252536-170000+1030-15000-10000, 500, 93), #500 is HSA
  (2021,  9, "COMMOD",         0,     0,      0),
  (2021,  9, "HIGH_ERN", 17166+190,   0,      0), # Includes vested $GOOG
  (2021,  9, "BONDS",          0, 25886,  13976),
  (2021,  9, "THE_529",    18248,     0,      0),
  (2021,  9, "SMALL_CAP",  22809+15000,  27104+44397, 85893), #27104 is HSA
  (2021,  9, "INTL_STOCK", 64166+10000, 258862*.36, 139763*.36+67582+26021),
  (2021,  9, "LARGE_CAP",  85578, 258862*.54, 139763*.54+67121),

  # my 401k: 252950 pretax, 137020 posttax
  # r's fidelity 401k: 7510 pretax, 5890 posttax (approx)
  # both 401k combined: 260460 pretax, 142910 posttax
  (2021, 12, "EMERGENCY",   9757,     0,      0),
  (2021, 12, "HOUSING",        0,     0,      0),
  (2021, 12, "HOME_EQ",   152000,     0,      0), # $703k zestimate - $551k loan
  (2021, 12, "LC",             0,     0,      0),
  (2021, 12, "CASH",     120585+957-33720-29430-13858, 500, 93), #500 is HSA
  (2021, 12, "COMMOD",         0,     0,      0),
  (2021, 12, "HIGH_ERN", 16883+172,   0,      0), # Includes vested $GOOG
  (2021, 12, "BONDS",      20000, 26046,  14291),
  (2021, 12, "THE_529",    18929,     0,      0),
  (2021, 12, "SMALL_CAP",  38331+13858,  27357+44504, 87139), #27357 is HSA
  (2021, 12, "INTL_STOCK", 70212+33720, 260460*.36, 142910*.36+24651+64025),
  (2021, 12, "LARGE_CAP",  86268+29430, 260460*.54, 142910*.54+67687),

  # my 401k: 273131 pretax, 140785 posttax
  # r's varian 401k: 11501 pretax, 9312 posttax (approx)
  # both 401k combined: 284632 pretax, 150097 posttax
  (2022,  3, "EMERGENCY",   7749,     0,      0),
  (2022,  3, "HOUSING",        0,     0,      0),
  (2022,  3, "HOME_EQ",   210000,     0,      0), # $758k zestimate - $548k loan
  (2022,  3, "LC",             0,     0,      0),
  (2022,  3, "CASH",     53686+11000+735-47400, 500, 6000+6093-12092), #500 is HSA
  (2022,  3, "COMMOD",         0,     0,      0),
  (2022,  3, "HIGH_ERN", 17122+119,   0,      0), # Includes vested $GOOG
  (2022,  3, "BONDS",      40000, 28463,  15010),
  (2022,  3, "THE_529",    19344,     0,      0),
  (2022,  3, "SMALL_CAP",  50654+47400,  29604, 85214), #29604 is HSA
  (2022,  3, "INTL_STOCK", 102411, 284632*.36, 150097*.36+63264+24358+12092),
  (2022,  3, "LARGE_CAP",  111128, 284632*.54+42424, 150097*.54+65048),

  # my 401k (65% pretax): 260164 pretax, 140090 posttax
  # r's varian 401k: 11189 pretax, 8792 posttax (approx)
  # both 401k combined: 271353 pretax, 148882 posttax
  (2022,  6, "EMERGENCY",   9600,     0,      0),
  (2022,  6, "HOUSING",        0,     0,      0),
  (2022,  6, "HOME_EQ",   217000,     0,      0), # $762k zestimate - $545k loan
  (2022,  6, "LC",             0,     0,      0),
  (2022,  6, "CASH",  73877+2204-13000-6000-25500,   500, 0), #500 is HSA
  (2022,  6, "COMMOD",         0,     0,      0),
  (2022,  6, "HIGH_ERN", 17796+134,   0,      0), # Includes vested $GOOG
  (2022,  6, "BONDS",      40000,  27135,  14888),
  (2022,  6, "THE_529",    19015,     0,      0),
  (2022,  6, "SMALL_CAP",  93010+13000, 29473, 81189), #29473 is HSA
  (2022,  6, "INTL_STOCK", 95367+25500, 271353*.36, 148882*.36+64561+28417),
  (2022,  6, "LARGE_CAP", 103634+6000, 271353*.54+47889, 148882*.54+60673),

  # my 401k (63% pretax): 240822 pretax, 141435 posttax
  # r's varian 401k: 10268 pretax, 8068 posttax (approx)
  # both 401k combined: 251090 pretax, 149503 posttax
  (2022,  9, "EMERGENCY",   11043,     0,      0),
  (2022,  9, "HOUSING",        0,     0,      0),
  (2022,  9, "HOME_EQ",   147000,     0,      0), # $689k zestimate - $542k loan
  (2022,  9, "LC",             0,     0,      0),
  (2022,  9, "CASH",  3214+83882+2695-29000-13000-14000,   500, 0), #500 is HSA
  (2022,  9, "COMMOD",         0,     0,      0),
  (2022,  9, "HIGH_ERN", 13190+115,   0,      0), # Includes vested $GOOG
  (2022,  9, "BONDS",      40000,  25109,  14950),
  (2022,  9, "THE_529",    19608,     0,      0),
  (2022,  9, "SMALL_CAP",  97918+14000, 29340, 75024), #29340 is HSA
  (2022,  9, "INTL_STOCK", 107923+29000, 251090*.36, 149503*.36+57627+25365),
  (2022,  9, "LARGE_CAP", 104032+13000, 251090*.54+53283, 149503*.54+57595),

  # my 401k (63% pretax): 255782 pretax, 150222 posttax
  # r's varian 401k (56% pretax): 10890 pretax, 8556 posttax
  # both 401k combined: 266672 pretax, 158778 posttax
  (2022, 12, "EMERGENCY",   5860,     0,      0),
  (2022, 12, "HOUSING",        0,     0,      0),
  (2022, 12, "HOME_EQ",   139000,     0,      0), # $678k zestimate - $539k loan
  (2022, 12, "LC",             0,     0,      0),
  (2022, 12, "CASH",  74539+903,   500, 0), #500 is HSA
  (2022, 12, "COMMOD",         0,     0,      0),
  (2022, 12, "HIGH_ERN", 12833+110,   0,      0), # Includes vested $GOOG
  (2022, 12, "BONDS",      40000,  26667,  15878),
  (2022, 12, "THE_529",    20910,     0,      0),
  (2022, 12, "SMALL_CAP", 122281, 32219, 81971), #32219 is HSA
  (2022, 12, "INTL_STOCK", 148925, 266672*.36, 158778*.36+62718+27606),
  (2022, 12, "LARGE_CAP", 123238, 266672*.54+62916, 158778*.54+60603),

  # my 401k (63% pretax): 286724 pretax, 168394 posttax
  # r's varian 401k (56% pretax): 11023 pretax, 8662 posttax
  # both 401k combined: 297747 pretax, 177056 posttax
  (2023,  3, "EMERGENCY",   6000,     0,      0),
  (2023,  3, "HOUSING",        0,     0,      0),
  (2023,  3, "HOME_EQ",   125000,     0,      0), # $661k zestimate (rolling average) - $536k loan
  (2023,  3, "LC",             0,     0,      0),
  (2023,  3, "CASH",  8959+49744+385-22000-5000-3000,   500, 0), #500 is HSA
  (2023,  3, "COMMOD",         0,     0,      0),
  (2023,  3, "HIGH_ERN", 11967,   0,      0), # Includes vested $GOOG
  (2023,  3, "BONDS",      63360,  29774,  17705),
  (2023,  3, "THE_529",    22305,     0,      0),
  (2023,  3, "SMALL_CAP", 125233+3000, 36837, 83949), #36837 is HSA
  (2023,  3, "INTL_STOCK", 166903+5000, 297747*.36, 177056*.36+64969+28597+6500),
  (2023,  3, "LARGE_CAP", 140360+22000, 297747*.54+67820, 177056*.54+60771+6500),

  # my 401k (63% pretax): 299680 pretax, 176003 posttax
  # r's varian 401k (56% pretax): 11218 pretax, 8814 posttax
  # both 401k combined: 300808 pretax, 184817 posttax
  (2023,  6, "EMERGENCY",   8000,     0,      0),
  (2023,  6, "HOUSING",    60000,     0,      0),
  (2023,  6, "HOME_EQ",   147000,     0,      0), # $680 zestimate (rolling average) - $533k loan
  (2023,  6, "LC",             0,     0,      0),
  (2023,  6, "CASH",  15202+39196+42539-60000,   500, 11), #500 is HSA
  (2023,  6, "COMMOD",         0,     0,      0),
  (2023,  6, "HIGH_ERN", 23113,   0,      0), # Includes vested $GOOG
  (2023,  6, "BONDS",      63360,  30081,  18482),
  (2023,  6, "THE_529",    23775,     0,      0),
  (2023,  6, "SMALL_CAP", 116182, 35303+20000, 76110), #35303 is HSA
  (2023,  6, "INTL_STOCK", 202023, 300808*.36-20000, 184817*.36+71762+28708),
  (2023,  6, "LARGE_CAP", 166828, 300808*.54+78575, 184817*.54+69138),

  # my 401k (63% pretax): 317927 pretax, 186719 posttax
  # r's varian 401k (56% pretax): 11659 pretax, 9161 posttax
  # both 401k combined: 329586 pretax, 195880 posttax
  (2023,  9, "EMERGENCY",   8000,     0,      0),
  (2023,  9, "HOUSING",    60000,     0,      0),
  (2023,  9, "HOME_EQ",   176000,     0,      0), # $706k zestimate (rolling average) - $530k loan
  (2023,  9, "LC",             0,     0,      0),
  (2023,  9, "CASH",  204890-60000+211-45640-35800-17700,   500, 116), #500 is HSA
  (2023,  9, "COMMOD",         0,     0,      0),
  (2023,  9, "HIGH_ERN", 24124,   0,      0), # Includes vested $GOOG
  (2023,  9, "BONDS",      63360,  32959,  19588),
  (2023,  9, "THE_529",    25816,     0,      0),
  (2023,  9, "SMALL_CAP", 120039+17700, 38728, 99537), #38728 is HSA
  (2023,  9, "INTL_STOCK", 203854+45640, 329586*.36, 195880*.36+72406+8609),
  (2023,  9, "LARGE_CAP", 178236+35800, 329586*.54+94198, 195880*.54+73841)
;

# Account checklist for each quarter: charles schwab, ynab, ally, hsa, r's old 401k, r's new 401k, r's vanguard, my vanguard, home equity calc, ibonds
