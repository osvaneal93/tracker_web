import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soriana_tracker/data/models/sucursal_model.dart';
import 'package:soriana_tracker/domain/repository/home_repository/sidebar_repository.dart';

part 'sidebar_state.dart';

class SidebarCubit extends Cubit<SidebarState> {
  final SidebarRepository _sidebarRepository;

  SidebarCubit(this._sidebarRepository) : super(SidebarInitial());

  Future<void> getSucursales() async {
    emit(SidebarLoading());
    final SucursalModel sucursal =
        await _sidebarRepository.retrieveSucursales();
    emit(SidebarLoaded(sucursalModel: sucursal, index: 0));
  }

  Future<void> changePage(int index) async {
    emit(state.copyWith(index: index));
  }
}
