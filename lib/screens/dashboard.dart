import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shimmer/shimmer.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/common/dialog_widget.dart';
import 'package:survey/common/indicator_shimmer.dart';
import 'package:survey/common/nav_widget.dart';
import 'package:survey/common/progress_indicator.dart';
import 'package:survey/common/text_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/langProvider.dart';
import 'package:survey/locale/AppLanguage.dart';
import 'package:survey/models/poll_model.dart';
import 'package:survey/models/sign_up_response.dart';
import 'package:survey/models/survey_response.dart';
import 'package:survey/navscreen/survey_web_view.dart';

import 'package:survey/network/network_util.dart';
import 'package:survey/screens/finish.dart';

import 'package:survey/screens/notification_page.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  LangProvider prlan;
  Dashboard({this.prlan}) ;

  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  //Controller c = Controller();

  List<PollsData> l = [];

  // List<dynamic> surveyList = [];
  List<SurveyResponse> surveyList = [];

  bool _enabled = true;

  bool isIndicator = false;

  @override
  void initState() {
    super.initState();
    getAccountInfo();
    //getAllSurvey();
    fetchPosts().then((value) {
      setState(() {
        surveyList = value;
      });
    });
    Future.delayed(const Duration(milliseconds: 3), () {
      setState(() {
        l.add(PollsData("data byond the buffer 1", "11:30", "5 point",
            "assets/images/img_dash.png"));
        l.add(PollsData("data byond the buffer 2", "12:30", "7 point",
            "assets/images/img.png"));
        l.add(PollsData("data byond the buffer 3", "01:30", "9 point",
            "assets/images/img_dash.png"));
        l.add(PollsData("data byond the buffer 4", "03:30", "6 point",
            "assets/images/img.png"));
        l.add(PollsData("data byond the buffer 5", "11:45", "1 point",
            "assets/images/img_dash.png"));
        isIndicator = true;
      });
    });
  }

  void getAccountInfo() {
    NetworkUtil networkUtil = new NetworkUtil();
    var url = BASE_URL + ACCOUNT_PAGE;

    networkUtil
        .get(url, headers: {"Authorization": "$TOKEN_PRE" + "$token"}).then(
            (dynamic value) {
      setState(() {
        response = SignUpResponse.fromJson(value);

        if (response != null) {
          print("----------$response");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  // var appLanguage = Provider.of<AppLanguage>(context);

                  navigateToNotification();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Image.asset(
                    "assets/icons/icons8-bell-96.png",
                    width: 32,
                  ),
                )

                //Icon(Icons.notification_important),
                ),

            //   notificationWidget()
            // closeWidget(closeClick)
          ],
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
        body: response != null
            ? Column(
                children: [
                  dataWidget(),
                  listWidget(),
                ],
              )
            : Container());
  }

  onClick(dynamic t) {}

  onClickRecover() {
    showDialog(
        context: context, builder: (BuildContext context) => CustomDialog());
  }

  _launchURL(String url) async {
    //const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url).then((value){
        Get.to(SurveyFinish());

      });
    } else {
      /*await launch("http://projects.marketeersresearch.com/DiaperPant/login.html").then((value) {
        Get.to(SurveyFinish());
      });*/

      Fluttertoast.showToast(msg: "Could not launch");
      throw 'Could not launch $url';
    }
  }

  listWidget() {
    return Container(
        height: MediaQuery.of(context).size.height * 27 / 100,
        child: l.length != 0
            ? ListView.builder(
                itemCount: surveyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      //onTap: () => {_launchURL(surveyList[index].link)},
                    onTap: (){
                      Get.to(Surveyweb(launchURL: _launchURL(surveyList[index].link).toString()));
                    },
                      child: Container(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            rowImageWidget(surveyList[index]),
                            rowTextWidget(surveyList[index])
                          ],
                        ),
                      ));
                })
            : ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 100,
                    margin: EdgeInsets.all(10),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [imageShimmer(), widgetdata()],
                    ),
                  );
                }));
  }

  rowImageWidget(SurveyResponse l) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 30 / 100,
      child: Image.asset(
        "assets/images/img_dash.png",
        cacheWidth: 120,
        cacheHeight: 90,
      ),
    );
  }

  rowTextWidget(SurveyResponse l) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 65 / 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 100,
              child: Text(
                //  c.getText("dash_title", context),
                l.title,
                style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontFamily: "assets/fonts/Janna LT Regular.ttf"),
              )),
          starWidget(l),
        ],
      ),
    );
  }

  Widget textImageWidget(String image, String textLabel) {
    return Container(
        width: MediaQuery.of(context).size.width * 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 14,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              textLabel,
              style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontFamily: "assets/fonts/Janna LT Regular.ttf"),
            )
          ],
        ));
  }


  starWidget(SurveyResponse l) {
    return Container(
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 50 / 100,
              child: textTime(l)),
          InkWell(
            onTap: () async {
              final ByteData bytes = await rootBundle.load('assets/images/img_dash.png');
              final Uint8List list = bytes.buffer.asUint8List();
              final tempDir = await getTemporaryDirectory();
              final file = await new File('${tempDir.path}/img_dash.png').create();
              file.writeAsBytesSync(list);
              Share.shareFiles(
                ['${file.path}'],
                text: "Title : ${l.title} \nDescription : ${l.description} \nLink : ${l.link}",
              );
            },
              child: Image.asset(
                "assets/icons/share.png",
                color: Color(0xff20268A),
                width: 24,
              ))
        ],
      ),
    );
  }

  textTime(SurveyResponse l) {
    return Container(
        child: Column(
      children: [
        textImageWidget("assets/icons/icons8-time-96.png",
            l.time.toString() //c.getText("time", context)
            ),
        textImageWidget("assets/icons/icons8-star-filled-96.png",
            l.numberofpoints.toString())
      ],
    ));
  }

  Widget notificationWidget() {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: GestureDetector(
              onTap: () => {
                // Get.to(() => NotificationPage())
                Get.to(NotificationPage(prlan: widget.prlan,))
              },
              child: Image.asset(
                "assets/images/notification_icon.png",
                cacheHeight: 28,
                cacheWidth: 28,
              ),
            )));
  }

  imageShimmer() {
    return Shimmer.fromColors(
      baseColor: white,
      highlightColor: gray,
      child: Container(
        color: Colors.green,
        height: 80,
        width: MediaQuery.of(context).size.width * 30 / 100,
      ),
    );
  }

  widgetdata() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width * 60 / 100,
      child: Column(
        children: [
          Shimmer.fromColors(
              baseColor: white,
              highlightColor: gray,
              child: Container(
                  width: MediaQuery.of(context).size.width * 60 / 100,
                  margin: EdgeInsets.all(2),
                  color: borderColor,
                  child: Text(""))),
          Shimmer.fromColors(
              baseColor: white,
              highlightColor: gray,
              child: Container(
                  margin: EdgeInsets.all(2),
                  color: borderColor,
                  width: MediaQuery.of(context).size.width * 60 / 100,
                  child: Text(""))),
          Shimmer.fromColors(
              baseColor: white,
              highlightColor: gray,
              child: Container(
                  margin: EdgeInsets.all(2),
                  color: borderColor,
                  width: MediaQuery.of(context).size.width * 60 / 100,
                  child: Text(""))),
        ],
      ),
    );
  }

  dataWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 60 / 100,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 2 / 100,
          ),
          text(
              response != null
                  ? "${S.of(context).welcome} " + response.name
                  : "",
              24,
              textColor,
              "assets/fonts/Janna LT Regular.ttf",
              context,
              true),
          SizedBox(
            height: MediaQuery.of(context).size.height * 3 / 100,
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 30 / 100,
            child: isIndicator == true
                ? progressIndicator(
                    "${response.credit}" + "/100",
                    MediaQuery.of(context).size.height * 30 / 100,
                    response.credit)
                : progressIndicatorShimmer(context),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 3 / 100,
          ),
          buttonWidget(onClickRecover, S.of(context).recover_now,
              MediaQuery.of(context).size.height * 8 / 100),
          SizedBox(
            height: MediaQuery.of(context).size.height * 2 / 100,
          ),
          text(S.of(context).polls_today, 20, textColor,
              "assets/fonts/Janna LT Regular.ttf", context, false),
        ],
      ),
    );
  }

  void getAllSurvey() {
    NetworkUtil networkUtil = new NetworkUtil();

    var url = BASE_URL + GET_SURVEY;
    networkUtil.get(url).then((dynamic value) {
      List responseJson = json.decode(value);
      var res = SurveyResponse.fromJson(value[1]);
      // surveyList.add(value);
      print("--------v---${res.title}");
      print("--------v---${responseJson.length}");
    });
  }

  Future<List<SurveyResponse>> fetchPosts() async {
    http.Response response = await http.get(BASE_URL + GET_SURVEY);
    List responseJson = json.decode(response.body);

    print("-------bfdf---${responseJson}");

    return responseJson.map((m) => new SurveyResponse.fromJson(m)).toList();
  }

  void navigateToNotification() {
    var _timer = new Timer(const Duration(seconds: 1), () {
      Get.to(NotificationPage(prlan: widget.prlan,));

      // Get.off(isReferesh ? Dashboard() : SignIn());
      //Get.off(isReferesh ? Dashboard() : WelcomeScreen());
    });
  }
}
