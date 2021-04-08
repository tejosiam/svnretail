import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goldenlamian/models/menu_model.dart';
import 'package:goldenlamian/resources/api_repository.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ApiRepository _apiRepository = ApiRepository();

  MenuBloc() : super(MenuInitial());

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    if (event is GetMenuList) {
      try {
        yield MenuLoading();
        final mList = await _apiRepository.fetchMenuList();
        yield MenuLoaded(mList);
        if (mList.error != null) {
          yield MenuError(mList.error);
        }
      } on NetworkError {
        yield MenuError("Failed to fetch data. is your device online?");
      }
    }
  }
}
