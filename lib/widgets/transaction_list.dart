
import 'package:intl/intl.dart';


import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions;
  
  TransactionList(this.transactions);
 
  @override 
  Widget build(BuildContext context){
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
                children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 249, 167, 241),
                              width: 2,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text('\$${tx.amount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.deepPurple,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat('yyyy/MM/dd').format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}

