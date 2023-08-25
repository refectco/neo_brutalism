import 'package:flutter/material.dart';
import 'package:neo_brutalism/components/neo_container.dart';

class NeoContainerSection extends StatelessWidget {
  const NeoContainerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'NeoContainer',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                NeoContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'NeoContainer',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                NeoContainer(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'NeoContainer',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                NeoContainer(
                  shadowColor: Theme.of(context).colorScheme.tertiary,
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'NeoContainer',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                NeoContainer(
                  borderRadius: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'NeoContainer',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                NeoContainer(
                  borderRadius: 0.0,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'NeoContainer',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                NeoContainer(
                  borderRadius: 0.0,
                  shadowColor: Theme.of(context).colorScheme.tertiary,
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'NeoContainer',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
