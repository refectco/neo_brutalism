import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:neo_brutalism/neo_brutalism.dart';

class TabConfig {
  const TabConfig({
    this.borderRadius = 8.0,
    this.backgroundColor,
    this.foregroundColor,
    this.shadowColor = Colors.black,
  });

  final double borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color shadowColor;
}

class NeoSegmentedTabBar extends StatelessWidget {
  const NeoSegmentedTabBar({
    super.key,
    required this.tabs,
    this.tabConfig = const TabConfig(),
    required this.onTabSelected,
    required this.selectedIndex,
    this.backgroundColor,
    this.shadowColor = Colors.black,
    this.offset = const Offset(3, 3),
    this.borderRadius = 8.0,
  });

  final List<String> tabs;
  final TabConfig tabConfig;
  final Function(int index) onTabSelected;
  final int selectedIndex;
  final Color? backgroundColor;
  final Color shadowColor;
  final Offset offset;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return NeoContainer(
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      offset: offset,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: tabs.mapIndexed((index, tab) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(18.0),
                onTap: () => onTabSelected(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: selectedIndex == index ? 150.0 : 120.0,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? tabConfig.backgroundColor ??
                            Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.background,
                    boxShadow: [
                      BoxShadow(
                        color: tabConfig.shadowColor,
                        offset: offset,
                      ),
                    ],
                    border: Border.all(
                      color: tabConfig.shadowColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(tabConfig.borderRadius),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    tab,
                    style: TextStyle(
                      color: tabConfig.foregroundColor ??
                          Theme.of(context).colorScheme.onSurface,
                    ),
                  )),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
