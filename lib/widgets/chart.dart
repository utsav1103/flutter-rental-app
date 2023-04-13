import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttTransactions;
  Chart(this.recenttTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.00;
      for (var i = 0; i < recenttTransactions.length; i++) {
        if (recenttTransactions[i].date.day == weekDay.day &&
            recenttTransactions[i].date.month == weekDay.month &&
            recenttTransactions[i].date.year == weekDay.year) {
          totalSum += recenttTransactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay).substring(0, 1),
       'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return Text('${data['day']}: ${data['amount']}');
        }).toList(),
      ),
    );
  }
}
