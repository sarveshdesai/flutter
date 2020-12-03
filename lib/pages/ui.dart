
import 'package:flutter/material.dart';
import 'package:rescue/global/themes/themes.dart';
import 'package:rescue/pages/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rescue/pages/button.dart';
import 'package:rescue/pages/numbers.dart';
import 'package:rescue/pages/profile.dart';
import 'package:rescue/pages/profile_view.dart';



class MainUI extends StatefulWidget {
  final cameras;
  const MainUI({this.onSignedOut , this.cameras});
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


  int _selectedIndex = 1;
  var _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController= PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _pages = [Buttonns(widget.cameras) ,HomePage(), Numbers(), ProfileUser(onSignedOut: widget.onSignedOut)];
    return Scaffold(
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
                  }
                  );
                }
                ),
          ),
        ),
      ),
    );
  }
}