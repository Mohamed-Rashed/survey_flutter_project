import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Surveyweb extends StatefulWidget {
  String launchURL;

  Surveyweb({this.launchURL});

  @override
  _SurveywebState createState() => _SurveywebState();
}

class _SurveywebState extends State<Surveyweb> {
  WebViewController controllerGlobal;

  Future<bool> browserBack(BuildContext context) async{
    if(await controllerGlobal.canGoBack()){
      controllerGlobal.goBack();
    }
    else{
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=> browserBack(context),
      child: Scaffold(
        body: Builder(builder: (
          BuildContext context,
        ) {
          return WebView(
            initialUrl: widget.launchURL,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewController) {
              controllerGlobal = webviewController;
            },
          );
        }),
      ),
    );
  }
}
