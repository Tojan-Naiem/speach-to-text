
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speach_to_text/data/categories.dart';
import 'package:speach_to_text/models/Categories.dart';
import 'package:speach_to_text/models/GroceryI_tem.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {

  final _formKey=GlobalKey<FormState>();
  var _enterName='';
  int _enterQuantity=0;
  Category _selectedCategory=categories[Categories.fruit]!;
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Add new item',style: TextStyle(color: Colors.white),),
      ),
      body: Padding( 
        padding: const EdgeInsets.all(15),
        child: Form( 
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration:const InputDecoration(
                  labelText: 'Name',
                ),
                onSaved: (value){
             
                    _enterName=value!;
              
                },
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
                       onSaved: (value){
                 
                    _enterQuantity=int.parse(value!);
                
                },
                      keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                  labelText: 'Quantity',
                ),
                validator: (String? value) {
                  if(value==null||value.isEmpty||int.tryParse(value)==null||int.tryParse(value)!<=0){
                    return 'Must be a valid ,positive value';
                  }
                  return null;
                },)
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child:DropdownButtonFormField(
                        value: _selectedCategory,
                        items: [
                          for(final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            
                            child: Row(
                              children: [
                                Container(height: 24,width: 24,color:category.value.color ,),
                                const SizedBox(width: 10,),
                                Text(category.value.title,style:const TextStyle(color: Colors.white),)
                              ],
                            )
                            ),
                            
                        ],
                        onChanged: (value){
                          setState(() {
                            _selectedCategory=value!;
                          });

                
                        },
                      )
                       )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    _formKey.currentState!.reset();
                  }, child:const  Text('Resert',style: TextStyle(color: Colors.white),)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                        if(_formKey.currentState!.validate())
                    {
                      _formKey.currentState!.save();
                      final Uri url=Uri.parse('https://test-20ee0-default-rtdb.firebaseio.com/shopping-list.json');
                        http.post(
                          url,
                          headers: {
                          'Content-Type':'application/json'  
                          },
                          body: json.encode(
                              {
                                'name': _enterName,
                            'quantity': _enterQuantity
                            , 'category': _selectedCategory.title
                              }
                            )
                          
                          
                          );
                      // Navigator.of(context).pop();


                      
                      
                    }
                    });
                  
                  }, child: const Text('Add Item')),
                ],
              )
            ],
          ),
        ),
      ),
      
    );
  }
}