import 'package:bdvcourse/search.dart';
import 'package:flutter/material.dart';

class DetailStateless extends StatelessWidget {

  final String info;
  final String optionalInfo;

  DetailStateless(this.info, {this.optionalInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Collapsing Toolbar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  "https://blog.glugmvit.com/assets/images/first_app/flutter.jpg",
                  fit: BoxFit.cover,
                )
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => showSearch(
                    context: context, 
                    delegate: Search()
                  ),
                )
              ],
            ),
          ];
        },
        body: ListView.builder(
          itemBuilder: (context, index){
            return EntryItem(data[index]);
          }, 
          itemCount: data.length
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
          Entry('Item A0.3'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'Chapter C',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),
          Entry('Item C2.2'),
          Entry('Item C2.3'),
        ],
      ),
    ],
  ),
  Entry(
    'Chapter D',
    <Entry>[
      Entry('Section D0'),
      Entry('Section D1'),
      Entry(
        'Section D2',
        <Entry>[
          Entry('Item D2.0'),
          Entry('Item D2.1'),
          Entry('Item D2.2'),
          Entry('Item D2.3'),
        ],
      ),
    ],
  ),
  Entry(
    'Chapter E',
    <Entry>[
      Entry('Section E0'),
      Entry('Section E1'),
      Entry(
        'Section E2',
        <Entry>[
          Entry('Item E2.0'),
          Entry('Item E2.1'),
          Entry('Item E2.2'),
          Entry('Item E2.3'),
        ],
      ),
    ],
  ),
  Entry(
    'Chapter F',
    <Entry>[
      Entry('Section F0'),
      Entry('Section F1'),
      Entry(
        'Section F2',
        <Entry>[
          Entry('Item F2.0'),
          Entry('Item F2.1'),
          Entry('Item F2.2'),
          Entry('Item F2.3'),
        ],
      ),
    ],
  ),
  Entry(
    'Chapter G',
    <Entry>[
      Entry('Section G0'),
      Entry('Section G1'),
      Entry(
        'Section G2',
        <Entry>[
          Entry('Item G2.0'),
          Entry('Item G2.1'),
          Entry('Item G2.2'),
          Entry('Item G2.3'),
        ],
      ),
    ],
  ),
  Entry(
    'Chapter H',
    <Entry>[
      Entry('Section H0'),
      Entry('Section H1'),
      Entry(
        'Section H2',
        <Entry>[
          Entry('Item H2.0'),
          Entry('Item H2.1'),
          Entry('Item H2.2'),
          Entry('Item H2.3'),
        ],
      ),
    ],
  ),
  Entry(
    'Chapter I',
    <Entry>[
      Entry('Section I0'),
      Entry('Section I1'),
      Entry(
        'Section I2',
        <Entry>[
          Entry('Item I2.0'),
          Entry('Item I2.1'),
          Entry('Item I2.2'),
          Entry('Item I2.3'),
        ],
      ),
    ],
  ),
  Entry(
    'Chapter J',
    <Entry>[
      Entry('Section J0'),
      Entry('Section J1'),
      Entry(
        'Section J2',
        <Entry>[
          Entry('Item J2.0'),
          Entry('Item J2.1'),
          Entry('Item J2.2'),
          Entry('Item J2.3'),
        ],
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}