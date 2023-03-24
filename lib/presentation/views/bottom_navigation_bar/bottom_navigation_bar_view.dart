import 'package:flutter/material.dart';
import 'package:tap_to_safety/constants/app_constants.dart';
import 'package:tap_to_safety/presentation/views/home/home_view.dart';
import 'package:tap_to_safety/presentation/views/register_contacts/register_contacts_view.dart';
import 'package:tap_to_safety/presentation/views/view_contacts/view_contacts_view.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int _currentIndex = 0;
  final List<Widget> _allScreens = [
    HomeView(),
    RegisterContactView(),
    ViewContactsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppConstants.primaryColor,
        unselectedItemColor: AppConstants.bottomNavbarUnactiveColor,
        selectedFontSize: 16,
        showUnselectedLabels: false,
        backgroundColor: _currentIndex == 0 ? Color(0xffd8b7ca) : Colors.transparent,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset('assets/images/home (1).png',color: AppConstants.bottomNavbarUnactiveColor,height: 18,width: 18,),
            activeIcon: Image.asset('assets/images/home (1).png',),
          ),
          BottomNavigationBarItem(
            label: 'Register Contacts',
            icon: Image.asset(
              'assets/images/register_contacts_unactive.png',height: 18,width: 18,),
            activeIcon: Image.asset('assets/images/register_contacts_unactive.png',
              color: AppConstants.primaryColor,
              height: 18,width: 18,),
          ),
          BottomNavigationBarItem(
            label: 'View Contacts',
            icon: Image.asset('assets/images/view_contacts_unactive.png',height: 18,width: 18,),
            activeIcon: Image.asset('assets/images/view_contacts_unactive.png',
              color: AppConstants.primaryColor,
              height: 18,width: 18,),
          ),
          BottomNavigationBarItem(
            label: 'Safety Tips',
            icon: Image.asset('assets/images/safety-tips.png',height: 18,width: 18,),
            activeIcon: Image.asset('assets/images/safety-tips.png',
              color: AppConstants.primaryColor,
              height: 18,width: 18,),
          ),
          BottomNavigationBarItem(
            label: 'Complaints',
            icon: Image.asset('assets/images/complaint-section.png',height: 18,width: 18,),
            activeIcon: Image.asset('assets/images/complaint-section.png',
              color: AppConstants.primaryColor,
              height: 18,width: 18,),
          ),
          BottomNavigationBarItem(
            label: 'Other Helpline',
            icon: Image.asset('assets/images/other-helpline.png',height: 18,width: 18,),
            activeIcon: Image.asset('assets/images/other-helpline.png',color : AppConstants.primaryColor,height: 18,width: 18,),
          ),
        ],
      ),
      body: _allScreens.elementAt(_currentIndex),
    );
  }
}
