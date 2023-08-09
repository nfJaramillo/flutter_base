import 'package:flutter/material.dart';
import 'package:walletconnect_modal_flutter/walletconnect_modal_flutter.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  WalletConnectModalService service = WalletConnectModalService(
    projectId: 'a2f8d571d4141cefbc3a26db7f6126a0',
    metadata: const PairingMetadata(
      name: 'Flutter WalletConnect',
      description: 'Flutter WalletConnectModal Sign Example',
      url: 'https://walletconnect.com/',
      icons: ['https://walletconnect.com/walletconnect-logo.png'],
      redirect: Redirect(
        native: 'flutterdapp://',
        universal: 'https://www.walletconnect.com',
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    context.loaderOverlay.show();
    startWalletConnectService();
    context.loaderOverlay.hide();
  }

  startWalletConnectService() async {
    await service.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Image.asset(
                'assets/images/Logo_Blockchain2.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            const Text(
              "Bienvenido a la experiencia móvil Blockchain ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 45,
                //fontFamily: themeData.fontFamily,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: WalletConnectModalConnect(
                walletConnectModalService: service,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
