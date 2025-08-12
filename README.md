# Proyecto de Aplicación


Este proyecto es una aplicación desarrollada en Flutter 3.29.3 que funciona en dispositivos iOS y Android. Se utiliza **FVM (Flutter Version Manager)** para gestionar la versión de Flutter. Además, se proporciona un archivo `.env.example` para las configuraciones locales, que solo contiene URLs y no compromete información sensible. También se incluye un archivo de configuración de Visual Studio Code para facilitar la ejecución y depuración del proyecto.

## Estructura del Proyecto

- `.env.local`: Contiene las URLs necesarias para la configuración local.
- `.vscode`: Contiene el archivo `launch.json` para facilitar la ejecución y depuración de la aplicación.


## Arquitectura del Proyecto

### 1. **Clean Architecture**

Este proyecto sigue el principio de **Clean Architecture**, el cual busca una separación clara de responsabilidades entre las diferentes capas de la aplicación, lo que permite una mayor mantenibilidad, escalabilidad y testabilidad.

La **Clean Architecture** se divide en varias capas que interactúan entre sí de manera estructurada:

- **Capa de Dominio**: Contiene la lógica de negocio central, como los **Use Cases** (Casos de Uso) que encapsulan las acciones o comportamientos específicos de la aplicación.
  
- **Capa de Datos**: Interactúa con las fuentes de datos externas, como bases de datos o APIs. Los **Repositorios** se encargan de abstraer la interacción con estas fuentes.

- **Capa de Presentación**: Donde se encuentra la lógica de la interfaz de usuario. Aquí se utiliza **Flutter BLoC** para gestionar el estado de la aplicación y separarlo de la lógica de presentación.

La comunicación entre las capas sigue una dirección clara:
- La **Capa de Presentación** se comunica con la **Capa de Dominio** a través de los **Use Cases**.
- La **Capa de Dominio** interactúa con la **Capa de Datos** a través de los **Repositorios**.

### 2. **Uso de BLoC (Business Logic Component)**

En este proyecto, se utiliza **Flutter BLoC** para gestionar el estado de la aplicación de manera reactiva y separada de la UI. BLoC se encarga de gestionar los eventos y estados, lo que permite que la lógica de negocio esté completamente desacoplada de la interfaz de usuario. Esto facilita el testeo de la lógica y mejora la escalabilidad de la aplicación.

#### Flujo de BLoC:
1. **Event**: El usuario realiza una acción, como presionar un botón.
2. **BLoC**: El evento es procesado por el BLoC, que ejecuta la lógica asociada.
3. **State**: El BLoC emite un nuevo estado que representa la actualización de la UI.

### 3. **Inyección de Dependencias**

La **inyección de dependencias** se utiliza para manejar las dependencias de manera eficiente y flexible. Esto permite que las clases no creen sus propias dependencias, sino que las reciban de un contenedor de dependencias, facilitando las pruebas unitarias y la reutilización del código.

En este proyecto, se utiliza **GetIt** para la inyección de dependencias. Estas herramientas permiten registrar y acceder a instancias de las clases que se necesitarán en el proyecto (por ejemplo, los **Repositorios**, **Use Cases** y **BLoC**).

#### Ejemplo de Inyección de Dependencias:
```dart
final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<SomeRepository>(() => SomeRepositoryImpl());
  getIt.registerFactory<SomeUseCase>(() => SomeUseCase(getIt()));
  getIt.registerFactory<SomeBloc>(() => SomeBloc(getIt()));
}

## Configuración del Entorno

1. Clona el repositorio:

   ```bash
   git clone https://github.com/miguelangelflores1993/PinApp.git
   cd PinApp
   ```

## Generación de Código con Mason CLI

Este proyecto utiliza **Mason CLI** para generar código de features de manera automatizada. Para configurar y usar Mason, sigue estos pasos:

### Instalación de Mason CLI

1. **Activa Mason CLI globalmente:**
   ```bash
   dart pub global activate mason_cli
   ```

2. **Instala las dependencias de Mason:**
   ```bash
   mason get
   ```

### Uso de Mason para generar features

Una vez configurado Mason, puedes generar nuevas features usando los siguientes comandos:

```bash
# Crear una feature básica
mason make feature --feature_name=sellers

# Crear una feature simple
mason make feature_simple --feature_name=sales

# Crear una feature con Dartz
mason make feature --feature_name=sales

# Agregar biblioteca de networking
mason make networking --name=none
```

## Firebase analitics
npm install -g firebase-tools
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
  flutterfire config --project=keen-honor-459913-h5 --out=lib/firebase_options_dev.dart --ios-bundle-id=com.datec.elgeniox.dev --ios-out=ios/flavors/dev/GoogleService-Info.plist --android-package-name=com.datec.elgeniox.dev --android-out=android/app/src/development/google-services.json