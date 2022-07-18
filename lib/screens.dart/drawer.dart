import 'package:expense_tracker/shared/sharedpreferenecs.dart';
import 'package:expense_tracker/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lighttext,
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(color: AppColors.themeColor),
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      bottom: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          username,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColors.lighttext),
                        ),
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 18,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          CupertinoIcons.moon_circle_fill,
                          color: AppColors.lighttext,
                          size: 30,
                        ),
                        onPressed: () {},
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 14,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Simply",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white)),
                            Text("Expenses.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black))
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: MediaQuery.of(context).size.height / 12,
                      child: Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.lighttext))
                ],
              )),
        ],
      ),
    );
  }
}
