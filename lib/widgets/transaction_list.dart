import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints){
          return Column(
            children: <Widget>[
              Text(
                'NO transactions added yet!',
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.jpg',
                    fit: BoxFit.cover,
                  )),
            ],
          );
        }) 
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                   ? TextButton.icon(
                    icon: Icon(Icons.delete),
                    label: Text('Delete'),
                    style: TextButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 141, 19, 10),
                    ),
                    onPressed: () => deleteTx(transactions[index].id),
                   )
                   : IconButton(
                    icon: Icon(Icons.delete),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: ()=> deleteTx(transactions[index].id),
                   )
                  ),
                );
              
            },
            itemCount: transactions.length,
          );
  }
}
 