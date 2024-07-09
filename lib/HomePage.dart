import 'package:flutter/material.dart';
import 'package:speach_to_text/data/dummy_items.dart';
import 'package:speach_to_text/widget/newItem.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Items',style: TextStyle(color: Colors.white),),
      actions: [
        IconButton(onPressed: (){
          
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>new NewItem()));

        }, icon: Icon(Icons.add,color: Colors.white,))
      ],
      ),
      body: ListView.builder(
        itemCount:groceryItems.length ,
        itemBuilder: (context,index)=>ListTile(
          
          title: Text(groceryItems[index].name,style: TextStyle(color: Colors.white),),
          leading: Container(height: 24,width: 24,color:groceryItems[index].category.color ,),
          trailing: Text(groceryItems[index].quantity.toString(),style: TextStyle(color: Colors.white),),


        )
      )
      
    );
  }
}