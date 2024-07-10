import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speach_to_text/data/categories.dart';
import 'package:speach_to_text/models/Categories.dart';
import 'package:speach_to_text/models/GroceryI_tem.dart';
import 'package:speach_to_text/widget/newItem.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
 HomePage({ super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
    List<GroceryItem> _groceryItems=[];
   void _loadData() async{
final Uri url=Uri.parse('https://test-20ee0-default-rtdb.firebaseio.com/shopping-list.json');
           final http.Response res= await http.get(url); 
           final Map<String,Map<String ,dynamic>> loadedeData=json.decode(res.body);
           final List<GroceryItem> _loadedItems=[];

           for(var item in loadedeData.entries){
            final Category category=categories.entries.firstWhere((element) => element.value.title==item.value['category']).value;
            _loadedItems.add(
              GroceryItem(id: item.key, name: item.value['name'], quantity: item.value['quantity'], category: category)
            );
           }
           _groceryItems=_loadedItems;
   }

   @override
  void initState() {
    super.initState();
    _loadData();
  }







  @override
  Widget build(BuildContext context) {
   Widget content=const Center(
    child: Text('No item added yet'),
   );
   if(!_groceryItems.isEmpty){
    setState(() {
      content=ListView.builder(
  
        itemCount:_groceryItems.length ,
        itemBuilder: (context,index)=>Dismissible(
        key: ValueKey(_groceryItems[index].id),
        onDismissed: (_){
          setState(() {
            _groceryItems.remove(_groceryItems[index]);
          });

        },
        
        child: ListTile(
           
          title: Text(_groceryItems[index].name,style: TextStyle(color: Colors.white),),
          leading: Container(height: 24,width: 24,color:_groceryItems[index].category.color ,),
          trailing: Text(_groceryItems[index].quantity.toString(),style: TextStyle(color: Colors.white),),

        ),
        
        )
      
         

        
      );
    });
   }
    return Scaffold(
      appBar: AppBar(title: const Text('My Items',style: TextStyle(color: Colors.white),),
      actions: [
        IconButton(onPressed:_addItem(),
         icon: Icon(Icons.add,color: Colors.white,))
      ],
      ),
      body: content,
      
    );
  }
   _addItem() async{
    
        await  Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
            builder: (ctx)=>new NewItem()));

          _loadData();
  }
}