import 'dart:async';
import 'package:flutter/material.dart';
import 'package:radsync_flutter/modules/api/auth_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:radsync_flutter/models/constants.dart';
import 'package:radsync_flutter/modules/tools/navigate.dart';
import 'package:radsync_flutter/features/waste/waste.dart';


class LoginWebView extends StatefulWidget {
  const LoginWebView({required this.controller, super.key});

  final Completer<WebViewController> controller;

  @override
  State<LoginWebView> createState() => _LoginWebViewState();
}

class _LoginWebViewState extends State<LoginWebView> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: Constants.host.toString(),
          onWebViewCreated: (webViewController) {
            widget.controller.complete(webViewController);
          },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          navigationDelegate: (navigation) async {
            if (navigation.url.startsWith(Constants.redirectUri)) {
              final token = navigation.url.split("/").last;
              final authService = AuthService();
              authService.fetchAuthToken(token).then((value) => {Navigate.replaceTo(context, const WasteHomeScreen())});
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: _createJavascriptChannels(context),
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }

  Set<JavascriptChannel> _createJavascriptChannels(BuildContext context) {
    return {
      JavascriptChannel(
        name: 'SnackBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)));
        },
      ),
    };
  }
}
