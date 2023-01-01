
import 'package:equipilia/views/tabs/account_tab.dart';
import 'package:equipilia/views/tabs/careers_tab.dart';
import 'package:equipilia/views/tabs/courseTab.dart';
import 'package:equipilia/views/tabs/home_tab.dart';
import 'package:equipilia/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNavigation extends StatefulWidget {
  final bool? hasSideMenu;
  //final UserModel? user;

  // final String? userName,
  //     userEmail,
  //     userPhone,
  //     userFirstName,
  //     userLastName,
  //     userAvatar;

  final List<dynamic>? msgList;

  // final UserModel user;
  //
  const CustomNavigation({
    Key? key,
    this.hasSideMenu,
    this.msgList,
  }) : super(key: key);

  @override
  _CustomNavigationState createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  var isUserType = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  DateTime? time;

  // bool isNotificationActive = false;
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transparent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return true;
        }
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
          key: _key,
          body: IndexedStack(
            index: _selectedIndex,
            children: const [
              HomeTab(),
             CareersTab(),
             CourseTab(),
             AccountTab()
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              selectedFontSize: 10.0,
              unselectedFontSize: 10.0,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              fixedColor: AppColors.primaryThemeColor,
              onTap: (i) => setState(() => _selectedIndex = i),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/icons/dashboard.png",
                    height: 22,
                  ),
                  activeIcon:
                  Image.asset("assets/icons/dashboard_active.png", height: 24),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/careers.png",
                      height: 20,
                    ),
                    activeIcon: Image.asset(
                        "assets/icons/careers_active.png",
                        height: 24),
                    label: 'Careers'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/course.png",
                      height: 22,
                    ),
                    activeIcon: Image.asset("assets/icons/course_active.png",
                        height: 24),
                    label: 'Courses'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/ebooks.png",
                      height: 22,
                    ),
                    activeIcon: Image.asset("assets/icons/ebooks_active.png",
                        height: 24),
                    label: 'eBooks'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icons/account.png",
                      height: 22,
                    ),
                    activeIcon: Image.asset("assets/icons/account_active.png",
                        height: 24),
                    label: 'Account'),
              ],
            ),
          )),
    );
  }
}
