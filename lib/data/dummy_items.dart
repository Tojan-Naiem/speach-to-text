import 'package:speach_to_text/data/categories.dart';
import 'package:speach_to_text/models/Categories.dart';
import 'package:speach_to_text/models/GroceryI_tem.dart';


final List<GroceryItem> groceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
