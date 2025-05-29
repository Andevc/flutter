# 🚀 Guía Básica de Flutter

Esta guía está diseñada para ayudarte a comprender los conceptos básicos de Flutter. Aprenderás sobre widgets, botones, estilos, navegación entre pantallas, funciones, listas y cómo actualizar datos dinámicamente (como un contador).

---

## 🧱 StatelessWidget vs StatefulWidget

| Característica             | StatelessWidget                        | StatefulWidget                            |
|---------------------------|----------------------------------------|-------------------------------------------|
| ¿Tiene estado mutable?    | ❌ No                                   | ✅ Sí                                     |
| ¿Cambia durante ejecución?| ❌ No                                   | ✅ Sí                                     |
| Ejemplo de uso            | Textos, íconos, widgets estáticos      | Contadores, formularios, animaciones      |

### Ejemplo:
``` js
// StatelessWidget
class MiTexto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hola mundo');
  }
}

// StatefulWidget
class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Valor: \$contador'),
        ElevatedButton(
          onPressed: incrementar,
          child: Text('Incrementar'),
        ),
      ],
    );
  }
}
```
---

## 🔘 Cómo crear un botón
``` js
ElevatedButton(
  onPressed: () {
    print('¡Botón presionado!');
  },
  child: Text('Presióname'),
)
```
---

## 🎨 Estilos en Flutter

### Texto con estilo:
``` js
Text(
  'Hola mundo',
  style: TextStyle(
    fontSize: 24,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
)
```
### Botón estilizado:
``` js
ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    textStyle: TextStyle(fontSize: 16),
  ),
  onPressed: () {},
  child: Text('Botón Estilizado'),
)
```
---

## 📄 Navegación entre páginas
``` js
// Página 1
class PaginaUno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaginaDos()),
            );
          },
          child: Text('Ir a Página 2'),
        ),
      ),
    );
  }
}

// Página 2
class PaginaDos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página 2')),
      body: Center(
        child: Text('¡Bienvenido a la Página 2!'),
      ),
    );
  }
}
```
---

## 🔧 Cómo declarar funciones
``` js
void saludar(String nombre) {
  print('Hola, \$nombre');
}

// Uso:
saludar('Juan'); // Imprime: Hola, Juan
```
---

## 🧾 Cómo crear y mostrar listas
``` js
List<String> frutas = ['Manzana', 'Banana', 'Naranja'];

ListView.builder(
  itemCount: frutas.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(frutas[index]),
    );
  },
)
```
---

## 🔄 Cómo actualizar un contador al hacer clic
``` js
class ContadorPage extends StatefulWidget {
  @override
  _ContadorPageState createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Has presionado el botón:'),
            Text(
              '\$contador veces',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementar,
              child: Text('Incrementar'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Imagenes / Audio
yaml
``` js
dependencies:
  audioplayers: ^5.2.1


flutter:
  assets:
    - assets/images/logo.png
    - assets/audio/click.mp3
```
imagenes
``` js
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/logo.png'),
      fit: BoxFit.cover,
    ),
  ),
)
```

audio 
``` js
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

void reproducirSonido() async {
  await player.play(AssetSource('audio/click.mp3'));
}
```
tambien funciona asi
``` js
ElevatedButton(
     onPressed: () {
          player.play(AssetSource(sound.replaceFirst('assets/', '')));
     },
     child: Text('Reproducir sonido'),
     ),
```
