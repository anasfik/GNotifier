import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'privacy__content.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText(
          "Privacy & policy",
          maxLines: 1,
        ),
      ),
      body: const Markdown(
        data: privacyContent,
      ),
    );
  }
}
