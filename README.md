 Visualizador Interactivo de Estructuras de Datos y Algoritmos

Proyecto Final
Aplicación educativa para visualizar y manipular estructuras de datos y algoritmos fundamentales,
facilitando la comprensión de conceptos clave en ciencias de la computación.

Objetivo

Desarrollar una herramienta interactiva que permita:

- Visualizar
- listas enlazadas simples,
- listas doblemente enlazadas,
- pilas,
- algoritmos de ordenamiento Merge Sort y Quick Sort), y una sección educativa con gráficos de complejidad y
-  cuestionario
- Analizar la eficiencia de los algoritmos mediante animaciones paso a paso.
- Ofrecer una experiencia educativa atractiva y accesible.
Tecnologías utilizadas

| Capa        | Tecnologías                          |
|-------------|--------------------------------------|
| Frontend    | HTML5, CSS3, JavaScript (ES6)        |
| Backend (opcional) | Ruby (script de consola)        |
| API de voz  | Web Speech API (window.speechSynthesis) |
| Estilos     | CSS Flexbox, Grid, transiciones, diseño responsivo |

Estructuras de datos implementadas

1. **Lista Enlazada Simple (Singly Linked List)
   - Operaciones: insertar al inicio/final, eliminar por valor, buscar.  
   - Visualización con flechas→.  
   - Complejidad: inserción al inicio O(1), búsqueda/eliminación **O(n).

2. Lista Doblemente Enlazada (Doubly Linked List) 
   - Punteros prev y next.  
   - Flechas dobles ⇄.  
   - Mismas operaciones que la lista simple, pero con recorrido bidireccional.

3. Pila (Stack) 
   - Estructura LIFO (Last In, First Out).  
   - Operaciones: push,pop, peek.  
   - Visualización vertical con el tope arriba.

4. Algoritmos de ordenamiento 
   - **Merge Sort**: divide y vencerás, estable, **O(n log n)** siempre.  
   - **Quick Sort**: pivote último, in-place, **O(n log n)** promedio, **O(n²)** peor caso.  
   - Controles: reproducir, pausar, paso a paso, velocidad ajustable.  
   - Código fuente resaltado sincronizado con la animación.

5. Mejora educativa  
   - Gráfico de complejidad temporal comparativo (Merge vs Quick).  
   - Cuestionario interactivo sobre complejidad de listas enlazadas.



##Archivos del proyecto

| Archivo         | Descripción                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| index.html   | Página principal con toda la interfaz y el código JavaScript integrado.    |
| styles.css   | Hoja de estilos para diseño responsivo, colores, animaciones y resaltados. |
| visualizer.rb| Script en Ruby que implementa las mismas estructuras en consola (colorido). |

---

ómo ejecutar
 Visualizador web (HTML/CSS/JS)

1. Descarga los archivos index.html y styles.css en la misma carpeta.
2. Asegúrate de que ambos archivos tengan exactamente esos nombres.
3. Abre index.html con cualquier navegador moderno (Chrome, Firefox, Edge, Safari).  
   - No se necesita servidor web; funciona completamente en el lado del cliente.

Script de Ruby (consola)

1. Asegúrate de tener Ruby instalado (versión 2.5 o superior).  
   - Verifica con ruby --version en la terminal.
2. Ejecuta el script:
   bash
   ruby visualizer.rb
Observarás una demostración automática con colores ANSI que muestra:

Inserción, eliminación y búsqueda en listas.

Operaciones de pila.

Ejecución de Merge Sort y Quick Sort con sus complejidades.
Uso del visualizador web
Navegación por pestañas
Lista Enlazada Simple / Lista Doblemente Enlazada / Pila

Introduce un valor en el campo de texto y pulsa los botones para añadir, eliminar o buscar.

Los nodos se resaltan temporalmente en amarillo al ser añadidos o encontrados.

Algoritmos: Merge & Quick Sort

Selecciona el algoritmo, genera datos aleatorios o usa el array por defecto.

Controles: Reproducir (animación automática), Pausa, Paso +/‑, Velocidad.

El código del algoritmo se muestra abajo y se sincroniza con el paso actual.

Mejora Educativa + Quiz

Gráfico de complejidad temporal (curvas O(n log n)).

Cuestionario: elige la respuesta correcta y recibe retroalimentación.

Sistema de voz interactivo
Botón "Introducción general": explica el propósito del proyecto.

Dentro de cada pestaña, un botón "Explicar esta sección" describe esa estructura o algoritmo.

Controles de voz: Pausar  y Reanudar (la pausa detiene la voz y al reanudar comienza desde el principio del mismo texto)
