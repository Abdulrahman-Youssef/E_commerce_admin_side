import 'package:admin_app/core/constant/enum/screen_state.dart';
import 'package:admin_app/data/model/item_model.dart';
import 'package:equatable/equatable.dart';

class ManageItemsState extends Equatable {
  final ScreenState screenState;

  final List<ItemModel>? items;

  const ManageItemsState({this.screenState = ScreenState.notAssigned, this.items});

  ManageItemsState copyWith({ScreenState? screenState, List<ItemModel>? items}) {
    return ManageItemsState(
      screenState: screenState ?? this.screenState,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [screenState, items];
}
