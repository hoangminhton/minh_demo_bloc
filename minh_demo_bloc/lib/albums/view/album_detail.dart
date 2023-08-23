import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/album.dart';
import '../widgets/album_list_item.dart';

class AlbumDetail extends StatefulWidget {
  const AlbumDetail({super.key, required this.item});

  final Album item;

  @override
  State<StatefulWidget> createState() {
    return _AlbumDetailState();
  }
}

class _AlbumDetailState extends State<AlbumDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
            height: double.infinity, child: DetailLayout(album: widget.item)),
      ),
    );
  }
}
