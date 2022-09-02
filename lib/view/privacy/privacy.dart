import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
        body: const Markdown(data: """
**Privacy Policy**

Gwhyyy ( Developer ) built the GNotifier app as an Open Source app. This SERVICE is provided by me (Gwhyyy) at no cost and is intended for use as is.à
This page is used to inform visitors regarding my policies with the collection,

**Information Collection**

Our offered service here don't require any collection of data from users, it's made to solve a problem and help, we collect 0% of data our users put in the app because we just care about the privacy of our users


**Security**

Since your data isn't stored at any place but your actual phone, we guarantee you a 100% security on external environment 

**Links to Other Sites**

This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

**Changes to This Privacy Policy**

I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 2022-09-02

**Contact Us**

If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at ffikhi.aanas@gmail.com.
"""));
  }
}
