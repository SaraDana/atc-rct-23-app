import 'package:app/features/auth/index.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fakes/recover_password_fakes.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('RecoverPasswordCubit', () {
    late AuthRepository authRepository;
    setUp(() {
      authRepository = MockAuthRepository();
      when(
        () => authRepository.recoverPasswordByEmail(email: 'test@gmail.com'),
      ).thenAnswer((_) async => {});
    });

    test('initial state is RecoverPasswordState', () {
      expect(
        RecoverPasswordCubit(
          authRepository: authRepository,
        ).state,
        equals(RecoverPasswordState()),
      );
    });

    group('emailChanged', () {
      blocTest<RecoverPasswordCubit, RecoverPasswordState>(
        'emits invalid when email is invalid',
        build: () => RecoverPasswordCubit(
          authRepository: authRepository,
        ),
        act: (cubit) => cubit.emailChanged(tInvalidEmailString),
        expect: () => <RecoverPasswordState>[tInvalidEmailState],
      );

      blocTest<RecoverPasswordCubit, RecoverPasswordState>(
        'emits valid when email are valid',
        build: () => RecoverPasswordCubit(
          authRepository: authRepository,
        ),
        seed: () => const RecoverPasswordState(),
        act: (cubit) => cubit.emailChanged(tValidEmailString),
        expect: () => <RecoverPasswordState>[tValidState],
      );
    });

    group('recoverPasswordByEmail', () {
      blocTest<RecoverPasswordCubit, RecoverPasswordState>(
        'emits success when recoverPasswordByEmail is successful',
        build: () => RecoverPasswordCubit(
          authRepository: authRepository,
        ),
        seed: () => const RecoverPasswordState(
          email: tValidEmail,
        ),
        act: (cubit) => cubit.recoverPasswordByEmail(),
        verify: (_) {
          verify(
            () =>
                authRepository.recoverPasswordByEmail(email: 'test@gmail.com'),
          ).called(1);
        },
      );

      blocTest<RecoverPasswordCubit, RecoverPasswordState>(
        'emits success when recoverPasswordByEmail is successful',
        build: () => RecoverPasswordCubit(
          authRepository: authRepository,
        ),
        seed: () => const RecoverPasswordState(
          email: tValidEmail,
        ),
        act: (cubit) => cubit.recoverPasswordByEmail(),
        expect: () => <RecoverPasswordState>[tInProgressState, tSuccessStatus],
      );

      blocTest<RecoverPasswordCubit, RecoverPasswordState>(
        'emits failure when recoverPasswordByEmail is unsuccessful',
        build: () {
          when(
            () =>
                authRepository.recoverPasswordByEmail(email: 'test@gmail.com'),
          ).thenThrow(Exception());

          return RecoverPasswordCubit(
            authRepository: authRepository,
          );
        },
        seed: () => const RecoverPasswordState(
          email: tValidEmail,
        ),
        act: (cubit) => cubit.recoverPasswordByEmail(),
        expect: () => <RecoverPasswordState>[tInProgressState, tFailureStatus],
      );
    });
  });
}
