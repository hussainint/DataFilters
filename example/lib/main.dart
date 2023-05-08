import 'package:data_filters/data_filters.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx, i) {
                if (filterIndex == null || filterIndex!.contains(i)) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.grey[300],
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
