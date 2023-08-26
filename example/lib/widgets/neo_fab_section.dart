import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:neo_brutalism/components/neo_fab.dart';

class NeoFabSection extends HookWidget {
  const NeoFabSection({super.key});

  @override
  Widget build(BuildContext context) {
    final expanded = useState(false);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'NeoIconButton',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                NeoFab(
                  expanded: expanded.value,
                  text: 'Add to cart',
                  icon: Icons.add,
                  onPressed: () => expanded.value = !expanded.value,
                ),
                const SizedBox(width: 8.0),
                NeoFab(
                  expanded: expanded.value,
                  text: 'Add to cart',
                  icon: Icons.add,
                  shadowColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () => expanded.value = !expanded.value,
                ),
                const SizedBox(width: 8.0),
                NeoFab(
                  expanded: expanded.value,
                  text: 'Add to cart',
                  icon: Icons.add,
                  shadowColor: Theme.of(context).colorScheme.tertiary,
                  foregroundColor: Theme.of(context).colorScheme.tertiary,
                  onPressed: () => expanded.value = !expanded.value,
                ),
                const SizedBox(width: 8.0),
                NeoFab(
                  expanded: expanded.value,
                  text: 'Add to cart',
                  icon: Icons.add,
                  borderRadius: 0.0,
                  onPressed: () => expanded.value = !expanded.value,
                ),
                const SizedBox(width: 8.0),
                NeoFab(
                  expanded: expanded.value,
                  text: 'Add to cart',
                  icon: Icons.add,
                  borderRadius: 0.0,
                  shadowColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () => expanded.value = !expanded.value,
                ),
                const SizedBox(width: 8.0),
                NeoFab(
                  expanded: expanded.value,
                  text: 'Add to cart',
                  icon: Icons.add,
                  borderRadius: 0.0,
                  shadowColor: Theme.of(context).colorScheme.tertiary,
                  foregroundColor: Theme.of(context).colorScheme.tertiary,
                  onPressed: () => expanded.value = !expanded.value,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
