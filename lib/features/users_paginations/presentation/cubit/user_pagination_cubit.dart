import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:notes/features/users_paginations/data/repos/users_repo.dart';

import 'user_pagination_state.dart';

class UserPaginationCubit extends Cubit<UserPaginationState> {
  final UsersRepo _usersRepo;
  List usersList = [];
  ScrollController scrollController = ScrollController();
  int totalPages = 0;
  int pageNumber = 1;
  UserPaginationCubit(this._usersRepo) : super(UserPaginationState.initial());

  void emitUsers() async {
    // emit(UserPaginationState.initial());

    var response =
        await _usersRepo.getSomeUsers({"page": pageNumber, "per_page": 5});

    response.when(success: (users) {
      totalPages = users['total_pages'];
      usersList.addAll(users['data']);
      emit(UserPaginationState.success(usersList));
    }, failure: (errorMSG) {
      emit(UserPaginationState.failure(errorMSG));
    });
  }

  pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (pageNumber <= totalPages)) {
      pageNumber++;
      print("call");
      emit(UserPaginationState.pagination());
      emitUsers();
    }
    ;
  }
}
