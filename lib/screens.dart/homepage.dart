import 'package:expense_tracker/database/database.dart';
import 'package:expense_tracker/database/incomedatabase.dart';
import 'package:expense_tracker/screens.dart/addexpensedata.dart';
import 'package:expense_tracker/screens.dart/addincomedata.dart';
import 'package:expense_tracker/screens.dart/drawer.dart';
import 'package:expense_tracker/screens.dart/expensescreen.dart';
import 'package:expense_tracker/screens.dart/incomescreen.dart';
import 'package:expense_tracker/shared/sharedpreferenecs.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

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
  void loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString("name") ?? 0);
      currency = (prefs.getString("currency") ?? 0);
    });
  }

  @override
  void initState() {
    loadPref();
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
    var width = MediaQuery.of(context).size.width;

    double totalSvaings = totalIncome - total;
    final topColor = Theme.of(context).brightness;
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    CupertinoIcons.bars,
                    size: 27,
                  ),
                  color: topColor == Brightness.dark
                      ? AppColors.lighttext
                      : AppColors.darkBack)),
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
        drawer: AppDrawer(),
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
                      Text(username.toString(),
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
                    height: width < 600 ? 200 : 300,
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
                                  fontWeight: width < 600
                                      ? FontWeight.w500
                                      : FontWeight.bold,
                                  fontSize: width < 600 ? 20 : 40,
                                  color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(currency.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width < 600 ? 20 : 30,
                                          color: AppColors.lighttext)),
                                  Text(total.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width < 600 ? 20 : 40,
                                          color: AppColors.lighttext))
                                ],
                              ),
                              Icon(
                                CupertinoIcons.checkmark_alt_circle_fill,
                                color: Colors.white,
                                size: width < 600 ? 20 : 40,
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Text("Alerts:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width < 600 ? 20 : 30,
                                  color: AppColors.lighttext)),
                          Text(
                              totalSvaings >= 0
                                  ? "None, All good!"
                                  : "You need to cut your costs!",
                              style: TextStyle(
                                  fontSize: width < 600 ? 18 : 25,
                                  color: AppColors.lighttext)),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ExpensesPage())));
                            },
                            child: Container(
                              height: width < 600 ? 30 : 50,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(4),
                                  color: AppColors.darkBack.withOpacity(0.2)),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.forward),
                                  Text("Track Expenses",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width < 600 ? 20 : 25,
                                          color: AppColors.lighttext))
                                ],
                              ),
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
                          fontSize: width < 600 ? 22 : 30,
                          fontWeight:
                              width < 600 ? FontWeight.normal : FontWeight.bold,
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
                        height: width < 600 ? 100 : 200,
                        width: width < 600 ? 85 : 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.restaurant,
                                color: Colors.white,
                                size: width < 600 ? 20 : 30),
                            Text(
                              "Food",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width < 600 ? 20 : 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currency.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width < 600 ? 20 : 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(totalFood.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width < 600 ? 20 : 30,
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
                        height: width < 600 ? 100 : 200,
                        width: width < 600 ? 85 : 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.nightlife,
                                color: Colors.white,
                                size: width < 600 ? 20 : 30),
                            Text(
                              "Leisure",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width < 600 ? 20 : 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currency.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width < 600 ? 20 : 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(totalLeisure.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width < 600 ? 20 : 30,
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
                        height: width < 600 ? 100 : 200,
                        width: width < 600 ? 85 : 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home,
                                color: Colors.white,
                                size: width < 600 ? 20 : 30),
                            Text(
                              "Rents",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width < 600 ? 20 : 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currency.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width < 600 ? 20 : 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(totalRents.toString(),
                                    style: TextStyle(
                                        fontSize: width < 600 ? 20 : 30,
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
                        height: width < 600 ? 100 : 200,
                        width: width < 600 ? 85 : 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.dynamic_form_outlined,
                                color: Colors.white,
                                size: width < 600 ? 20 : 30),
                            Text(
                              "Others",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width < 600 ? 20 : 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currency.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width < 600 ? 20 : 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(totalOthers.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width < 600 ? 20 : 25,
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
                        Text(currency.toString(),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(currency.toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.darkBack)),
                                  SizedBox(width: 5),
                                  Text("Track Income",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width < 600 ? 15 : 20,
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
                                Text(currency.toString(),
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
                            (totalSvaings > 0 || totalSvaings == 0)
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
                        InkWell(
                          onTap: () {
                            showGeneralDialog(
                              barrierLabel: "Label",
                              barrierDismissible: false,
                              barrierColor: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.5),
                              transitionDuration:
                                  const Duration(milliseconds: 350),
                              context: context,
                              pageBuilder: (context, anim1, anim2) {
                                return AddExpenseData();
                              },
                              transitionBuilder:
                                  (context, anim1, anim2, child) {
                                return SlideTransition(
                                  position: Tween(
                                          begin: const Offset(0, 1),
                                          end: const Offset(0, 0))
                                      .animate(anim1),
                                  child: child,
                                );
                              },
                            );
                          },
                          child: Container(
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
                                    Icon(
                                      Icons.payment,
                                      size: width < 600 ? 20 : 30,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Add Expenses",
                                      style: TextStyle(
                                          fontSize: width < 600 ? 17 : 25,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            showGeneralDialog(
                              barrierLabel: "Label",
                              barrierDismissible: false,
                              barrierColor: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.5),
                              transitionDuration:
                                  const Duration(milliseconds: 350),
                              context: context,
                              pageBuilder: (context, anim1, anim2) {
                                return AddIncomeData();
                              },
                              transitionBuilder:
                                  (context, anim1, anim2, child) {
                                return SlideTransition(
                                  position: Tween(
                                          begin: const Offset(0, 1),
                                          end: const Offset(0, 0))
                                      .animate(anim1),
                                  child: child,
                                );
                              },
                            );
                          },
                          child: Container(
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
                                    Icon(
                                      Icons.upcoming,
                                      size: width < 600 ? 20 : 30,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Add Earnings",
                                      style: TextStyle(
                                          fontSize: width < 600 ? 17 : 25,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ]),
            )
          ],
        ));
  }
}
