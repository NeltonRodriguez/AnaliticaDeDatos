use PortfolioProject

-- Ver todos los datos:
select * from ProduccionAguaPotable


-- 1. Ver produccion total por año (2019-2022):
SELECT Año, 'La Vega' AS Acueducto,
    SUM([Acueducto La Vega]) AS TotalGalones
FROM ProduccionAguaPotable
WHERE Año BETWEEN '2019' AND '2022'
GROUP BY Año
UNION ALL
SELECT Año, 'Jarabacoa' AS Acueducto,
    SUM([Acueducto Jarabacoa]) AS TotalGalones
FROM ProduccionAguaPotable
WHERE Año BETWEEN '2019' AND '2022'
GROUP BY Año
UNION ALL
SELECT Año, 'Constanza' AS Acueducto,
    SUM([Acueducto Constanza]) AS TotalGalones
FROM ProduccionAguaPotable
WHERE Año BETWEEN '2019' AND '2022'
GROUP BY Año
UNION ALL
SELECT Año, 'Jima' AS Acueducto,
    SUM([Acueducto Jima]) AS TotalGalones
FROM ProduccionAguaPotable
WHERE Año BETWEEN '2019' AND '2022'
GROUP BY Año
UNION ALL
SELECT Año, 'Rurales' AS Acueducto,
    SUM([Acueductos rurales]) AS TotalGalones
FROM ProduccionAguaPotable
WHERE Año BETWEEN '2019' AND '2022'
GROUP BY Año
ORDER BY Año, Acueducto;



-- 2. Encontrar cual acueducto tuvo la mayor produccion en un mes (con la cantidad):
SELECT Año, Mes,
    CASE
        WHEN [Acueducto La Vega] >= [Acueducto Jarabacoa] AND [Acueducto La Vega] >= [Acueducto Constanza] AND [Acueducto La Vega] >= [Acueducto Jima] AND [Acueducto La Vega] >= [Acueductos rurales] THEN 'Acueducto La Vega'
        WHEN [Acueducto Jarabacoa] >= [Acueducto Constanza] AND [Acueducto Jarabacoa] >= [Acueducto Jima] AND [Acueducto Jarabacoa] >= [Acueductos rurales] THEN 'Acueducto Jarabacoa'
        WHEN [Acueducto Constanza] >= [Acueducto Jima] AND [Acueducto Constanza] >= [Acueductos rurales] THEN 'Acueducto Constanza'
        WHEN [Acueducto Jima] >= [Acueductos rurales] THEN 'Acueducto Jima'
        ELSE 'Acueductos rurales'
    END AS [Acueducto con más suministro],
    CASE
        WHEN [Acueducto La Vega] >= [Acueducto Jarabacoa] AND [Acueducto La Vega] >= [Acueducto Constanza] AND [Acueducto La Vega] >= [Acueducto Jima] AND [Acueducto La Vega] >= [Acueductos rurales] THEN [Acueducto La Vega]
        WHEN [Acueducto Jarabacoa] >= [Acueducto Constanza] AND [Acueducto Jarabacoa] >= [Acueducto Jima] AND [Acueducto Jarabacoa] >= [Acueductos rurales] THEN [Acueducto Jarabacoa]
        WHEN [Acueducto Constanza] >= [Acueducto Jima] AND [Acueducto Constanza] >= [Acueductos rurales] THEN [Acueducto Constanza]
        WHEN [Acueducto Jima] >= [Acueductos rurales] THEN [Acueducto Jima]
        ELSE [Acueductos rurales]
    END AS [Suministro más alto]
FROM ProduccionAguaPotable
WHERE Año = '2023' AND Mes = 'Enero';

-- 3. Ver total generado por los acueductos separado por años:

SELECT Año, SUM([Acueducto La Vega] + [Acueducto Jarabacoa] + [Acueducto Constanza] + [Acueducto Jima] + [Acueductos rurales]) AS [Suministro Total]
FROM ProduccionAguaPotable
WHERE Año IN ('2019', '2020', '2021', '2022')
GROUP BY Año
ORDER BY Año;



-- 4. Para encontrar el mes con mayor suministro de agua total:
SELECT Año, Mes,
    [Acueducto La Vega] + [Acueducto Jarabacoa] + [Acueducto Constanza] + [Acueducto Jima] + [Acueductos rurales] AS [Suministro Total],
    [Acueducto La Vega] AS [La Vega],
    [Acueducto Jarabacoa] AS [Jarabacoa],
    [Acueducto Constanza] AS [Constanza],
    [Acueducto Jima] AS [Jima],
    [Acueductos rurales] AS [Rurales]
FROM ProduccionAguaPotable
ORDER BY [Suministro Total] DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;


-- 5. Comparar cantidad total de agua potable en galones desde 2019 hasta 2022:
SELECT Año,
    SUM([Acueducto La Vega]) AS [La Vega], 
    SUM([Acueducto Jarabacoa]) AS [Jarabacoa], 
    SUM([Acueducto Constanza]) AS [Constanza], 
    SUM([Acueducto Jima]) AS [Jima], 
    SUM([Acueductos rurales]) AS [Rurales]
FROM ProduccionAguaPotable
WHERE Año BETWEEN '2019' AND '2022'
GROUP BY Año
ORDER BY Año;
