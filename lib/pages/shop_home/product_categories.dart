import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:surga_mainan/theme/theme.dart';

import '../../theme/dark_color.dart';

class Category extends StatefulWidget {
  const Category({Key key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: DarkColor.blackColor.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
          // _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}