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
      home: HalamanGaya(),
    );
  }
}

class HalamanGaya extends StatefulWidget {
  @override
  State<HalamanGaya> createState() => _HalamanGayaState();
}

class _HalamanGayaState extends State<HalamanGaya> {
  final massaController = TextEditingController();
  final percepatanController = TextEditingController();

  double hasil = 0;

  void hitungGaya() {
    double m = double.tryParse(massaController.text) ?? 0;
    double a = double.tryParse(percepatanController.text) ?? 0;

    setState(() {
      hasil = m * a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menghitung Gaya"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Rumus Gaya (F = m × a)",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: massaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan Massa (kg)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: percepatanController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan Percepatan (m/s²)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungGaya,
              child: Text("Hitung Gaya"),
            ),
            SizedBox(height: 25),
            Text(
              "Hasil Gaya: $hasil Newton",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
