```python
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import calendar
```


```python
df = pd.read_csv('analysis_table.csv')
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>order_id</th>
      <th>customer_id</th>
      <th>order_status</th>
      <th>order_purchase_time</th>
      <th>order_approved</th>
      <th>order_delivered_carrier_date</th>
      <th>order_delivered_customer_date</th>
      <th>order_estimated_delivery_date</th>
      <th>price</th>
      <th>product_category_name</th>
      <th>order_item_id</th>
      <th>freight_value</th>
      <th>reviews_score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>00010242fe8c5a6d1ba2dd792cb16214</td>
      <td>3ce436f183e68e07877b285a838db11a</td>
      <td>delivered</td>
      <td>13/09/2017 08:59</td>
      <td>13/09/2017 09:45</td>
      <td>19/09/2017 18:34</td>
      <td>20/09/2017 23:43</td>
      <td>29/09/2017 00:00</td>
      <td>58.90</td>
      <td>cool_stuff</td>
      <td>1.0</td>
      <td>13.29</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>00018f77f2f0320c557190d7a144bdd3</td>
      <td>f6dd3ec061db4e3987629fe6b26e5cce</td>
      <td>delivered</td>
      <td>26/04/2017 10:53</td>
      <td>26/04/2017 11:05</td>
      <td>04/05/2017 14:35</td>
      <td>12/05/2017 16:04</td>
      <td>15/05/2017 00:00</td>
      <td>239.90</td>
      <td>pet_shop</td>
      <td>1.0</td>
      <td>19.93</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>000229ec398224ef6ca0657da4fc703e</td>
      <td>6489ae5e4333f3693df5ad4372dab6d3</td>
      <td>delivered</td>
      <td>14/01/2018 14:33</td>
      <td>14/01/2018 14:48</td>
      <td>16/01/2018 12:36</td>
      <td>22/01/2018 13:19</td>
      <td>05/02/2018 00:00</td>
      <td>199.00</td>
      <td>moveis_decoracao</td>
      <td>1.0</td>
      <td>17.87</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>00024acbcdf0a6daa1e931b038114c75</td>
      <td>d4eb9395c8c0431ee92fce09860c5a06</td>
      <td>delivered</td>
      <td>08/08/2018 10:00</td>
      <td>08/08/2018 10:10</td>
      <td>10/08/2018 13:28</td>
      <td>14/08/2018 13:32</td>
      <td>20/08/2018 00:00</td>
      <td>12.99</td>
      <td>perfumaria</td>
      <td>1.0</td>
      <td>12.79</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>00048cc3ae777c65dbb7d2a0634bc1ea</td>
      <td>816cbea969fe5b689b39cfc97a506742</td>
      <td>delivered</td>
      <td>15/05/2017 21:42</td>
      <td>17/05/2017 03:55</td>
      <td>17/05/2017 11:05</td>
      <td>22/05/2017 13:44</td>
      <td>06/06/2017 00:00</td>
      <td>21.90</td>
      <td>utilidades_domesticas</td>
      <td>1.0</td>
      <td>12.69</td>
      <td>4.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 114092 entries, 0 to 114091
    Data columns (total 13 columns):
     #   Column                         Non-Null Count   Dtype  
    ---  ------                         --------------   -----  
     0   order_id                       114092 non-null  object 
     1   customer_id                    114092 non-null  object 
     2   order_status                   114092 non-null  object 
     3   order_purchase_time            114092 non-null  object 
     4   order_approved                 113930 non-null  object 
     5   order_delivered_carrier_date   112112 non-null  object 
     6   order_delivered_customer_date  110839 non-null  object 
     7   order_estimated_delivery_date  114092 non-null  object 
     8   price                          113314 non-null  float64
     9   product_category_name          111702 non-null  object 
     10  order_item_id                  113314 non-null  float64
     11  freight_value                  113314 non-null  float64
     12  reviews_score                  113131 non-null  float64
    dtypes: float64(4), object(9)
    memory usage: 11.3+ MB
    


```python
# changing data type into datetime
date_cols = ['order_purchase_time','order_approved', 'order_delivered_carrier_date','order_delivered_customer_date','order_estimated_delivery_date']
df[date_cols] = df[date_cols].apply(pd.to_datetime)
```

    C:\Users\aminh\AppData\Local\Temp\ipykernel_64408\481634424.py:3: UserWarning: Parsing dates in %d/%m/%Y %H:%M format when dayfirst=False (the default) was specified. Pass `dayfirst=True` or specify a format to silence this warning.
      df[date_cols] = df[date_cols].apply(pd.to_datetime)
    C:\Users\aminh\AppData\Local\Temp\ipykernel_64408\481634424.py:3: UserWarning: Parsing dates in %d/%m/%Y %H:%M format when dayfirst=False (the default) was specified. Pass `dayfirst=True` or specify a format to silence this warning.
      df[date_cols] = df[date_cols].apply(pd.to_datetime)
    C:\Users\aminh\AppData\Local\Temp\ipykernel_64408\481634424.py:3: UserWarning: Parsing dates in %d/%m/%Y %H:%M format when dayfirst=False (the default) was specified. Pass `dayfirst=True` or specify a format to silence this warning.
      df[date_cols] = df[date_cols].apply(pd.to_datetime)
    C:\Users\aminh\AppData\Local\Temp\ipykernel_64408\481634424.py:3: UserWarning: Parsing dates in %d/%m/%Y %H:%M format when dayfirst=False (the default) was specified. Pass `dayfirst=True` or specify a format to silence this warning.
      df[date_cols] = df[date_cols].apply(pd.to_datetime)
    C:\Users\aminh\AppData\Local\Temp\ipykernel_64408\481634424.py:3: UserWarning: Parsing dates in %d/%m/%Y %H:%M format when dayfirst=False (the default) was specified. Pass `dayfirst=True` or specify a format to silence this warning.
      df[date_cols] = df[date_cols].apply(pd.to_datetime)
    


```python
# Creating new column deliver time which calculates the time taken to deliver to customer from when the order was purchased
df['deliver_time'] = df['order_delivered_customer_date'] - df['order_purchase_time']
df['approval_time'] = df['order_approved'] - df['order_purchase_time']
df['waiting_time'] = df['order_delivered_carrier_date'] - df['order_approved']
df['shipping_time'] = df['order_delivered_customer_date'] - df['order_delivered_carrier_date']
df['estimated_time'] = df['order_estimated_delivery_date'] - df['order_purchase_time']
df['deliver_estimate_time_gap'] = df['deliver_time'] - df['estimated_time']
```


```python
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 114092 entries, 0 to 114091
    Data columns (total 19 columns):
     #   Column                         Non-Null Count   Dtype          
    ---  ------                         --------------   -----          
     0   order_id                       114092 non-null  object         
     1   customer_id                    114092 non-null  object         
     2   order_status                   114092 non-null  object         
     3   order_purchase_time            114092 non-null  datetime64[ns] 
     4   order_approved                 113930 non-null  datetime64[ns] 
     5   order_delivered_carrier_date   112112 non-null  datetime64[ns] 
     6   order_delivered_customer_date  110839 non-null  datetime64[ns] 
     7   order_estimated_delivery_date  114092 non-null  datetime64[ns] 
     8   price                          113314 non-null  float64        
     9   product_category_name          111702 non-null  object         
     10  order_item_id                  113314 non-null  float64        
     11  freight_value                  113314 non-null  float64        
     12  reviews_score                  113131 non-null  float64        
     13  deliver_time                   110839 non-null  timedelta64[ns]
     14  approval_time                  113930 non-null  timedelta64[ns]
     15  waiting_time                   112097 non-null  timedelta64[ns]
     16  shipping_time                  110838 non-null  timedelta64[ns]
     17  estimated_time                 114092 non-null  timedelta64[ns]
     18  deliver_estimate_time_gap      110839 non-null  timedelta64[ns]
    dtypes: datetime64[ns](5), float64(4), object(4), timedelta64[ns](6)
    memory usage: 16.5+ MB
    


