import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  final int? pageNumber;

  const HomePageState({
     this.pageNumber = 0 ,
  });

  HomePageState copyWith({int? pageNumber}) {
    return HomePageState(pageNumber: pageNumber ?? this.pageNumber);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [pageNumber];
}