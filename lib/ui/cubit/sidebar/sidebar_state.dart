// ignore_for_file: overridden_fields

part of 'sidebar_cubit.dart';

class SidebarState extends Equatable {
  final SucursalModel? sucursalModel;
  final int? index;
  const SidebarState({this.sucursalModel, this.index});
  SidebarState copyWith({SucursalModel? sucursalModel, int? index}) =>
      SidebarState(
          index: index ?? this.index,
          sucursalModel: sucursalModel ?? this.sucursalModel);

  @override
  List<Object> get props => [sucursalModel!, index!];
}

class SidebarInitial extends SidebarState {}

class SidebarLoading extends SidebarState {}

class SidebarLoaded extends SidebarState {
  @override
  final SucursalModel? sucursalModel;
  @override
  final int? index;

  const SidebarLoaded({this.index = 1, this.sucursalModel});

  @override
  SidebarLoaded copyWith({SucursalModel? sucursalModel, int? index}) =>
      SidebarLoaded(
          index: index ?? this.index,
          sucursalModel: sucursalModel ?? this.sucursalModel);
  @override
  List<Object> get props => [sucursalModel!, index!];
}

class PageChanged extends SidebarState {
  @override
  final int index;

  const PageChanged(this.index);
  @override
  List<Object> get props => [index];
}
