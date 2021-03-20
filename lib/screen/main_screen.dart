import 'package:flutter/material.dart';
import 'package:layout_example/page.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  void onIndexChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://youimg1.tripcdn.com/target/100i1f000001gp47yD3E5_C_750_500.jpg?proc=source%2Ftrip"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyKuVJb5x7XL48rRSxgi47JChNTO0xSNaxMg&usqp=CAU"),
                    ),
                    Text(
                      "วัดพระธาตุดอยคำ",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // UserAccountsDrawerHeader(
            //   currentAccountPicture: CircleAvatar(
            //     backgroundImage: NetworkImage(
            //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyKuVJb5x7XL48rRSxgi47JChNTO0xSNaxMg&usqp=CAU"),
            //   ),
            //   accountName: Text("First"),
            //   accountEmail: Text("panther11103@gmail.com"),
            // ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/history');
              },
              leading: Icon(Icons.people),
              title: Text("ประวัติ"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/credit');
              },
              leading: Icon(Icons.do_disturb_alt_sharp),
              title: Text("เครดิต"),
            ),
            ListTile(
              leading: Icon(Icons.access_alarms),
              title: Text("prawite"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(pages[currentIndex].title),
      ),
      body: pages[currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onIndexChange,
        items: pages
            .map(
              (page) =>
                  BottomNavigationBarItem(icon: page.icon, label: page.label),
            )
            .toList(),
      ),
    );
  }
}
