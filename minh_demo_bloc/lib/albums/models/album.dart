import 'package:equatable/equatable.dart';

final class Album extends Equatable {
  const Album({required this.id, required this.title});

  final int id;
  final String title;

  @override
  List<Object> get props => [id, title];
}
