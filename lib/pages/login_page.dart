import 'package:flutter/material.dart';
import 'package:walletconnect_modal_flutter/walletconnect_modal_flutter.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

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

  loginUsingMetamask(BuildContext context) async {
    await service.init();

    service.open(context: context);
    print(service.connectResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitHeight,
            ),
            ElevatedButton(
                onPressed: () => loginUsingMetamask(context),
                child: const Text("Connect with Metamask"))
          ],
        ),
      ),
    );
  }
}
