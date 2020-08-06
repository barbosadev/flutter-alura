import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: FormularioTransferencia(),
        ),
        debugShowCheckedModeBanner: false,
      );
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController
    _controladorCampoNumeroConta = TextEditingController(),
    _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Transferência"),
      ),
      body: Column(
        children: <Widget>[
          Editor(_controladorCampoNumeroConta, 'Número da Conta', '0000'),
          Editor(_controladorCampoNumeroConta, 'Valor', '0.00'),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                  fontSize: 24.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            onPressed: (){
              final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null){
                final transferenciaCriada = Transferencia(valor, numeroConta);
                //debugPrint("$transferenciaCriada");
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$transferenciaCriada'),
                  ),
                );
              }
            },
            child: Text(
              "Confirmar",
              style: TextStyle(
                  fontSize: 24
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {

  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;

  Editor(this._controlador, this._rotulo, this._dica);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: _controlador,
        style: TextStyle(
            fontSize: 24.0
        ),
        decoration: InputDecoration(
            labelText: _rotulo,
            hintText: _dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100, 123100)),
          ItemTransferencia(Transferencia(760, 123100))
        ],
      ),
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
    ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(_transferencia.valor.toString()),
              subtitle: Text(_transferencia.numeroConta.toString()),
              ),
            ),
          ],
        ),
      );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  const Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}