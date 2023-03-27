import 'package:flutter/material.dart';
import './transaction.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    ); // MaterialApp
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 44.44,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Shirt',
      amount: 54.44,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Color.fromARGB(255, 104, 227, 236),
              child: Text('CHART! '),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx){
            return Card(child: Row(children: <Widget>[
              Container(child: Text(tx.amount.toString(),
              ),
              ),
              Column(children: <Widget>[
                Text(tx.title),
                Text(tx.date.toString()),
              ],
              ),
            ],
            ),
            );
  }).toList(),
  ),
        ], 
      ),
    );
  }
}
