import 'package:flutter/material.dart';
import 'package:flutter_base/utils/routes.dart';
import 'package:flutter_base/pages/login_page.dart';
import 'package:walletconnect_modal_flutter/walletconnect_modal_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WalletConnectModalTheme(
      data: WalletConnectModalThemeData.darkMode,
      child: GlobalLoaderOverlay(
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xff2C2A29),
                primary: const Color(0xff2C2A29),
                onPrimary: const Color(0xffffffff)),
            fontFamily: 'Nunito',
            useMaterial3: true,
          ),
          initialRoute: MyRoutes.loginRoute,
          routes: {
            MyRoutes.loginRoute: (context) => const LoginPage(),
          },
        ),
      ),
    );
  }
}
