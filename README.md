<p align="center">
    <img src = "https://raw.githubusercontent.com/refectco/neo_brutalism/master/demos/pub_header.png" height = "300"/>
</p>

<h1 align="center">Neo Brutalism Widgets</h1>
<h3 align="center">Commonly used flutter widgets in the Neo Brutalism style</h3>

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/refectco/neo_brutalism/blob/master/LICENSE)
[![Pub](https://img.shields.io/pub/v/neo_brutalism?color=blue)](https://pub.dev/packages/neo_brutalism)
[![GitHub stars](https://img.shields.io/github/stars/refectco/neo_brutalism
)](https://github.com/refectco/neo_brutalism)

## Live Example : https://neo-brutalism.web.app/

## Note

This package was made because I really enjoy the aesthetic of Neo Brutalism and was using it in a few of my projects
and wanted to create a shared package that I thought I would share with the community 

## Usage

You can customize each widget's shadow color, shadow offset, and background color.
All widgets react to light and dark mode and get default values from the default theme.

```dart
NeoContainer(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
      'NeoContainer',
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  ),
)
```

## Features

### NeoContainer

A wrapper for a basic container

```dart
NeoContainer(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
      'NeoContainer',
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  ),
)
```

### NeoIconButton

A simple IconButton that can be `circle` or `rectangle`

```dart
NeoIconButton(
  shape: BoxShape.rectangle,
  icon: Icons.add,
  onTap: () {},
)
```

### NeoFab

Similar to the `NeoIconButton` but with an optional label and the ability to expand/collapse

```dart
NeoFab(
    expanded: expanded.value,
    text: 'Add to cart',
    icon: Icons.add,
    onPressed: () => expanded.value = !expanded.value,
)
```

### NeoTextField

```dart
NeoTextField(
  hintText: 'Search',
  fillColor: Theme.of(context).colorScheme.primaryContainer,
  foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
)
```

### NeoSegmentedTabBar

```dart
NeoSegmentedTabBar(
  tabs: const ['Tab 1', 'Tab 2', 'Tab 3'],
  onTabSelected: (index) => selectedIndex.value = index,
  selectedIndex: selectedIndex.value,
  tabConfig: TabConfig(
    borderRadius: 0.0,
    shadowColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Theme.of(context).colorScheme.primary,
  ),
)
```

The `NeoSegmentedTabBar` also has an optional `TabConfig` property for additional customization

```dart
final double borderRadius;
final Color? backgroundColor;
final Color? foregroundColor;
final Color shadowColor;
```

