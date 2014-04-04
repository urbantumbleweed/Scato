#Scato Trader

##Overview
**Scato** will scan the market for presense of doji patterns and deliver opportunities to an investor.  The investor can view opportunities of interest where the application will calculate

1. risk per share
2. risk ratio per share
3. entry point
4. exit point
5. position size (# of shares)

Additionally, the drilling into an oportunity will reveal a candlestick chart of the past 3 months with current price.

As of 2014-04-03 Scato Trader has has only minimal front end functionality.  The tables and relationships are created for the following functionality:

Tickers have been imported from the NYSE, AMEX, and NASDAQ.  The the program is able to download price information using the yahoofinance ruby gem.  Both realtime, historical, and extended ticker details are available.  A scan is able to be generated on a ticker symbol to determine the presence of patterns.  The program will then create an opportunity based on the presence of an appropriate pattern. 

The opportunity created will have information about the risk associated with an opportunity, the target price, and expected reward ratio.  The opportunity can be updated with post opportunity details (based on the aggregated data of usertunities) to determine performance overall. Opportunities reference the patterns they contain through the scan_id that is passed.  

A given opportunity generates what are called usertunities, these are opportunities tailored to a particular user.  A usertunity contains the risk and expected return for a specific user based on their account balance and user rules.  The userturnity also contains fields to collect performance information that is aggregated in opportunity performance metrics.  

Usertunities can be converted to trades where the user is actually in the position at a given price.  While a trade is open, the user can track the performance and realtime and determine the exact profit/loss on a given position.

Users have the ability to be admins, managers of other other investors (financial manager), or they can be individual users.  Users may select the patterns which will be used to generate their usertunities.

##Completed User Stories

* As a user, I want to login from any page, so that I can use the system more quickly.
*  As a user, I want be sure I need to be logged to see my personal data, so that I can protect my financial data.
* As a user, as soon as I log in I want to see a list of stocks that had a doji yesterday, so that I know what opportunities exist.
* As a user, I want to know  risk amount per share for each opportunity, so that I can determine whether to enter a trade.
* As a user, I want to know what my risk to capital ratio is per share, so that I can determine the maximum I can invest in the opportunity.
* As a user, I want to know how many shares I can afford of a current oportunity, so that ensure my exposure is minimal.
* As a user, I want know the price and quantity of a transaction, so that I know how much capital is tied up in a particular opportunity.
* As a user, I want to know what portion of a position is at risk, so I can determine ROI on invested capital.
* As a user, I want to see a list of open positions, so that at a glance I know as a whole where I am invested.




##Technologies Used

yahoofinance ruby gem


View the [pivotal tracker project](https://www.pivotaltracker.com/s/projects/1047160) here.

![Scato Trader](http://i.imgur.com/XMoPv0X.gif =700x)