```python
df.isna().sum()
```




    order_id                            0
    customer_id                         0
    order_status                        0
    order_purchase_time                 0
    order_approved                    162
    order_delivered_carrier_date     1980
    order_delivered_customer_date    3253
    order_estimated_delivery_date       0
    price                             778
    product_category_name            2390
    order_item_id                     778
    freight_value                     778
    reviews_score                     961
    deliver_time                     3253
    approval_time                     162
    waiting_time                     1995
    shipping_time                    3254
    estimated_time                      0
    deliver_estimate_time_gap        3253
    dtype: int64




```python
# replacing all empty product names with 'Unknown'
df['product_category_name'].fillna('Unknown', inplace=True)
```

    C:\Users\aminh\AppData\Local\Temp\ipykernel_64408\3003120284.py:2: FutureWarning: A value is trying to be set on a copy of a DataFrame or Series through chained assignment using an inplace method.
    The behavior will change in pandas 3.0. This inplace method will never work because the intermediate object on which we are setting values always behaves as a copy.
    
    For example, when doing 'df[col].method(value, inplace=True)', try using 'df.method({col: value}, inplace=True)' or df[col] = df[col].method(value) instead, to perform the operation inplace on the original object.
    
    
      df['product_category_name'].fillna('Unknown', inplace=True)
    


