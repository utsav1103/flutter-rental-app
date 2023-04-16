import 'package:flutter/material.dart';
import './chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttTransactions;
  Chart(this.recenttTransactions);

  List<Map<String, dynamic>> get groupedTransactionValues {
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
       'amount': totalSum,
       };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item){
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                 data['amount'],
              totalSpending == 0.0 ? 0.0 :
              (data['amount']as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
