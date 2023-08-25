import 'package:example/utils/multi_value_listenable.dart';
import 'package:flutter/material.dart';
import 'package:neo_brutalism/neo_brutalism.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = ValueNotifier(ThemeMode.light);
    final seedColor = ValueNotifier(Colors.purple.shade500);

    return ValueListenableBuilder2<ThemeMode, Color>(
      first: themeMode,
      second: seedColor,
      builder: (context, first, second, child) {
        final brightness = themeMode.value == ThemeMode.light
            ? Brightness.light
            : Brightness.dark;

        return MaterialApp(
          title: 'Neo Brutalism',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: brightness,
            useMaterial3: true,
            colorSchemeSeed: second,
          ),
          themeMode: first,
          home: MyHomePage(
            onSeedColorChange: (color) {
              seedColor.value = color;
            },
            onThemeChange: () {
              themeMode.value = themeMode.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.onSeedColorChange,
    required this.onThemeChange,
  });

  final ValueChanged<Color> onSeedColorChange;
  final VoidCallback onThemeChange;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Neo Brutalism'),
        actions: [
          NeoIconButton(
            icon: Icons.color_lens_outlined,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            onTap: () async {
              final color = await ColorPickerDialog.show(context);

              if (color != null) {
                onSeedColorChange(color);
              }
            },
          ),
          const SizedBox(width: 8.0),
          NeoIconButton(
            icon: brightness == Brightness.light
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
            backgroundColor: brightness == Brightness.light
                ? Colors.yellow.shade600
                : Colors.blue.shade800,
            onTap: onThemeChange,
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NeoIconButtonContainer(),
            const Divider(height: 32.0),
            const NeoTextFieldContainer(),
            const Divider(height: 32.0),
            Column(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
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
            ),
          ],
        ),
      ),
    );
  }
}

class NeoTextFieldContainer extends StatelessWidget {
  const NeoTextFieldContainer({
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

class NeoIconButtonContainer extends StatelessWidget {
  const NeoIconButtonContainer({
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

class ColorPickerDialog extends StatelessWidget {
  const ColorPickerDialog({super.key});

  static Future<Color?> show(BuildContext context) async {
    return await showDialog<Color>(
      context: context,
      builder: (context) => const ColorPickerDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 300.0,
        width: 300.0,
        child: Center(
          child: Wrap(
              children: Colors.accents.map((color) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: NeoIconButton(
                icon: Icons.color_lens_outlined,
                backgroundColor: color,
                onTap: () {
                  Navigator.of(context).pop(color.shade400);
                },
              ),
            );
          }).toList()),
        ),
      ),
    );
  }
}
