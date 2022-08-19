// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:watch_it_later/main.dart' as app;
import 'package:watch_it_later/view/general__widgets/button.dart';
import 'package:watch_it_later/view/get__started/widgets/one_face_rounded_box.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('app run test', (WidgetTester tester) async {
    await app.main();
    await tester.pumpAndSettle();

    //Finders
    final Finder getStartedText = find.text('Get Started');
    final Finder getStartedButton = find.byKey(Key("getStartedButton"));
    final Finder decorationBoxes = find.byType(OneFaceRoundedBox);
    final Finder appLogo = find.byKey(Key("app logo"));
    final Finder getUsernameTextField =
        find.byKey(Key("get username text field"));
    final Finder getUsernameButton = find.byWidgetPredicate(
        (widget) => widget is CustomButton && widget.onPressed == null);
    final Finder getUsernameButtonWithNonNullOnPressed = find.byWidgetPredicate(
        (widget) => widget is CustomButton && widget.onPressed != null);

    // check for the 4 decoration boxes
    expect(decorationBoxes, findsNWidgets(4));
    tester.printToConsole("found the 4 decoration boxes");

    // check for get started button
    expect(getStartedButton, findsOneWidget);
    tester.printToConsole("found get started button");

    // check for the get started text
    expect(getStartedText, findsOneWidget);
    tester.printToConsole("found get started text");

    // click the get Started button
    await tester.tap(getStartedButton);
    await tester.pumpAndSettle();

    // check for the app logo
    expect(appLogo, findsOneWidget);
    tester.printToConsole("found app logo");

    // check for the username text field
    expect(getUsernameTextField, findsOneWidget);
    tester.printToConsole("found username text field");

    // check for the button onPressed being null before typing anything
    expect(getUsernameButton, findsOneWidget);
    tester
        .printToConsole("the button onPressed is null before typing anything");

    // type in the username text field
    await tester.enterText(getUsernameTextField, "Gwhyyy");
    await tester.pumpAndSettle();
    tester.printToConsole("typed \"Gwhyyy\" in the username text field");

    // check for the button onPressed being not null cause we typed something
    expect(getUsernameButtonWithNonNullOnPressed, findsOneWidget);
    tester.printToConsole(
        "the button onPressed is not null and working now fine");

    // go to mainPage
    await tester.tap(getUsernameButtonWithNonNullOnPressed);
    await tester.pumpAndSettle();
    tester.printToConsole("tapped button, going to main page");

// check if this is the home page



  });
}
