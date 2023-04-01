import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            ElevatedButton(
              // ignore: prefer_const_constructors
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Color.fromARGB(255, 242, 229, 244)),
              ),

              onPressed: () {
                addTx(titleController.text,
                    double.parse(amountController.text),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
