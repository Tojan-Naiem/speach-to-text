import 'package:flutter/material.dart';
import 'package:speach_to_text/data/dummy_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Items')),
      // body: ListView.builder(
      //   itemBuilder: (context,index)=>ListTile(
      //     title: Text(groceryItems[index].name),
      //     leading: Container(height: 24,width: 24,color:groceryItems[index].category.color ,),
      //     trailing: Text(groceryItems[index].quantity.toString()),


      //   )
        
    );
  }
}