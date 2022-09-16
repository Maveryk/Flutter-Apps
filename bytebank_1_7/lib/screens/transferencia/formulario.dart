import 'package:bytebank_1_7/components/editor.dart';
import 'package:bytebank_1_7/models/Transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';

const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';

const _dicaCampoNumeroConta = '0000';

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _ctrlCampoNumConta = TextEditingController();
  final TextEditingController _ctrlCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                ctrl: _ctrlCampoNumConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta),
            Editor(
                ctrl: _ctrlCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text('Confirmar'),
            )
          ],
        ),
      ),
    );
    return scaffold;
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_ctrlCampoNumConta.text);
    final double valor = double.tryParse(_ctrlCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      Navigator.pop(
        context,
        transferencia,
      );
    }
  }
}

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}
