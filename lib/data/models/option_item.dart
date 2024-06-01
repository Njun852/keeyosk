class OptionItem {
  final String id;
  final String name;
  final double additionalPrice;

  OptionItem({
    required this.id,
    required this.name,
    required this.additionalPrice,
  });

  Map<String, dynamic> toJSON(String optionId) {
    return {
      "item_id": id,
      "option_id": optionId,
      "item_name": name,
      "additional_price": additionalPrice,
    };
  }

  static OptionItem fromJSON(Map<String, dynamic> data) {
    print(data);
    return OptionItem(
      id: data["item_id"],
      name: data["item_name"],
      additionalPrice: double.parse(data["additional_price"].toString()),
    );
  }
}
