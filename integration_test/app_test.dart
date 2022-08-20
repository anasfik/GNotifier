// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:watch_it_later/main.dart' as app;
import 'package:watch_it_later/view/general__widgets/button.dart';
import 'package:watch_it_later/view/general__widgets/favorite_icon__button.dart';
import 'package:watch_it_later/view/general__widgets/notification__card.dart';
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
    final Finder tabBar = find.byKey(Key("tabBar"));
    final Finder textToCreateFirstNotification =
        find.text("Press ' + ' To Create Your First Schedule Notification");
    final Finder addButton = find.byKey(Key("create notification button"));

    final Finder titleField = find.byKey(Key("title field"));
    final Finder descriptionField = find.byKey(Key("description field"));

    final Finder dailyButton = find.byKey(Key("daily icon"));
    final Finder autoDeleteButton = find.byKey(Key("auto delete icon"));
    final Finder dateButton = find.byKey(Key("date icon"));
    final Finder createButton = find.byKey(Key("create button"));
    final Finder notificationCard = find.byType(NotificationCard);
    final Finder searchTab = find.byIcon(Icons.search);
    final Finder favoritesTab = find.byIcon(Icons.favorite);
    final Finder settingsTab = find.byIcon(Icons.settings);
    final Finder homeTab = find.byIcon(Icons.home);
    final Finder searchField = find.byKey(Key("search field"));
    final Finder searchFieldHint = find.text("Search");
    final Finder noSearchText = find.byKey(Key("nothing to show"));
    final Finder lottieWidget = find.byKey(Key("lottie"));
    final Finder favoriteButton = find.byWidgetPredicate(
        (widget) => widget is FavoriteIconButton && widget.isChecked == false);
    final Finder checkedFavoriteButton = find.byWidgetPredicate(
        (widget) => widget is FavoriteIconButton && widget.isChecked == true);
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
    // useful to hide the keyboard
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    tester.printToConsole("typed \"Gwhyyy\" in the username text field");

    // check for the button onPressed being not null cause we typed something
    expect(getUsernameButtonWithNonNullOnPressed, findsOneWidget);
    tester.printToConsole(
        "the button onPressed is not null and working now fine");

    // go to mainPage
    await tester.pumpAndSettle();
    await tester.tap(getUsernameButtonWithNonNullOnPressed);
    tester.printToConsole("tapped button, going to main page");
    await tester.pumpAndSettle();

    // check if this is the home page
    expect(tabBar, findsOneWidget);
    tester.printToConsole("found tab bar");

    // check if those texts are there
    expect(textToCreateFirstNotification, findsOneWidget);
    tester.printToConsole("found text to create first notification");
    expect(find.text("Hey, Gwhyyy"), findsOneWidget);
    tester.printToConsole("found text \"Hey, Gwhyyy\"");

    // check if there is a addButton
    expect(addButton, findsOneWidget);
    tester.printToConsole("found add (+) button");

    // tap that button and open the add notification page
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    tester.printToConsole("tapped button to create notification");

    // check id there is a title field
    expect(titleField, findsOneWidget);
    tester.printToConsole("found title field");

    // write in the title field
    await tester.enterText(titleField, "we will");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    await tester.pumpAndSettle();
    tester.printToConsole("typed in the title field");

    // check if there is a description field
    expect(descriptionField, findsOneWidget);
    tester.printToConsole("found description field");

    // write in the description field
    await tester.enterText(descriptionField, "just a, exmaple test here");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    await tester.pumpAndSettle();
    tester.printToConsole("typed in the description field");

    // check if there is date, daily, auto delete widgets
    expect(dailyButton, findsOneWidget);
    expect(dateButton, findsOneWidget);
    expect(autoDeleteButton, findsOneWidget);
    tester.printToConsole("found the three, daily, auto delete, date");

    // tap date button date and time
    await tester.tap(dateButton);
    await tester.pumpAndSettle();
    await tester.pump();
    tester.printToConsole("tapped date button");

    // choose date
    await tester.tap(find.text((DateTime.now().day + 2).toString()));
    print((DateTime.now().day + 2).toString());
    await tester.tap(find.text("OK"));
    await tester.pumpAndSettle();
    tester.printToConsole("entered date");

    /// to do
    // choose time
    // await tester.tap(find.textContaining("2"));
    // await tester.pump();
    // await tester.tap(find.text("30"));
    // await tester.pump();
    await tester.tap(find.text("OK"));
    await tester.pumpAndSettle();
    tester.printToConsole("entered time");

    //switch the daily icon to true
    await tester.tap(dailyButton);
    await tester.pumpAndSettle();
    await tester.pump();
    tester.printToConsole("tapped the daily icon");

    // switch the auto delete icon to true
    await tester.tap(autoDeleteButton);
    await tester.pumpAndSettle();
    await tester.pump();
    tester.printToConsole("tapped the auto delete icon");

    // click create button to create a new notification
    await tester.tap(createButton);
    tester.printToConsole("tapped create button");
    await tester.pumpAndSettle();

    // check if it go back to the home page and created the notifications Card
    expect(
      notificationCard,
      findsWidgets,
    );

    // check if  is no longer in the ui because we have now something in the list
    expect(textToCreateFirstNotification, findsNothing);

    // check if title is correct
    expect(find.text("We Will"), findsOneWidget);
    // check if description is correct
    expect(find.text("just a, exmaple test here"), findsOneWidget);
    tester.printToConsole("found title and description");

    // check if the date is correct
    expect(find.textContaining("${DateTime.now().day + 2}"), findsOneWidget);
    expect(find.textContaining("${DateTime.now().hour}"), findsOneWidget);
    expect(find.textContaining("${DateTime.now().minute}"), findsOneWidget);
    tester.printToConsole("found date");

    // navigate between the tabs
