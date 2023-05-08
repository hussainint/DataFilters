<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->



## Features

Converts your existing data into Filters.
 
## Usage

Check out example code in `/example` folder.


Your main data must be arranged like below.

```dart
List<List> data = [
    ['red', 'dog', 'small', 'bark'],
    ['green', 'cat', 'medium', 'meow'],
    ['blue', 'fish', 'large', 'swim'],
    ['red', 'cat', 'small', 'meow'],
    ['yellow', 'dog', 'large', 'bark'],
    ['green', 'fish', 'medium', 'swim'],
    ['blue', 'dog', 'medium', 'bark'],
    ['red', 'fish', 'large', 'swim'],
    ['yellow', 'cat', 'small', 'meow'],
    ['green', 'dog', 'small', 'bark'],
    ['blue', 'cat', 'large', 'meow'],
    ['red', 'fish', 'medium', 'swim'],
    ['yellow', 'dog', 'medium', 'bark'],
    ['green', 'fish', 'large', 'swim'],
    ['blue', 'cat', 'small', 'meow'],
    ['red', 'dog', 'small', 'bark'],
    ['yellow', 'cat', 'medium', 'meow'],
    ['green', 'fish', 'small', 'swim'],
    ['blue', 'dog', 'large', 'bark'],
    ['red', 'cat', 'medium', 'meow'],
  ];


```
Selected filters will be stored in form of index
```dart
List<int>? filterIndex;
```

This code builds a filters ui
```dart
        DataFilters(
            data: data,
            filterTitle: const ['Color', 'Animal', 'Size', 'Sound'],
            recent_selected_data_index: (List<int>? index) {
              setState(() {
                filterIndex = index;
              });
            },
            style: FilterStyle(
              buttonColor: Colors.red,
              filterBorderColor: Colors.grey,
            ),
          ),
```
