import 'package:flutter/material.dart';

class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _todoListState();
}

class _todoListState extends State<todoList> {

  List<String> itemList = [];
  TextEditingController itemaddcontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();
  String search = '';

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        drawer: Drawer(),
        body: Stack(
          children: [
            Column(
            children: [
              SizedBox(height: 15,),
              //  Lsit tile for drawer and and circular avatrar with photo
              ListTile(
                leading: Builder(
                  builder: (context){
                    return  IconButton(onPressed: (){
                      Scaffold.of(context).openDrawer();
                    }, icon:const Icon(Icons.menu,size: 30,color: Colors.black,));
                  },
                ),
                trailing:const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,

                ),
              ),
              //  search bar
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow:const [
                      BoxShadow(color: Colors.black,blurRadius: 4,spreadRadius: 0.5)
                    ]
                  ),
                  child: TextFormField(
                    controller: searchcontroller,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.transparent,),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (String? value){
                      setState(() {
                        search = value.toString();
                      });
                    },
                  ),
                ),
              ),
              //  list of items
              Expanded(
                child: ListView.builder(
                  itemCount: itemList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(25),
                    itemBuilder: (context , index){
                   late final position = index.toString();
                      if (searchcontroller.text.isEmpty){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: ListTile(
                              leading: IconButton(onPressed: (){

                                showDialog(
                                    context: context,
                                    builder: (context)=> SimpleDialog(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                            height: 50,
                                            width: 300,
                                            decoration:const BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(color: Colors.black,blurRadius: 5,spreadRadius: 0.5)
                                                ]
                                            ),
                                            child: TextField(
                                              controller: searchcontroller,
                                              decoration: InputDecoration(
                                                hintText: 'update your text here',
                                                fillColor: Colors.white,
                                                filled: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                onPressed: (){
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text('cancel'),
                                              ),
                                              SizedBox(width: 10,),
                                              ElevatedButton(
                                                onPressed: (){
                                                  setState(() {
                                                    itemList[index] = searchcontroller.text.toString();
                                                    searchcontroller.clear();
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text('update'),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ));
                              },icon: Icon(Icons.edit),),
                              title: Text(itemList[index],style:const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                              ),),
                              trailing:Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.red,
                                  child: Center(child: IconButton(onPressed: (){
                                    setState(() {
                                      itemList.removeAt(index);
                                    });
                                  },icon:const Icon(Icons.delete,color: Colors.white,),))),
                            ),
                          ),
                        );
                      } else if(position.toLowerCase().contains(searchcontroller.text.toLowerCase())){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: ListTile(
                              leading: IconButton(onPressed: (){

                                showDialog(
                                    context: context,
                                    builder: (context)=> SimpleDialog(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                            height: 50,
                                            width: 300,
                                            decoration:const BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(color: Colors.black,blurRadius: 5,spreadRadius: 0.5)
                                                ]
                                            ),
                                            child: TextField(
                                              controller: searchcontroller,
                                              decoration: InputDecoration(
                                                hintText: 'update your text here',
                                                fillColor: Colors.white,
                                                filled: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                onPressed: (){
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text('cancel'),
                                              ),
                                              SizedBox(width: 10,),
                                              ElevatedButton(
                                                onPressed: (){
                                                  setState(() {
                                                    itemList[index] = searchcontroller.text.toString();
                                                    searchcontroller.clear();
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text('update'),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ));
                              },icon: Icon(Icons.edit),),
                              title: Text(itemList[index],style:const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                              ),),
                              trailing:Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.red,
                                  child: Center(child: IconButton(onPressed: (){
                                    setState(() {
                                      itemList.removeAt(index);
                                    });
                                  },icon:const Icon(Icons.delete,color: Colors.white,),))),
                            ),
                          ),
                        );
                      }
                      else{
                         Container(
                          child: Center(child: Text('Empty List',)),
                        );
                      }
                    }),
              ),
            ],
          ),
            //  create items botton
            Positioned(
              bottom: 10,
              left: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 300,
                    decoration:const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black,blurRadius: 5,spreadRadius: 0.5)
                      ]
                    ),
                    child: TextFormField(
                      controller: itemaddcontroller,
                      decoration:const InputDecoration(
                        hintText: 'Add item',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                 const SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration:const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        boxShadow: [
                          BoxShadow(color: Colors.black,blurRadius: 5,spreadRadius: 0.5)
                        ]
                    ),
                    child: IconButton(onPressed: (){
                      setState(() {
                        itemList.add(itemaddcontroller.text.toString());
                        itemaddcontroller.clear();
                      });

                    },icon: Icon(Icons.add),),
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
