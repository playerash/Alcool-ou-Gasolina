import 'package:flutter/material.dart';

main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado =
            'O valor inserido está incorreto, utilize (.) e valores maiores que 0';
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _resultado = 'Melhor abastecer com gasolina';
        });
      } else {
        setState(() {
          _resultado = 'Melhor abastecer com álcool';
        });
      }
    }
    _limpar();
  }

  void _limpar() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = '';
  }

  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Álcool ou Gasolina'),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 30),
                  child: Image.asset('imagens/logo.png'),
                ),
                Text(
                  'Saiba a melhor opção para abastecimento do seu carro',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Preço do Álcool, ex: 1.59',
                    ),
                    keyboardType: TextInputType.number,
                    controller: _controllerAlcool,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Preço da Gasolina, ex: 3.59',
                  ),
                  keyboardType: TextInputType.number,
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _calcular,
                    color: Colors.indigo,
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Text(
                  _resultado,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
