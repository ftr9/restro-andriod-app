import 'package:flutter/material.dart';
import 'package:syanko/State/foodConstruct.dart';

class cart extends ChangeNotifier {
  Map order = {"total": 0};
  Map Proceeded = {"totalPrice": 0, "totalQuantity": 0, "items": []};

  void addFood(String name, String image) {
    if (order[name] == null) {
      order[name] = {};
      order[name]["total"] = 1;
      order[name]["details"] = foodConstruct(name: name, image: image);
      order[name]["price"] = 120;
      order["total"] += 1;
    } else {
      order[name]["total"] += 1;
      order[name]["price"] += 120;
      order["total"] += 1;
    }
    notifyListeners();
  }

  void proceededCheckout() {
    List items = this.order.values.toList();
    this.Proceeded["totalPrice"] += this.order["total"] * 120;
    this.Proceeded["totalQuantity"] += this.order["total"];

    for (int i = 1; i <= items.length - 1; i++) {
      this.Proceeded["items"].add(items[i]);
    }
    this.order = {"total": 0};
    notifyListeners();
  }

  void incrementTotal(String name) {
    print(name);
    order[name]["total"] += 1;
    order[name]["price"] += 120;
    order["total"] += 1;
    notifyListeners();
  }

  void decrementTotal(String name) {
    print(name);
    order[name]["total"] -= 1;
    order[name]["price"] -= 120;
    order["total"] -= 1;
    notifyListeners();
  }

  void finalPayment(BuildContext context) {
    if (this.Proceeded["items"].length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("nothing left order something")));
    } else {
      this.Proceeded = {"totalPrice": 0, "totalQuantity": 0, "items": []};
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("thank you your payment ...")));
      notifyListeners();
    }
  }
}
