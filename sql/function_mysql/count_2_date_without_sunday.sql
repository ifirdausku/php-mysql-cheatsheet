CREATE FUNCTION TOTAL_WEEKDAYS(date1 DATE, date2 DATE)
RETURNS INT
RETURN ABS(DATEDIFF(date2, date1)) + 1
	 - ABS(DATEDIFF(ADDDATE(date2, INTERVAL 1 - DAYOFWEEK(date2) DAY),
					ADDDATE(date1, INTERVAL 1 - DAYOFWEEK(date1) DAY))) / 7 * 1
	 - (DAYOFWEEK(IF(date1 < date2, date1, date2)) = 1)
	 - (DAYOFWEEK(IF(date1 > date2, date1, date2)) = 7);