/* ============================================================
File Name   : site_performance_analysis.sql
Author      : Naga Mallikarjun
Purpose     : Site-wise SLA and delivery performance analysis
Domain      : Quick Commerce Operations Analytics
============================================================ */

SELECT
    site_code,
    COUNT(order_id) AS total_orders,
    AVG(otd_minutes) AS avg_otd,
    SUM(CASE WHEN otd_minutes <= 30 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS sla_percentage
FROM orders
GROUP BY site_code
ORDER BY sla_percentage DESC;
