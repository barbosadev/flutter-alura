
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Nova Transferência";
const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "0.00";
const _rotuloCampoConta ="Numero da Conta";
const _dicaCampoConta = "0000";
const _textoBotaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() => _FormularioTransferenciaState();

}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController
  _controladorCampoNumeroConta = TextEditingController(),
      _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoConta,
                dica: _dicaCampoConta,
            ),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(
                _textoBotaoConfirmar,
                style: TextStyle(
                    fontSize: 24
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}