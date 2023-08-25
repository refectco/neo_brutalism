import 'package:flutter/material.dart';
import 'package:neo_brutalism/components/neo_icon_button.dart';

class NeoIconButtonSection extends StatelessWidget {
  const NeoIconButtonSection({
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
            'NeoIconButton',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              NeoIconButton(
                icon: Icons.add,
                onTap: () {},
              ),
              const SizedBox(width: 16.0),
              NeoIconButton(
                shape: BoxShape.rectangle,
                icon: Icons.add,
                onTap: () {},
              ),
              const SizedBox(width: 16.0),
              NeoIconButton(
                shadowColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.primary,
                icon: Icons.add,
                onTap: () {},
              ),
              const SizedBox(width: 16.0),
              NeoIconButton(
                shadowColor: Theme.of(context).colorScheme.tertiary,
                foregroundColor: Theme.of(context).colorScheme.tertiary,
                shape: BoxShape.rectangle,
                icon: Icons.add,
                onTap: () {},
              ),
              const SizedBox(width: 16.0),
              NeoIconButton(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
                icon: Icons.add,
                onTap: () {},
              ),
              const SizedBox(width: 16.0),
              NeoIconButton(
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.onTertiaryContainer,
                shape: BoxShape.rectangle,
                icon: Icons.add,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
