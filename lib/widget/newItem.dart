import 'package:flutter/material.dart';
import 'package:speach_to_text/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Add new item',style: TextStyle(color: Colors.white),),
      ),
      body: Padding( 
        padding: const EdgeInsets.all(15),
        child: Form( 
          child: Column(
            children: [
              TextFormField(
                decoration:const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (String? value) {
                  if(value==null||value.isEmpty||value.trim().length<=1||value.trim().length>50){
                    return 'Must be between 1 to 50 charactor';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField( 
                      initialValue: '1',
                  decoration: const InputDecoration(
                  labelText: 'Quantity',
                ),
                validator: (String? value) {
                  if(value==null||value.isEmpty){
                    return 'Must be between 1 to 50 charactor';
                  }
                  return null;
                },)
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child:DropdownButtonFormField(
                        items: [
                          for(final category in categories.entries)
                          DropdownMenuItem(
                            value: category.key,
                            child: Row(
                              children: [
                                Container(height: 24,width: 24,color:category.value.color ,),
                                const SizedBox(width: 10,),
                                Text(category.value.title,style:const TextStyle(color: Colors.white),)
                              ],
                            )
                            ),
                            
                        ],
                        onChanged: (value){},
                      )
                       )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child:const  Text('Resert',style: TextStyle(color: Colors.white),)),
                  ElevatedButton(onPressed: (){}, child: const Text('Add Item')),
                ],
              )
            ],
          ),
        ),
      ),
      
    );
  }
}