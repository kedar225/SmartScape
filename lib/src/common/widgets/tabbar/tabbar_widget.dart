// lib/src/widgets/tab_bar_widget.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/utils/constants/colors.dart';

class TabBarWidget extends StatefulWidget {
  final List<String> tabTitles;
  final Widget Function(int) tabContentBuilder;
  final bool isDarkMode;
  final String title;

  const TabBarWidget({
    super.key,
    required this.tabTitles,
    required this.tabContentBuilder,
    required this.isDarkMode,
    this.title = "Page",
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabTitles.length, vsync: this);
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
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.isDarkMode
                    ? TColors.primary
                    : const Color.fromARGB(255, 93, 12, 107),
                width: 2.0,
              ),
            ),
          ),
          tabs: widget.tabTitles.map((title) => Tab(text: title)).toList(),
          labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? TColors.light : TColors.dark,
              ),
          unselectedLabelStyle:
              Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: widget.isDarkMode
                        ? TColors.light.withOpacity(0.5)
                        : TColors.dark.withOpacity(0.5),
                  ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.tabTitles
            .map((title) =>
                widget.tabContentBuilder(widget.tabTitles.indexOf(title)))
            .toList(),
      ),
    );
  }
}
