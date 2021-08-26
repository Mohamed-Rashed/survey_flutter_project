import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/locale/app_localizations.dart';
import 'package:survey/utils/colors..dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      width: 200,
      height: MediaQuery.of(context).size.height * 40 / 100,
      margin: EdgeInsets.only(top: 13.0, right: 8.0),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Text(
            S.of(context).dialog_text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "assets/fonts/Janna LT Bold.ttf",
                fontSize: 18,
                color: textColor),
          )),
          buttonWidget(onclick, S.of(context).share,
              MediaQuery.of(context).size.height * 8 / 100),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  onclick() {

    Share.share("The Survey link is http://projects.marketeersresearch.com/DiaperPant/login.html");

  }
  // String getText(String content, BuildContext context) {
  //   // Get.updateLocale(l)
  //   return AppLocalizations.of(context).translate(content);
  // }
}
