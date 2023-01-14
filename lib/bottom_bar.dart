import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

const _kPages = <String, IconData>{
  'home': Icons.home,
  'add': Icons.add,
  'profile': Icons.person,
};

class ConvexBottombar extends StatefulWidget {
  const ConvexBottombar({super.key});

  @override
  _ConvexBottombarState createState() => _ConvexBottombarState();
}

class _ConvexBottombarState extends State<ConvexBottombar> {
  TabStyle _tabStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TabBarView(
                  children: [
                    for (final icon in _kPages.values) Icon(icon, size: 64),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: ConvexAppBar.badge(
              // Optional badge argument: keys are tab indices, values can be
              // String, IconData, Color or Widget.
             const <int, dynamic>{3: '99+'},
            style: _tabStyle,
            items: <TabItem>[
            for (final entry in _kPages.entries)
            TabItem(icon: entry.value, title: entry.key),
        ],
    ),
    ),
    );
  }

  // Select style enum from dropdown menu:

}