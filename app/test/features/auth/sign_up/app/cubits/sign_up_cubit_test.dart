import 'package:app/features/auth/index.dart';
import 'package:app/features/user/domain/repositories/user_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fakes/sign_up_fake_values.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('SignUpCubit', () {
    late AuthRepository authRepository;
    late UserRepository userRepository;

    setUpAll(() {
      authRepository = MockAuthRepository();
      userRepository = MockUserRepository();
      when(
        () => authRepository.signUpWithEmailAndPassword(
          email: 'email',
          password: 'password',
        ),
      ).thenAnswer((_) async => tAuthDTO);
    });

    test('initial state is SignUpState', () {
      expect(
        SignUpCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ).state,
        equals(SignUpState()),
      );
    });

    group('emailChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits invalid when firstName/email/password/confirmedPassword are invalid',
        build: () => SignUpCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        seed: () => SignUpState(),
        act: (cubit) => cubit.emailChanged(tInvalidEmailString),
        expect: () => <SignUpState>[tInvalidEmailState],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits valid when email/password/confirmedPassword/checkbox are valid',
        build: () => SignUpCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        seed: () => const SignUpState(
          password: tValidPassword,
          acceptTerms: tValidAcceptedTerms,
          passwordRepeat: tValidConfirmedPassword,
        ),
        act: (cubit) => cubit.emailChanged(tValidEmailString),
        expect: () => <SignUpState>[tValidState],
      );
    });

    group('passwordChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits invalid when email/password/confirmedPassword are invalid',
        build: () => SignUpCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        act: (cubit) => cubit.passwordChanged(tInvalidPasswordString),
        expect: () => <SignUpState>[tInvalidPasswordState],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits valid when email/password/confirmedPassword/checkbox are valid',
        build: () => SignUpCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        seed: () => const SignUpState(
          email: tValidEmail,
          passwordRepeat: tValidConfirmedPassword,
          acceptTerms: tValidAcceptedTerms,
        ),
        act: (cubit) => cubit.passwordChanged(tValidPasswordString),
        expect: () => <SignUpState>[tValidState],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits valid when email/password/confirm password are valid',
        build: () => SignUpCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        seed: () => const SignUpState(
          email: tValidEmail,
          password: tValidPassword,
          passwordRepeat: tValidConfirmedPassword,
          acceptTerms: tValidAcceptedTerms,
        ),
        act: (cubit) => cubit.passwordChanged(tValidPasswordString),
        expect: () => <SignUpState>[tValidState],
      );
    });

    group('signUpFormSubmitted', () {
      blocTest<SignUpCubit, SignUpState>(
        'does nothing when status is not validated',
        build: () => SignUpCubit(
          authRepository: authRepository,
          userRepository: userRepository,
        ),
        act: (cubit) => cubit.signUpFormSubmitted(),
        expect: () => const <SignUpState>[],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits submissionInProgress, submissionFailure '
        'when signUp fails',
        build: () {
          when(
            () => authRepository.signUpWithEmailAndPassword(
              email: 'email',
              password: 'password',
            ),
          ).thenThrow(Exception());
          return SignUpCubit(
            authRepository: authRepository,
            userRepository: userRepository,
          );
        },
        seed: () => tValidState,
        act: (cubit) => cubit.signUpFormSubmitted(),
        expect: () => <SignUpState>[tInProgressState, tSubmissionFailureState],
      );
    });
  });
}
