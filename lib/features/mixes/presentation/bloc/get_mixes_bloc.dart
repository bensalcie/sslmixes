import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:sslmixes/core/common/error/failures.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_body.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_response.dart';
import 'package:sslmixes/features/mixes/domain/usecases/get_mixes_usecase.dart';

part 'get_mixes_event.dart';
part 'get_mixes_state.dart';

@injectable
class GetMixesBloc extends Bloc<GetMixesEvent, GetMixesState> {
  final GetMixesUseCase _getMixesUseCase;

  GetMixesBloc(this._getMixesUseCase) : super(GetMixesInitial()) {
    on<GetMixes>(_onGetMixes);
  }

  _onGetMixes(GetMixes event, Emitter<GetMixesState> emit) async {
    emit(GetMixesLoading());

    final result = await _getMixesUseCase.call(event.mixsearchparams);
    emit(
      result.fold(
        (failure) {
          return GetMixesFailed(
              errorMessage: failure.runtimeType == HandShakeFailure
                  ? 'SLL Pinning Violation Found!!!'
                  : 'Something went wrong');
        },
        (data) => GetMixesSuccess(result: data),
      ),
    );
  }
}
