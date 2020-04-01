import 'transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transaction = [
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
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
     // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.red,
              child: Text('chart'),
              elevation: 5, //double value for elevation
            ),
          ),
          Card(elevation: 15,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                  labelText: 'Title',                   
                ),
                controller: titleController,),
                TextField(
                  decoration: InputDecoration(
                  labelText: 'Amount', 
                ),keyboardType: TextInputType.number ,
                controller: amountController,
                ),
                FlatButton(
                  child: Text('ADD'),
                onPressed: (){},
                )
              ],),
            ),
          ),
          Column(
            children: transaction.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 15),
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
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
   //title                       
                          tx.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 127, 80, 1),
                              fontSize: 18,
                        ),),
    //date        
                        Text(
                          DateFormat('EE dd-MM-yyyy').format(tx.date),
                        style: TextStyle(color: Colors.grey[700]),),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
