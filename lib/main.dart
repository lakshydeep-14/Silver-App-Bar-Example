import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: SilverBar(),
    );
  }
}
class SilverBar extends StatefulWidget {
  @override
  _SilverBarState createState() => _SilverBarState();
}

class _SilverBarState extends State<SilverBar> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  var cont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.red[900],
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace:_appbar()
          ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Container(
              height: 100,
              width: double.infinity,
              color: i%2==0?Colors.red[500]:Colors.redAccent[100],),
              childCount: 100,
            ), //SliverChildBuildDelegate
          ) // ListView.builder(
        ]
      ),
      
      
    );
  }
   Widget _appbar(){
    return FlexibleSpaceBar(
      background: Container(height: 100,color: Colors.red[900],),
      titlePadding: EdgeInsets.only(bottom: 15),
      centerTitle: true,
      title:Container(
        height: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        
        width: 0.6*MediaQuery.of(context).size.width,
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          controller: cont,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            fillColor: Colors.white,
            hintText: "Search..",
            hintStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400),
            suffixIcon: Icon(Icons.search,color: Colors.blue,size: 20,),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.purple, width: 1.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent,style: BorderStyle.none,width: 1.5))),),
      )
    );
  }
}
