import 'package:flutter/material.dart';

class AddIncome extends StatefulWidget {
  final int id;
  final String source;
  final DateTime creationDate;

  const AddIncome(
      {Key? key,
      required this.id,
      required this.source,
      required this.creationDate})
      : super(key: key);

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
