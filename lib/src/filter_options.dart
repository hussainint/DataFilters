import 'package:data_filters/src/Models/filter_model.dart';
import 'package:flutter/material.dart';

import 'Components/custom_check_box_stateless.dart';

class FilterOptions extends StatelessWidget {
  FilterOptions({
    required this.height,
    required this.filters,
    required this.filter_index,
    required this.selected_option,
    required this.list_of_all_selected_filtersOptions,
    required this.btnClr,
  });

  final double height;
  final List<FilterModel> filters;
  final int filter_index;
  final void Function(List<List>) selected_option;
  List<List> list_of_all_selected_filtersOptions = [];
  Color btnClr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              child: Text('D O N E'),
              color: btnClr,

              // margin: EdgeInsets.all(10),
              minWidth: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
