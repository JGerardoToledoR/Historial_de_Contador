import 'package:flutter/material.dart';
import 'second_page.dart'; // Importa la segunda pantalla

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historial del Contador',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Historial del Contador'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<int> _historial = [];
  bool _mostrarHistorial = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _historial.add(_counter);
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _historial.add(_counter);
    });
  }

  void _toggleHistorial() {
    setState(() {
      _mostrarHistorial = !_mostrarHistorial;
    });
  }

  void _clearHistorial() {
    setState(() {
      _historial.clear();
    });
  }

  Widget _buildHistorial() {
    if (_historial.isEmpty) {
      return const Text(
        "Historial vacío.",
        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
      );
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: _historial.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.history),
            title: Text("Valor: ${_historial[index]}"),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Valor actual del contador:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _toggleHistorial,
              child: Text(_mostrarHistorial ? "Ocultar historial" : "Mostrar historial"),
            ),

            ElevatedButton(
              onPressed: _clearHistorial,
              child: const Text("Limpiar historial"),
            ),

            const SizedBox(height: 20),

            // Botón para cambiar a la segunda pantalla y pasar el contador
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(counterValue: _counter),
                  ),
                );
              },
              child: const Text("Ir a segunda pantalla"),
            ),

            if (_mostrarHistorial) _buildHistorial(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Restar',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Sumar',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
