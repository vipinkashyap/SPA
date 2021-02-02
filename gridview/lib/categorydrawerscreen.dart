import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryDrawerScreen extends StatefulWidget {
  @override
  _CategoryDrawerScreenState createState() => _CategoryDrawerScreenState();
}

class _CategoryDrawerScreenState extends State<CategoryDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4ba3c7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF4ba3c7),
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Icon(
          FontAwesomeIcons.layerGroup,
          color: Colors.white,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) => EntryItem(
            data[index],
          ),
        ),
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry> children;

  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  Entry(
    'Electronics & Media',
    <Entry>[
      Entry('View all'),
      Entry('Audio & Speakers'),
      Entry('Cell phones & Accessories'),
      Entry('Cameras & Photography'),
      Entry('TV\'s'),
      Entry('Video games & Consoles'),
      Entry('Computer\'s & Accessories'),
      Entry('Wearables'),
      Entry('Drones'),
      Entry('VR'),
    ],
  ),
  Entry(
    'Home & Garden',
    <Entry>[
      Entry('View all'),
      Entry('Furniture'),
      Entry('Household Appliances'),
      Entry('Kitchen & Dining'),
      Entry('Bathroom Supplies'),
      Entry('Tools & Machinery'),
      Entry('Lawn & Garden'),
      Entry('Decor'),
    ],
  ),
  Entry(
    'Clothing, Shoes & Accessories',
    <Entry>[
      Entry('Women\'s Clothing'),
      Entry('Men\'s Clothing'),
      Entry('Women Shoes'),
      Entry('Men\'s Shoes'),
      Entry('Girl\'s Clothing'),
      Entry('Boys\'s Clothing'),
      Entry('Girl\'s Shoes'),
      Entry('Boys\'s Shoes'),
      Entry('Toddler Accessories'),
    ],
  ),
  Entry(
    'Baby & Kid\'s',
    <Entry>[
      Entry('View all'),
      Entry('Girl\'s Accessories'),
      Entry('Boys\'s Accessories'),
      Entry('Food'),
      Entry('Strollers'),
    ],
  ),
  Entry(
    'Vehicles',
    <Entry>[
      Entry('View all'),
      Entry('Cars'),
      Entry('Motorcycles'),
      Entry('Tires & Rims'),
      Entry('View all'),
      Entry('Autoparts & Accessories'),
    ],
  ),
  Entry(
    'Toys, Games & Hobbies',
    <Entry>[
      Entry('View all'),
      Entry('Toys'),
      Entry('Puzzles & Board Games'),
      Entry('Muscial Instruments'),
    ],
  ),
  Entry(
    'Sports & Outdoors',
    <Entry>[
      Entry('View all'),
      Entry('Yoga & Pilates'),
      Entry('MMA & Boxing'),
      Entry('Cycling'),
      Entry('Skateboarding'),
      Entry('Gym Gear'),
      Entry('Camping Equipment'),
    ],
  ),
  Entry(
    'Collectibles',
    <Entry>[
      Entry('Art'),
      Entry('Antiques'),
      Entry('Handmade'),
    ],
  ),
  Entry(
    'Pet Supplies',
    <Entry>[
      Entry('View all'),
      Entry('Collars & Leash'),
      Entry('Pet Clothing & Accessories'),
      Entry('Toys'),
      Entry('Food'),
      Entry('Bedding'),
      Entry('Health & Wellness'),
    ],
  ),
  Entry(
    'Health & Beauty',
    <Entry>[
      Entry('View all'),
      Entry('Hair Care'),
      Entry('Bath & Body'),
      Entry('Makeup & Cosmetics'),
      Entry('Skincare'),
      Entry('Fragrance'),
      Entry('Tools & Accessories'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(
          root.title,
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return ExpansionTile(
      backgroundColor: Colors.white.withOpacity(0.1),
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
