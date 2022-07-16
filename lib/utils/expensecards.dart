import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  final int id;
  final int amt;
  final String type;
  final DateTime creationDate;

  const AddExpenses(
      {Key? key,
      required this.id,
      required this.amt,
      required this.type,
      required this.creationDate})
      : super(key: key);

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
