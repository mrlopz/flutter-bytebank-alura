import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Criando Transferência'),
        ),
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0)),
            const TextField(
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                    labelText: 'Número da conta', hintText: '0000'),
                keyboardType: TextInputType.number),
            const Padding(padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0)),
            const TextField(
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: '0.00'),
                keyboardType: TextInputType.number),
            ElevatedButton(
              child: const Text('Confirmar'),
              onPressed: () => const Text('Confirmado com sucesso'),
            )
          ],
        ));
  }
}

class TransferList extends StatelessWidget {
  const TransferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TransferItem(Transfer(100.0, 1000)),
        TransferItem(Transfer(200.0, 1000)),
        TransferItem(Transfer(300.0, 1000))
      ]),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => const Text('Cliquei no botão'),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;
  const TransferItem(this._transfer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: const Icon(Icons.monetization_on),
            title: Text(_transfer.value.toString()),
            subtitle: Text(_transfer.accountNumber.toString())));
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}
