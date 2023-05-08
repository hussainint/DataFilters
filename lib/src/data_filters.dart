import 'package:data_filters/src/Models/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Components/custom_Check_Box_Stateless.dart';
import 'Models/filter_Model.dart';
import 'filter_options.dart';
import 'helperFunctions/filter_Functions.dart';

/// Generates a horizontal list of filters from the  given data
///
///
class DataFilters extends StatefulWidget {
  /// Nested List of data from while filter is to be shown
  List<List> data;

  /// title of each filter category
  List<String> filterTitle;

  /// this function returns the new list of selected index
  final void Function(List<int>?) recent_selected_data_index;

  ///
  FilterStyle style;

  /// All fields are mandatory
  /// `selected_data_index` can be empty initailly
  DataFilters({
    required this.data,
    required this.filterTitle,
    required this.recent_selected_data_index,
    required this.style,
  });

  @override
  State<DataFilters> createState() => _DataFiltersState();
}

class _DataFiltersState extends State<DataFilters> {
  List<FilterModel> filters = [];

  List<List> selected_option_string_filter = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filters = createFilters(widget.data, widget.filterTitle);

    /// initializing empty selected filters
    initializeEmptySelectedIndexOptionList();
  }

  void initializeEmptySelectedIndexOptionList() {
    selected_option_string_filter.clear();
    List.generate(
        widget.data.length, (index) => selected_option_string_filter.add([]));
  }

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 600), curve: Curves.easeOut);
  }

  List allSelectedOptions = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: 60,
      width: double.infinity,
      child: ListView.builder(
        controller: _scrollController,
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // reverse: true,
        itemCount: filters.length,
        itemBuilder: (ctx, i) {
          // if (i == filter.length) {
          //   print('last scrollll');
          // _scrollToBottom();

          return Row(
            children: [
              Container(
                height: 45,
                margin: const EdgeInsets.only(
                  left: 13,
                  top: 13,
                  bottom: 13,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                  border: Border.all(color: widget.style.filterBorderColor!),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      isDismissible: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      // backgroundColor: Colors.black,
                      builder: (BuildContext context) {
                        return FilterOptions(
                          btnClr: widget.style.buttonColor!,
                          height: height,
                          filters: filters,
                          filter_index: i,
                          selected_option_string_filter:
                              selected_option_string_filter,
                          selected_option: (List<List> selectedOptions) {
                            selected_option_string_filter = selectedOptions;
                            List<int> indexs =
                                search(selected_option_string_filter);

                            widget.recent_selected_data_index(indexs);
                          },
                        );
                      },
                    );
                  },
                  child: Center(
                    child: Row(
                      children: [
                        Text(filters[i].title),
                        if (filters[i].options.isNotEmpty)
                          const Icon(Icons.arrow_drop_down_sharp),
                      ],
                    ),
                  ),
                ),
              ),

              /// reset
              if (i == filters.length - 1)
                Row(
                  children: [
                    SizedBox(width: 10),
                    VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        initializeEmptySelectedIndexOptionList();
                        widget.recent_selected_data_index(null);
                      },
                      child: const Text(
                        'Clear All',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(width: 15),
                  ],
                )
            ],
          );
        },
      ),
    );
  }

  void resetFilter(int totalDataLength) {
    return null;
  }

  List<int> search(List<List> selected_filter) {
    List<int> filteredIndexes = [];

    for (int i = 0; i < widget.data.length; i++) {
      bool shouldAdd = true;
      for (int j = 0; j < widget.filterTitle.length; j++) {
        if (selected_filter[j].isNotEmpty &&
            !selected_filter[j].contains(widget.data[i][j])) {
          shouldAdd = false;
          break;
        }
      }
      if (shouldAdd) {
        filteredIndexes.add(i);
      }
    }

    return filteredIndexes;
  }
}