// search tab
    await tester.tap(searchTab);
    await tester.pumpAndSettle();

// favorites tab
    await tester.tap(favoritesTab);
    await tester.pumpAndSettle();

// settings tab

    await tester.tap(settingsTab);
    await tester.pumpAndSettle();

// back to home tab
    await tester.tap(homeTab);
    await tester.pumpAndSettle();

// navigate to search tab
    await tester.tap(searchTab);
    await tester.pumpAndSettle();

// check if there is a searchField
    expect(searchField, findsOneWidget);
    tester.printToConsole("found search field");

// check it's hint
    expect(searchFieldHint, findsWidgets);
    tester.printToConsole("found search field hint");

    // check if nothing is there to show before we enter something
    expect(noSearchText, findsOneWidget);
    tester.printToConsole("found no search text");

    // enter something in the search field
    await tester.enterText(searchField, "we");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    await tester.pumpAndSettle();
    tester.printToConsole("entered text in the search field");

    // check if there is a search result
    expect(notificationCard, findsOneWidget);

    // check if the no results text is hidden
    expect(noSearchText, findsNothing);
    tester.printToConsole("no search text gone");

    // enter extra text in search bar to what we'll show
    await tester.tap(searchField);
    await tester.enterText(searchField, "xxxxxxxxxxxxxx");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    tester.printToConsole("entered more text in the search field");

    // check if there is no results text and no card and the result will be the lottie
    expect(noSearchText, findsNothing);
    expect(notificationCard, findsNothing);
    expect(lottieWidget, findsOneWidget);

    // go back to the home page
    await tester.tap(homeTab);
    await tester.pumpAndSettle();

    // check if there is a favorite button in the card
    expect(favoriteButton, findsWidgets);
    tester.printToConsole("found favorite button in the card");

    // click the favorite button
    await tester.tap(favoriteButton);
    await tester.pumpAndSettle();
    tester.printToConsole("tapped favorite button");
    await Future.delayed(Duration(seconds: 3));
    await tester.pump();
    await tester.pumpAndSettle();

    tester.printToConsole("clicked the fav button");

    // check if the isChecked changed ( the icon changed to fill )
    expect(checkedFavoriteButton, findsOneWidget);
    tester.printToConsole("found checked favorite button");

    // go now to favorites page
    await tester.tap(favoritesTab);
    await tester.pumpAndSettle();

    // check if there is a notification card in the favorites page
    expect(notificationCard, findsOneWidget);
    tester.printToConsole("found notification card in the favorites page");
  });
}
