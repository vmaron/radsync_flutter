import 'dart:async';

import 'package:flutter/material.dart';
import 'package:radsync_flutter/pages/login_web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: RadsyncApp(),
    ),
  );
}

class RadsyncApp extends StatefulWidget {
  const RadsyncApp({super.key});

  @override
  State<RadsyncApp> createState() => _RadsyncAppState();
}

class _RadsyncAppState extends State<RadsyncApp> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radsync'),
      ),
      body: LoginWebView(controller: controller),
    );
  }
}
