#!/bin/bash

# This file has the data we want to show
mysql -h $DB_PORTFOLIO_HOST --port $DB_PORTFOLIO_PORT -u $DB_PORTFOLIO_USER -p$DB_PORTFOLIO_PW -D $DB_PORTFOLIO_DB < /var/www/scripts/kristopher_data.sql

apache2-foreground
