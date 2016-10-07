#!/bin/bash

apache2-foreground

# This file has the data we want to show
CMD mysql -h $DB_PORTFOLIO_HOST --port $DB_PORTFOLIO_PORT -u $DB_PORTFOLIO_USER -p$DB_PORTFOLIO_PW -D $DB_PORTFOLIO_DB < /var/www/scripts/kristopher_data.sql
