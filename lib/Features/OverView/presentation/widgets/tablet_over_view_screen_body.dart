import 'package:flutter/material.dart';
import 'package:qube_cashier/Features/Dashboard/presentation/views/dashboard_view.dart';
import 'package:qube_cashier/core/utils/app_colors.dart';
import 'package:qube_cashier/core/utils/text_styles.dart';
import 'package:qube_cashier/core/widgets/custom_app_bar.dart';

class TabletOverViewScreenBody extends StatefulWidget {
  const TabletOverViewScreenBody({super.key});

  @override
  TabletOverViewScreenBodyState createState() =>
      TabletOverViewScreenBodyState();
}

class TabletOverViewScreenBodyState extends State<TabletOverViewScreenBody> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    DashboardView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        CustomAppBar(width: width),
        Expanded(
          child: Row(
            children: [
              Sidebar(
                onItemSelected: _onItemTapped,
                selectedIndex: selectedIndex,
              ),
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: pages,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Sidebar extends StatelessWidget {
  final Function(int) onItemSelected;
  final int selectedIndex;

  const Sidebar({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 238,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem("Dashboard", Icons.dashboard, 0, context),
                _buildMenuItem(
                    "Sales & Orders", Icons.shopping_cart, 1, context),
                _buildMenuItem("Business Account", Icons.business, 2, context),
                _buildMenuItem("Users & Customers", Icons.people, 3, context),
                _buildMenuItem("Suppliers", Icons.local_shipping, 4, context),
                _buildMenuItem("Tax & Discounts", Icons.receipt, 5, context),
                _buildMenuItem("Stock", Icons.store, 6, context),
                _buildMenuItem(
                    "Bookings & Calendar", Icons.calendar_today, 7, context),
                _buildMenuItem("Reports", Icons.bar_chart, 8, context),
                _buildMenuItem("Restaurant", Icons.restaurant, 9, context),
                _buildMenuItem(
                    "Notifications", Icons.notifications, 10, context),
                _buildMenuItem("Import Data", Icons.import_export, 11, context),
                _buildMenuItem("Settings", Icons.settings, 12, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      String title, IconData icon, int index, BuildContext context) {
    return Container(
      decoration: selectedIndex == index
          ? BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: ListTile(
        selected: selectedIndex == index,
        leading: Icon(icon,
            color: selectedIndex == index ? Colors.white : Colors.black),
        title: Text(title,
            style: selectedIndex == index
                ? Styles.styleBold16(context).copyWith(color: Colors.white)
                : Styles.styleRegular14(context).copyWith(color: Colors.black)),
        onTap: () => onItemSelected(index),
      ),
    );
  }
}
