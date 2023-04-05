import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var txtPeso = TextEditingController();
  var txtAltura = TextEditingController();
  var txtIdade = TextEditingController();
  var txtSexo = TextEditingController();
  late double peso, altura, imc = 0;
  late int idade;
  late double Sexo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculando IMC"),
      ),
      body: ListView(
        children: [
          const Icon(
            Icons.accessibility,
            size: 130,
            color: Colors.blue,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              controller: txtAltura,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite a Altura',
                hintStyle: TextStyle(color: Colors.green),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              controller: txtPeso,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite o Peso',
                  hintStyle: TextStyle(color: Colors.green)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              controller: txtIdade,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite a Idade',
                  hintStyle: TextStyle(color: Colors.green)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              controller: txtSexo,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite o Sexo',
                  hintStyle: TextStyle(color: Colors.green)),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(top: 100),
            child: ElevatedButton(
              onPressed: () {
                calc();
              },
              /* () => context.go("/calc") */
              child: Text('Calcular'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void calc() {
    altura = double.parse(txtAltura.text);
    peso = double.parse(txtPeso.text);
    idade = int.parse(txtIdade.text);
    Sexo = txtSexo.text == 'Masculino' ? 1.0 : 0.8;
    final double imc = peso / pow(altura / 100, 2);
    final double igc = (1.2 * imc) + (0.23 * idade) - (10.8 * Sexo) - 5.4;
    final String imcResult = imc.toStringAsFixed(2);
    final String igcResult = igc.toStringAsFixed(2);
    context.goNamed("calc", params: {"imc": imcResult, "igc": igcResult});
  }
}
