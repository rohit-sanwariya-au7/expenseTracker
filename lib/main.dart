import 'widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'widgets/chart.dart';
import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        textTheme:  
           ThemeData.light().textTheme.copyWith(title:
           TextStyle(
             fontFamily: 'OpenSans',
             fontWeight: FontWeight.bold,
             fontSize: 17, ),
             ),
        appBarTheme: AppBarTheme(
          textTheme:
           ThemeData.light().textTheme.copyWith(title:
           TextStyle(
             fontFamily: 'OpenSans' ))
        )
      ),
      
      debugShowCheckedModeBanner: false,
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
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  final List<Transaction> _userTransaction = [

  ];
  List<Transaction> get _recentTransaction{
     return _userTransaction.where((tx){
        return tx.date.isAfter(
          DateTime.now().subtract(Duration(days: 7))
        );
     }).toList() ;
  }
  void _addNewTransaction(String txTitle, double txAmount,DateTime choosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: choosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }
  void _deleteTransactoin(String id){
        setState(() {
          _userTransaction.retainWhere((tx)
          {
return tx.id == id;
          }
          );
        });
  }



  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
      final appBar = AppBar(
        title: Text('Expense Tracker'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ) ;
    return Scaffold(
      appBar: appBar,
      drawer: Drawer(elevation: 5,
        child:ListView(children: <Widget>[
          new UserAccountsDrawerHeader(
           accountName: Text('Rohit Sanwariya'),
           accountEmail: Text('rohit@gmail.com'),
           currentAccountPicture: CircleAvatar(child: Text('Rht'),),
           ),
           
           
      ],
      )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Container(
             height: (MediaQuery.of(context).size.height - appBar.preferredSize.height-MediaQuery.of(context).padding.top) *.3,
             child: Container(child: Chart(_recentTransaction))),
            Container(height: (MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*.7,
              child: TransactionList(_userTransaction,_deleteTransactoin)),
          ],
        ),
      ),
    );
  }
}
