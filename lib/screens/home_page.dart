import 'package:budget_tracker/screens/login_options/login_opt.dart';
import 'package:budget_tracker/services/auth_service.dart';
import 'package:budget_tracker/widgets/colors.dart';
import 'package:budget_tracker/widgets/custom_button.dart';
import 'package:budget_tracker/widgets/expense_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> expenseData = [
    {
      'title': "Shopping",
      'date': "6 January 2023",
      'logo': "",
      'money': 50,
    },
    {
      'title': "Entertainment",
      'date': "6 January 2023",
      'logo': "",
      'money': 50,
    },
    {
      'title': "Transport",
      'date': "6 January 2023",
      'logo': "",
      'money': 50,
    },
    {
      'title': "Food & Drinks",
      'date': "6 January 2023",
      'logo': "",
      'money': 50,
    },
    {
      'title': "Bills",
      'date': "6 January 2023",
      'logo': "",
      'money': 50,
    },
  ];
  @override
  Widget build(BuildContext context) {
    var screeWidth = MediaQuery.of(context).size.width;
    var screeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.secondaryColor,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart, size: 20),
              label: "Charts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box, size: 20),
              label: "Goals",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month, size: 20),
              label: "Bills",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 20),
              label: "Settings",
            ),
          ]),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
              child: Container(
                width: double.infinity,
                height: screeHeight * 0.22,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      spreadRadius: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expenses",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "100000" + " " + "\u{20B9}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(7)),
                      Text(
                        "Savings",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "300000" + " " + "\u{20B9}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screeHeight * 0.06,
            ),
            Text(
              "Recent Expenses",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: screeHeight * 0.03,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ExpenseTile(
                    title: expenseData[index]['title'],
                    money: expenseData[index]['money'],
                    date: expenseData[index]['date'],
                  ),
                );
              }),
            ),

            // CustomButton(
            //     child: Text("Sign out"),
            //     onPressed: () {
            //       signOut(context);
            //     }),
          ],
        ),
      ),
    );
  }
}

signOut(BuildContext context) async {
  await AuthService().signOut().whenComplete(() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login_opt()));
  });
}
