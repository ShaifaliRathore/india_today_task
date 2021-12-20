// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:india_today_task/appbar.dart';
import 'package:india_today_task/bottomnavigationbar.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'api_manger/api_service.dart';
import 'utility/images.dart';

class AstrologerList extends StatefulWidget {
  const AstrologerList({Key key}) : super(key: key);

  @override
  _AstrologerListState createState() => _AstrologerListState();
}

class _AstrologerListState extends State<AstrologerList> {
  TextStyle textStyle =
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  bool loading = false;
  @override
  void initState() {
    getDailyPanchangApiCall();
    super.initState();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Talk to an Astrologer", style: textStyle),
                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            Images.search,
                            height: 25.0,
                            width: 25.0,
                          ),
                          onPressed: null,
                        ),
                        IconButton(
                          icon: Image.asset(
                            Images.filter,
                            height: 25.0,
                            width: 25.0,
                          ),
                          onPressed: null,
                        ),
                        IconButton(
                          icon: Image.asset(
                            Images.sort,
                            height: 25.0,
                            width: 25.0,
                          ),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  getDailyPanchangApiCall() async {
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
      if (res.httpStatusCode == 200 && res.success == true) {
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
  }
}
