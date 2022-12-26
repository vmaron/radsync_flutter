import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radsync_flutter/modules/api/auth_service.dart';
import 'package:go_router/go_router.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: IconButton(
        onPressed: () {
          final authService = AuthService();
          authService.logout();
          context.go('/');
        },
        icon: SvgPicture.asset(
          'assets/icons/user-circle-solid.svg',
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
