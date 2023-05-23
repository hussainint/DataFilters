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
 
## Demo

https://github.com/hussainint/DataFilters/assets/48062618/5ff0dcb1-2e9a-4d5e-9cb4-a1a93a131162


![Screenshot](https://github.com/hussainint/DataFilters/blob/main/promo.jpg)
## Usage

Check out example code in `/example` folder.


Your main data must be arranged like below.

```dart
List<List> data = [
    ['red', 'dog', 'small', 'bark', 'pet'],
    ['green', 'cat', 'medium', 'meow', 'stray'],
    ['blue', 'fish', 'large', 'swim', 'pet'],
    ['red', 'cat', 'small', 'meow', 'stray'],
    ['yellow', 'dog', 'large', 'bark', 'pet'],
    ['green', 'fish', 'medium', 'swim', 'pet'],
    ['blue', 'dog', 'medium', 'bark', 'pet'],
    ['red', 'fish', 'large', 'swim', 'pet'],
    ['yellow', 'cat', 'small', 'meow', 'pet'],
    ['green', 'dog', 'small', 'bark', 'pet'],
    ['blue', 'cat', 'large', 'meow', 'pet'],
    ['red', 'fish', 'medium', 'swim', 'stray'],
    ['yellow', 'dog', 'medium', 'bark', 'pet'],
    ['green', 'fish', 'large', 'swim', 'stray'],
    ['blue', 'cat', 'small', 'meow', 'pet'],
    ['red', 'dog', 'small', 'bark', 'stray'],
    ['yellow', 'cat', 'medium', 'meow', 'pet'],
    ['green', 'fish', 'small', 'swim', 'stray'],
    ['blue', 'dog', 'large', 'bark', 'pet'],
    ['pink', 'cat', 'medium', 'meow', 'pet'],
  ];

List<String> titles = ['Color', 'Animal', 'Size', 'Sound', 'Type'];


```
Selected filters will be stored in form of index
```dart
List<int>? filterIndex;
```

This code builds a filters ui
```dart
          DataFilters(
            data: data,

            /// pass your filter title here
            filterTitle: titles,

            /// enable animation
            showAnimation: true,

            /// get list of index of selected filter
            recent_selected_data_index: (List<int>? index) {
              setState(() {
                filterIndex = index;
              });
            },

            /// styling
            style: FilterStyle(
              buttonColor: Colors.green,
              buttonColorText: Colors.white,
              filterBorderColor: Colors.grey,
            ),
          ),
```
