part of 'get_mixes_bloc.dart';

class GetMixesEvent extends Equatable {
  const GetMixesEvent();

  @override
  List<Object> get props => [];
}

class GetMixes extends GetMixesEvent {
  final MixBody mixsearchparams;

  const GetMixes({required this.mixsearchparams});

  @override
  List<Object> get props => [mixsearchparams];
}
