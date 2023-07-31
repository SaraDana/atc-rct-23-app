import 'package:app/features/auth/index.dart';
import 'package:app/features/user/domain/repositories/user_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fakes/sign_in_fakes_values.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('SignInCubit', () {
    late AuthRepository authRepository;
    late UserRepository userRepository;

    setUpAll(() {
      authRepository = MockAuthRepository();
      userRepository = MockUserRepository();
      when(
        () => authRepository.signInWithEmailAndPassword(
          email: 'email',
          password: 'password',
        ),
      ).thenAnswer((_) async => tAuthDTO);
    });

    test('initial state is SignInState', () {
      expect(
        SignInCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ).state,
        equals(SignInState()),
      );
    });

    group('emailChanged', () {
      blocTest<SignInCubit, SignInState>(
        'emits invalid when firstName/email/password/confirmedPassword are invalid',
        build: () => SignInCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        seed: () => SignInState(),
        act: (cubit) => cubit.emailChanged(tInvalidEmailString),
        expect: () => <SignInState>[tInvalidEmailState],
      );

      blocTest<SignInCubit, SignInState>(
        'emits valid when email/password/confirmedPassword/checkbox are valid',
        build: () => SignInCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        seed: () => const SignInState(
          password: tValidPassword,
        ),
        act: (cubit) => cubit.emailChanged(tValidEmailString),
        expect: () => <SignInState>[tValidState],
      );
    });

    group('passwordChanged', () {
      blocTest<SignInCubit, SignInState>(
        'emits invalid when email/password/confirmedPassword are invalid',
        build: () => SignInCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        act: (cubit) => cubit.passwordChanged(tInvalidPasswordString),
        expect: () => <SignInState>[tInvalidPasswordState],
      );

      blocTest<SignInCubit, SignInState>(
        'emits valid when email/password/confirmedPassword/checkbox are valid',
        build: () => SignInCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        seed: () => const SignInState(
          email: tValidEmail,
        ),
        act: (cubit) => cubit.passwordChanged(tValidPasswordString),
        expect: () => <SignInState>[tValidState],
      );

      blocTest<SignInCubit, SignInState>(
        'emits valid when email/password/confirm password are valid',
        build: () => SignInCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        seed: () => const SignInState(
          email: tValidEmail,
          password: tValidPassword,
        ),
        act: (cubit) => cubit.passwordChanged(tValidPasswordString),
        expect: () => <SignInState>[tValidState],
      );
    });

    group('signInFormSubmitted', () {
      blocTest<SignInCubit, SignInState>(
        'does nothing when status is not validated',
        build: () => SignInCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        act: (cubit) => cubit.sigInWithCredentials(),
        expect: () => const <SignInState>[],
      );

      blocTest<SignInCubit, SignInState>(
        'emits submissionInProgress, submissionFailure '
        'when signIn fails',
        build: () {
          when(
            () => authRepository.signInWithEmailAndPassword(
              email: 'email',
              password: 'password',
            ),
          ).thenThrow(Exception());
          return SignInCubit(
            authRepository: authRepository,
            userRepository: userRepository,
          );
        },
        seed: () => tValidState,
        act: (cubit) => cubit.sigInWithCredentials(),
        expect: () => <SignInState>[tInProgressState, tSubmissionFailureState],
      );
    });
  });
}
