import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:minh_demo_bloc/albums/bloc/album_event.dart';
import 'package:minh_demo_bloc/albums/bloc/album_state.dart';
import 'package:http/http.dart' as http;

import '../models/album.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(const AlbumState()) {
    on<AlbumFetched>(
      _onAlbumFetched,
    );
  }

  Future<void> _onAlbumFetched(
      AlbumFetched event, Emitter<AlbumState> emit) async {
    try {
      if (state.status == AlbumStatus.initial) {
        final albums = await _fetchAlbums();
        return emit(state.copyWith(
          status: AlbumStatus.success,
          albums: albums,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: AlbumStatus.failure));
    }
  }

  Future<List<Album>> _fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Album(
          id: map['id'] as int,
          title: map['title'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching albums');
  }
}
