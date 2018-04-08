import 'package:flutter/material.dart';
import 'package:studentapp/globals.dart' as globals;
import 'package:studentapp/UI/RandomQuoteContainer.dart';

class DrawerFragment extends StatelessWidget{
  final IconData icon;
  final String title;
  final String subtitle;
  final String pageNamerouteName;

  DrawerFragment(this.icon, this.title, this.subtitle, this.pageNamerouteName);

  @override
  Widget build(BuildContext context){
    _onTap(pageNamerouteName) {
      Navigator.popAndPushNamed(context, pageNamerouteName);
    }

    return new ListTile(
      leading: new Icon(icon),
      title: new Text(title),
      subtitle: new Text(subtitle),
      onTap: () => _onTap(pageNamerouteName),
    );
  }

}

class StudentoDrawer extends StatelessWidget {
  final bool usedInHomePage;

  StudentoDrawer({this.usedInHomePage : false});

  // Place quote and author widgets located in RandomQuotesContainer() into the
  // DrawerHeader.
  final drawerHeader = new DrawerHeader(
    decoration: new BoxDecoration(
      color: Colors.deepPurpleAccent,
    ),

    child: new RandomQuoteContainer(),
  );

  final homePageFragment = new DrawerFragment(Icons.home, "Home", "Go back to the home page.", globals.homePageRouteName);
  final syllabusPageFragment = new DrawerFragment(Icons.book, "Syllabus", "Access the syllabus of your subjects.", globals.syllabusPageRouteName);
  final eventsFragment = new DrawerFragment(Icons.notifications, "Events", "View or add reminders for exams/events.", globals.eventsPageRouteName);
  final marksCalculatorFragment = new DrawerFragment(Icons.assessment, "Marks Calculator", "Input your assignment scores, get your final mark. Simple.", globals.marksCalculatorPageRouteName);

  final getProFragment = new DrawerFragment(Icons.card_membership, "Get Pro", "Buy us a cup of chai, we'll help you get rid of ads!", globals.getProPageRouteName);
  final sendFeedbackFragment = new DrawerFragment(Icons.feedback, "Send Feedback", "Report a nasty bug or send awesome ideas our way.", globals.sendFeedbackPageRouteName);
  final settingsFragment = new DrawerFragment(Icons.settings, "Settings", "Configure your app settings.", globals.settingsPageRouteName);

  Widget build(BuildContext context){
    List fragmentsList = [drawerHeader, homePageFragment, syllabusPageFragment, eventsFragment, marksCalculatorFragment, new Divider(),
      getProFragment, settingsFragment, sendFeedbackFragment];
    if (usedInHomePage) {
      fragmentsList.remove(homePageFragment);
    }
    // Put the header and all the fragments together in a ListView.
    ListView fragmentListView= new ListView(children: fragmentsList);
    final drawer = new Drawer(child: fragmentListView);
    return drawer;
  }

}