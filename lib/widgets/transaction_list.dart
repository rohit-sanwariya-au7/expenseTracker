import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      
      child: transactions.isEmpty ? Column(
        children: <Widget>[
          Text('No Transaction',
          style: Theme.of(context).textTheme.title,),
          Divider(height: 20,thickness: .5,),
          Container(height: 200,
            child: Image.asset('assets/images/waiting.png',
            fit: BoxFit.cover,),
          )
        ],
      ):
      ListView.builder(
          itemBuilder: (ctx,index){
return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    //amaount
                    '\u20B9 ${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      //title
                      transactions[index].title,
                      style:Theme.of(context).textTheme.title,
                    ),
                    //date
                    Text(
                      DateFormat('EE dd-MM-yyyy').format(transactions[index].date),
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                )
              ],
            ),
          );
          },
          itemCount: transactions.length,
         
        ),
    );
  }
}
