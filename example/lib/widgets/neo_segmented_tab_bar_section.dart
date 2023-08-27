import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:neo_brutalism/components/neo_segmented_tab_bar.dart';

class NeoSegmentedTabBarSection extends HookWidget {
  const NeoSegmentedTabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NeoSegmentedTabBar',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8.0),
        NeoSegmentedTabBar(
          tabs: const ['Tab 1', 'Tab 2', 'Tab 3'],
          onTabSelected: (index) => selectedIndex.value = index,
          selectedIndex: selectedIndex.value,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        const SizedBox(height: 8.0),
        NeoSegmentedTabBar(
          tabs: const ['Tab 1', 'Tab 2', 'Tab 3'],
          onTabSelected: (index) => selectedIndex.value = index,
          selectedIndex: selectedIndex.value,
          tabConfig: TabConfig(
            borderRadius: 0.0,
            shadowColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
