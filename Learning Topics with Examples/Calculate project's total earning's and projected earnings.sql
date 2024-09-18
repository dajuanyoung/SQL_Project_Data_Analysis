SELECT
	project_id,
    hours_spent,
    hours_rate AS rate_original,
    SUM(hours_spent * hours_rate) AS project_original_cost,
    hours_rate + 5 AS rate_hike,
    SUM(hours_spent * (hours_rate + 5)) AS project_projected_cost
FROM
	invoices_fact
GROUP BY
	project_id