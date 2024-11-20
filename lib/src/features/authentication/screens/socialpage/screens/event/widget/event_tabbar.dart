import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/event/Screens/event_list_widget.dart';
import 'package:smartscape/src/utils/constants/colors.dart';

class EventTabBarWidget extends StatefulWidget {
  final List<String> tabTitles;
  final bool isDarkMode;
  final String title;

  const EventTabBarWidget({
    super.key,
    required this.tabTitles,
    required this.isDarkMode,
    this.title = "Event",
  });

  @override
  State<EventTabBarWidget> createState() => _EventTabBarWidgetState();
}

class _EventTabBarWidgetState extends State<EventTabBarWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabTitles.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? TColors.light : TColors.dark,
              ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: TColors.primary,
                width: 2.0,
              ),
            ),
          ),
          tabs: widget.tabTitles.map((title) => Tab(text: title)).toList(),
          labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? TColors.light : TColors.dark,
              ),
          unselectedLabelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: widget.isDarkMode ? TColors.light.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
              ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          EventListScreen(),
          Container(), // Placeholder for additional tabs
        ],
      ),
    );
  }
}
