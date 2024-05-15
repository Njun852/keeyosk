import 'package:keeyosk/data/models/option_item.dart';

String toStringOptions(List<OptionItem> options) {
  if (options.isEmpty) return 'Default Options';
  if (options.length == 1) return options.first.name;
  String details = '';
  for (int i = 0; i < options.length - 1; i++) {
    details += '${options[i].name}, ';
  }
  details += options[options.length - 1].name;
  return details;
}
