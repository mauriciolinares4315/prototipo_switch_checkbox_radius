import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoWidgets(),
    );
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

  String color = "Rojo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch, Checkbox y Radio"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            const Text(
              "Switch",
              style: TextStyle(fontSize: 20),
            ),

            SwitchListTile(
              title: const Text("Activar notificaciones"),
              value: notificaciones,
              onChanged: (value) {
                setState(() {
                  notificaciones = value;
                });
              },
            ),

            const Divider(),

            const Text(
              "Checkbox",
              style: TextStyle(fontSize: 20),
            ),

            CheckboxListTile(
              title: const Text("Fútbol"),
              value: futbol,
              onChanged: (value) {
                setState(() {
                  futbol = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Videojuegos"),
              value: videojuegos,
              onChanged: (value) {
                setState(() {
                  videojuegos = value!;
                });
              },
            ),

            const Divider(),

            const Text(
              "Radio Buttons",
              style: TextStyle(fontSize: 20),
            ),

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
          ],
        ),
      ),
    );
  }
}