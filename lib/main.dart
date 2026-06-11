import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: DemoWidgets());
  }
}

class DemoWidgets extends StatefulWidget {
  @override
  State<DemoWidgets> createState() => _DemoWidgetsState();
}

class _DemoWidgetsState extends State<DemoWidgets> {
  bool notificaciones = false;
  bool futbol = false;
  bool videojuegos = false;
  bool estudiarparalaexpo = false;
  bool descansar = false;
  bool sacar5enlaexpo = false;
  String color = "Rojo";

  Color appBarColor = Colors.blue;
  Color scaffoldColor = Colors.white;
  String interesesSeleccionados = "Ninguno";

  Color obtenerColor(String nombreColor) {
    switch (nombreColor) {
      case "Rojo":
        return Colors.red;
      case "Azul":
        return Colors.blue;
      case "Verde":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void actualizarIntereses() {
    setState(() {
      List<String> intereses = [];
      if (futbol) intereses.add("Fútbol");
      if (videojuegos) intereses.add("Videojuegos");
      if (estudiarparalaexpo) intereses.add("Estudiar para la expo");
      if (descansar) intereses.add("Descansar");
      if (sacar5enlaexpo) intereses.add("Sacar 5 en la expo");

      interesesSeleccionados = intereses.isEmpty
          ? "Ninguno"
          : intereses.join(", ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch, Checkbox y Radio"),
        backgroundColor: appBarColor,
      ),
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text("Switch", style: TextStyle(fontSize: 20)),
            SwitchListTile(
              title: const Text("Cambia color del AppBar y el Body"),
              value: notificaciones,
              onChanged: (value) {
                setState(() {
                  notificaciones = value;
                  if (value) {
                    appBarColor = Colors.green;
                    scaffoldColor = Colors.orange.shade200;
                  } else {
                    appBarColor = Colors.blue;
                    scaffoldColor = Colors.white;
                  }
                });
              },
            ),
            const Divider(),

            const Text("Checkbox", style: TextStyle(fontSize: 20)),
            CheckboxListTile(
              title: const Text("Fútbol"),
              value: futbol,
              onChanged: (value) {
                setState(() {
                  futbol = value!;
                  actualizarIntereses();
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Videojuegos"),
              value: videojuegos,
              onChanged: (value) {
                setState(() {
                  videojuegos = value!;
                  actualizarIntereses();
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Estudiar para la expo"),
              value: estudiarparalaexpo,
              onChanged: (value) {
                setState(() {
                  estudiarparalaexpo = value!;
                  actualizarIntereses();
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Descansar"),
              value: descansar,
              onChanged: (value) {
                setState(() {
                  descansar = value!;
                  actualizarIntereses();
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Sacar 5 en la expo :D"),
              value: sacar5enlaexpo,
              onChanged: (value) {
                setState(() {
                  sacar5enlaexpo = value!;
                  actualizarIntereses();
                });
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Intereses seleccionados: $interesesSeleccionados",
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const Divider(),

            const Text("Radio Buttons", style: TextStyle(fontSize: 20)),
            RadioListTile(
              title: const Text("Rojo"),
              value: "Rojo",
              groupValue: color,
              onChanged: (value) {
                setState(() {
                  color = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Azul"),
              value: "Azul",
              groupValue: color,
              onChanged: (value) {
                setState(() {
                  color = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Verde"),
              value: "Verde",
              groupValue: color,
              onChanged: (value) {
                setState(() {
                  color = value.toString();
                });
              },
            ),

            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 100,
              width: double.infinity,
              color: obtenerColor(color),
              child: const Center(
                child: Text(
                  "Color seleccionado",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
