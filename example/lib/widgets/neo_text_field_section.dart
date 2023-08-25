import 'package:flutter/material.dart';
import 'package:neo_brutalism/components/neo_text_field.dart';

class NeoTextFieldSection extends StatelessWidget {
  const NeoTextFieldSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NeoTextField',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8.0),
          const NeoTextField(
            hintText: 'Search',
          ),
          const SizedBox(height: 12.0),
          NeoTextField(
            hintText: 'Search',
            fillColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          const SizedBox(height: 12.0),
          NeoTextField(
            hintText: 'Search',
            shadowColor: Theme.of(context).colorScheme.tertiary,
            fillColor: Theme.of(context).colorScheme.tertiaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ],
      ),
    );
  }
}
