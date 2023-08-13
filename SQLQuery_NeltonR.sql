use PortfolioProject

-- Ver todos los datos:
select * from ProduccionAguaPotable

-- Obtener la cantidad total de galones (anual) por cada acueducto en 2019:
SELECT Año, 
    SUM([Acueducto La Vega]) AS [La Vega], 
    SUM([Acueducto Jarabacoa]) AS [Jarabacoa], 
    SUM([Acueducto Constanza]) AS [Constanza], 
    SUM([Acueducto Jima]) AS [Jima], 
    SUM([Acueductos rurales]) AS [Rurales] 
FROM ProduccionAguaPotable
WHERE Año = '2019' 
GROUP BY Año;

-- Obtener la cantidad total de galones (anual) por cada acueducto en 2020:
SELECT Año, 
    SUM([Acueducto La Vega]) AS [La Vega], 
    SUM([Acueducto Jarabacoa]) AS [Jarabacoa], 
    SUM([Acueducto Constanza]) AS [Constanza], 
    SUM([Acueducto Jima]) AS [Jima], 
    SUM([Acueductos rurales]) AS [Rurales] 
FROM ProduccionAguaPotable
WHERE Año = '2020' 
GROUP BY Año;

-- Obtener la cantidad total de galones (anual) por cada acueducto en 2021:
SELECT Año, 
    SUM([Acueducto La Vega]) AS [La Vega], 
    SUM([Acueducto Jarabacoa]) AS [Jarabacoa], 
    SUM([Acueducto Constanza]) AS [Constanza], 
    SUM([Acueducto Jima]) AS [Jima], 
    SUM([Acueductos rurales]) AS [Rurales] 
FROM ProduccionAguaPotable
WHERE Año = '2021' 
GROUP BY Año;


-- Obtener la cantidad total de galones (anual) por cada acueducto en 2022:
SELECT Año, 
    SUM([Acueducto La Vega]) AS [La Vega], 
    SUM([Acueducto Jarabacoa]) AS [Jarabacoa], 
    SUM([Acueducto Constanza]) AS [Constanza], 
    SUM([Acueducto Jima]) AS [Jima], 
    SUM([Acueductos rurales]) AS [Rurales] 
FROM ProduccionAguaPotable
WHERE Año = '2022' 
GROUP BY Año;


-- Encontrar cual acueducto tuvo la mayor produccion en un mes (con la cantidad):
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


-- Calcular la suma total de galones suministrados por todos los acueductos en 2019:
SELECT Año, SUM([Acueducto La Vega] + [Acueducto Jarabacoa] + [Acueducto Constanza] + [Acueducto Jima] + [Acueductos rurales]) AS [Suministro Total]
FROM ProduccionAguaPotable
WHERE Año = '2019'
GROUP BY Año;

-- Calcular la suma total de galones suministrados por todos los acueductos en 2020:
SELECT Año, SUM([Acueducto La Vega] + [Acueducto Jarabacoa] + [Acueducto Constanza] + [Acueducto Jima] + [Acueductos rurales]) AS [Suministro Total]
FROM ProduccionAguaPotable
WHERE Año = '2020'
GROUP BY Año;

-- Calcular la suma total de galones suministrados por todos los acueductos en 2021:
SELECT Año, SUM([Acueducto La Vega] + [Acueducto Jarabacoa] + [Acueducto Constanza] + [Acueducto Jima] + [Acueductos rurales]) AS [Suministro Total]
FROM ProduccionAguaPotable
WHERE Año = '2021'
GROUP BY Año;

-- Calcular la suma total de galones suministrados por todos los acueductos en 2022:
SELECT Año, SUM([Acueducto La Vega] + [Acueducto Jarabacoa] + [Acueducto Constanza] + [Acueducto Jima] + [Acueductos rurales]) AS [Suministro Total]
FROM ProduccionAguaPotable
WHERE Año = '2022'
GROUP BY Año;


-- Para encontrar el mes con mayor suministro de agua total:
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