```python
df.isna().sum()
```




    order_id                            0
    customer_id                         0
    order_status                        0
    order_purchase_time                 0
    order_approved                      0
    order_delivered_carrier_date        1
    order_delivered_customer_date       0
    order_estimated_delivery_date       0
    price                               0
    product_category_name               0
    order_item_id                       0
    freight_value                       0
    reviews_score                     827
    deliver_time                        0
    approval_time                      15
    waiting_time                       16
    shipping_time                       1
    estimated_time                      0
    deliver_estimate_time_gap           0
    product_category_name_english    1545
    dtype: int64




```python
# all price, freight_value and order_item_id share same rows with missing values
# on top of that all these rows also have order_delivered_customer_date missing as the number decreased matches up
test = df.dropna(subset='price')
test.isna().sum()
```




    order_id                            0
    customer_id                         0
    order_status                        0
    order_purchase_time                 0
    order_approved                      0
    order_delivered_carrier_date        1
    order_delivered_customer_date       0
    order_estimated_delivery_date       0
    price                               0
    product_category_name               0
    order_item_id                       0
    freight_value                       0
    reviews_score                     827
    deliver_time                        0
    approval_time                      15
    waiting_time                       16
    shipping_time                       1
    estimated_time                      0
    deliver_estimate_time_gap           0
    product_category_name_english    1545
    dtype: int64




```python
# I will remove all rows that have missing values from price, freight_values and order_item_id
# all these rows have been shown to also have missing order_delivered_customer_date, indicating these orders may not have been delivered
# It will be stored under missing values and data will be interpreted seperately
missing_values = df[df.price.isna()]
missing_values.reviews_score.describe()
```




    count    0.0
    mean     NaN
    std      NaN
    min      NaN
    25%      NaN
    50%      NaN
    75%      NaN
    max      NaN
    Name: reviews_score, dtype: float64




```python
# removing the missing_values as mentioned above
df.dropna(subset='price', inplace=True)
```


```python
df.isna().sum()
```




    order_id                            0
    customer_id                         0
    order_status                        0
    order_purchase_time                 0
    order_approved                      0
    order_delivered_carrier_date        1
    order_delivered_customer_date       0
    order_estimated_delivery_date       0
    price                               0
    product_category_name               0
    order_item_id                       0
    freight_value                       0
    reviews_score                     827
    deliver_time                        0
    approval_time                      15
    waiting_time                       16
    shipping_time                       1
    estimated_time                      0
    deliver_estimate_time_gap           0
    product_category_name_english    1545
    dtype: int64




```python
df[df["order_delivered_customer_date"].isnull()]["order_status"].value_counts()
```




    Series([], Name: count, dtype: int64)




```python
df.order_status.value_counts()
```




    order_status
    delivered    110832
    canceled          7
    Name: count, dtype: int64




```python
# the data shows that the most of the null values from order_delivered_customer_date are still in the process of delivering when the data was taken
# I will remove them from the data
df.dropna(subset='order_delivered_customer_date', inplace=True)
```


```python
df.isna().sum()
```




    order_id                            0
    customer_id                         0
    order_status                        0
    order_purchase_time                 0
    order_approved                      0
    order_delivered_carrier_date        1
    order_delivered_customer_date       0
    order_estimated_delivery_date       0
    price                               0
    product_category_name               0
    order_item_id                       0
    freight_value                       0
    reviews_score                     827
    deliver_time                        0
    approval_time                      15
    waiting_time                       16
    shipping_time                       1
    estimated_time                      0
    deliver_estimate_time_gap           0
    product_category_name_english    1545
    dtype: int64




```python
# null values of order approved time are being filled with order purchase time of the same row
df['order_approved'] = df['order_approved'].fillna(df['order_purchase_time'])
```


