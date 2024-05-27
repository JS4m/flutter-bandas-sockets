import 'package:band_name/models/band.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State <HomePage>{

List <Band> bands=[
  Band (id:'1',name:'Miel san Marcos', votes:5),
  Band (id:'2',name:'Barak', votes:2),
  Band (id:'3',name:'Llevame Señor', votes:1),
  Band (id:'4',name:'Fuego', votes:4),
  Band (id:'5',name:'Manantial del Cielo', votes:3),
]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Bandas',style: TextStyle(color:Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: ( context,  i) =>  _bandTile(bands[i])
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 1,
          onPressed: (){},
          ),
   );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: ((direction) {
        print('direction:$direction');
        print('id:${band.id}');
        //Todo: llamar el borrado en el server
      }),
      background: Container(
        padding: EdgeInsets.only(left:8.0),
        color:Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child:Text('Eliminar Banda', style: TextStyle(color:Colors.white),),
        ),
      ),
      child: ListTile(
          leading: CircleAvatar(
            child: Text(band.name.substring(0,2)),
            backgroundColor: Colors.blue[100],
          ),
          title:Text(band.name),
          trailing: Text('${band.votes}',style: TextStyle(fontSize: 20),),
          onTap: (){
            print(band.name);
          },
        ),
    );
  }
}
