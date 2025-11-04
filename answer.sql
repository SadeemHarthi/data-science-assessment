WITH investor_totals AS (
    SELECT investor_id, SUM(no_of_shares) AS total_shares
    FROM investor_transactions
    GROUP BY investor_id
)
SELECT 
    t.investor_id,
    s.sector_name,
    ROUND( (t.no_of_shares * 1.0 / it.total_shares) * 100 , 2 ) AS percentage
FROM investor_transactions t
JOIN investor_totals it
    ON t.investor_id = it.investor_id
JOIN sectors s
    ON t.sector_id = s.sector_id
ORDER BY t.investor_id, s.sector_name