```python
translation_map = {
    "agro_industria_e_comercio": "Agribusiness & Commerce",
    "alimentos": "Food",
    "alimentos_bebidas": "Food & Beverages",
    "artes": "Arts",
    "artes_e_artesanato": "Arts & Crafts",
    "artigos_de_festas": "Party Supplies",
    "artigos_de_natal": "Christmas Items",
    "audio": "Audio",
    "automotivo": "Automotive",
    "bebes": "Baby",
    "bebidas": "Beverages",
    "beleza_saude": "Beauty & Health",
    "brinquedos": "Toys",
    "cama_mesa_banho": "Bed, Bath & Table",
    "casa_conforto": "Home Comfort",
    "casa_conforto_2": "Home Comfort (Other)",
    "casa_construcao": "Home Construction",
    "cds_dvds_musicais": "Music CDs & DVDs",
    "cine_foto": "Cameras & Photography",
    "climatizacao": "Climate Control (AC, Heaters)",
    "consoles_games": "Consoles & Video Games",
    "construcao_ferramentas_construcao": "Construction Tools",
    "construcao_ferramentas_ferramentas": "Hand Tools",
    "construcao_ferramentas_iluminacao": "Lighting (Construction)",
    "construcao_ferramentas_jardim": "Garden Tools",
    "construcao_ferramentas_seguranca": "Safety Equipment",
    "cool_stuff": "Cool Gadgets",
    "dvds_blu_ray": "DVDs & Blu-rays",
    "eletrodomesticos": "Home Appliances",
    "eletrodomesticos_2": "Home Appliances (Other)",
    "eletronicos": "Electronics",
    "eletroportateis": "Small Appliances",
    "esporte_lazer": "Sports & Leisure",
    "fashion_bolsas_e_acessorios": "Fashion: Bags & Accessories",
    "fashion_calcados": "Fashion: Shoes",
    "fashion_esporte": "Fashion: Sportswear",
    "fashion_roupa_feminina": "Fashion: Women's Clothing",
    "fashion_roupa_infanto_juvenil": "Fashion: Kids & Teens Clothing",
    "fashion_roupa_masculina": "Fashion: Men's Clothing",
    "fashion_underwear_e_moda_praia": "Fashion: Underwear & Swimwear",
    "ferramentas_jardim": "Garden Tools",
    "flores": "Flowers",
    "fraldas_higiene": "Diapers & Hygiene",
    "industria_comercio_e_negocios": "Industry, Commerce & Business",
    "informatica_acessorios": "Computer & Accessories",
    "instrumentos_musicais": "Musical Instruments",
    "la_cuisine": "Kitchenware",
    "livros_importados": "Imported Books",
    "livros_interesse_geral": "General Interest Books",
    "livros_tecnicos": "Technical Books",
    "malas_acessorios": "Luggage & Accessories",
    "market_place": "Marketplace",
    "moveis_colchao_e_estofado": "Mattresses & Upholstery",
    "moveis_cozinha_area_de_servico_jantar_e_jardim": "Kitchen, Dining & Garden Furniture",
    "moveis_decoracao": "Home Décor & Furniture",
    "moveis_escritorio": "Office Furniture",
    "moveis_quarto": "Bedroom Furniture",
    "moveis_sala": "Living Room Furniture",
    "musica": "Music",
    "papelaria": "Stationery",
    "pc_gamer": "Gaming PCs",
    "pcs": "Desktop PCs",
    "perfumaria": "Perfumes",
    "pet_shop": "Pet Shop",
    "portateis_casa_forno_e_cafe": "Small Kitchen Appliances (Oven & Coffee)",
    "portateis_cozinha_e_preparadores_de_alimentos": "Small Kitchen Appliances (Food Prep)",
    "relogios_presentes": "Watches & Gifts",
    "seguros_e_servicos": "Insurance & Services",
    "sinalizacao_e_seguranca": "Signage & Safety",
    "tablets_impressao_imagem": "Tablets, Printers & Imaging",
    "telefonia": "Mobile Phones",
    "telefonia_fixa": "Landline Phones",
    "utilidades_domesticas": "Household Items",
    "Unknown":"Unknown"
}

# Apply translation
df['product_category_name_english'] = df['product_category_name'].map(translation_map)
```


```python
df.to_csv('analysis_table_edit.csv', index=False)
```


```python

```
