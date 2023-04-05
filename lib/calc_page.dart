import 'package:flutter/material.dart';

class CalcPage extends StatelessWidget {
  final String imc;
  final String igc;
  const CalcPage({super.key, required this.imc, required this.igc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculo do IMC e IGC'),
      ),
      body: ListView(
        children: [
          Column(
            children: [Text("IMC: " + imc), Text("IGC: " + igc)],
          ),
        ],
      ),
    );
  }
}
