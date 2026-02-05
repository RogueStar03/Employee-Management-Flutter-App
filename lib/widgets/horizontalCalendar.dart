import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'calendarTile.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({
    super.key,
  });

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  final ScrollController _scrollController = ScrollController();
  int? selectedDay; // Track the selected day

  List<Widget> populateElements() {
    List<Widget> items = [];

    int monthDays =
        DateUtils.getDaysInMonth(DateTime.now().year, DateTime.now().month);

    for (int i = 1; i <= monthDays; i++) {
      DateTime date = DateTime(DateTime.now().year, DateTime.now().month, i);
      String dayName =
          DateFormat('EEE').format(date); // Get day name like Sun, Mon, etc.
      items.add(
        CalendarTile(
          dayName: dayName,
          i: i,
          isSelected: selectedDay == i, // Highlight if selected
          onSelect: () {
            setState(() {
              selectedDay = i; // Update the selected day
            });
          },
        ),
      );
    }
    return items;
  }

  void _scrollToToday() {
    int today = DateTime.now().day;
    double itemWidth = 47.5;
    _scrollController.animateTo(
      (today - 1) * itemWidth,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    selectedDay = DateTime.now().day; // Initially select today's date
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToToday();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: populateElements(),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
