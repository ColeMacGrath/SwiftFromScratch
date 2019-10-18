![alt text](https://camo.githubusercontent.com/de32b354687f1cd9b05a89e4aa03c7f2d311f294/68747470733a2f2f73776966742e6f72672f6173736574732f696d616765732f73776966742e737667)

## [0 - Básicos](https://github.com/ColeMacGrath/SwiftFromScratch/tree/master/0%20-%20Básicos)

Revisando temas básicos de programación en C++ y su compración con Swift

|           Tema           |
| :----------------------: |
|          Clases          |
|         Arreglos         |
| Declaración de variables |
|        Funciones         |
|          Bucles          |

## [1 - Interfaces](https://github.com/ColeMacGrath/SwiftFromScratch/tree/master/1%20-%20Interfaces/Interfaz-1) / [2 - Web Scraping](https://github.com/ColeMacGrath/SwiftFromScratch/tree/master/2%20-%20Web%20Scrapping)

Creación de una aplicación de música para revisar el funcionamiento básico de las interfaces con restricciones, objetos básicos (UIImageView, Label, TableView, CollectionView y extensiones) así como paso de información entre controladores.  Scrapping de datos directos de la web para proveer a la aplicación de datos directos de internet.

## Screenshots

| ![alt text](https://user-images.githubusercontent.com/42153044/65650765-c81ccb80-dfd1-11e9-94fa-c05ef8235b08.png) | ![alt text](https://user-images.githubusercontent.com/42153044/65650766-c8b56200-dfd1-11e9-846a-72e82cf38983.png) | ![alt text](https://user-images.githubusercontent.com/42153044/65650767-c8b56200-dfd1-11e9-8c00-3a16d87ba260.png) |
| :----------------------------------------------------------: | ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![alt text](https://user-images.githubusercontent.com/42153044/65650768-c8b56200-dfd1-11e9-930a-1d7a016bd5a3.png) | ![alt text](https://user-images.githubusercontent.com/42153044/65650769-c8b56200-dfd1-11e9-8712-4cda7fed8792.png) | ![alt text](https://user-images.githubusercontent.com/42153044/65650770-c8b56200-dfd1-11e9-96c6-afc0838f48f1.png) |

## [3 - Machine Learning](https://github.com/ColeMacGrath/SwiftFromScratch/tree/master/3%20-%20HousePrice)

Aplicación basada en un UIPageViewController dónde en base a ciertos parámetros se busca predecir el precio de venta de una casa con CoreML.

### Acerca del modelo 

Modelo entrenado con 100,000 datos a partir de un JSON

#### Type

Pipeline Regressor

#### Size

1.2 MB

#### Model Evaluation Parameters

 #### Inputs

|   Name    |  Type  |
| :-------: | :----: |
| bathrooms | Double |
|   cars    | Double |
| condition | Double |
|   rooms   | Double |
|   size    | Double |
| yearBuilt | Double |

#### Output

* Value -> Double (precio estimado)

## Screenshots

| ![alt text](https://user-images.githubusercontent.com/42153044/66789815-f1cf6100-eeb2-11e9-92cc-a03c6e678832.png) | ![alt text](https://user-images.githubusercontent.com/42153044/66789816-f1cf6100-eeb2-11e9-9630-5a45e613860e.png) | ![alt text](https://user-images.githubusercontent.com/42153044/66789817-f1cf6100-eeb2-11e9-9cc2-9bb36bba789e.png) |
| :----------------------------------------------------------: | ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![alt text](https://user-images.githubusercontent.com/42153044/66789818-f1cf6100-eeb2-11e9-80d8-ad4da2a16107.png) | ![alt text](https://user-images.githubusercontent.com/42153044/66789819-f1cf6100-eeb2-11e9-81a2-b6f748b1925d.png) | ![alt text](https://user-images.githubusercontent.com/42153044/66789820-f267f780-eeb2-11e9-82cc-92675a4bcf42.png) |
|                                                              | ![alt text](https://user-images.githubusercontent.com/42153044/66789822-f267f780-eeb2-11e9-9ba2-da6efe92f8c8.png) |                                                              |

## [4 - Machine Learning en imágenes](https://github.com/ColeMacGrath/SwiftFromScratch/tree/master/4%20-%20Image%20Predictor)

Aplicación basada en CoreML entrenada con el imageset de [animals10](https://www.kaggle.com/alessiocorrado99/animals10) para determinar el animal con una imagen

### Acerca del modelo

El modelo fue entrenado con mas de 20,000 imágenes

#### Nombre

[AnimalsImageClassifier.mlmodel](https://github.com/ColeMacGrath/SwiftFromScratch/blob/master/4%20-%20Image%20Predictor/AnimalsImageClassifier.mlmodel)

#### Tipo

Image Classifier

#### Tamaño

148 kb

#### Descripción

A machine learning model that has been trained to recognize images. When you give it an image, it responds with a label for that image.

#### Parámetros

##### Inputs:

- Image (Color 299x299): Input image to be classified

#### Outputs

- classLabelProbs (String -> Double): Probability of each category
- classLabel (String): Most likely image category

## Animales a determinar

|  Animal  | Número de imágenes | Tamaño original |
| :------: | :----------------: | :-------------: |
|  Perro   |        4908        |     61.3 MB     |
| Caballo  |        2673        |     43.6 MB     |
| Elefante |        1484        |      62 MB      |
| Mariposa |        2465        |     73.1 MB     |
| Gallina  |        3672        |     68.6 MB     |
|   Gato   |        1942        |    158.7 MB     |
|   Vaca   |        2040        |     32.2 MB     |
|  Oveja   |        1943        |      69 MB      |
|  Araña   |        5134        |     99.9 MB     |
| Ardilla  |        2014        |     31.7 MB     |

## Screenshots

| ![alt text](https://user-images.githubusercontent.com/42153044/66969556-a43c2b00-f04f-11e9-96fb-0559a24a7d51.png) | ![alt text](https://user-images.githubusercontent.com/42153044/66969557-a4d4c180-f04f-11e9-9d66-22962b582c0e.png) |
| :----------------------------------------------------------: | ------------------------------------------------------------ |
| ![alt text](https://user-images.githubusercontent.com/42153044/67133718-b8a93080-f1d3-11e9-94f9-98964723e1b2.png) | ![alt text](https://user-images.githubusercontent.com/42153044/67133719-b8a93080-f1d3-11e9-87d4-55be10f0cb85.png) |

# Utilidades

* [Pixaby - Galería de imágenes en alta resolución](https://pixabay.com)

* [Iconscout - Repositorio de íconos editables](https://iconscout.com)

* [ScaleImageDown - workflow para el escalado de imágenes a @3x, @2x, @1x](https://github.com/ColeMacGrath/SwiftFromScratch/tree/master/Utilidades/ScaleImageDown.workflow)

* [CreateML - Playground para la creación de un modelo de CoreML a partir de un dataset](https://github.com/ColeMacGrath/SwiftFromScratch/tree/master/Utilidades/CreateML.playground)

* [Create Image Classifier - Playground para la creación de un modelo de Vision a partir de un set de imágenes](https://github.com/ColeMacGrath/SwiftFromScratch/tree/master/Utilidades/Create%20Image%20Classifier.playground)
