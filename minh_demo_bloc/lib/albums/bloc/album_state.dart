import 'package:equatable/equatable.dart';

import '../models/album.dart';

enum AlbumStatus { initial, success, failure }

final class AlbumState extends Equatable {
  const AlbumState(
      {this.status = AlbumStatus.initial, this.list = const <Album>[]});

  final AlbumStatus status;
  final List<Album> list;

  AlbumState copyWith({
    AlbumStatus? status,
    List<Album>? albums,
  }) {
    return AlbumState(status: status ?? this.status, list: albums ?? list);
  }

  @override
  List<Object> get props => [status, list];
}
