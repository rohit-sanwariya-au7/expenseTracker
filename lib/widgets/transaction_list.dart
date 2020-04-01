import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.purple,
                  width: 1,
                )),
                padding: EdgeInsets.all(10),
                child: Text(
                  //amaount
                  '\u20B9 ${tx.amount}',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    //title
                    tx.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 127, 80, 1),
                      fontSize: 18,
                    ),
                  ),
                  //date
                  Text(
                    DateFormat('EE dd-MM-yyyy').format(tx.date),
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
