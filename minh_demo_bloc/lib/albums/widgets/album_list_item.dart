import 'package:flutter/material.dart';

import '../models/album.dart';
import '../view/album_detail.dart';

class AlbumListItem extends StatelessWidget {
  const AlbumListItem({required this.album, super.key});

  final Album album;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AlbumDetail(item: album);
        }));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: DetailLayout(album: album),
      ),
    );
  }
}

// Build the detail layout( For re-using in both places)
class DetailLayout extends StatelessWidget {
  const DetailLayout({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    String imageLink = _getImageAssetLink(album.id);

    return Stack(children: <Widget>[
      Container(
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageLink), fit: BoxFit.fill)),
      ),
      SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(
                child: SizedBox(
              width: 10,
              height: 10,
            )),
            Container(
              height: 50,
              color: Colors.white.withOpacity(0.7),
              child: Center(
                child: Text(album.title),
              ),
            ),
          ],
        ),
      )
    ]);
  }

  String _getImageAssetLink(int index) {
    int mod = index % 10;
    if (mod == 0) {
      mod = 1;
    }
    String result = 'images/image1.jpg';
    result = 'images/image$mod.jpg';
    return result;
  }
}
