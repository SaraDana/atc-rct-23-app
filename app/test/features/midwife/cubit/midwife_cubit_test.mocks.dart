// Mocks generated by Mockito 5.4.0 from annotations
// in app/test/features/midwife/cubit/midwife_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:app/core/enums/status_cubit.dart' as _i5;
import 'package:app/data/repositories/ask_for_info/ask_for_info_repository.dart'
    as _i6;
import 'package:app/features/midwife/app/cubit/midwife_cubit.dart' as _i2;
import 'package:bloc/bloc.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMidWifeState_0 extends _i1.SmartFake implements _i2.MidWifeState {
  _FakeMidWifeState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$MidWifeStateCopyWith_1<$Res> extends _i1.SmartFake
    implements _i2.$MidWifeStateCopyWith<$Res> {
  _Fake$MidWifeStateCopyWith_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MidWifeCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockMidWifeCubit extends _i1.Mock implements _i2.MidWifeCubit {
  MockMidWifeCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MidWifeState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMidWifeState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.MidWifeState);
  @override
  _i3.Stream<_i2.MidWifeState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.MidWifeState>.empty(),
      ) as _i3.Stream<_i2.MidWifeState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  dynamic savePhoneNumber(String? option) =>
      super.noSuchMethod(Invocation.method(
        #savePhoneNumber,
        [option],
      ));
  @override
  void emit(_i2.MidWifeState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onChange(_i4.Change<_i2.MidWifeState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [MidWifeState].
///
/// See the documentation for Mockito's code generation for more information.
class MockMidWifeState extends _i1.Mock implements _i2.MidWifeState {
  MockMidWifeState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.StatusCubit get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _i5.StatusCubit.INITIAL,
      ) as _i5.StatusCubit);
  @override
  _i2.$MidWifeStateCopyWith<_i2.MidWifeState> get copyWith =>
      (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$MidWifeStateCopyWith_1<_i2.MidWifeState>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i2.$MidWifeStateCopyWith<_i2.MidWifeState>);
}

/// A class which mocks [AskForInfoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAskForInfoRepository extends _i1.Mock
    implements _i6.AskForInfoRepository {
  MockAskForInfoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> savePhoneNumber({
    required String? phoneNumber,
    String? courseName,
    Map<String, dynamic>? extraData,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #savePhoneNumber,
          [],
          {
            #phoneNumber: phoneNumber,
            #courseName: courseName,
            #extraData: extraData,
          },
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}