import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import '../models/auth_token.dart';
import '../models/constants.dart';

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
              final auth = await fetchAuthToken(token);
              debugPrint("Hello ${auth.profile?.firstName}");
              debugPrint(auth.jwt?.token);
              /* ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'You have successfully signed in',
                  ),
                ),
              );
*/
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

Future<AuthToken> fetchAuthToken(String token) async {
  final url = "${Constants.host}/api/auth/$token";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final authToken = AuthToken.fromJson(jsonDecode(response.body));
    return authToken;
  } else {
    throw Exception("Failed to get data from API");
  }
}
