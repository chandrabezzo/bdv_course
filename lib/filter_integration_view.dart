import 'package:bdvcourse/colors.dart';
import 'package:flutter/material.dart';

class FilterIntegrationView extends StatefulWidget {
  static const String routeName = '/filterIntegrationView';

  @override
  _FilterIntegrationViewState createState() => _FilterIntegrationViewState();
}

class _FilterIntegrationViewState extends State<FilterIntegrationView> {
  
  bool _notifUpdate = false;
  bool _isLatest = false;
  bool _adult = false;
  bool _parentGuidance = false;
  bool _allAges = false;
  final _etQuery = TextEditingController();
  final _queryFocus = FocusNode();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _queryFocus.requestFocus();
    _etQuery.text = "Init Query";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(children: <Widget>[
        SizedBox(height: 16),
        Center(child: Text("Filter", style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 20
        ))),
        SizedBox(height: 8),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: TextField(
            controller: _etQuery,
            focusNode: _queryFocus,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              labelText: "Keyword"
            ),
          ),
        ),
        SwitchListTile(
          title: Text("Notifikasi Update"),
          value: _notifUpdate,
          activeColor: Colors.white,
          activeTrackColor: colorPrimary,
          onChanged: (value){
            setState(() {
              _notifUpdate = value;
              if(value){
                _etQuery.text = "Dapat Notifikasi Update";
              }
              else {
                _etQuery.text = "Tidak Dapat Notifikasi Update";
              }
            });
          },
        ),
        RadioListTile(
          groupValue: _isLatest,
          value: true,
          onChanged: (value){
            setState(() {
              _isLatest = true;
            });

            if(_isLatest){
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Terbaru"),
                duration: Duration(seconds: 3),
              ));
            }
          },
          title: Text("Terbaru"),
          subtitle: Text("Urutkan berdasarkan terbaru"),
        ),
        RadioListTile(
          groupValue: _isLatest,
          value: false,
          onChanged: (value){
            setState(() {
              _isLatest = false;
            });

            if(!_isLatest){
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Terlama"),
                duration: Duration(seconds: 3),
              ));
            }
          },
          title: Text("Terlama"),
          subtitle: Text("Urutkan berdasarkan terlama"),
        ),
        CheckboxListTile(
          value: _adult,
          title: Text("Dewasa"),
          subtitle: Text("Film mengandung konten dewasa"),
          onChanged: (value){
            setState(() {
              _adult = value;
            });
          },
        ),
        CheckboxListTile(
          value: _parentGuidance,
          title: Text("Bimbingan Orang Tua"),
          subtitle: Text("Ada beberapa adegan yang harus dibimbing oleh orang tua"),
          onChanged: (value){
            setState(() {
              _parentGuidance = value;
            });
          },
        ),
        CheckboxListTile(
          value: _allAges,
          title: Text("Semua Umur"),
          subtitle: Text("Film aman ditonton oleh semua umur"),
          onChanged: (value){
            setState(() {
              _allAges = value;
            });
          },
        ),
      ]),
    );
  }
}
