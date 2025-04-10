import 'dart:io';

import 'package:admin_app/core/constant/enum/categories.dart';
import 'package:admin_app/core/constant/enum/screen_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AddEditItemState extends Equatable {
  final ScreenState? isLoading;
  final IsActive isItemActive;
  final enCategories? selectedCategory;

  final File? imageFile;

  const AddEditItemState(
      {this.imageFile,
      this.isLoading = ScreenState.notAssigned,
      this.isItemActive = IsActive.active,
      this.selectedCategory});

  AddEditItemState copyWith({
    ScreenState? isLoading,
    IsActive? isItemActive,
    enCategories? selectedCategory,
    File? imageFile,
  }) {
    return AddEditItemState(
      isLoading: isLoading ?? this.isLoading,
      isItemActive: isItemActive ?? this.isItemActive,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      imageFile: imageFile ?? this.imageFile,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, isItemActive, selectedCategory, imageFile];
}

enum IsActive {
  //1
  active,
  // 0
  notActive,
}
