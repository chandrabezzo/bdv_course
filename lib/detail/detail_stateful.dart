import 'package:flutter/material.dart';

class DetailStateful extends StatefulWidget {
  static const String routeName = '/detail_stateful';

  final Detail detail;
  
  DetailStateful(this.detail);

  @override
  _DetailStatefulState createState() => _DetailStatefulState();
}

class _DetailStatefulState extends State<DetailStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Stateful'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => _dialog()
            )
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => showDialog(
              context: context,
              builder: (context){
                return _alert();
              }
            ),
          )
        ],
      ),
      body: ListView(children: <Widget>[
        _columnImage(),
        _rowImage(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _stackImage(),
        ),
        _slideHorizontal(),
        Container(height: 8),
        _slideVertical(context)
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
            context: context, 
            builder: (context) => _columnBottom()
          );
        },
      ),
    );
  }

  Widget _columnImage(){
    return Column(children: <Widget>[
      SizedBox(height: 16),
      Image(image: AssetImage("asset/image/flutter.png"), width: 50, height: 50),
      Center(child: Text(widget.detail.info)),
      SizedBox(height: 16),
      (widget.detail.optionalInfo != null) ? Image.network("https://www.neappoli.com/static/flutterImg-94b8139a9f1f2c226184af4106495c66.png",
        width: 50, height: 50) : Container(),
      (widget.detail.optionalInfo != null) ? Center(child: Text(widget.detail.optionalInfo)) : Container(),
    ]);
  }

  Widget _rowImage(){
    return Row(children: <Widget>[
      SizedBox(width: 16),
      Image(image: AssetImage("asset/image/flutter.png"), width: 50, height: 50),
      Center(child: Text(widget.detail.info)),
      SizedBox(width: 16),
      (widget.detail.optionalInfo != null) ? Image.network("https://www.neappoli.com/static/flutterImg-94b8139a9f1f2c226184af4106495c66.png",
        width: 50, height: 50) : Container(),
      (widget.detail.optionalInfo != null) ? Center(child: Text(widget.detail.optionalInfo)) : Container(),
    ]);
  }

  Widget _stackImage(){
    return Stack(children: <Widget>[
      Image.network("https://fadlikadn.files.wordpress.com/2013/07/photo0137.jpg"),
      Positioned(
        child: Text("Bandung Digital Valley", style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontFamily: "Montserrat"
        )),
        top: 6,
        right: 0,
        bottom: 0,
        left: 60,
      )
    ]);
  }

  Widget _slideHorizontal(){
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              final counter = index + 1;
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Horizontal #$counter"),
                duration: Duration(seconds: 5),
                action: SnackBarAction(
                  label: "Dismiss",
                  onPressed: () => {},
                ),
              ));
            },
            child: Card(child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Horizontal"),
              )),
              elevation: 6,
            ),
          );
        },
        itemCount: 20,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _slideVertical(BuildContext context){
    return ListView.builder(
      itemBuilder: (context, index){
        return GestureDetector(
          onTap: (){
            showModalBottomSheet(context: context, builder: (context){
              return _listBottom();
            });
          },
          child: Card(child: Center(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Vertical"),
          ))),
        );
      },
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _columnBottom(){
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(children: <Widget>[
        Text("Bottom Sheet"),
        Text("Size Minimum"),
        SizedBox(height: 16),
        OutlineButton(
          child: Text("Tutup"),
          onPressed: () => Navigator.pop(context),
        )
      ], mainAxisSize: MainAxisSize.min),
    );
  }

  Widget _listBottom(){
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text("Title"),
        subtitle: Text("Subtitle"),
        trailing: Icon(Icons.chevron_right),
        onTap: () => Navigator.pop(context),
      ),
      itemCount: 20,
    );
  }

  Widget _alert(){
    return AlertDialog(
      title: Text("title"),
      content: Text("Content"),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  Widget _dialog(){
    return Dialog(
      child: Container(
        child: Text("Dialog"),
        margin: EdgeInsets.all(16),
      ),
    );
  }
}

class Detail {
  final String info;
  final String optionalInfo;

  Detail(this.info, {this.optionalInfo});
}