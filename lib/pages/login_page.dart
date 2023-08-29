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
      name: 'Bancolmbia Flutter WalletConnect',
      description: 'Bancolmbia Flutter WalletConnectModal Sign Example',
      url: 'https://www.bancolombia.com/',
      icons: [
        'https://www.bancolombia.com/wcm/connect/b8e4c3f2-36a9-497d-a125-ac04f83b0bf8/LogoBancolombia.png?MOD=AJPERES'
      ],
      redirect: Redirect(
        native: 'flutterdapp://',
        universal: 'https://www.bancolombia.com/',
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    startWalletConnectService();
  }

  startWalletConnectService() async {
    showLoaderOverlay();
    await service.init();
    hideLoaderOverlay();
  }

  showLoaderOverlay() {
    context.loaderOverlay.show();
  }

  hideLoaderOverlay() {
    context.loaderOverlay.hide();
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
