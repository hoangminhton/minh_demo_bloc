import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/album_bloc.dart';
import '../bloc/album_event.dart';
import '../bloc/album_state.dart';
import '../widgets/album_list_item.dart';
import '../widgets/bottom_loader.dart';

class AlbumsList extends StatefulWidget {
  const AlbumsList({super.key});

  @override
  State<AlbumsList> createState() => _AlbumsListState();
}

class _AlbumsListState extends State<AlbumsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        switch (state.status) {
          case AlbumStatus.failure:
            return const Center(child: Text('failed to fetch album'));
          case AlbumStatus.success:
            if (state.list.isEmpty) {
              return const Center(child: Text('no albums'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.list.length
                    ? const BottomLoader()
                    : AlbumListItem(album: state.list[index]);
              },
              itemCount: state.list.length,
              controller: _scrollController,
            );
          case AlbumStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<AlbumBloc>().add(AlbumFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
