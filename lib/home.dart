// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:india_today_task/appbar.dart';
import 'package:india_today_task/bottomnavigationbar.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'api_manger/api_service.dart';
import 'utility/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle textStyle =
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  TextStyle textStyle1 = const TextStyle(fontSize: 12.0);
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  bool loading = false;
  DateTime date = DateTime.now();
  DateFormat formatter = new DateFormat('d MMMM, yyyy');

  @override
  void initState() {
  
    //getAstrologerListApiCall();
    super.initState();
  }

  Future<DateTime> selectDate(DateTime selectedDate) async {
    final DateTime _date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime.now().add(Duration(days: 3650)),
    );

    if (_date != null) {
      selectedDate = _date;
    }
    return selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      progressIndicator: const CircularProgressIndicator(),
      child: Scaffold(
          key: _scaffoldState,
          backgroundColor: Colors.white,
          appBar: const AppBarHeader(),
          bottomNavigationBar: const BottomNavigation(),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    Text("Daily Panchang", style: textStyle),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                    "India is a country know for its festival but knowing the exact dates can sometimes be difficult. To ensure you to do not miss out on the critical dates we bring you the daily panchang.",
                    style: textStyle1),
                const SizedBox(height: 10.0),
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  //height: 100,
                  decoration: BoxDecoration(color: Colors.red[50]),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(child: Text("Date:"))),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.615,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(formatter.format(date)),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                         selectDate(date);
                                        });
                                      },
                                      icon: Icon(Icons.arrow_drop_down))
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(child: Text("Location:"))),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width:
                                    MediaQuery.of(context).size.width * 0.615,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text("Delhi, India",
                                        style: TextStyle(fontSize: 15.0))))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

/*   getAstrologerListApiCall() async {
    setState(() {
      loading = true;
    });
    var request = {
      "day": 2,
      "month": 7,
      "year": 2021,
      "placeId": "ChIJL_P_CXMEDTkRw0ZdG-0GVvw"
    };
    log(request.toString());
    ApiService.getDailyPanchang(request).then((res) async {
      if (res.httpStatusCode==200 && res.success == true) {
        log("Result Daily Panchang" + res.data.toString());
      } else {
        log("Result Daily Panchang");
      }
      setState(() {
        loading = false;
      });
    }).catchError((error) {
      setState(() {
        loading = false;
      });
    });
  } */
}
