import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:survey/common/cloase_widget.dart';
import 'package:survey/common/nav_widget.dart';
import 'package:survey/common/text_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/langProvider.dart';
import 'package:survey/models/notification_response.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/controller.dart';
import 'package:http/http.dart' as http;
import 'package:survey/utils/util.dart';

class NotificationPage extends StatefulWidget {

  LangProvider prlan;
  NotificationPage({this.prlan}) ;

  @override
  Widget build(BuildContext context) {}

  @override
  State<StatefulWidget> createState() {
    return _NotificationPageState();
  }
}

class _NotificationPageState extends State<NotificationPage> {
  Controller c = Controller();

  onClick() {}

  closeClick() {
    Navigator.pop(context, false);
  }

  listWidget(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 78 / 100,
        child: ListView.builder(
            itemCount: notification.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    height: MediaQuery.of(context).size.height * 15 / 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor, width: 1.2),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        /*  Container(
                          width: MediaQuery.of(context).size.width * 100,
                          margin: EdgeInsets.only(top: 10, left: 7),
                          child: Text(
                            notification[index].surveyid.toString(),
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontFamily:
                                    "assets/fonts/Janna LT Regular.ttf"),
                          ),
                        ),*/
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 10 / 100,
                          width: MediaQuery.of(context).size.width * 100,
                          margin: EdgeInsets.only(top: 3, left: 7),
                          child: Text(
                            notification[index].details,
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontFamily:
                                    "assets/fonts/Janna LT Regular.ttf"),
                          ),
                        ),
                        /* Container(
                          width: MediaQuery.of(context).size.width * 100,
                          margin: EdgeInsets.only(top: 3, left: 7),
                          child: Text(
                            c.getText("yes_10", context),
                            style: TextStyle(
                                color: textColor,
                                fontSize: 12,
                                fontFamily:
                                "assets/fonts/Janna LT Regular.ttf"),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                  c.marginTop20,
                  Container(
                    width: MediaQuery.of(context).size.width * 80 / 100,
                    height: 1,
                    color: Colors.black12,
                  ),
                  c.marginTop5,
                ],
              );
            }));
  }

  List<NotificationResponse> notification = [];
  @override
  void initState() {
    super.initState();

    getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0,
          actions: [closeWidget(closeClick)],
          leading: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => {
                  Scaffold.of(context).openDrawer(),
                },
                child: Image.asset(
                  "assets/images/drawer_icon.png",
                  cacheWidth: 24,
                  cacheHeight: 22,
                ),
              );
            },
          ),
        ),
        drawer: drawerWidget(context, onClick,widget.prlan),
        body: Column(
          children: [
            text(S.of(context).notice, 25, textColor,
                "assets/fonts/Janna LT Regular.ttf", context, false),
            c.marginTop15,
            listWidget(context)
          ],
        ));
  }

  void getNotification() {
    var pr = new ProgressDialog(context, isDismissible: true, showLogs: false);

    pr.show();
    fetchPosts().then((value) {
      setState(() {
        pr.hide();
        notification = value;
      });
    });
  }

  Future<List<NotificationResponse>> fetchPosts() async {
    http.Response response = await http.get(BASE_URL + notificationList,
        headers: {"Authorization": "$TOKEN_PRE" + "$token"});
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);

      print("-------bfdf---${responseJson}");

      return responseJson
          .map((m) => new NotificationResponse.fromJson(m))
          .toList();
    }
    return [];
  }
}
