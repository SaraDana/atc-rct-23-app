import 'package:app/core/enums/status_cubit.dart';
import 'package:app/features/midwife/app/cubit/midwife_cubit.dart';
import 'package:app/data/repositories/ask_for_info/ask_for_info_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'midwife_cubit_test.mocks.dart';

@GenerateMocks([MidWifeCubit, MidWifeState, AskForInfoRepository])
void main() {
  MidWifeCubit mockMidWifeCubit;
  MidWifeState initialState;
  AskForInfoRepository midWifeRepository;

  group('MidWifeCubit functions', () {
    test('set phone number', () async {
      // Arrange
      mockMidWifeCubit = MockMidWifeCubit();
      initialState = MidWifeState(phoneNumber: null);
      String testNumber = "5367306597";

      //implement
      when(mockMidWifeCubit.state).thenReturn(initialState);
      when(mockMidWifeCubit.setNumber(testNumber)).thenAnswer((_) async {
        return initialState.copyWith(phoneNumber: testNumber);
      });

      // Act
      MidWifeState newState = await mockMidWifeCubit.setNumber(testNumber);

      // Assert
      expect(newState.phoneNumber, testNumber);
    });

    test('save phone number succes senario', () async {
      // Arrange
      mockMidWifeCubit = MockMidWifeCubit();
      String testNumber = "5367306597";
      initialState = MidWifeState(phoneNumber: testNumber);
      midWifeRepository = MockAskForInfoRepository();

      //implement
      when(mockMidWifeCubit.state).thenReturn(initialState);
      when(midWifeRepository.savePhoneNumber(phoneNumber:testNumber)).thenAnswer((_) async {
        return true;
      });
      when(mockMidWifeCubit.savePhoneNumber("home")).thenAnswer((_) async {
        if (mockMidWifeCubit.state.phoneNumber != null) {
          bool isOk = await midWifeRepository
              .savePhoneNumber(phoneNumber:mockMidWifeCubit.state.phoneNumber!);

          if (isOk) {
            return initialState.copyWith(status: StatusCubit.SUCCESS);
          } else {
            return initialState.copyWith(status: StatusCubit.CHARGE_ERROR);
          }
        }
      });

      // Act
      MidWifeState newState = await mockMidWifeCubit.savePhoneNumber("home");

      // Assert
      expect(newState.status, StatusCubit.SUCCESS);
    });

    test('save phone number failed senario', () async {
      // Arrange
      mockMidWifeCubit = MockMidWifeCubit();
      String testNumber = "5367306597";
      initialState = MidWifeState(phoneNumber: testNumber);
      midWifeRepository = MockAskForInfoRepository();

      //implement
      when(mockMidWifeCubit.state).thenReturn(initialState);
      when(midWifeRepository.savePhoneNumber(phoneNumber: testNumber)).thenAnswer((_) async {
        return false;
      });
      when(mockMidWifeCubit.savePhoneNumber("home")).thenAnswer((_) async {
        if (mockMidWifeCubit.state.phoneNumber != null) {
          bool isOk = await midWifeRepository
              .savePhoneNumber(phoneNumber:mockMidWifeCubit.state.phoneNumber!);

          if (isOk) {
            return initialState.copyWith(status: StatusCubit.SUCCESS);
          } else {
            return initialState.copyWith(status: StatusCubit.CHARGE_ERROR);
          }
        }
      });

      // Act
      MidWifeState newState = await mockMidWifeCubit.savePhoneNumber("home");

      // Assert
      expect(newState.status, StatusCubit.CHARGE_ERROR);
    });
  });
}
