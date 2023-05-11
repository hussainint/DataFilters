import 'package:data_filters/data_filters.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Filters',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  List<int>? filterIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          DataFilters(
            data: data,

            /// pass your filter title here
            filterTitle: const ['Color', 'Animal', 'Size', 'Sound'],

            /// get list of index of selected filter
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

          /// Display your data
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx, i) {
                /// filterIndex must be null initially
                if (filterIndex == null || filterIndex!.contains(i)) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[200],
                    child: Column(
                      children: [for (var ele in data[i]) Text(ele)],
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
