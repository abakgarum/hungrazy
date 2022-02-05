import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 1;
  List<String> _menuItems = ['Settings', 'Orders', 'Tracker', 'Offers'];
  List<IconData> _menuItemIcons = [
    Icons.settings,
    Icons.restaurant_menu,
    Icons.track_changes,
    Icons.local_offer
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Haris Chandra Neupane",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'harryneupane7@email.com',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        '+918127013224',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                  4,
                  (index) => ListTile(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          _menuItemIcons[index],
                          color: _selectedIndex == index
                              ? Colors.deepOrange
                              : null,
                        ),
                        title: Text(
                          _menuItems[index],
                          style: TextStyle(
                            color: _selectedIndex == index
                                ? Colors.deepOrange
                                : null,
                          ),
                        ),
                        trailing: RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.expand_less,
                            color: _selectedIndex == index
                                ? Colors.deepOrange
                                : null,
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
