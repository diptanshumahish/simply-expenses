import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    final topColor = Theme.of(context).brightness;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: topColor == Brightness.dark
              ? AppColors.lighttext.withAlpha(30)
              : AppColors.darkBack.withAlpha(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  returnIcon(),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.type,
                    style: TextStyle(
                        color: topColor == Brightness.dark
                            ? AppColors.lighttext
                            : AppColors.darkBack,
                        fontSize: 18),
                  ),
                  Text(
                    DateFormat('jm').format(widget.creationDate),
                    style: TextStyle(
                        color: topColor == Brightness.dark
                            ? AppColors.lighttext
                            : AppColors.darkBack,
                        fontSize: 14),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\u{0024}",
                    style: TextStyle(
                        color: topColor == Brightness.dark
                            ? AppColors.lighttext
                            : AppColors.darkBack,
                        fontSize: 14),
                  ),
                  Text(
                    widget.amt.toString(),
                    style: TextStyle(
                        color: topColor == Brightness.dark
                            ? AppColors.lighttext
                            : AppColors.darkBack,
                        fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget returnIcon() {
    final topColor = Theme.of(context).brightness;
    if (widget.type == "Food") {
      return Icon(
        Icons.restaurant,
        color: topColor == Brightness.dark
            ? AppColors.lighttext
            : AppColors.darkBack,
        size: 30,
      );
    } else if (widget.type == "Leisure") {
      return Icon(
        Icons.nightlife,
        color: topColor == Brightness.dark
            ? AppColors.lighttext
            : AppColors.darkBack,
        size: 30,
      );
    } else if (widget.type == "Rents") {
      return Icon(
        Icons.home,
        color: topColor == Brightness.dark
            ? AppColors.lighttext
            : AppColors.darkBack,
        size: 30,
      );
    } else
      return Icon(
        Icons.dynamic_form_outlined,
        color: topColor == Brightness.dark
            ? AppColors.lighttext
            : AppColors.darkBack,
        size: 30,
      );
  }
}
