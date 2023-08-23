import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minh_demo_bloc/albums/view/album_list.dart';

import '../bloc/album_bloc.dart';
import '../bloc/album_event.dart';

class AlbumsPage extends StatelessWidget {
  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: BlocProvider(
        create: (_) => AlbumBloc()..add(AlbumFetched()),
        child: const AlbumsList(),
      ),
    );
  }
}
