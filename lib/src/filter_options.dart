import 'package:data_filters/src/Models/filter_model.dart';
import 'package:flutter/material.dart';

import '../data_filters.dart';
import 'Components/custom_check_box_stateless.dart';

class FilterOptions extends StatelessWidget {
  FilterOptions({
    required this.height,
    required this.filters,
    required this.filter_index,
    required this.selected_option,
    required this.list_of_all_selected_filtersOptions,
    required this.title,
    required this.style,
  });

  final double height;
  final List<FilterModel> filters;
  final int filter_index;
  final void Function(List<List>) selected_option;
  List<List> list_of_all_selected_filtersOptions = [];

  String title;
  FilterStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilterHeader(text: title),
          Expanded(
            child: ListView.builder(
              itemCount: filters[filter_index].options.length,
              itemBuilder: (ctx, j) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text('${filters[filter_index].options[j]}')),
                      CustomCheckBoxStateless(
                        value: list_of_all_selected_filtersOptions[filter_index]
                            .contains(filters[filter_index].options[j]),
                        onchanged: (k) {
                          if (k) {
                            ///
                            list_of_all_selected_filtersOptions[filter_index]
                                .add('${filters[filter_index].options[j]}');
                          } else {
                            ///
                            list_of_all_selected_filtersOptions[filter_index]
                                .remove('${filters[filter_index].options[j]}');
                          }
                        },
                        title: '',
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () {
                selected_option(list_of_all_selected_filtersOptions);
                Navigator.of(context).pop();
              },
              color: style.buttonColor,

              // margin: EdgeInsets.all(10),
              minWidth: double.infinity,
              child: Text(
                'D O N E',
                style: TextStyle(
                  color: style.buttonColorText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterHeader extends StatelessWidget {
  String text;
  FilterHeader({required this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 3,
            width: 50,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
