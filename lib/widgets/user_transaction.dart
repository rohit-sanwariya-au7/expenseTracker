import '../models/transaction.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }
 final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'new shoes',
      amount: 218.10,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'bengan',
      amount: 999.1,
      date: DateTime.now(),
    )
  ];
  void _addNewTransaction(String txTitle,double txAmount){
        final newTx = Transaction(
          title: txTitle,
          amount: txAmount,
          date: DateTime.now(),
          id: DateTime.now().toString()
          );

          setState(() {
            _userTransaction.add(
              newTx
            );
          });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
       NewTransaction(_addNewTransaction),
          TransactionList(_userTransaction),
    ],
    );
  }
}