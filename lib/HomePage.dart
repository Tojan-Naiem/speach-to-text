import 'package:flutter/material.dart';
import 'package:speach_to_text/models/GroceryI_tem.dart';
import 'package:speach_to_text/widget/newItem.dart';

class HomePage extends StatefulWidget {
 HomePage({ super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
   final List<GroceryItem> _groceryItems=[];
  @override
  Widget build(BuildContext context) {
   Widget content=const Center(
    child: Text('No item added yet'),
   );
   if(!_groceryItems.isEmpty){
    setState(() {
      content=ListView.builder(
        itemCount:_groceryItems.length ,
        itemBuilder: (context,index)=>ListTile(
          
          title: Text(_groceryItems[index].name,style: TextStyle(color: Colors.white),),
          leading: Container(height: 24,width: 24,color:_groceryItems[index].category.color ,),
          trailing: Text(_groceryItems[index].quantity.toString(),style: TextStyle(color: Colors.white),),


        )
      );
    });
   }
    return Scaffold(
      appBar: AppBar(title: const Text('My Items',style: TextStyle(color: Colors.white),),
      actions: [
        IconButton(onPressed: (){

          Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
            builder: (ctx)=>new NewItem())).then((GroceryItem? value){
              if(value==null)return null;
              setState(() {
              _groceryItems.add(value);

              });
              });

        }, icon: Icon(Icons.add,color: Colors.white,))
      ],
      ),
      body: content,
      
    );
  }
}