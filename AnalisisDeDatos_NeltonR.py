#!/usr/bin/env python
# coding: utf-8

# In[32]:


import pandas as pd
import matplotlib.pyplot as plt


# Variable para Leer el archivo Excel. Ese archivo solo contiene el total de galones producidos cada año
df = pd.read_excel(r'C:\Datos CSV Produccion de Agua\Cantidad total de agua potable en galones desde 2019 hasta 2022.xlsx')

# 1. ACUEDUCTO LA VEGA

# Seleccionar las columnas relevantes... En este Caso Año y La Vega (Acueducto)
columnas = df[["Año", "La Vega"]]

# Gráfico de barras Cantidad de Agua Potable producido por el Acueducto La Vega (2019-2022)
ax = columnas.plot.bar(x="Año", y="La Vega", rot=0)
plt.xlabel("Año")
plt.ylabel("Cantidad de Agua (Galones)")
plt.title("Producción de Agua en Acueducto La Vega por Año")

# Bucle para acceder a los datos de los años:
for p in ax.patches:
    ax.annotate(format(p.get_height(), '.0f'), 
                (p.get_x() + p.get_width() / 2., p.get_height()), 
                ha = 'center', va = 'center', 
                xytext = (0, 9), 
                textcoords = 'offset points',
                fontsize=8,
                color='black') 
plt.show()

# 2. ACUEDUCTO JARABACOA

# Seleccionar las columnas relevantes... En este Caso Año y Jarabacoa (Acueducto)
columnas_jarabacoa = df[["Año", "Jarabacoa"]]

# Gráfico de barras Cantidad de Agua Potable producido por el Acueducto Jarabacoa (2019-2022)
ax_jarabacoa = columnas_jarabacoa.plot.bar(x="Año", y="Jarabacoa", rot=0)
plt.xlabel("Año")
plt.ylabel("Cantidad de Agua (Galones)")
plt.title("Producción de Agua en Acueducto Jarabacoa por Año")

# Bucle para acceder a los datos de los años:
for p in ax_jarabacoa.patches:
    ax_jarabacoa.annotate(format(p.get_height(), '.0f'), 
                (p.get_x() + p.get_width() / 2., p.get_height()), 
                ha = 'center', va = 'center', 
                xytext = (0, 9), 
                textcoords = 'offset points',
                fontsize=8,
                color='black') 
plt.show()

# 3. ACUEDUCTO  CONSTANZA

# Seleccionar las columnas relevantes... En este Caso Año y Constanza (Acueducto)
columnas_constanza = df[["Año", "Constanza"]]

# Gráfico de barras Cantidad de Agua Potable producido por el Acueducto Constanza (2019-2022)
ax_constanza = columnas_constanza.plot.bar(x="Año", y="Constanza", rot=0)
plt.xlabel("Año")
plt.ylabel("Cantidad de Agua (Galones)")
plt.title("Producción de Agua en Acueducto Contanza por Año")

# Bucle para acceder a los datos de los años:
for p in ax_constanza.patches:
    ax_constanza.annotate(format(p.get_height(), '.0f'), 
                (p.get_x() + p.get_width() / 2., p.get_height()), 
                ha = 'center', va = 'center', 
                xytext = (0, 9), 
                textcoords = 'offset points',
                fontsize=8,
                color='black') 
plt.show()


# 4. ACUEDUCTO JIMA

# Seleccionar las columnas relevantes... En este Caso Año y Jima (Acueducto)
columnas_jima = df[["Año", "Jima"]]

# Gráfico de barras Cantidad de Agua Potable producido por el Acueducto Jima (2019-2022)
ax_jima = columnas_jima.plot.bar(x="Año", y="Jima", rot=0)
plt.xlabel("Año")
plt.ylabel("Cantidad de Agua (Galones)")
plt.title("Producción de Agua en Acueducto Jima por Año")

# Bucle para acceder a los datos de los años:
for p in ax_jima.patches:
    ax_jima.annotate(format(p.get_height(), '.0f'), 
                (p.get_x() + p.get_width() / 2., p.get_height()), 
                ha = 'center', va = 'center', 
                xytext = (0, 9), 
                textcoords = 'offset points',
                fontsize=8,
                color='black') 
plt.show()

# 5. ACUEDUCTOS RURALES

# Seleccionar las columnas relevantes... En este Caso Año y Rurales (Acueducto)
columnas_rurales = df[["Año", "Rurales"]]

# Gráfico de barras Cantidad de Agua Potable producido por Acueductos Rurales (2019-2022)
ax_rurales = columnas_rurales.plot.bar(x="Año", y="Rurales", rot=0)
plt.xlabel("Año")
plt.ylabel("Cantidad de Agua (Galones)")
plt.title("Producción de Agua en Acueductos Rurales por Año")

# Bucle para acceder a los datos de los años:
for p in ax_rurales.patches:
    ax_rurales.annotate(format(p.get_height(), '.0f'), 
                (p.get_x() + p.get_width() / 2., p.get_height()), 
                ha = 'center', va = 'center', 
                xytext = (0, 9), 
                textcoords = 'offset points',
                fontsize=8,
                color='black') 
plt.show()



# In[52]:


import pandas as pd
import numpy as np
import seaborn as sns

import matplotlib.pyplot as plt
import matplotlib.mlab as mlab
import matplotlib
plt.style.use('ggplot')
from matplotlib.pyplot import figure

get_ipython().run_line_magic('matplotlib', 'inline')
matplotlib.rcParams['figure.figsize'] = (10,6) # Tamaño de la figura


