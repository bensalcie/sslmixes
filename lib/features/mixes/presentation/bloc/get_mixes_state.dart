part of 'get_mixes_bloc.dart';

class GetMixesState extends Equatable {
  const GetMixesState();

  @override
  List<Object?> get props => [];
}

class GetMixesInitial extends GetMixesState {}

class GetMixesLoading extends GetMixesState {}

class GetMixesSuccess extends GetMixesState {
  final MixesResponse? result;

  const GetMixesSuccess({required this.result});

  @override
  List<Object?> get props => [result];
}

class GetMixesFailed extends GetMixesState {
  final String errorMessage;

  const GetMixesFailed({required this.errorMessage});
}
