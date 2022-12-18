import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          navigationDelegate: (navigation) {
            debugPrint(navigation.url);
            final host = Uri.parse(navigation.url).host;

            if (navigation.url.startsWith(Constants.redirectUri)) {

              final token = navigation.url.split("/").last;
              debugPrint("Token: $token");

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'You have successfully signed in',
                  ),
                ),
              );

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

mixin Constants {
  static Pattern host = 'https://staging-radsync.mskcc.org';
  static Pattern redirectUri = 'https://staging-radsync.mskcc.org/sso';
}
