
import 'package:flutter/material.dart';
import 'package:rescue/global/themes/themes.dart';
import 'package:rescue/pages/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rescue/pages/button.dart';
import 'package:rescue/pages/numbers.dart';

/*class UI extends StatelessWidget {
  const UI({this.onSignedOut});
  final VoidCallback onSignedOut;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainUI(),
      theme: CustomTheme().lightTheme(),
    );
  }
}*/


class MainUI extends StatefulWidget {
  const MainUI({this.onSignedOut});
  final VoidCallback onSignedOut;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainUI(),
      theme: CustomTheme().lightTheme(),
    );
  }
  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {

  int _selectedIndex = 2;
  //var _pages = [FirstPage(), Buttonns() ,HomePage().build(context), Numbers(), FourthPage()];
  var _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController= PageController(initialPage: 2);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _pages = [FirstPage(), Buttonns() ,HomePage(onSignedOut: widget.onSignedOut).build(context), Numbers(), FourthPage()];
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('Rescue', style: TextStyle(color: accentmar, fontFamily: 'Rubik', fontWeight: FontWeight.bold,),),
        backgroundColor: primaryshrine,
      ),*/
      body: PageView(
        children: _pages,
        onPageChanged: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        controller: _pageController,
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor,
          //boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))]
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Theme.of(context).iconTheme.color,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.circle_o_notch,
                    text: 'Buttons',
                  ),
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.phone,
                    text: 'Contact',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                    _pageController.animateToPage(
                        _selectedIndex,
                        duration: Duration(milliseconds: 350),
                        curve: Curves.linear);
                  });
                }),
          ),
        ),
      ),
    );
  }
}