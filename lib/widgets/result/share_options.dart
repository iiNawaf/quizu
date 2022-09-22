import 'package:flutter/material.dart';

class ShareOptions extends StatelessWidget {
  const ShareOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('./assets/icons/twitter.png'),
        Image.asset('./assets/icons/whatsapp.png'),
        Image.asset('./assets/icons/twitter.png')
      ],
    );
  }
}
