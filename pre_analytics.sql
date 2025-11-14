--the most common defect types
SELECT defect_type,
        COUNT(*) AS total_defects
FROM defects_data
GROUP BY defect_type
ORDER BY total_defects DESC;

--defect locations/components are most problematic
SELECT defect_location,
        COUNT(*) AS total_defects
FROM defects_data
GROUP BY defect_location
ORDER BY total_defects DESC;

--defect severities distribution
SELECT severity,
        COUNT(*) AS total_defects
        ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM defects_data
GROUP BY severity
ORDER BY total_defects DESC;

--inspection methods detect the most defects
SELECT inspection_method,
        COUNT(*) AS total_defects
FROM defects_data
GROUP BY inspection_method
ORDER BY total_defects DESC;

--the average and total repair costs by defect type and severity
SELECT defect_type,
        severity,
        ROUND(AVG(repair_cost), 2) AS average_repair_cost,
        ROUND(SUM(repair_cost), 2) AS total_repair_cost,
        COUNT(*) AS defect_count
FROM defects_data
GROUP BY defect_type, severity

--relationships between severity and repair cost
SELECT severity,
        ROUND(AVG(repair_cost), 2) AS average_repair_cost,
        ROUND(MIN(repair_cost), 2) AS min_repair_cost,
        ROUND(MAX(repair_cost), 2) AS max_repair_cost,
        COUNT(*) AS defect_count
FROM defects_data
GROUP BY severity

--defects over time by month
-- Convert M/D/YYYY format to YYYY-MM-DD for SQLite date functions
WITH date_converted AS (
    SELECT 
        defect_date,
        -- Extract year (last 4 characters)
        substr(defect_date, -4) AS year,
        -- Extract month (first part before first '/')
        printf('%02d', CAST(substr(defect_date, 1, instr(defect_date, '/') - 1) AS INTEGER)) AS month,
        -- Extract day (between first and second '/')
        printf('%02d', CAST(substr(defect_date, instr(defect_date, '/') + 1, 
               instr(substr(defect_date, instr(defect_date, '/') + 1), '/') - 1) AS INTEGER)) AS day
    FROM defects_data
    WHERE defect_date IS NOT NULL
)
SELECT 
    strftime('%Y-%m', year || '-' || month || '-' || day) AS month,
    COUNT(*) AS defect_count
FROM date_converted
GROUP BY strftime('%Y-%m', year || '-' || month || '-' || day)
ORDER BY month;