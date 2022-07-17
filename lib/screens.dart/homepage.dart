import 'package:expense_tracker/database/database.dart';
import 'package:expense_tracker/database/incomedatabase.dart';
import 'package:expense_tracker/screens.dart/drawer.dart';
import 'package:expense_tracker/screens.dart/expensescreen.dart';
import 'package:expense_tracker/screens.dart/incomescreen.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double total = 0;
  int totalIncome = 0;
  double totalFood = 0;
  double totalLeisure = 0;
  double totalRents = 0;
  double totalOthers = 0;
  void calcTotal() async {
    var totalExpense = (await db.totalExpense())[0]['TOTAL'];
    setState(() {
      if (totalExpense == null) {
        total = 0;
      } else {
        total = totalExpense;
      }
    });
  }

  void calcTotalIncome() async {
    var totalExpense = (await indb.totalIncome())[0]['TOTAL'];
    setState(() {
      if (totalExpense == null) {
        total = 0;
      } else {
        totalIncome = totalExpense;
      }
    });
  }

  void calcTotalFood() async {
    var totalExpense = (await db.totalFood())[0]['TOTAL'];
    setState(() {
      if (totalExpense == null) {
        total = 0;
      } else {
        totalFood = totalExpense;
      }
    });
  }

  void calcTotalLeisure() async {
    var totalExpense1 = (await db.totalLeisure())[0]['TOTAL'];
    setState(() {
      if (totalExpense1 == null) {
        total = 0;
      } else {
        totalLeisure = totalExpense1;
      }
    });
  }

  void calcTotalRents() async {
    var totalExpense = (await db.totalRents())[0]['TOTAL'];
    setState(() {
      if (totalExpense == null) {
        total = 0;
      } else {
        totalRents = totalExpense;
      }
    });
  }

  void calcTotalOthers() async {
    var totalExpense = (await db.totalOthers())[0]['TOTAL'];
    setState(() {
      if (totalExpense == null) {
        total = 0;
      } else {
        totalOthers = totalExpense;
      }
    });
  }

  var db = DatabaseConnect();
  var indb = IncomeConnect();

  @override
  void initState() {
    calcTotalFood();
    calcTotalLeisure();
    calcTotalRents();
    calcTotalOthers();

    calcTotalIncome();
    calcTotal();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double totalSvaings = totalIncome - total;
    final topColor = Theme.of(context).brightness;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.line_horizontal_3,
                color: topColor == Brightness.dark
                    ? Colors.white
                    : AppColors.darkBack,
                size: 27,
              )),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Text("Simply ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.themeColor)),
              Text("Expenses",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: topColor == Brightness.dark
                          ? Colors.white
                          : AppColors.darkBack)),
            ],
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                            color: topColor == Brightness.dark
                                ? Colors.white
                                : AppColors.darkBack,
                            fontSize: 25),
                      ),
                      Text("Usernamensdfdshjshjahfahkfhaskfhaksfh,",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              color: AppColors.themeColor,
                              fontSize: 35)),
                      Text("Hope you are doing well :)",
                          style: TextStyle(
                              color: topColor == Brightness.dark
                                  ? Colors.white
                                  : AppColors.darkBack,
                              fontSize: 25))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.themeColor),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Expenses",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("\u{0024}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: AppColors.lighttext)),
                                  Text(total.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: AppColors.lighttext))
                                ],
                              ),
                              Icon(CupertinoIcons.checkmark_alt_circle_fill,
                                  color: Colors.white)
                            ],
                          ),
                          SizedBox(height: 30),
                          Text("Alerts:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColors.lighttext)),
                          Text("None , All good :)",
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.sec)),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ExpensesPage())));
                            },
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.forward),
                                Text("Track Expenses",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: AppColors.darkBack))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your expenses in brief",
                      style: TextStyle(
                          fontSize: 22,
                          color: topColor == Brightness.dark
                              ? Colors.white
                              : AppColors.darkBack)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.themeColor),
                        height: 100,
                        width: 85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.restaurant, color: Colors.white),
                            Text(
                              "Food",
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\u{0024}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(totalFood.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.themeColor),
                        height: 100,
                        width: 85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.nightlife, color: Colors.white),
                            Text(
                              "Leisure",
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\u{0024}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(totalLeisure.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.themeColor),
                        height: 100,
                        width: 85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home, color: Colors.white),
                            Text(
                              "Rents",
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\u{0024}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(totalRents.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.themeColor),
                        height: 100,
                        width: 85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.dynamic_form_outlined,
                                color: Colors.white),
                            Text(
                              "Others",
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\u{0024}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(totalOthers.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Overall earnings",
                        style: TextStyle(
                            fontSize: 22,
                            color: topColor == Brightness.dark
                                ? Colors.white
                                : AppColors.darkBack)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("\u{0024}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: topColor == Brightness.dark
                                    ? Colors.white
                                    : AppColors.darkBack)),
                        Text(totalIncome.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: topColor == Brightness.dark
                                    ? Colors.white
                                    : AppColors.darkBack)),
                        Spacer(),
                        InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IncomeScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.sec,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.money_dollar,
                                    color: AppColors.darkBack,
                                  ),
                                  Text("Track Income",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: AppColors.darkBack))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Savings",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: topColor == Brightness.dark
                                        ? Colors.white
                                        : AppColors.darkBack)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("\u{0024}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: totalSvaings < 0
                                            ? AppColors.secondary
                                            : AppColors.positive)),
                                Text(totalSvaings.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: totalSvaings < 0
                                            ? AppColors.secondary
                                            : AppColors.positive))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            (totalSvaings > 0)
                                ? Icon(
                                    Icons.mood,
                                    size: 80,
                                    color: AppColors.positive,
                                  )
                                : Icon(
                                    Icons.mood_bad,
                                    color: AppColors.secondary,
                                    size: 80,
                                  )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.width / 4,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: AppColors.themeColor),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.payment),
                                  SizedBox(height: 10),
                                  Text(
                                    "Add Expenses",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                        Spacer(),
                        Container(
                            height: MediaQuery.of(context).size.width / 4,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: AppColors.positive),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.upcoming),
                                  SizedBox(height: 10),
                                  Text(
                                    "Add Earnings",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                      ],
                    )
                  ]),
            )
          ],
        ));
  }
}
