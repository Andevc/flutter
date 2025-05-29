import 'package:flutter/material.dart';
import 'package:laboratorio/screens/screen_animal_details.dart';


class ScreenListAnimals extends StatelessWidget {
  final List<Map<String, String>> animales = [
    {
      'nombre': 'Gato',
      'descripcion': 'Un gato es un animal pequeño, independiente y juguetón, conocido por su agilidad y su capacidad para cazar.',
      'imagen': 'assets/images/gatito.jpg',
      'sonido': 'assets/sounds/gato.mp3',
    },
    {
      'nombre': 'Perro',
      'descripcion': 'Un perro es un animal leal, sociable y protector, reconocido por su estrecha relación con los humanos y su habilidad para ser entrenado.',
      'imagen': 'assets/images/perro.jpg',
      'sonido': 'assets/sounds/perro.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Animales')),
      body: ListView.builder(
        itemCount: animales.length,
        itemBuilder: (context, index) {
          final animal = animales[index];
          return ListTile(
            title: Text(animal['nombre']!),
            trailing: ElevatedButton(
              child: Text('Ver más'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AnimalDetails(
                      nombre: animal['nombre']!,
                      descripcion: animal['descripcion']!,
                      imagen: animal['imagen']!,
                      sound: animal['sonido']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
