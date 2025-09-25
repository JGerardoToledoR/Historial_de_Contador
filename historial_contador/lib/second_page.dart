import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final int counterValue; // Recibe el valor del contador

  const SecondPage({super.key, required this.counterValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Pantalla"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "¡Bienvenido a la segunda pantalla!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Mostrar el valor que viene desde la primera pantalla
            Text(
              "El valor actual del contador es: $counterValue",
              style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Volver a la pantalla principal"),
            ),
          ],
        ),
      ),
    );
  }
}
