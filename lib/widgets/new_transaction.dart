import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime _selectDate;
  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle =titleController.text;
    final enteredAmount = double.parse(amountController.text);
   
    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }
     widget.addTx(
                        enteredTitle,
                        enteredAmount
                      );
                      Navigator.of(context).pop();
  }
 void _presentDatePicker(context){
   showDatePicker(
     context: context, 
     initialDate: DateTime.now(), 
     firstDate: DateTime(2020), 
     lastDate: DateTime.now()).then((pickedDate){
       if(pickedDate==null){return;}
       setState(() {
         _selectDate = pickedDate;
       });
     });
 }
  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 15,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: titleController,
                    onSubmitted: (_)=>submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    onSubmitted: (_)=>submitData(),
                  ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Text( _selectDate==null ? 'No Date Choosen':
                      DateFormat.yMd().format(_selectDate )),
                      FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold) ,),
                      onPressed: ()=>_presentDatePicker(context),)
                    ],
                  ),
                ),
                  
                  RaisedButton(
                    child: Text('ADD'),
                    color: Colors.purple,
                    textColor: Color.fromRGBO(255, 255, 255, 1),
                    onPressed: submitData,
                  )
                ],
              ),
            ),
    );
    
  }
}