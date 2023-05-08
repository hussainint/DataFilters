import '../Models/filter_Model.dart';

List<FilterModel> createFilters(List<List> data, List<String> filter_title) {
  List<FilterModel> filters = [];

  for (int i = 0; i < data[0].length; i++) {
    List<String> options = [];
    for (int j = 0; j < data.length; j++) {
      options.add(data[j][i]);
    }
    FilterModel filter = FilterModel(
      title: filter_title[i],
      options: options.toSet().toList(),
    );
    filters.add(filter);
  }

  return filters;
}
