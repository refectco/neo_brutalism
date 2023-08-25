import 'package:example/utils/multi_value_listenable.dart';
import 'package:example/widgets/neo_container_section.dart';
import 'package:example/widgets/neo_icon_button_section.dart';
import 'package:example/widgets/neo_text_field_section.dart';
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            NeoIconButtonSection(),
            Divider(height: 32.0),
            NeoTextFieldSection(),
            Divider(height: 32.0),
            NeoContainerSection(),
          ],
        ),
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
