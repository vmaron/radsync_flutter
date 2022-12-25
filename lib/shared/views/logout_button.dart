import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:radsync_flutter/features/auth/view/login_web_view.dart';
import 'package:radsync_flutter/modules/api/auth_service.dart';
import 'package:radsync_flutter/modules/tools/navigate.dart';


class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center, padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: IconButton(
        onPressed: () {
          final authService = AuthService();
          authService.logout();
          Navigate.push(context, LoginWebView(controller: Completer<WebViewController>()));
        },
        icon: const Icon(Icons.account_circle_sharp),
      ),
    );
  }
}