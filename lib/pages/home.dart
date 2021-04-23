import 'dart:io';

import 'package:flutter/material.dart';
import 'package:badnames/models/band.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band>bands=[
    Band(id: "1",name: "Metalica",votes: 5),
    Band(id: "2",name: "Queen",votes: 1),
    Band(id: "3",name: "Heroes del silencio",votes: 2),
    Band(id: "4",name: "Bom jovi",votes: 5),
   

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("BandNames",style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
        ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder:(context,i)=> _bandTile(bands[i])
        
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 1,
          onPressed: addNewBand,
        ),
   );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direccion){
        print("$direccion");
        //llamar el borrado en el server
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
         child: Icon(Icons.cleaning_services_sharp,color: Colors.white,),
          ),
      ),
          child: ListTile(
           leading: CircleAvatar(
             child: Text(band.name.substring(0,2)
             ),
             backgroundColor: Colors.blue[100],
           ),
           title: Text(band.name),
           trailing: Text("${band.votes}",style: TextStyle(fontSize: 20),),
           onTap: (){
             print(band.name);
           },
          ),
    );
  }

  addNewBand(){
    final textController=new TextEditingController();
    if(Platform.isAndroid){
      return showDialog(
      context: context,
       builder: (context){
          return AlertDialog(
            title: Text("New band name:"),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                elevation: 5,
                child: Text("Add"),
                textColor: Colors.blue,
                onPressed: ()=>addBandToList(textController.text)
                )
            ],

          );
       }
      );
    }
    
  }

  void addBandToList(String name){
    print(name);
    if(name.length>1){
     this.bands.add(new Band(id: DateTime.now().toString(),name: name,votes: 0));
     setState(() {
       
     });
    }

    Navigator.pop(context);

  }
}