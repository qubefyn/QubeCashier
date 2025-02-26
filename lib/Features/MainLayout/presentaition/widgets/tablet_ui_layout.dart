import 'package:flutter/material.dart';

class TabletUiLayout extends StatefulWidget {
  const TabletUiLayout({super.key});

  @override
  _TabletUiLayoutState createState() => _TabletUiLayoutState();
}

class _TabletUiLayoutState extends State<TabletUiLayout> {
  bool _isSidebarOpen = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cyberfyn - Belt El Masfanwy'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleSidebar,
        ),
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarOpen ? 250 : 0,
            color: Colors.blueGrey[800],
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cyberfyn',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Belt El Masfanwy',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.dashboard, color: Colors.white),
                  title: const Text(
                    'Dashboard',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {

                  },
                ),
                ExpansionTile(
                  leading: const Icon(Icons.shopping_cart, color: Colors.white),
                  title: const Text(
                    'Sales & Orders',
                    style: TextStyle(color: Colors.white),
                  ),
                  children: [
                    ListTile(
                      title: const Text(
                        'Master Dashboard',
                        style: TextStyle(color: Colors.white70),
                      ),
                      onTap: () {
                       },
                    ),
                    ListTile(
                      title: const Text(
                        'Billing Counter Dashboard',
                        style: TextStyle(color: Colors.white70),
                      ),
                      onTap: () {
                       },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ahmed Konwash',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                     },
                    child: const Text('+ New Order'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}