import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText(
          "Contact",
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[

             const AutoSizeText(
              "Contact",
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
