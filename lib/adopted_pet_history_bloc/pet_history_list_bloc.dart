import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/adopted_pet_history_bloc/pet_history_states.dart';
import 'package:test_app/data.dart';

class PetHistoryListCubit extends Cubit<PetHistoryListStates> {
  PetHistoryListCubit() : super(InitialPetHistoryListState()) {
    getPetHistoryList();
  }

  void getPetHistoryList() {
    emit(LoadingPetHistoryListState());
    List<Pet> data = PetAdopted.list;

    emit(LoadedPetHistoryListState(data));
  }

  void error() {
    emit(ErrorPetHistoryListState());
  }
}
