import 'package:flutter/material.dart';

class CalendarTile extends StatelessWidget {
  const CalendarTile({
    super.key,
    required this.dayName,
    required this.i,
    required this.isSelected,
    required this.onSelect,
  });

  final String dayName;
  final int i;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    bool isToday = DateTime.now().day == i; // Check if it's today's date

    return GestureDetector(
      onTap: onSelect, // Handle date selection
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Text(
              dayName,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Dongle',
                color: Colors.black45,
              ),
            ), // Display day name
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              height: 45.0,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.teal
                    : isToday
                        ? Colors.teal.shade200
                        : Colors
                            .transparent, // Highlight current day or selected date
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: isSelected ? Colors.teal : Colors.transparent,
                  // width: isToday || isSelected ? 2.0 : 0.0,
                ),
              ),
              child: Text(
                i.toString(),
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Dongle',
                  fontWeight: FontWeight.w600,
                  color: isToday || isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ), // Day number
          ],
        ),
      ),
    );
  }
}
