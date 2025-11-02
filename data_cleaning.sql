SELECT
    -- Replace NULL or empty strings with 'undefined' for all columns
    CASE 
        WHEN "Date" IS NULL OR TRIM("Date") = '' THEN 'undefined' 
        ELSE "Date" 
    END AS "Date",
    CASE 
        WHEN "Machine_ID" IS NULL OR TRIM("Machine_ID") = '' THEN 'undefined' 
        ELSE "Machine_ID" 
    END AS "Machine_ID",
    CASE 
        WHEN "Assembly_Line_No" IS NULL OR TRIM("Assembly_Line_No") = '' THEN 'undefined' 
        ELSE "Assembly_Line_No" 
    END AS "Assembly_Line_No",
    -- Corrected logic for numeric columns: check for NULL OR empty string, then CAST to TEXT if valid
    CASE 
        WHEN "Hydraulic_Pressure(bar)" IS NULL OR TRIM("Hydraulic_Pressure(bar)") = '' THEN 'undefined' 
        ELSE CAST("Hydraulic_Pressure(bar)" AS TEXT) 
    END AS "Hydraulic_Pressure(bar)",
    CASE 
        WHEN "Coolant_Pressure(bar)" IS NULL OR TRIM("Coolant_Pressure(bar)") = '' THEN 'undefined' 
        ELSE CAST("Coolant_Pressure(bar)" AS TEXT) 
    END AS "Coolant_Pressure(bar)",
    CASE 
        WHEN "Air_System_Pressure(bar)" IS NULL OR TRIM("Air_System_Pressure(bar)") = '' THEN 'undefined' 
        ELSE CAST("Air_System_Pressure(bar)" AS TEXT) 
    END AS "Air_System_Pressure(bar)",
    CASE 
        WHEN "Coolant_Temperature" IS NULL OR TRIM("Coolant_Temperature") = '' THEN 'undefined' 
        ELSE CAST("Coolant_Temperature" AS TEXT) 
    END AS "Coolant_Temperature",
    CASE 
        WHEN "Hydraulic_Oil_Temperature(?C)" IS NULL OR TRIM("Hydraulic_Oil_Temperature(?C)") = '' THEN 'undefined' 
        ELSE CAST("Hydraulic_Oil_Temperature(?C)" AS TEXT) 
    END AS "Hydraulic_Oil_Temperature(?C)",
    CASE 
        WHEN "Spindle_Bearing_Temperature(?C)" IS NULL OR TRIM("Spindle_Bearing_Temperature(?C)") = '' THEN 'undefined' 
        ELSE CAST("Spindle_Bearing_Temperature(?C)" AS TEXT) 
    END AS "Spindle_Bearing_Temperature(?C)",
    CASE 
        WHEN "Spindle_Vibration(?m)" IS NULL OR TRIM("Spindle_Vibration(?m)") = '' THEN 'undefined' 
        ELSE CAST("Spindle_Vibration(?m)" AS TEXT) 
    END AS "Spindle_Vibration(?m)",
    CASE 
        WHEN "Tool_Vibration(?m)" IS NULL OR TRIM("Tool_Vibration(?m)") = '' THEN 'undefined' 
        ELSE CAST("Tool_Vibration(?m)" AS TEXT) 
    END AS "Tool_Vibration(?m)",
    CASE 
        WHEN "Spindle_Speed(RPM)" IS NULL OR TRIM("Spindle_Speed(RPM)") = '' THEN 'undefined' 
        ELSE CAST("Spindle_Speed(RPM)" AS TEXT) 
    END AS "Spindle_Speed(RPM)",
    CASE 
        WHEN "Voltage(volts)" IS NULL OR TRIM("Voltage(volts)") = '' THEN 'undefined' 
        ELSE CAST("Voltage(volts)" AS TEXT) 
    END AS "Voltage(volts)",
    CASE 
        WHEN "Torque(Nm)" IS NULL OR TRIM("Torque(Nm)") = '' THEN 'undefined' 
        ELSE CAST("Torque(Nm)" AS TEXT) 
    END AS "Torque(Nm)",
    CASE 
        WHEN "Cutting(kN)" IS NULL OR TRIM("Cutting(kN)") = '' THEN 'undefined' 
        ELSE CAST("Cutting(kN)" AS TEXT) 
    END AS "Cutting(kN)",
    CASE 
        WHEN "Downtime" IS NULL OR TRIM("Downtime") = '' THEN 'undefined' 
        ELSE "Downtime" 
    END AS "Downtime"

FROM "Machine Downtime.csv";