# Variable que leera el archivo CSV donde se encuentran TODOS los datos...
df = pd.read_csv(r'C:\Datos CSV Produccion de Agua\ProducciónAguaPotable2019-2023.csv', encoding='latin1')

# Solo necesito las columnas de la #3 en adelante (o sea, los acueductos...)
# Quitamos las comas de los numeros para evitar problemas...
numeric_columns = df.columns[3:]
df[numeric_columns] = df[numeric_columns].replace({',': ''}, regex=True).astype(float)

# 1. Gráfico de barras para la producción mensual promedio en 2023(enero-julio)... Acueducto Jarabacoa
df_2023_jarabacoa = df[df['Año'] == 2023]
plt.figure(figsize=(12, 6))
sns.barplot(data=df_2023_jarabacoa, x='Mes', y='Acueducto Jarabacoa')
plt.title('Producción Mensual en 2023 Acueducto Jarabacoa')
plt.xlabel('Mes')
plt.ylabel('Producción de Agua (Galones)')
plt.xticks(rotation=45)

# Bucle para que se vean los valores exactos
for idx, value in enumerate(df_2023_jarabacoa['Acueducto Jarabacoa']):
    plt.text(idx, value, f'{value:.2f}', ha='center', va='bottom', fontsize=8, color='black')

plt.tight_layout()
plt.show()


# 2. Gráfico de barras para la producción mensual promedio en 2023(enero-julio)... Acueducto La Vega
df_2023_lavega = df[df['Año'] == 2023]
plt.figure(figsize=(12, 6))
sns.barplot(data=df_2023_jarabacoa, x='Mes', y='Acueducto La Vega')
plt.title('Producción Mensual en 2023 Acueducto La Vega')
plt.xlabel('Mes')
plt.ylabel('Producción de Agua (Galones)')
plt.xticks(rotation=45)

# Bucle para que se vean los valores exactos
for idx, value in enumerate(df_2023_lavega['Acueducto La Vega']):
    plt.text(idx, value, f'{value:.2f}', ha='center', va='bottom', fontsize=8, color='black')

plt.tight_layout()
plt.show()


# 3. Gráfico de barras para la producción mensual promedio en 2023(enero-julio)... Acueducto Constanza
df_2023_constanza = df[df['Año'] == 2023]
plt.figure(figsize=(12, 6))
sns.barplot(data=df_2023_constanza, x='Mes', y='Acueducto Constanza')
plt.title('Producción Mensual en 2023 Acueducto Constanza')
plt.xlabel('Mes')
plt.ylabel('Producción de Agua (Galones)')
plt.xticks(rotation=45)

# Bucle para que se vean los valores exactos
for idx, value in enumerate(df_2023_constanza['Acueducto Constanza']):
    plt.text(idx, value, f'{value:.2f}', ha='center', va='bottom', fontsize=8, color='black')

plt.tight_layout()
plt.show()



# 4. Gráfico de barras para la producción mensual promedio en 2023(enero-julio)... Acueducto Jima
df_2023_jima = df[df['Año'] == 2023]
plt.figure(figsize=(12, 6))
sns.barplot(data=df_2023_jima, x='Mes', y='Acueducto Jima')
plt.title('Producción Mensual en 2023 Acueducto Jima')
plt.xlabel('Mes')
plt.ylabel('Producción de Agua (Galones)')
plt.xticks(rotation=45)

# Bucle para que se vean los valores exactos
for idx, value in enumerate(df_2023_jima['Acueducto Jima']):
    plt.text(idx, value, f'{value:.2f}', ha='center', va='bottom', fontsize=8, color='black')

plt.tight_layout()
plt.show()



# 5. Gráfico de barras para la producción mensual promedio en 2023(enero-julio)... Acueductos Rurales
df_2023_rurales = df[df['Año'] == 2023]
plt.figure(figsize=(12, 6))
sns.barplot(data=df_2023_rurales, x='Mes', y='Acueductos rurales')
plt.title('Producción Mensual en 2023 Acueductos Rurales')
plt.xlabel('Mes')
plt.ylabel('Producción de Agua (Galones)')
plt.xticks(rotation=45)

# Bucle para que se vean los valores exactos
for idx, value in enumerate(df_2023_rurales['Acueductos rurales']):
    plt.text(idx, value, f'{value:.2f}', ha='center', va='bottom', fontsize=8, color='black')

plt.tight_layout()
plt.show()


# In[74]:


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Variable que leera el archivo CSV donde se encuentran TODOS los datos...
datos = pd.read_csv(r'C:\Datos CSV Produccion de Agua\ProducciónAguaPotable2019-2023.csv', encoding='latin1')

# Vamos a calcular el crecimiento porcentual del Acueducto La Vega VS Acueducto Jarabacoa:
acueductos = datos.columns[3:5] 
crecimiento = datos[acueductos].pct_change()*100

# pct_change se usa para calcular la diferencia porcentual, formula:  (b-a)/A, y x 100 da el '%'


# Creamos grafico:
plt.figure(figsize=(10, 6))
crecimiento.plot(kind='line', marker='o')
plt.title('Comparación Crecimiento Porcentual Acueducto La Vega VS Acueducto Jarabacoa Enero 2019 Julio 2023')
plt.xlabel('Año')
plt.ylabel('Crecimiento Porcentual (%)')
plt.legend(loc='upper left', bbox_to_anchor=(1, 1))
plt.grid(True)
plt.show()


# In[ ]:




