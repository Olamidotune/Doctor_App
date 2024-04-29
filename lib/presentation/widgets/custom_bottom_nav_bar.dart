import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.secondary,
      enableFeedback: true,
      type: BottomNavigationBarType.shifting,
      onTap: (value) {
        switch (value){
          case 0: 
          debugPrint("$value 0");
          break;
          case 1:
          debugPrint("$value 1" );
          break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.explore_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.calendar_month_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: "Chat",
          icon: Icon(
            Icons.chat_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(
            Icons.person_outlined,
          ),
        ),
      ],
    );
  }
}
