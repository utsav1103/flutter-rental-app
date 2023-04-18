import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData (){

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if ( enteredTitle.isEmpty ||  enteredAmount <= 0 ) {
      return;
    }

    widget.addTx (
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),

            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                Text('NO DATE CHOSEN!',
                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),),
                ElevatedButton(
                  
                  child: Text('Choose Date',
                  style: TextStyle(color: Color.fromARGB(255, 238, 229, 240),
                  fontWeight: FontWeight.bold
                  ),
                  ),
                onPressed: () {},
                ),
              ],),
            ),
            ElevatedButton(
              // ignore: prefer_const_constructors
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Color.fromARGB(255, 242, 229, 244)),
              ),

              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
