import 'package:equatable/equatable.dart';
import 'package:test_app/data.dart';

abstract class PetHistoryListStates extends Equatable {}

class InitialPetHistoryListState extends PetHistoryListStates {
  @override
  List<Object?> get props => [];
}

class LoadingPetHistoryListState extends PetHistoryListStates {
  @override
  List<Object?> get props => [];
}

class LoadedPetHistoryListState extends PetHistoryListStates {
  List<Pet> petList = [];
  LoadedPetHistoryListState(this.petList);

  @override
  List<Object?> get props => [petList];
}

class ErrorPetHistoryListState extends PetHistoryListStates {
  @override
  List<Object?> get props => [];
}
