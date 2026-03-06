
# Blueprint: Florería Ajolote App

## 1. Visión General

**Florería Ajolote** es una aplicación móvil de comercio electrónico desarrollada en Flutter. Su objetivo es proporcionar a los usuarios una experiencia de compra de arreglos florales y productos relacionados que sea visualmente atractiva, intuitiva y moderna. La aplicación sigue un diseño consistente basado en los bocetos proporcionados por el cliente, con un enfoque en la facilidad de uso y una estética limpia y colorida.

## 2. Características Implementadas

- **Navegación Principal:**
  - Barra de navegación inferior con tres secciones principales: **Inicio**, **Para Ti** y **Perfil**.
  - Menú lateral deslizable (`Drawer`) para opciones secundarias como "Servicio al cliente", "Políticas" y "Cerrar sesión".

- **Diseño de la Interfaz de Usuario (UI):**
  - **`AppBar` Personalizado y Reutilizable:** Se creó un widget `AppBar` unificado que se usa en todas las pantallas principales. Incluye:
    - El logo de la "Florería Ajolote".
    - El nombre de la tienda.
    - Un ícono de menú (hamburguesa) que abre el `Drawer`.
    - Un ícono de carrito de compras que navega a la pantalla del carrito.
    - El diseño del `AppBar` sigue el boceto del cliente, con el menú de hamburguesa posicionado sobre el ícono del carrito.
  - **Paleta de Colores:** Basada en tonos pastel, principalmente rosados (`#FFC0CB`) y morados (`#D1C4E9`), con acentos en verde para los botones de compra y acciones positivas.

- **Pantalla de Inicio (`pantalla_inicio.dart`):**
  - Muestra un banner promocional principal para "Ofertas".
  - Presenta una lista horizontal de **filtros de categorías** (ej. "Todo", "Flores", "Macetas").
  - Exhibe los productos en una **cuadrícula de 3 columnas** para una visualización rápida.
  - Cada producto tiene una tarjeta con su imagen y un botón para agregarlo al carrito.

- **Pantalla "Para Ti" (`pantalla_para_ti.dart`):**
  - Mantiene una estructura visual consistente con la pantalla de Inicio.
  - Incluye el título "Para ti" y la misma lista de filtros de categorías.
  - Muestra una cuadrícula de productos recomendados, también en **3 columnas**.

- **Pantalla de Perfil de Usuario (`pantalla_perfil.dart`):**
  - Permite al usuario ver y editar su información personal: nombre, correo y teléfono.
  - Los cambios se guardan y se reflejan en el estado de la aplicación.

- **Pantalla del Carrito de Compras (`pantalla_carrito.dart`):**
  - Rediseñada completamente para coincidir con el boceto del cliente.
  - Los productos en el carrito se muestran en una **cuadrícula de 2 columnas**.
  - Cada producto tiene una tarjeta de estilo compacto que incluye:
    - Imagen del producto.
    - Nombre y precio.
    - Controles para **aumentar, disminuir y ver la cantidad**.
    - Un botón intuitivo en la esquina para **eliminar** el artículo del carrito.
  - En la parte inferior, se muestra un resumen con el **costo total** y un botón de **"Comprar"** destacado en color verde.

## 3. Arquitectura y Gestión de Estado

- **Gestión de Estado Centralizada:** Se utiliza el paquete `provider` para manejar el estado de la aplicación de forma eficiente.
- **Clase `EstadoApp` (`estado_app.dart`):**
  - Contiene la lógica de negocio y los datos compartidos en toda la aplicación.
  - Gestiona la lista de productos en el `carrito` (agregar, eliminar, ajustar cantidad).
  - Calcula el `total` del carrito.
  - Almacena y actualiza la información del `usuario`.
- **Estructura de Archivos:**
  - `lib/screens/`: Contiene todos los archivos de las pantallas principales.
  - `lib/widgets/`: Almacena widgets reutilizables como `AppBarPersonalizada` y `MenuLateral`.
  - `lib/main.dart`: Punto de entrada de la aplicación, configura el `ChangeNotifierProvider` y la navegación principal (`BottomNavigationBar`).
  - `lib/estado_app.dart`: Define la clase `EstadoApp` para la gestión del estado.

## 4. Decisiones de Diseño y Estilo

- **Consistencia Visual:** Se ha puesto especial atención en que todas las pantallas compartan una estética coherente, utilizando el mismo `AppBar`, paleta de colores y estilos de tarjetas.
- **Fidelidad a los Bocetos:** Todas las modificaciones se han basado directamente en los bocetos y las especificaciones proporcionadas por el cliente, incluyendo la disposición de los elementos, los íconos y la estructura general.
- **Componentes Reutilizables:** La creación de `AppBarPersonalizada` permite mantener un `branding` consistente y facilita futuras modificaciones, ya que el cambio se realiza en un solo lugar.
- **Experiencia de Usuario (UX):** La interfaz se ha diseñado para ser intuitiva. Las acciones principales (agregar al carrito, comprar, eliminar) son claras y accesibles.
