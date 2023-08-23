import 'package:equatable/equatable.dart';

sealed class AlbumEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class AlbumFetched extends AlbumEvent {}
