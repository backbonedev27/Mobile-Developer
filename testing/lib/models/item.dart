class Item {
  final String namaBarang;
  final int quantity;
  final double harga;

  Item({
    required this.namaBarang,
    required this.quantity,
    required this.harga,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      namaBarang: json['nama_barang'] ?? '',
quantity: json['quantity'] ?? 0,
harga: json['harga'] != null ? double.parse(json['harga'].toString()) : 0,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama_barang': namaBarang,
      'quantity': quantity,
      'harga': harga,
    };
  }
}

class ItemsResponse {
  final List<Item> items;

  ItemsResponse(this.items);

  factory ItemsResponse.fromJson(List<dynamic> json) {
    List<Item> itemsList = json.map((itemJson) => Item.fromJson(itemJson)).toList();
    return ItemsResponse(itemsList);
  }
}
