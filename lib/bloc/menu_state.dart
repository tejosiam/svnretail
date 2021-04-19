part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {
  const MenuInitial();
  @override
  List<Object> get props => [];
}

class MenuLoading extends MenuState {
  const MenuLoading();
  @override
  List<Object> get props => null;
}

class MenuLoaded extends MenuState {
  final MenuModel menuModel;

  const MenuLoaded(this.menuModel);
  @override
  List<Object> get props => [menuModel];
}

class MenuError extends MenuState {
  final String message;
  const MenuError(this.message);
  @override
  List<Object> get props => [message];
}
