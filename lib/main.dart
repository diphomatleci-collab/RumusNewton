import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HalamanGaya(),
  ));
}

class HalamanGaya extends StatefulWidget {
  @override
  _HalamanGayaState createState() => _HalamanGayaState();
}

class _HalamanGayaState extends State<HalamanGaya> {
  final massaController = TextEditingController();
  final percepatanController = TextEditingController();

  double hasil = 0;

  void hitungGaya() {
    double massa = double.tryParse(massaController.text) ?? 0;
    double percepatan = double.tryParse(percepatanController.text) ?? 0;

    setState(() {
      hasil = massa * percepatan;
    });
  }

  void reset() {
    massaController.clear();
    percepatanController.clear();

    setState(() {
      hasil = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "F = m x a",
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
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
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: reset,
              child: Text("Reset"),
            ),
            SizedBox(height: 25),
            Text(
              "Hasil Gaya:",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "$hasil Newton",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
