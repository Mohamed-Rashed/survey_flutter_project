import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:survey/common/cloase_widget.dart';
import 'package:survey/common/indicator_shimmer.dart';
import 'package:survey/common/nav_widget.dart';
import 'package:survey/common/progress_indicator.dart';
import 'package:survey/common/text_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/langProvider.dart';
import 'package:survey/models/awards_response.dart';
import 'package:survey/models/poll_model.dart';
import 'package:survey/models/survey_response.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/util.dart';

import 'package:http/http.dart' as http;

class PointPage extends StatefulWidget {

  LangProvider prlan;
  PointPage({this.prlan}) ;


  @override
  State<StatefulWidget> createState() {
    return _PointPageState();
  }
}

class _PointPageState extends State<PointPage> {
  //Controller c = Controller();

  bool isIndicator = false;

  List<PollsData> l = [];
  List<AwardsResponse> awardsList = [];

  @override
  void initState() {
    super.initState();

    fetchAwards().then((value) {
      awardsList = value;
      print("-----------nit----${value.length}");
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
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
            dataWidget(),
            isIndicator == true ? listWidget() : listShimmer()
          ],
        ));
  }

  onClick() {}

  closeClick() {
    Get.back();
    // print("fjh");
  }

  listWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 34 / 100,
      child: ListView.builder(
          itemCount: awardsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
              height: MediaQuery.of(context).size.height * 15 / 100,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1.2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 25 / 100,
                    width: MediaQuery.of(context).size.width * 30 / 100,
                    child: Image.asset("assets/images/img.png"),
                  ),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height * 25 / 100,
                          width: MediaQuery.of(context).size.width * 35 / 100,
                          child: text(
                              awardsList[index].description,
                              14,
                              textColor,
                              "assets/fonts/Janna LT Regular.ttf",
                              context,
                              false))),
                ],
              ),
            );
          }),
    );
  }

  listShimmer() {
    return Container(
      height: MediaQuery.of(context).size.height * 30 / 100,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.all(5),
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                height: MediaQuery.of(context).size.height * 15 / 100,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: 1.2),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Shimmer.fromColors(
                        baseColor: white,
                        highlightColor: gray,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 25 / 100,
                          width: MediaQuery.of(context).size.width * 30 / 100,
                          child: Image.asset("assets/images/img.png"),
                        )),
                    Expanded(
                        child: Shimmer.fromColors(
                            baseColor: white,
                            highlightColor: gray,
                            child: Container(
                              color: textColor,
                              margin: EdgeInsets.only(top: 20),
                              height:
                                  MediaQuery.of(context).size.height * 25 / 100,
                            ))),
                  ],
                ));
          }),
    );
  }

  dataWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 52 / 100,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 2 / 100,
          ),
          text(S.of(context).my_points, 24, textColor,
              "assets/fonts/Janna LT Bold.ttf", context, false),
          SizedBox(
            height: MediaQuery.of(context).size.height * 2 / 100,
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 30 / 100,
            child: isIndicator == true
                ? progressIndicator("${response.credit}" + "/100",
                    MediaQuery.of(context).size.height * 30 / 100, 5)
                : progressIndicatorShimmer(context),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 3 / 100,
          ),
          text(S.of(context).available_gift, 24, textColor,
              "assets/fonts/Janna LT Bold.ttf", context, false),
          SizedBox(
            height: MediaQuery.of(context).size.height * 2 / 100,
          ),
        ],
      ),
    );
  }

  Future<List<AwardsResponse>> fetchAwards() async {
    http.Response response = await http.get(BASE_URL + GET_AWARDS);
    List responseJson = json.decode(response.body);

    print("-------bfdf---${responseJson}");

    return responseJson.map((m) => new AwardsResponse.fromJson(m)).toList();
  }
}
