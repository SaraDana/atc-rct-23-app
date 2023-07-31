// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Dana`
  String get appName {
    return Intl.message(
      'Dana',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Gracias por compartir cómo te encuentras hoy`
  String get homePageMoodTodaySuccess {
    return Intl.message(
      'Gracias por compartir cómo te encuentras hoy',
      name: 'homePageMoodTodaySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Escribe aquí tu email...`
  String get screenLoginEmailHint {
    return Intl.message(
      'Escribe aquí tu email...',
      name: 'screenLoginEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Escribe tu contraseña...`
  String get screenLoginPasswordHint {
    return Intl.message(
      'Escribe tu contraseña...',
      name: 'screenLoginPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get screenOnBoardingLogin {
    return Intl.message(
      'Login',
      name: 'screenOnBoardingLogin',
      desc: '',
      args: [],
    );
  }

  /// `Registro`
  String get screenOnBoardingRegister {
    return Intl.message(
      'Registro',
      name: 'screenOnBoardingRegister',
      desc: '',
      args: [],
    );
  }

  /// `¡Hola soy Dana!`
  String get screenOnBoarding1Title {
    return Intl.message(
      '¡Hola soy Dana!',
      name: 'screenOnBoarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `Tu asistente personal durante \n la maternidad`
  String get screenOnBoarding1Description {
    return Intl.message(
      'Tu asistente personal durante \n la maternidad',
      name: 'screenOnBoarding1Description',
      desc: '',
      args: [],
    );
  }

  /// `Vive y disfruta de \n tu maternidad`
  String get screenOnBoarding2Title {
    return Intl.message(
      'Vive y disfruta de \n tu maternidad',
      name: 'screenOnBoarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Mejora tu bienestar con programas diseñados por profesionales de la salud maternal`
  String get screenOnBoarding2Description {
    return Intl.message(
      'Mejora tu bienestar con programas diseñados por profesionales de la salud maternal',
      name: 'screenOnBoarding2Description',
      desc: '',
      args: [],
    );
  }

  /// `Cuídate para \n cuidar`
  String get screenOnBoarding3Title {
    return Intl.message(
      'Cuídate para \n cuidar',
      name: 'screenOnBoarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `Comparte tus experiencias con otras madres en la comunidad de Dana`
  String get screenOnBoarding3Description {
    return Intl.message(
      'Comparte tus experiencias con otras madres en la comunidad de Dana',
      name: 'screenOnBoarding3Description',
      desc: '',
      args: [],
    );
  }

  /// `¿Ya eres miembro de Dana? `
  String get screenAuthMemberYet {
    return Intl.message(
      '¿Ya eres miembro de Dana? ',
      name: 'screenAuthMemberYet',
      desc: '',
      args: [],
    );
  }

  /// `Haz `
  String get screenAuthMemberYet2 {
    return Intl.message(
      'Haz ',
      name: 'screenAuthMemberYet2',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get screenAuthMemberYetLink {
    return Intl.message(
      'Login',
      name: 'screenAuthMemberYetLink',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes cuenta en Dana. `
  String get screenAuthMemberNotYet {
    return Intl.message(
      'Aún no tienes cuenta en Dana. ',
      name: 'screenAuthMemberNotYet',
      desc: '',
      args: [],
    );
  }

  /// `¡Vamos!`
  String get screenAuthMemberNotYetLink {
    return Intl.message(
      '¡Vamos!',
      name: 'screenAuthMemberNotYetLink',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get screenAuthButtonMail {
    return Intl.message(
      'Mail',
      name: 'screenAuthButtonMail',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get screenAuthButtonGoogle {
    return Intl.message(
      'Google',
      name: 'screenAuthButtonGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get screenAuthButtonFacebook {
    return Intl.message(
      'Facebook',
      name: 'screenAuthButtonFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Registremos tus intereses`
  String get screenHomePageProfileQuestion {
    return Intl.message(
      'Registremos tus intereses',
      name: 'screenHomePageProfileQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Continuar con Apple`
  String get screenAuthButtonApple {
    return Intl.message(
      'Continuar con Apple',
      name: 'screenAuthButtonApple',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get screenLoginAppbarTitle {
    return Intl.message(
      'Login',
      name: 'screenLoginAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Qué bien verte aquí!`
  String get screenLoginTitle {
    return Intl.message(
      '¡Qué bien verte aquí!',
      name: 'screenLoginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa ahora con`
  String get screenLoginSubtitle {
    return Intl.message(
      'Ingresa ahora con',
      name: 'screenLoginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Registro`
  String get screenRegisterAppbarTitle {
    return Intl.message(
      'Registro',
      name: 'screenRegisterAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Bienvenida!`
  String get screenRegisterTitle {
    return Intl.message(
      '¡Bienvenida!',
      name: 'screenRegisterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Regístrate ahora con`
  String get screenRegisterSubtitle {
    return Intl.message(
      'Regístrate ahora con',
      name: 'screenRegisterSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Registro con mail`
  String get screenRegisterMailAppbarTitle {
    return Intl.message(
      'Registro con mail',
      name: 'screenRegisterMailAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Genial!`
  String get screenRegisterMailTitle {
    return Intl.message(
      '¡Genial!',
      name: 'screenRegisterMailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ya casi estás lista`
  String get screenRegisterMailSubtitle {
    return Intl.message(
      'Ya casi estás lista',
      name: 'screenRegisterMailSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Registro`
  String get screenRegisterMailButton {
    return Intl.message(
      'Registro',
      name: 'screenRegisterMailButton',
      desc: '',
      args: [],
    );
  }

  /// `Con tu registro aceptas los Términos y Condiciones y la Política de Privacidad`
  String get screenRegisterMailTerms {
    return Intl.message(
      'Con tu registro aceptas los Términos y Condiciones y la Política de Privacidad',
      name: 'screenRegisterMailTerms',
      desc: '',
      args: [],
    );
  }

  /// `Login con mail`
  String get screenLoginMailAppbarTitle {
    return Intl.message(
      'Login con mail',
      name: 'screenLoginMailAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo estás?`
  String get screenLoginMailTitle {
    return Intl.message(
      '¿Cómo estás?',
      name: 'screenLoginMailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Te hemos echado de menos`
  String get screenLoginMailSubtitle {
    return Intl.message(
      'Te hemos echado de menos',
      name: 'screenLoginMailSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Olvidaste tu contraseña?`
  String get screenLoginMailForgotPassword {
    return Intl.message(
      '¿Olvidaste tu contraseña?',
      name: 'screenLoginMailForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get screenLoginMailButton {
    return Intl.message(
      'Login',
      name: 'screenLoginMailButton',
      desc: '',
      args: [],
    );
  }

  /// `Recuperar contraseña`
  String get screenForgotPasswordBarTitle {
    return Intl.message(
      'Recuperar contraseña',
      name: 'screenForgotPasswordBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enviar`
  String get screenForgotPasswordButton {
    return Intl.message(
      'Enviar',
      name: 'screenForgotPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `¿Olvidaste tu contraseña?`
  String get screenForgotPasswordTitle {
    return Intl.message(
      '¿Olvidaste tu contraseña?',
      name: 'screenForgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dinos tu email y te ayudamos`
  String get screenForgotPasswordSubtitle {
    return Intl.message(
      'Dinos tu email y te ayudamos',
      name: 'screenForgotPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Enviar`
  String get screenProgramDetailSendRateButton {
    return Intl.message(
      'Enviar',
      name: 'screenProgramDetailSendRateButton',
      desc: '',
      args: [],
    );
  }

  /// `Programa`
  String get screenProgramDetailProgram {
    return Intl.message(
      'Programa',
      name: 'screenProgramDetailProgram',
      desc: '',
      args: [],
    );
  }

  /// `¡Claro!`
  String get screenInitialProfileOnBoardingButtonYes {
    return Intl.message(
      '¡Claro!',
      name: 'screenInitialProfileOnBoardingButtonYes',
      desc: '',
      args: [],
    );
  }

  /// `No gracias, mejor luego`
  String get screenInitialProfileOnBoardingButtonNo {
    return Intl.message(
      'No gracias, mejor luego',
      name: 'screenInitialProfileOnBoardingButtonNo',
      desc: '',
      args: [],
    );
  }

  /// `Siguiente`
  String get screenInitialProfilePagesButtonNext {
    return Intl.message(
      'Siguiente',
      name: 'screenInitialProfilePagesButtonNext',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo te llamas?`
  String get screenInitialProfilePage1Title {
    return Intl.message(
      '¿Cómo te llamas?',
      name: 'screenInitialProfilePage1Title',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es tu fecha de nacimiento?`
  String get screenInitialProfilePage2Title {
    return Intl.message(
      '¿Cuál es tu fecha de nacimiento?',
      name: 'screenInitialProfilePage2Title',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es tu género?`
  String get screenInitialProfilePage3Title {
    return Intl.message(
      '¿Cuál es tu género?',
      name: 'screenInitialProfilePage3Title',
      desc: '',
      args: [],
    );
  }

  /// `Hombre`
  String get screenInitialProfilePage3Genre3Man {
    return Intl.message(
      'Hombre',
      name: 'screenInitialProfilePage3Genre3Man',
      desc: '',
      args: [],
    );
  }

  /// `Mujer`
  String get screenInitialProfilePage3Genre3Woman {
    return Intl.message(
      'Mujer',
      name: 'screenInitialProfilePage3Genre3Woman',
      desc: '',
      args: [],
    );
  }

  /// `No binario`
  String get screenInitialProfilePage3Genre3NoBinary {
    return Intl.message(
      'No binario',
      name: 'screenInitialProfilePage3Genre3NoBinary',
      desc: '',
      args: [],
    );
  }

  /// `Prefiero no responder`
  String get screenInitialProfilePage3Genre3NoAnswer {
    return Intl.message(
      'Prefiero no responder',
      name: 'screenInitialProfilePage3Genre3NoAnswer',
      desc: '',
      args: [],
    );
  }

  /// `¿En qué momento te encuentras?`
  String get screenInitialProfilePage4Title {
    return Intl.message(
      '¿En qué momento te encuentras?',
      name: 'screenInitialProfilePage4Title',
      desc: '',
      args: [],
    );
  }

  /// `Estoy buscando quedarme embarazada`
  String get screenInitialProfilePage4LookingToGetPregnant {
    return Intl.message(
      'Estoy buscando quedarme embarazada',
      name: 'screenInitialProfilePage4LookingToGetPregnant',
      desc: '',
      args: [],
    );
  }

  /// `Estoy embarazada`
  String get screenInitialProfilePage4MomentImPregnant {
    return Intl.message(
      'Estoy embarazada',
      name: 'screenInitialProfilePage4MomentImPregnant',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es la fecha de tu última menstruación?`
  String get screenInitialProfilePage4MomentImPregnantFormField {
    return Intl.message(
      '¿Cuál es la fecha de tu última menstruación?',
      name: 'screenInitialProfilePage4MomentImPregnantFormField',
      desc: '',
      args: [],
    );
  }

  /// `He sido madre`
  String get screenInitialProfilePage4MomentImAlreadyMother {
    return Intl.message(
      'He sido madre',
      name: 'screenInitialProfilePage4MomentImAlreadyMother',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál ha sido tu fecha de parto?`
  String get screenInitialProfilePage4MomentImAlreadyMotherFormField {
    return Intl.message(
      '¿Cuál ha sido tu fecha de parto?',
      name: 'screenInitialProfilePage4MomentImAlreadyMotherFormField',
      desc: '',
      args: [],
    );
  }

  /// `Soy la pareja de la madre`
  String get screenInitialProfilePage4MomentImTheMothersPartner {
    return Intl.message(
      'Soy la pareja de la madre',
      name: 'screenInitialProfilePage4MomentImTheMothersPartner',
      desc: '',
      args: [],
    );
  }

  /// `Soy profesional de la salud`
  String get screenInitialProfilePage4MomentImAHealthProfessional {
    return Intl.message(
      'Soy profesional de la salud',
      name: 'screenInitialProfilePage4MomentImAHealthProfessional',
      desc: '',
      args: [],
    );
  }

  /// `Ninguna de las anteriores`
  String get screenInitialProfilePage4MomentNoneOfTheAbove {
    return Intl.message(
      'Ninguna de las anteriores',
      name: 'screenInitialProfilePage4MomentNoneOfTheAbove',
      desc: '',
      args: [],
    );
  }

  /// `¡Enhorabuena! ¿Hace cuánto?`
  String get screenInitialProfilePage4MotherTitle {
    return Intl.message(
      '¡Enhorabuena! ¿Hace cuánto?',
      name: 'screenInitialProfilePage4MotherTitle',
      desc: '',
      args: [],
    );
  }

  /// `Acabo de dar a luz (bebé con menos de 30 días)`
  String get screenInitialProfilePage4MotherMonths1_less {
    return Intl.message(
      'Acabo de dar a luz (bebé con menos de 30 días)',
      name: 'screenInitialProfilePage4MotherMonths1_less',
      desc: '',
      args: [],
    );
  }

  /// `De 1 a 3 meses`
  String get screenInitialProfilePage4MotherMonths1_3 {
    return Intl.message(
      'De 1 a 3 meses',
      name: 'screenInitialProfilePage4MotherMonths1_3',
      desc: '',
      args: [],
    );
  }

  /// `De 3 a 6 meses`
  String get screenInitialProfilePage4MotherMonths3_6 {
    return Intl.message(
      'De 3 a 6 meses',
      name: 'screenInitialProfilePage4MotherMonths3_6',
      desc: '',
      args: [],
    );
  }

  /// `De 6 a 9 meses`
  String get screenInitialProfilePage4MotherMonths6_9 {
    return Intl.message(
      'De 6 a 9 meses',
      name: 'screenInitialProfilePage4MotherMonths6_9',
      desc: '',
      args: [],
    );
  }

  /// `De 9 a 12 meses`
  String get screenInitialProfilePage4MotherMonths9_12 {
    return Intl.message(
      'De 9 a 12 meses',
      name: 'screenInitialProfilePage4MotherMonths9_12',
      desc: '',
      args: [],
    );
  }

  /// `De 12 a 24 meses`
  String get screenInitialProfilePage4MotherMonths12_24 {
    return Intl.message(
      'De 12 a 24 meses',
      name: 'screenInitialProfilePage4MotherMonths12_24',
      desc: '',
      args: [],
    );
  }

  /// `De 24 a 36 meses`
  String get screenInitialProfilePage4MotherMonths24_36 {
    return Intl.message(
      'De 24 a 36 meses',
      name: 'screenInitialProfilePage4MotherMonths24_36',
      desc: '',
      args: [],
    );
  }

  /// `Más de 36 meses`
  String get screenInitialProfilePage4MotherMonths36_more {
    return Intl.message(
      'Más de 36 meses',
      name: 'screenInitialProfilePage4MotherMonths36_more',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo está siendo tu experiencia?`
  String get screenInitialProfilePage4MotherExperienceTitle {
    return Intl.message(
      '¿Cómo está siendo tu experiencia?',
      name: 'screenInitialProfilePage4MotherExperienceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Buena, tal y como la había imaginado`
  String get screenInitialProfilePage4MotherExperienceGood {
    return Intl.message(
      'Buena, tal y como la había imaginado',
      name: 'screenInitialProfilePage4MotherExperienceGood',
      desc: '',
      args: [],
    );
  }

  /// `Mucho mejor de lo que pensaba`
  String get screenInitialProfilePage4MotherExperienceVeryGood {
    return Intl.message(
      'Mucho mejor de lo que pensaba',
      name: 'screenInitialProfilePage4MotherExperienceVeryGood',
      desc: '',
      args: [],
    );
  }

  /// `Algo más dura de lo que pensaba`
  String get screenInitialProfilePage4MotherExperienceHard {
    return Intl.message(
      'Algo más dura de lo que pensaba',
      name: 'screenInitialProfilePage4MotherExperienceHard',
      desc: '',
      args: [],
    );
  }

  /// `Mucho más dura de lo que pensaba`
  String get screenInitialProfilePage4MotherExperienceVeryHard {
    return Intl.message(
      'Mucho más dura de lo que pensaba',
      name: 'screenInitialProfilePage4MotherExperienceVeryHard',
      desc: '',
      args: [],
    );
  }

  /// `¡Enhorabuena! ¿De cuántas semanas estás?`
  String get screenInitialProfilePage4PregnantTitle {
    return Intl.message(
      '¡Enhorabuena! ¿De cuántas semanas estás?',
      name: 'screenInitialProfilePage4PregnantTitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo podemos ayudarte?`
  String get screenInitialProfilePage5Title {
    return Intl.message(
      '¿Cómo podemos ayudarte?',
      name: 'screenInitialProfilePage5Title',
      desc: '',
      args: [],
    );
  }

  /// `Mejorar mi estado de ánimo`
  String get screenInitialProfilePage5ImproveMyMood {
    return Intl.message(
      'Mejorar mi estado de ánimo',
      name: 'screenInitialProfilePage5ImproveMyMood',
      desc: '',
      args: [],
    );
  }

  /// `Encontrarme mejor físicamente`
  String get screenInitialProfilePage5FeelBetterPhysically {
    return Intl.message(
      'Encontrarme mejor físicamente',
      name: 'screenInitialProfilePage5FeelBetterPhysically',
      desc: '',
      args: [],
    );
  }

  /// `Compartir experiencias con otras mujeres`
  String get screenInitialProfilePage5ShareExperiences {
    return Intl.message(
      'Compartir experiencias con otras mujeres',
      name: 'screenInitialProfilePage5ShareExperiences',
      desc: '',
      args: [],
    );
  }

  /// `Consultar a profesionales de la salud`
  String get screenInitialProfilePage5ConsultHealthProfessionals {
    return Intl.message(
      'Consultar a profesionales de la salud',
      name: 'screenInitialProfilePage5ConsultHealthProfessionals',
      desc: '',
      args: [],
    );
  }

  /// `Informarme sobre la maternidad`
  String get screenInitialProfilePage5InformationAboutMaternity {
    return Intl.message(
      'Informarme sobre la maternidad',
      name: 'screenInitialProfilePage5InformationAboutMaternity',
      desc: '',
      args: [],
    );
  }

  /// `Otros`
  String get screenInitialProfilePage5Others {
    return Intl.message(
      'Otros',
      name: 'screenInitialProfilePage5Others',
      desc: '',
      args: [],
    );
  }

  /// `Busco información de interés`
  String get screenInitialProfilePage5BisInformation {
    return Intl.message(
      'Busco información de interés',
      name: 'screenInitialProfilePage5BisInformation',
      desc: '',
      args: [],
    );
  }

  /// `Busco sentirme mejor`
  String get screenInitialProfilePage5BisFeelBetter {
    return Intl.message(
      'Busco sentirme mejor',
      name: 'screenInitialProfilePage5BisFeelBetter',
      desc: '',
      args: [],
    );
  }

  /// `Quiero relacionarme con otras madres`
  String get screenInitialProfilePage5BisPersonalRelations {
    return Intl.message(
      'Quiero relacionarme con otras madres',
      name: 'screenInitialProfilePage5BisPersonalRelations',
      desc: '',
      args: [],
    );
  }

  /// `Busco apoyo`
  String get screenInitialProfilePage5BisSupport {
    return Intl.message(
      'Busco apoyo',
      name: 'screenInitialProfilePage5BisSupport',
      desc: '',
      args: [],
    );
  }

  /// `Busco entretenimiento`
  String get screenInitialProfilePage5BisEntertainment {
    return Intl.message(
      'Busco entretenimiento',
      name: 'screenInitialProfilePage5BisEntertainment',
      desc: '',
      args: [],
    );
  }

  /// `No lo sé aún`
  String get screenInitialProfilePage5BisDoNotKnow {
    return Intl.message(
      'No lo sé aún',
      name: 'screenInitialProfilePage5BisDoNotKnow',
      desc: '',
      args: [],
    );
  }

  /// `¿En qué tipo de contenido estás más interesada?`
  String get screenInitialProfilePage6Title {
    return Intl.message(
      '¿En qué tipo de contenido estás más interesada?',
      name: 'screenInitialProfilePage6Title',
      desc: '',
      args: [],
    );
  }

  /// `Gestión emocional`
  String get screenInitialProfilePage6EmotionalManagement {
    return Intl.message(
      'Gestión emocional',
      name: 'screenInitialProfilePage6EmotionalManagement',
      desc: '',
      args: [],
    );
  }

  /// `Yoga`
  String get screenInitialProfilePage6Yoga {
    return Intl.message(
      'Yoga',
      name: 'screenInitialProfilePage6Yoga',
      desc: '',
      args: [],
    );
  }

  /// `Meditación / Mindfulness`
  String get screenInitialProfilePage6Mindfulness {
    return Intl.message(
      'Meditación / Mindfulness',
      name: 'screenInitialProfilePage6Mindfulness',
      desc: '',
      args: [],
    );
  }

  /// `Actividad física / Deporte`
  String get screenInitialProfilePage6Sport {
    return Intl.message(
      'Actividad física / Deporte',
      name: 'screenInitialProfilePage6Sport',
      desc: '',
      args: [],
    );
  }

  /// `Información general`
  String get screenInitialProfilePage6GeneralInformation {
    return Intl.message(
      'Información general',
      name: 'screenInitialProfilePage6GeneralInformation',
      desc: '',
      args: [],
    );
  }

  /// `Información científica`
  String get screenInitialProfilePage6ScientificInformation {
    return Intl.message(
      'Información científica',
      name: 'screenInitialProfilePage6ScientificInformation',
      desc: '',
      args: [],
    );
  }

  /// `¿Qué aspectos te interesan?`
  String get screenInitialProfilePage7Title {
    return Intl.message(
      '¿Qué aspectos te interesan?',
      name: 'screenInitialProfilePage7Title',
      desc: '',
      args: [],
    );
  }

  /// `Ansiedad`
  String get screenInitialProfilePage7Anxiety {
    return Intl.message(
      'Ansiedad',
      name: 'screenInitialProfilePage7Anxiety',
      desc: '',
      args: [],
    );
  }

  /// `Miedo`
  String get screenInitialProfilePage7Afraid {
    return Intl.message(
      'Miedo',
      name: 'screenInitialProfilePage7Afraid',
      desc: '',
      args: [],
    );
  }

  /// `Culpa`
  String get screenInitialProfilePage7Fault {
    return Intl.message(
      'Culpa',
      name: 'screenInitialProfilePage7Fault',
      desc: '',
      args: [],
    );
  }

  /// `Autocuidado`
  String get screenInitialProfilePage7SelfCare {
    return Intl.message(
      'Autocuidado',
      name: 'screenInitialProfilePage7SelfCare',
      desc: '',
      args: [],
    );
  }

  /// `Nutrición`
  String get screenInitialProfilePage7Nutrition {
    return Intl.message(
      'Nutrición',
      name: 'screenInitialProfilePage7Nutrition',
      desc: '',
      args: [],
    );
  }

  /// `Soledad`
  String get screenInitialProfilePage7Loneliness {
    return Intl.message(
      'Soledad',
      name: 'screenInitialProfilePage7Loneliness',
      desc: '',
      args: [],
    );
  }

  /// `Tristeza`
  String get screenInitialProfilePage7Sadness {
    return Intl.message(
      'Tristeza',
      name: 'screenInitialProfilePage7Sadness',
      desc: '',
      args: [],
    );
  }

  /// `Vínculo con el bebé`
  String get screenInitialProfilePage7BabyLink {
    return Intl.message(
      'Vínculo con el bebé',
      name: 'screenInitialProfilePage7BabyLink',
      desc: '',
      args: [],
    );
  }

  /// `Calidad del sueño`
  String get screenInitialProfilePage7SleepQuality {
    return Intl.message(
      'Calidad del sueño',
      name: 'screenInitialProfilePage7SleepQuality',
      desc: '',
      args: [],
    );
  }

  /// `Relación de pareja`
  String get screenInitialProfilePage7Relationship {
    return Intl.message(
      'Relación de pareja',
      name: 'screenInitialProfilePage7Relationship',
      desc: '',
      args: [],
    );
  }

  /// `Otros`
  String get screenInitialProfilePage7Others {
    return Intl.message(
      'Otros',
      name: 'screenInitialProfilePage7Others',
      desc: '',
      args: [],
    );
  }

  /// `¿Alguna vez has acudido a terapia psicológica?`
  String get screenInitialProfilePage8Title {
    return Intl.message(
      '¿Alguna vez has acudido a terapia psicológica?',
      name: 'screenInitialProfilePage8Title',
      desc: '',
      args: [],
    );
  }

  /// `Nunca y tampoco me interesa`
  String get screenInitialProfilePage8NeverAndNotInterested {
    return Intl.message(
      'Nunca y tampoco me interesa',
      name: 'screenInitialProfilePage8NeverAndNotInterested',
      desc: '',
      args: [],
    );
  }

  /// `No y me podría interesar`
  String get screenInitialProfilePage8NoAndInterested {
    return Intl.message(
      'No y me podría interesar',
      name: 'screenInitialProfilePage8NoAndInterested',
      desc: '',
      args: [],
    );
  }

  /// `Sí, anteriormente aunque ya no`
  String get screenInitialProfilePage8YesPreviously {
    return Intl.message(
      'Sí, anteriormente aunque ya no',
      name: 'screenInitialProfilePage8YesPreviously',
      desc: '',
      args: [],
    );
  }

  /// `Sí, actualmente sigo acudiendo`
  String get screenInitialProfilePage8YesCurrently {
    return Intl.message(
      'Sí, actualmente sigo acudiendo',
      name: 'screenInitialProfilePage8YesCurrently',
      desc: '',
      args: [],
    );
  }

  /// `¿Alguna vez has participado en grupos de apoyo?`
  String get screenInitialProfilePage9Title {
    return Intl.message(
      '¿Alguna vez has participado en grupos de apoyo?',
      name: 'screenInitialProfilePage9Title',
      desc: '',
      args: [],
    );
  }

  /// `(Maternidad, lactancia, etc.)`
  String get screenInitialProfilePage9SubTitle {
    return Intl.message(
      '(Maternidad, lactancia, etc.)',
      name: 'screenInitialProfilePage9SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nunca y tampoco me interesa`
  String get screenInitialProfilePage9NeverAndNotInterested {
    return Intl.message(
      'Nunca y tampoco me interesa',
      name: 'screenInitialProfilePage9NeverAndNotInterested',
      desc: '',
      args: [],
    );
  }

  /// `No y me podría interesar`
  String get screenInitialProfilePage9NoAndInterested {
    return Intl.message(
      'No y me podría interesar',
      name: 'screenInitialProfilePage9NoAndInterested',
      desc: '',
      args: [],
    );
  }

  /// `Sí, anteriormente aunque ya no`
  String get screenInitialProfilePage9YesPreviously {
    return Intl.message(
      'Sí, anteriormente aunque ya no',
      name: 'screenInitialProfilePage9YesPreviously',
      desc: '',
      args: [],
    );
  }

  /// `Sí, actualmente sigo acudiendo`
  String get screenInitialProfilePage9YesCurrently {
    return Intl.message(
      'Sí, actualmente sigo acudiendo',
      name: 'screenInitialProfilePage9YesCurrently',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona todo lo que te interese`
  String get screenInitialProfilePageSelectAll {
    return Intl.message(
      'Selecciona todo lo que te interese',
      name: 'screenInitialProfilePageSelectAll',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona las {max} más importantes para ti`
  String screenInitialProfilePageSelectMax(Object max) {
    return Intl.message(
      'Selecciona las $max más importantes para ti',
      name: 'screenInitialProfilePageSelectMax',
      desc: '',
      args: [max],
    );
  }

  /// `Es mi primer hijo/a`
  String get screenInitialProfilePageChildCountIsFirstChildText {
    return Intl.message(
      'Es mi primer hijo/a',
      name: 'screenInitialProfilePageChildCountIsFirstChildText',
      desc: '',
      args: [],
    );
  }

  /// `Tengo más hijos/as`
  String get screenInitialProfilePageChildCountIsNotFirstChildText {
    return Intl.message(
      'Tengo más hijos/as',
      name: 'screenInitialProfilePageChildCountIsNotFirstChildText',
      desc: '',
      args: [],
    );
  }

  /// `Indica aquí cuántos hijos/as tienes`
  String get screenInitialProfilePageChildTextInputText {
    return Intl.message(
      'Indica aquí cuántos hijos/as tienes',
      name: 'screenInitialProfilePageChildTextInputText',
      desc: '',
      args: [],
    );
  }

  /// `Perfil`
  String get screenProfileViewBarTitle {
    return Intl.message(
      'Perfil',
      name: 'screenProfileViewBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mi perfil`
  String get screenProfileViewTitle {
    return Intl.message(
      'Mi perfil',
      name: 'screenProfileViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get screenProfileViewEmail {
    return Intl.message(
      'Email',
      name: 'screenProfileViewEmail',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de nacimiento`
  String get screenProfileViewBirthday {
    return Intl.message(
      'Fecha de nacimiento',
      name: 'screenProfileViewBirthday',
      desc: '',
      args: [],
    );
  }

  /// `Género`
  String get screenProfileViewGenre {
    return Intl.message(
      'Género',
      name: 'screenProfileViewGenre',
      desc: '',
      args: [],
    );
  }

  /// `Estado`
  String get screenProfileViewMoment {
    return Intl.message(
      'Estado',
      name: 'screenProfileViewMoment',
      desc: '',
      args: [],
    );
  }

  /// `Semana embarazo`
  String get screenProfileViewPregnantWeek {
    return Intl.message(
      'Semana embarazo',
      name: 'screenProfileViewPregnantWeek',
      desc: '',
      args: [],
    );
  }

  /// `Meses bebé`
  String get screenProfileViewMotherMonths {
    return Intl.message(
      'Meses bebé',
      name: 'screenProfileViewMotherMonths',
      desc: '',
      args: [],
    );
  }

  /// `Editar perfil`
  String get screenProfileViewButtonEditProfile {
    return Intl.message(
      'Editar perfil',
      name: 'screenProfileViewButtonEditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Sobre Dana`
  String get screenProfileViewAboutApp {
    return Intl.message(
      'Sobre Dana',
      name: 'screenProfileViewAboutApp',
      desc: '',
      args: [],
    );
  }

  /// `¡Bienvenida!`
  String get screenProfileViewLinkWelcome {
    return Intl.message(
      '¡Bienvenida!',
      name: 'screenProfileViewLinkWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Comparte Dana`
  String get screenProfileViewLinkShareApp {
    return Intl.message(
      'Comparte Dana',
      name: 'screenProfileViewLinkShareApp',
      desc: '',
      args: [],
    );
  }

  /// `Quiero darme de baja`
  String get screenProfileViewLinkDeleteAccount {
    return Intl.message(
      'Quiero darme de baja',
      name: 'screenProfileViewLinkDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda`
  String get screenProfileViewLinkHelp {
    return Intl.message(
      'Ayuda',
      name: 'screenProfileViewLinkHelp',
      desc: '',
      args: [],
    );
  }

  /// `Contacto`
  String get screenProfileViewLinkContact {
    return Intl.message(
      'Contacto',
      name: 'screenProfileViewLinkContact',
      desc: '',
      args: [],
    );
  }

  /// `Privacidad`
  String get screenProfileViewLinkPrivacity {
    return Intl.message(
      'Privacidad',
      name: 'screenProfileViewLinkPrivacity',
      desc: '',
      args: [],
    );
  }

  /// `Términos y Condiciones`
  String get screenProfileViewLinkTermsConditions {
    return Intl.message(
      'Términos y Condiciones',
      name: 'screenProfileViewLinkTermsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Política de Cookies`
  String get screenProfileViewLinkCookies {
    return Intl.message(
      'Política de Cookies',
      name: 'screenProfileViewLinkCookies',
      desc: '',
      args: [],
    );
  }

  /// `Somos 1.000 colibrís`
  String get screenProfileViewLinkCollaborators {
    return Intl.message(
      'Somos 1.000 colibrís',
      name: 'screenProfileViewLinkCollaborators',
      desc: '',
      args: [],
    );
  }

  /// `La ciencia detrás de Dana`
  String get screenProfileViewLinkScienceBehindDana {
    return Intl.message(
      'La ciencia detrás de Dana',
      name: 'screenProfileViewLinkScienceBehindDana',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get screenProfileViewLogout {
    return Intl.message(
      'Log out',
      name: 'screenProfileViewLogout',
      desc: '',
      args: [],
    );
  }

  /// `Valóranos`
  String get screenProfileViewRate {
    return Intl.message(
      'Valóranos',
      name: 'screenProfileViewRate',
      desc: '',
      args: [],
    );
  }

  /// `¿Seguro que quieres cerrar la sesión?`
  String get screenProfileTitleLogout {
    return Intl.message(
      '¿Seguro que quieres cerrar la sesión?',
      name: 'screenProfileTitleLogout',
      desc: '',
      args: [],
    );
  }

  /// `Sí`
  String get yesText {
    return Intl.message(
      'Sí',
      name: 'yesText',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get noText {
    return Intl.message(
      'No',
      name: 'noText',
      desc: '',
      args: [],
    );
  }

  /// `Sentimos ver que te marchas.`
  String get screenProfileTitleFirstDeleteAccount {
    return Intl.message(
      'Sentimos ver que te marchas.',
      name: 'screenProfileTitleFirstDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Si te das de baja en la aplicación, perderás el acceso a tu cuenta y a cualquier información o actividad previa que hayas generado en la aplicación.`
  String get screenProfileDescriptionFirstDeleteAccount {
    return Intl.message(
      'Si te das de baja en la aplicación, perderás el acceso a tu cuenta y a cualquier información o actividad previa que hayas generado en la aplicación.',
      name: 'screenProfileDescriptionFirstDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// ` ¿Seguro que quieres darte de baja?`
  String get screenProfileTitleDeleteAccount {
    return Intl.message(
      ' ¿Seguro que quieres darte de baja?',
      name: 'screenProfileTitleDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Esta acción es irreversible y con ello de eliminarán tus datos de forma permanente.`
  String get screenProfileDescriptionDeleteAccount {
    return Intl.message(
      'Esta acción es irreversible y con ello de eliminarán tus datos de forma permanente.',
      name: 'screenProfileDescriptionDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Tu solicitud ha sido enviada`
  String get screenProfileSecondTitleDeleteAccount {
    return Intl.message(
      'Tu solicitud ha sido enviada',
      name: 'screenProfileSecondTitleDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Hemos recibido tu solicitud, te enviaremos un email confirmando tu baja`
  String get screenProfileSecondDescriptionDeleteAccount {
    return Intl.message(
      'Hemos recibido tu solicitud, te enviaremos un email confirmando tu baja',
      name: 'screenProfileSecondDescriptionDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Dadme de baja`
  String get screenProfileConfirmDeleteAccount {
    return Intl.message(
      'Dadme de baja',
      name: 'screenProfileConfirmDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `De acuerdo`
  String get screenProfileSecondConfirmDeleteAccount {
    return Intl.message(
      'De acuerdo',
      name: 'screenProfileSecondConfirmDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Quiero permanecer`
  String get screenProfileCancelDeleteAccount {
    return Intl.message(
      'Quiero permanecer',
      name: 'screenProfileCancelDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Editar perfil`
  String get screenEditProfileBarTitle {
    return Intl.message(
      'Editar perfil',
      name: 'screenEditProfileBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Editar mi Perfil`
  String get screenEditProfileTitle {
    return Intl.message(
      'Editar mi Perfil',
      name: 'screenEditProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Guardar`
  String get screenEditProfileButtonSave {
    return Intl.message(
      'Guardar',
      name: 'screenEditProfileButtonSave',
      desc: '',
      args: [],
    );
  }

  /// `Autocuidado`
  String get screenTrackingBarTitle {
    return Intl.message(
      'Autocuidado',
      name: 'screenTrackingBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hoy te\nencuentras`
  String get screenTrackingTodayYouAre {
    return Intl.message(
      'Hoy te\nencuentras',
      name: 'screenTrackingTodayYouAre',
      desc: '',
      args: [],
    );
  }

  /// `Tu diario`
  String get screenTrackingYourDiary {
    return Intl.message(
      'Tu diario',
      name: 'screenTrackingYourDiary',
      desc: '',
      args: [],
    );
  }

  /// `Hola,`
  String get screenTrackingHi {
    return Intl.message(
      'Hola,',
      name: 'screenTrackingHi',
      desc: '',
      args: [],
    );
  }

  /// `Editar estado`
  String get screenTrackingButtonEditState {
    return Intl.message(
      'Editar estado',
      name: 'screenTrackingButtonEditState',
      desc: '',
      args: [],
    );
  }

  /// `Mi Diario`
  String get screenTrackingMyDiaryTitle {
    return Intl.message(
      'Mi Diario',
      name: 'screenTrackingMyDiaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `cuéntame, ¿cómo estás hoy?`
  String get screenTrackingStateQuestion {
    return Intl.message(
      'cuéntame, ¿cómo estás hoy?',
      name: 'screenTrackingStateQuestion',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo estás hoy?`
  String get screenTrackingCheckInQuestion {
    return Intl.message(
      '¿Cómo estás hoy?',
      name: 'screenTrackingCheckInQuestion',
      desc: '',
      args: [],
    );
  }

  /// `¡Genial! Anotado.`
  String get screenHomePageChipMoodReady {
    return Intl.message(
      '¡Genial! Anotado.',
      name: 'screenHomePageChipMoodReady',
      desc: '',
      args: [],
    );
  }

  /// `Hagamos el check-in`
  String get screenHomePageChipMoodCheckin {
    return Intl.message(
      'Hagamos el check-in',
      name: 'screenHomePageChipMoodCheckin',
      desc: '',
      args: [],
    );
  }

  /// `¡Perfecto! Lo tenemos.`
  String get screenHomePageChipProfileReady {
    return Intl.message(
      '¡Perfecto! Lo tenemos.',
      name: 'screenHomePageChipProfileReady',
      desc: '',
      args: [],
    );
  }

  /// `Genial, estás lista!`
  String get screenHomePageChipProfileOpen {
    return Intl.message(
      'Genial, estás lista!',
      name: 'screenHomePageChipProfileOpen',
      desc: '',
      args: [],
    );
  }

  /// `cuéntame, ¿cómo estás hoy?`
  String get screenHomePageStateQuestion {
    return Intl.message(
      'cuéntame, ¿cómo estás hoy?',
      name: 'screenHomePageStateQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Hola`
  String get screenHomePageHi {
    return Intl.message(
      'Hola',
      name: 'screenHomePageHi',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get cupertinoDatePickerButton {
    return Intl.message(
      'OK',
      name: 'cupertinoDatePickerButton',
      desc: '',
      args: [],
    );
  }

  /// `Regálate un \nmomento para ti`
  String get widgetPremiumDialogTitle {
    return Intl.message(
      'Regálate un \nmomento para ti',
      name: 'widgetPremiumDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Accede a +200 contenidos para\ntu cuidado`
  String get widgetPremiumDialogFeature1 {
    return Intl.message(
      'Accede a +200 contenidos para\ntu cuidado',
      name: 'widgetPremiumDialogFeature1',
      desc: '',
      args: [],
    );
  }

  /// `Sigue tu bienestar diario`
  String get widgetPremiumDialogFeature2 {
    return Intl.message(
      'Sigue tu bienestar diario',
      name: 'widgetPremiumDialogFeature2',
      desc: '',
      args: [],
    );
  }

  /// `Audios y textos creados por expertos`
  String get widgetPremiumDialogFeature3 {
    return Intl.message(
      'Audios y textos creados por expertos',
      name: 'widgetPremiumDialogFeature3',
      desc: '',
      args: [],
    );
  }

  /// `Nuevos programas cada semana`
  String get widgetPremiumDialogFeature4 {
    return Intl.message(
      'Nuevos programas cada semana',
      name: 'widgetPremiumDialogFeature4',
      desc: '',
      args: [],
    );
  }

  /// `¡Disfruta de los 14 días de prueba!`
  String get widgetPremiumDialogFeature5 {
    return Intl.message(
      '¡Disfruta de los 14 días de prueba!',
      name: 'widgetPremiumDialogFeature5',
      desc: '',
      args: [],
    );
  }

  /// `Mensual`
  String get widgetPremiumDialogMonthly {
    return Intl.message(
      'Mensual',
      name: 'widgetPremiumDialogMonthly',
      desc: '',
      args: [],
    );
  }

  /// `al mes`
  String get widgetPremiumDialogByMonth {
    return Intl.message(
      'al mes',
      name: 'widgetPremiumDialogByMonth',
      desc: '',
      args: [],
    );
  }

  /// `Anual`
  String get widgetPremiumDialogAnnually {
    return Intl.message(
      'Anual',
      name: 'widgetPremiumDialogAnnually',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar prueba y suscribirme`
  String get widgetPremiumDialogPositiveButtonTitle {
    return Intl.message(
      'Iniciar prueba y suscribirme',
      name: 'widgetPremiumDialogPositiveButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `No gracias, más tarde`
  String get widgetPremiumDialogNegativeButtonTitle {
    return Intl.message(
      'No gracias, más tarde',
      name: 'widgetPremiumDialogNegativeButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Suscribiéndome acepto los terminos y condiciones y la política de privacidad`
  String get widgetPremiumDialogPrivacyTerms {
    return Intl.message(
      'Suscribiéndome acepto los terminos y condiciones y la política de privacidad',
      name: 'widgetPremiumDialogPrivacyTerms',
      desc: '',
      args: [],
    );
  }

  /// `¡Te premiamos por ser una de las primeras en querer suscribirte!`
  String get widgetPremiumDialogSuccessTitle {
    return Intl.message(
      '¡Te premiamos por ser una de las primeras en querer suscribirte!',
      name: 'widgetPremiumDialogSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Accede a todos los contenidos y funcionalidades actuales de forma gratuita. `
  String get widgetPremiumDialogSuccessDescription1 {
    return Intl.message(
      'Accede a todos los contenidos y funcionalidades actuales de forma gratuita. ',
      name: 'widgetPremiumDialogSuccessDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Te avisaré cuando activemos la opción premium para que decidas si quieres suscribirte.`
  String get widgetPremiumDialogSuccessDescription2 {
    return Intl.message(
      'Te avisaré cuando activemos la opción premium para que decidas si quieres suscribirte.',
      name: 'widgetPremiumDialogSuccessDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Cuida de ti y disfrútalo.`
  String get widgetPremiumDialogSuccessDescription3 {
    return Intl.message(
      'Cuida de ti y disfrútalo.',
      name: 'widgetPremiumDialogSuccessDescription3',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo te sientes hoy?`
  String get widgetMoodTrackerDialogTitle1 {
    return Intl.message(
      '¿Cómo te sientes hoy?',
      name: 'widgetMoodTrackerDialogTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Tu estado de ánimo cambia, pero lo importante es cómo te sientes ahora.`
  String get widgetMoodTrackerDialogSubtitle1 {
    return Intl.message(
      'Tu estado de ánimo cambia, pero lo importante es cómo te sientes ahora.',
      name: 'widgetMoodTrackerDialogSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `¿quieres compartir un poco más sobre ello?`
  String get widgetMoodTrackerDialogTitle2 {
    return Intl.message(
      '¿quieres compartir un poco más sobre ello?',
      name: 'widgetMoodTrackerDialogTitle2',
      desc: '',
      args: [],
    );
  }

  /// `describe aquí lo más relevante para ti hoy`
  String get widgetMoodTrackerDialogAnswer1Placeholder {
    return Intl.message(
      'describe aquí lo más relevante para ti hoy',
      name: 'widgetMoodTrackerDialogAnswer1Placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Autocuidado`
  String get widgetMoodTrackerDialogBarTitle {
    return Intl.message(
      'Autocuidado',
      name: 'widgetMoodTrackerDialogBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Listo!`
  String get widgetMoodTrackerDialogButtonSave {
    return Intl.message(
      '¡Listo!',
      name: 'widgetMoodTrackerDialogButtonSave',
      desc: '',
      args: [],
    );
  }

  /// `Fatal`
  String get widgetMoodTrackerDialogEmotion1 {
    return Intl.message(
      'Fatal',
      name: 'widgetMoodTrackerDialogEmotion1',
      desc: '',
      args: [],
    );
  }

  /// `Mal`
  String get widgetMoodTrackerDialogEmotion2 {
    return Intl.message(
      'Mal',
      name: 'widgetMoodTrackerDialogEmotion2',
      desc: '',
      args: [],
    );
  }

  /// `Meh`
  String get widgetMoodTrackerDialogEmotion3 {
    return Intl.message(
      'Meh',
      name: 'widgetMoodTrackerDialogEmotion3',
      desc: '',
      args: [],
    );
  }

  /// `Bien`
  String get widgetMoodTrackerDialogEmotion4 {
    return Intl.message(
      'Bien',
      name: 'widgetMoodTrackerDialogEmotion4',
      desc: '',
      args: [],
    );
  }

  /// `Increíble`
  String get widgetMoodTrackerDialogEmotion5 {
    return Intl.message(
      'Increíble',
      name: 'widgetMoodTrackerDialogEmotion5',
      desc: '',
      args: [],
    );
  }

  /// `Mi semana`
  String get widgetMoodTrackerWeekTitle {
    return Intl.message(
      'Mi semana',
      name: 'widgetMoodTrackerWeekTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Genial! tu estado de\nánimo se ha guardado\ncorrectamente`
  String get widgetMoodTrackerDialogSuccessTitle {
    return Intl.message(
      '¡Genial! tu estado de\nánimo se ha guardado\ncorrectamente',
      name: 'widgetMoodTrackerDialogSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Quiero ver mi evolución!`
  String get widgetMoodTrackerDialogSuccessButton1 {
    return Intl.message(
      '¡Quiero ver mi evolución!',
      name: 'widgetMoodTrackerDialogSuccessButton1',
      desc: '',
      args: [],
    );
  }

  /// `Prefiero volver a los programas`
  String get widgetMoodTrackerDialogSuccessButton2 {
    return Intl.message(
      'Prefiero volver a los programas',
      name: 'widgetMoodTrackerDialogSuccessButton2',
      desc: '',
      args: [],
    );
  }

  /// `Me paso por la comunidad`
  String get widgetMoodTrackerDialogSuccessButton3 {
    return Intl.message(
      'Me paso por la comunidad',
      name: 'widgetMoodTrackerDialogSuccessButton3',
      desc: '',
      args: [],
    );
  }

  /// `¡Gracias!`
  String get widgetDialogRegisterSuccessTitle {
    return Intl.message(
      '¡Gracias!',
      name: 'widgetDialogRegisterSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tu perfil ya está completo ahora puedes relajarte y disfrutar de la app`
  String get widgetDialogRegisterSuccessDescription {
    return Intl.message(
      'Tu perfil ya está completo ahora puedes relajarte y disfrutar de la app',
      name: 'widgetDialogRegisterSuccessDescription',
      desc: '',
      args: [],
    );
  }

  /// `¡Empecemos!`
  String get widgetDialogRegisterSuccessButton {
    return Intl.message(
      '¡Empecemos!',
      name: 'widgetDialogRegisterSuccessButton',
      desc: '',
      args: [],
    );
  }

  /// `Autoevaluación`
  String get widgetDialogProgramEvaluationLevel {
    return Intl.message(
      'Autoevaluación',
      name: 'widgetDialogProgramEvaluationLevel',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get widgetDialogProgramEvaluationButton {
    return Intl.message(
      'Continuar',
      name: 'widgetDialogProgramEvaluationButton',
      desc: '',
      args: [],
    );
  }

  /// `Tu estado de ánimo durante esta última semana`
  String get widgetMoodTrackerWeekSubtitle {
    return Intl.message(
      'Tu estado de ánimo durante esta última semana',
      name: 'widgetMoodTrackerWeekSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Your profile is incomplete, click here to complete it`
  String get widgetRememberProfileMessage {
    return Intl.message(
      'Your profile is incomplete, click here to complete it',
      name: 'widgetRememberProfileMessage',
      desc: '',
      args: [],
    );
  }

  /// `Muchas gracias por compartir tus emociones conmigo`
  String get widgetMoodTrackerDialogSuccessMessage {
    return Intl.message(
      'Muchas gracias por compartir tus emociones conmigo',
      name: 'widgetMoodTrackerDialogSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cargando`
  String get widgetUnitItemLoading {
    return Intl.message(
      'Cargando',
      name: 'widgetUnitItemLoading',
      desc: '',
      args: [],
    );
  }

  /// `Progreso `
  String get widgetProgramItemProgress {
    return Intl.message(
      'Progreso ',
      name: 'widgetProgramItemProgress',
      desc: '',
      args: [],
    );
  }

  /// `¡Programa completado!`
  String get widgetProgramItemProgressCompleted {
    return Intl.message(
      '¡Programa completado!',
      name: 'widgetProgramItemProgressCompleted',
      desc: '',
      args: [],
    );
  }

  /// `¿Te ha parecido útil?`
  String get widgetUnitFooterUsefulQuestion {
    return Intl.message(
      '¿Te ha parecido útil?',
      name: 'widgetUnitFooterUsefulQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get widgetUnitFooterContinue {
    return Intl.message(
      'Continuar',
      name: 'widgetUnitFooterContinue',
      desc: '',
      args: [],
    );
  }

  /// `Siguiente Unidad`
  String get widgetUnitFooterNextUnit {
    return Intl.message(
      'Siguiente Unidad',
      name: 'widgetUnitFooterNextUnit',
      desc: '',
      args: [],
    );
  }

  /// `{contentTime} min`
  String widgetUnitItemContentTime(Object contentTime) {
    return Intl.message(
      '$contentTime min',
      name: 'widgetUnitItemContentTime',
      desc: '',
      args: [contentTime],
    );
  }

  /// `Sobre este tema, ¿cómo te sientes?`
  String get widgetProgramEvaluationDialogInitialEvaluationTitle {
    return Intl.message(
      'Sobre este tema, ¿cómo te sientes?',
      name: 'widgetProgramEvaluationDialogInitialEvaluationTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Enhorabuena por completar este programa!`
  String get widgetProgramEvaluationDialogEndProgramTitle {
    return Intl.message(
      '¡Enhorabuena por completar este programa!',
      name: 'widgetProgramEvaluationDialogEndProgramTitle',
      desc: '',
      args: [],
    );
  }

  /// `Antes de empezar, valora cómo te sientes en relación a `
  String get widgetProgramEvaluationDialogInitialEvaluationSubtitle {
    return Intl.message(
      'Antes de empezar, valora cómo te sientes en relación a ',
      name: 'widgetProgramEvaluationDialogInitialEvaluationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Ahora que has finalizado, desliza para valorar cómo te sientes en relación a `
  String get widgetProgramEvaluationDialogEndProgramSubtitle {
    return Intl.message(
      'Ahora que has finalizado, desliza para valorar cómo te sientes en relación a ',
      name: 'widgetProgramEvaluationDialogEndProgramSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{number}`
  String formattedPrice(double number) {
    final NumberFormat numberNumberFormat = NumberFormat.simpleCurrency(
        locale: Intl.getCurrentLocale(), name: 'EUR');
    final String numberString = numberNumberFormat.format(number);

    return Intl.message(
      '$numberString',
      name: 'formattedPrice',
      desc: '',
      args: [numberString],
    );
  }

  /// `{number}`
  String formattedPriceNoDecimals(int number) {
    final NumberFormat numberNumberFormat = NumberFormat.simpleCurrency(
        locale: Intl.getCurrentLocale(), name: 'EUR', decimalDigits: 0);
    final String numberString = numberNumberFormat.format(number);

    return Intl.message(
      '$numberString',
      name: 'formattedPriceNoDecimals',
      desc: '',
      args: [numberString],
    );
  }

  /// `{number}`
  String percentNumber(double number) {
    final NumberFormat numberNumberFormat =
        NumberFormat.percentPattern(Intl.getCurrentLocale());
    final String numberString = numberNumberFormat.format(number);

    return Intl.message(
      '$numberString',
      name: 'percentNumber',
      desc: '',
      args: [numberString],
    );
  }

  /// `Empezar`
  String get premiumDialogSuccessStart {
    return Intl.message(
      'Empezar',
      name: 'premiumDialogSuccessStart',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo estás hoy?`
  String get widgetMoodTodayQuestionTitle {
    return Intl.message(
      '¿Cómo estás hoy?',
      name: 'widgetMoodTodayQuestionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Completa el diario emocional de hoy, te ayudará a hacerte seguimiento`
  String get widgetMoodTodayQuestionDescription {
    return Intl.message(
      'Completa el diario emocional de hoy, te ayudará a hacerte seguimiento',
      name: 'widgetMoodTodayQuestionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe algo`
  String get moodTrackerDialogWidgetWriteSomething {
    return Intl.message(
      'Por favor, escribe algo',
      name: 'moodTrackerDialogWidgetWriteSomething',
      desc: '',
      args: [],
    );
  }

  /// `Hola, acabo de descubrir Dana ¡mira qué interesante! https://www.dana-app.com/`
  String get pageProfileShareMessage {
    return Intl.message(
      'Hola, acabo de descubrir Dana ¡mira qué interesante! https://www.dana-app.com/',
      name: 'pageProfileShareMessage',
      desc: '',
      args: [],
    );
  }

  /// `Dana`
  String get pageProfileShareSubject {
    return Intl.message(
      'Dana',
      name: 'pageProfileShareSubject',
      desc: '',
      args: [],
    );
  }

  /// `¡Bienvenida a Dana!`
  String get pageLinkContentWelcomeTitle {
    return Intl.message(
      '¡Bienvenida a Dana!',
      name: 'pageLinkContentWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Si estás aquí, es porque has decidido explorar temas relacionados con la matrescencia y mejorar tu propia experiencia como madre o futura madre, así que ¡enhorabuena! Nos alegramos de poder darte la bienvenida :).`
  String get pageLinkContentWelcomeMessage {
    return Intl.message(
      'Si estás aquí, es porque has decidido explorar temas relacionados con la matrescencia y mejorar tu propia experiencia como madre o futura madre, así que ¡enhorabuena! Nos alegramos de poder darte la bienvenida :).',
      name: 'pageLinkContentWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `La matrescencia`
  String get pageLinkContentWelcomeMatrescenceTitle {
    return Intl.message(
      'La matrescencia',
      name: 'pageLinkContentWelcomeMatrescenceTitle',
      desc: '',
      args: [],
    );
  }

  /// `El término "matrescencia" fue acuñado en los años 70 por Dana Raphael, antropóloga especializada en la maternidad, y éste define el proceso de convertirse en madre. El término "Matrescencia" se usa para describir los cambios físicos, psicológicos, emocionales y sociales que atraviesan las mujeres durante la gran transformación que es el paso a la maternidad.\n\nExperimentar la matrescencia conlleva nuevos retos y grandes aprendizajes, que difícilmente se encuentran explicados en libros o cursos.`
  String get pageLinkContentWelcomeMatrescenceDescription {
    return Intl.message(
      'El término "matrescencia" fue acuñado en los años 70 por Dana Raphael, antropóloga especializada en la maternidad, y éste define el proceso de convertirse en madre. El término "Matrescencia" se usa para describir los cambios físicos, psicológicos, emocionales y sociales que atraviesan las mujeres durante la gran transformación que es el paso a la maternidad.\n\nExperimentar la matrescencia conlleva nuevos retos y grandes aprendizajes, que difícilmente se encuentran explicados en libros o cursos.',
      name: 'pageLinkContentWelcomeMatrescenceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Dana`
  String get pageLinkContentWelcomeDanaTitle {
    return Intl.message(
      'Dana',
      name: 'pageLinkContentWelcomeDanaTitle',
      desc: '',
      args: [],
    );
  }

  /// `En agradecimiento a todo el trabajo realizado por Dana Raphael, hemos decidido dar el nombre de Dana a este asistente digital que te acompañara en este viaje. Dana te ofrecerá una guía personalizada para tu vivencia de maternidad, proporcionándote acceso a contenidos, experiencias de otras madres, contacto con profesionales, etc.\n\nHemos lanzado el proyecto de Dana en septiembre del 2020, unidos por el sueño de conseguir una mejora substancial de la salud y del bienestar de las mujeres que se convierten en madres. Nuestro equipo de profesionales de la salud maternal compuesto por ginecólogos, pediatras, matronas, psicólogos perinatales y otros especialistas del bienestar general, han trabajado para que Dana ofrezca una visión holística e integral de la maternidad.`
  String get pageLinkContentWelcomeDanaDescription {
    return Intl.message(
      'En agradecimiento a todo el trabajo realizado por Dana Raphael, hemos decidido dar el nombre de Dana a este asistente digital que te acompañara en este viaje. Dana te ofrecerá una guía personalizada para tu vivencia de maternidad, proporcionándote acceso a contenidos, experiencias de otras madres, contacto con profesionales, etc.\n\nHemos lanzado el proyecto de Dana en septiembre del 2020, unidos por el sueño de conseguir una mejora substancial de la salud y del bienestar de las mujeres que se convierten en madres. Nuestro equipo de profesionales de la salud maternal compuesto por ginecólogos, pediatras, matronas, psicólogos perinatales y otros especialistas del bienestar general, han trabajado para que Dana ofrezca una visión holística e integral de la maternidad.',
      name: 'pageLinkContentWelcomeDanaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Dana es un proyecto de impacto social`
  String get pageLinkContentWelcomeSocialImpactTitle {
    return Intl.message(
      'Dana es un proyecto de impacto social',
      name: 'pageLinkContentWelcomeSocialImpactTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nuestro propósito es mejorar la salud y el bienestar de las mujeres que se convierten en madres. Si el éxito se mide por cómo podemos transformar positivamente la vida de las madres y en consecuencia, tener un impacto directo en el bienestar de sus bebés, esperamos ser tremendamente exitosos: por ti y por todas las mujeres, por sus parejas y familiares, y por los bebés que llegan al mundo.\n\nLas familias sanas son la base de una sociedad sana. Las madres desempeñan un papel fundamental: una madre sana y feliz garantiza el mejor comienzo en la vida para el bebé.\n\nLa maternidad es un momento de transformación, tanto para la madre como para su pareja y la familia, para el que a menudo no se cuenta con el apoyo necesario.\n\nQueremos ofrecer ese apoyo desde un enfoque integral de las necesidades de la maternidad, para mejorar la salud mental y el bienestar integral de la madre, sus parejas y sus bebés, previniendo así posibles escenarios que a veces empañan esta experiencia que puede resultar tan empoderante.`
  String get pageLinkContentWelcomeSocialImpactDescription {
    return Intl.message(
      'Nuestro propósito es mejorar la salud y el bienestar de las mujeres que se convierten en madres. Si el éxito se mide por cómo podemos transformar positivamente la vida de las madres y en consecuencia, tener un impacto directo en el bienestar de sus bebés, esperamos ser tremendamente exitosos: por ti y por todas las mujeres, por sus parejas y familiares, y por los bebés que llegan al mundo.\n\nLas familias sanas son la base de una sociedad sana. Las madres desempeñan un papel fundamental: una madre sana y feliz garantiza el mejor comienzo en la vida para el bebé.\n\nLa maternidad es un momento de transformación, tanto para la madre como para su pareja y la familia, para el que a menudo no se cuenta con el apoyo necesario.\n\nQueremos ofrecer ese apoyo desde un enfoque integral de las necesidades de la maternidad, para mejorar la salud mental y el bienestar integral de la madre, sus parejas y sus bebés, previniendo así posibles escenarios que a veces empañan esta experiencia que puede resultar tan empoderante.',
      name: 'pageLinkContentWelcomeSocialImpactDescription',
      desc: '',
      args: [],
    );
  }

  /// `Todo proyecto tiene un inicio`
  String get pageLinkContentWelcomeStartingPointTitle {
    return Intl.message(
      'Todo proyecto tiene un inicio',
      name: 'pageLinkContentWelcomeStartingPointTitle',
      desc: '',
      args: [],
    );
  }

  /// `Como nuevo proyecto tenemos un hoja de ruta que vamos construyendo paso a paso, y no podíamos esperar a ponernos en marcha acercando ya los primeros desarrollos y contenidos a las usuarias, ¡y hemos lanzado Dana! Pero por supuesto, iremos ampliando todos los contenidos de la app hasta completar todo el viaje de matrescencia desde la pre-concepción, embarazo, y posparto hasta que el bebé tenga 3 años. Aquí tu opinión como usuaria es muy importante: si te interesa un contenido especifico, compártelo con nosotros y lo tendremos muy en cuenta para la siguiente versión de Dana.\n\nNuestro objetivo es construir Dana contigo: cada maternidad es única y en el futuro llegaremos a una hiper-personalización centrada en tus necesidades, y solo en ellas. Mientras tanto, esperamos poder ser de utilidad con todos los contenidos que el equipo experto va elaborando. Si crees que podemos mejorar algo, ayúdanos: contáctanos y con gusto trabajaremos para que Dana responda mejor a tus preguntas, inquietudes o necesidades.`
  String get pageLinkContentWelcomeStartingPointDescription {
    return Intl.message(
      'Como nuevo proyecto tenemos un hoja de ruta que vamos construyendo paso a paso, y no podíamos esperar a ponernos en marcha acercando ya los primeros desarrollos y contenidos a las usuarias, ¡y hemos lanzado Dana! Pero por supuesto, iremos ampliando todos los contenidos de la app hasta completar todo el viaje de matrescencia desde la pre-concepción, embarazo, y posparto hasta que el bebé tenga 3 años. Aquí tu opinión como usuaria es muy importante: si te interesa un contenido especifico, compártelo con nosotros y lo tendremos muy en cuenta para la siguiente versión de Dana.\n\nNuestro objetivo es construir Dana contigo: cada maternidad es única y en el futuro llegaremos a una hiper-personalización centrada en tus necesidades, y solo en ellas. Mientras tanto, esperamos poder ser de utilidad con todos los contenidos que el equipo experto va elaborando. Si crees que podemos mejorar algo, ayúdanos: contáctanos y con gusto trabajaremos para que Dana responda mejor a tus preguntas, inquietudes o necesidades.',
      name: 'pageLinkContentWelcomeStartingPointDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ayudando a mejorar la maternidad`
  String get pageLinkContentWelcomeHelpingMotherhoodTitle {
    return Intl.message(
      'Ayudando a mejorar la maternidad',
      name: 'pageLinkContentWelcomeHelpingMotherhoodTitle',
      desc: '',
      args: [],
    );
  }

  /// `Queremos atender a las necesidades reales de las madres como tú. Y para ello, necesitamos tu ayuda. En esta versión podrás acceder gratuitamente a todos los contenidos. Compartiendo con nosotros cuál está siendo tu experiencia al usar la aplicación, ayudarás a seguir mejorando Dana para que os ofrezca los recursos más útiles posibles a ti y a otras madres, que seguro están experimentando lo mismo que tú. Y compartiendo la app con otras madres, nos ayudarás a que Dana sea más completa y universal.`
  String get pageLinkContentWelcomeHelpingMotherhoodDescription {
    return Intl.message(
      'Queremos atender a las necesidades reales de las madres como tú. Y para ello, necesitamos tu ayuda. En esta versión podrás acceder gratuitamente a todos los contenidos. Compartiendo con nosotros cuál está siendo tu experiencia al usar la aplicación, ayudarás a seguir mejorando Dana para que os ofrezca los recursos más útiles posibles a ti y a otras madres, que seguro están experimentando lo mismo que tú. Y compartiendo la app con otras madres, nos ayudarás a que Dana sea más completa y universal.',
      name: 'pageLinkContentWelcomeHelpingMotherhoodDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cómo colaborar`
  String get pageLinkContentWelcomeCollaborateTitle {
    return Intl.message(
      'Cómo colaborar',
      name: 'pageLinkContentWelcomeCollaborateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Si quieres apoyarnos en nuestro propósito de impactar en la sociedad mejorando la experiencia de la maternidad para el mayor número de familias posible, puedes hacerlo de distintas formas:\n\n- Experimenta con Dana y danos tu opinión: lo que más nos ayuda es si pruebas nuestros programas y nos indicas si te ha gustando o no un contenido específico, o si te sientes mejor después de haber finalizado un programa.\n\n- Comparte Dana con tus amigas, familiares y profesionales de la salud: la base de nuestro éxito será tu recomendación. Si te gusta Dana, ayúdanos y comparte tu experiencia con tu ginecólogo, pediatra, matrona, psicóloga, psiquiatra, doula, o coach experto, y por supuesto, con tus amigas y entorno próximo, grupo de preparación al parto, grupo de yoga perinatal, grupo de lactancia, grupo de madres o cualquier otro grupo relacionado con la maternidad, y de esta forma, entre todas, ayudamos al desarrollo y al éxito de Dana como herramienta de apoyo en la matrescencia.\n\n- Habla con nosotros: si tienes tiempo y ganas, podemos organizar una reunión contigo para intercambiar ideas al respecto de tu experiencia con Dana. Este tipo de feedback es muy importante porque podemos entender aún mejor tu propia experiencia y entender cómo ayudar a otras madres. Si quieres formar parte de nuestra comunidad de madres y cocrear Dana, manda un email a hola@dana.heath y un miembro del equipo se pondrá en contacto contigo con mucho gusto.\n\n- Cuéntanos cómo mejorar: Si detectas algún fallo en la aplicación (lo que es muy usual cuando se lanza nuevas versiones de un asistente digital) o nos quieres sugerir alguna mejora en el funcionamiento de la misma, puedes realizar una captura o video de tu pantalla para enviárnosla y/o simplemente escribirnos a hola@dana.heath.\n\n- Participa en Dana: Si eres psicóloga perinatal, matrona, ginecóloga, pediatra, doula, coach o experta en algún tema de salud maternal, y si te apetece participar en el desarrollo de Dana, contacta a través de hola@dana.health, compartiendo cuál es tu especialidad e interés.\n\n¡Gracias por ser de las primeras en vivir tu experiencia junto a Dana! ¡Es un honor poder estar a tu lado!`
  String get pageLinkContentWelcomeCollaborateDescription {
    return Intl.message(
      'Si quieres apoyarnos en nuestro propósito de impactar en la sociedad mejorando la experiencia de la maternidad para el mayor número de familias posible, puedes hacerlo de distintas formas:\n\n- Experimenta con Dana y danos tu opinión: lo que más nos ayuda es si pruebas nuestros programas y nos indicas si te ha gustando o no un contenido específico, o si te sientes mejor después de haber finalizado un programa.\n\n- Comparte Dana con tus amigas, familiares y profesionales de la salud: la base de nuestro éxito será tu recomendación. Si te gusta Dana, ayúdanos y comparte tu experiencia con tu ginecólogo, pediatra, matrona, psicóloga, psiquiatra, doula, o coach experto, y por supuesto, con tus amigas y entorno próximo, grupo de preparación al parto, grupo de yoga perinatal, grupo de lactancia, grupo de madres o cualquier otro grupo relacionado con la maternidad, y de esta forma, entre todas, ayudamos al desarrollo y al éxito de Dana como herramienta de apoyo en la matrescencia.\n\n- Habla con nosotros: si tienes tiempo y ganas, podemos organizar una reunión contigo para intercambiar ideas al respecto de tu experiencia con Dana. Este tipo de feedback es muy importante porque podemos entender aún mejor tu propia experiencia y entender cómo ayudar a otras madres. Si quieres formar parte de nuestra comunidad de madres y cocrear Dana, manda un email a hola@dana.heath y un miembro del equipo se pondrá en contacto contigo con mucho gusto.\n\n- Cuéntanos cómo mejorar: Si detectas algún fallo en la aplicación (lo que es muy usual cuando se lanza nuevas versiones de un asistente digital) o nos quieres sugerir alguna mejora en el funcionamiento de la misma, puedes realizar una captura o video de tu pantalla para enviárnosla y/o simplemente escribirnos a hola@dana.heath.\n\n- Participa en Dana: Si eres psicóloga perinatal, matrona, ginecóloga, pediatra, doula, coach o experta en algún tema de salud maternal, y si te apetece participar en el desarrollo de Dana, contacta a través de hola@dana.health, compartiendo cuál es tu especialidad e interés.\n\n¡Gracias por ser de las primeras en vivir tu experiencia junto a Dana! ¡Es un honor poder estar a tu lado!',
      name: 'pageLinkContentWelcomeCollaborateDescription',
      desc: '',
      args: [],
    );
  }

  /// `Conocemos la importancia de saber a quién acudir cuando sientes que necesitas ayuda y, en especial, en momentos de cambio y transformación como el momento en que nos convertimos en madres.`
  String get pageLinkContentHelpChangeTitle {
    return Intl.message(
      'Conocemos la importancia de saber a quién acudir cuando sientes que necesitas ayuda y, en especial, en momentos de cambio y transformación como el momento en que nos convertimos en madres.',
      name: 'pageLinkContentHelpChangeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Para facilitarte la búsqueda de contactos, la asistencia de especialistas y algunas recomendaciones útiles para cuando lo necesites, hemos diseñado un programa específico - el programa Ayuda - donde encontrarás reflexiones, materiales y contactos de asociaciones y centros especializados que acompañan a las mujeres durante su maternidad.\n\nPuedes encontrar el programa `
  String get pageLinkContentHelpChangeDescription {
    return Intl.message(
      'Para facilitarte la búsqueda de contactos, la asistencia de especialistas y algunas recomendaciones útiles para cuando lo necesites, hemos diseñado un programa específico - el programa Ayuda - donde encontrarás reflexiones, materiales y contactos de asociaciones y centros especializados que acompañan a las mujeres durante su maternidad.\n\nPuedes encontrar el programa ',
      name: 'pageLinkContentHelpChangeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda `
  String get pageLinkContentHelpTitle {
    return Intl.message(
      'Ayuda ',
      name: 'pageLinkContentHelpTitle',
      desc: '',
      args: [],
    );
  }

  /// `en la colección `
  String get pageLinkContentHelpCollection {
    return Intl.message(
      'en la colección ',
      name: 'pageLinkContentHelpCollection',
      desc: '',
      args: [],
    );
  }

  /// `Al alcance de tu mano`
  String get pageLinkContentHelpReachable {
    return Intl.message(
      'Al alcance de tu mano',
      name: 'pageLinkContentHelpReachable',
      desc: '',
      args: [],
    );
  }

  /// `. Esperamos pueda serte de utilidad.`
  String get pageLinkContentHelpRegards {
    return Intl.message(
      '. Esperamos pueda serte de utilidad.',
      name: 'pageLinkContentHelpRegards',
      desc: '',
      args: [],
    );
  }

  /// `¿Conoces la leyenda del colibrí?\n`
  String get pageLinkContentCollaboratorTitle1 {
    return Intl.message(
      '¿Conoces la leyenda del colibrí?\n',
      name: 'pageLinkContentCollaboratorTitle1',
      desc: '',
      args: [],
    );
  }

  /// `En Dana hemos inspirado nuestro ecosistema en una premisa: "Juntos llegamos más lejos", como el colibrí.\nNuestro equipo está formado por profesionales de la salud, desarrolladores de producto y tecnología, equipo creativo, madres, padres y muchas personas comprometidas con la matrescencia. Si crees que puedes aunar esfuerzos y sumarte a los 1000 colibríes, ¡Contáctanos!. Puedes escribirnos a hola@dana.health\n\n`
  String get pageLinkContentCollaboratorDescription1 {
    return Intl.message(
      'En Dana hemos inspirado nuestro ecosistema en una premisa: "Juntos llegamos más lejos", como el colibrí.\nNuestro equipo está formado por profesionales de la salud, desarrolladores de producto y tecnología, equipo creativo, madres, padres y muchas personas comprometidas con la matrescencia. Si crees que puedes aunar esfuerzos y sumarte a los 1000 colibríes, ¡Contáctanos!. Puedes escribirnos a hola@dana.health\n\n',
      name: 'pageLinkContentCollaboratorDescription1',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres saber quiénes formamos parte de Dana? ¡Nos presentamos!\n`
  String get pageLinkContentCollaboratorTitle2 {
    return Intl.message(
      '¿Quieres saber quiénes formamos parte de Dana? ¡Nos presentamos!\n',
      name: 'pageLinkContentCollaboratorTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Roser Palau Costafreda, matrona, Barcelona. "Soy especialista en parto natural y terapias complementarias. Coordinadora de contenido y asociaciones científicas. Me encanta viajar y conocer nuevos puntos de vista. Mi comida favorita, el arroz negro frente al mar".\n\nCarmen Hernández, Doctora en psicología, especialista en psicología perinatal. Almoster. "Soy Investigadora del grupo de investigación Nutrición y Salud Mental en la Universitat Rovira i Virgili. Madre de dos niños de 8 y 11 años. Me gusta viajar, leer, la naturaleza, comer xató y la tarta de queso".\n\nIsabel Coca Camín, matrona, profesora de Hatha Yoga, Barcelona. "He trabajado a lo largo de 40 años, en prevención y atención a la gestación y al nacimiento. Colaboro con Dana creando contenidos. Me gusta viajar, leer, compartir conocimiento, las ensaladas y el chocolate. Soy madre de 3 y abuela de 4".\n\nSven Mulfinger, ingeniero, doctor en genética, Esplugues de Llobregat. "Soy responsable de equipo y talento en Dana, padre de 3 hijos (18, 16, 10). Me declaro fan de descubrir nuevos territorios y de los crepes con mermelada".\n\nVerónica Montesinos Cerro, economista, Barcelona. "Soy cofundadora y CEO en Dana, madre en espíritu y en el corazón. Me encanta la música, bailar y conversar con gente interesante; comidas: las del mundo, con todos sus olores y sabores".\n\nSara Victor, tech lead en Dana, Barcelona. "Trabajar con equipos organizados y apasionados es algo que me alegra el día a día. No admito críticas sobre que la mejor comida del mundo es el Ramen".\n\nSofía Veloso, diseñadora de experiencia de usuariXs y product manager en Dana. Argentina viviendo en Mallorca. "No puedo vivir sin el teatro o fuera de la naturaleza. Intento aportar un granito más a las luchas sociales y feministas desde los espacios de conversación diarios. Adoro las milanesas y la menta granizada".\n\nLaura Valls, graduada en periodismo, Lleida. "Soy una enamorada de todas las formas de expresión. Estoy aprendiendo a coser y a hacer “ganxet”. No puedo vivir sin mis trocitos de chocolate negro... Soy madre de Ainara desde hace (casi) 5 años".\n\nAina Frau-Pascual, ingeniera de telecomunicaciones, doctora en matemáticas aplicadas, Palma de Mallorca. "Soy data scientist en Dana. Me encanta bailar. Mi comida preferida son los macarrones de mi abuela, o cualquier plato que cocine ella, compartidos en familia".\n\nJuan Segundo Clavijo, médico psiquiatra, Buenos Aires, Argentina. "Soy especialista en salud mental comunitaria en Dana. Esposo de Flor y papá de Josefina, Joaquin y Trinidad. Lo mejor de la vida son los vínculos y la comunicación. Unas empanadas caseras, pero acompañado y en comunidad compartiendo con otros".\n\nCeleste Ferrari, psicóloga clínica y Magister en familia, vínculos y diversidad sociocultural, Argentina viviendo en Madrid. "En Dana soy UX Researcher. Me encanta leer y escribir. Descubrí hace poco que mi comida preferida son los chipirones en su tinta"\n\nSara Granado, escritora y redactora de contenido en Dana. Profesora de Yoga y Meditación, Gran Canaria. "Me encanta correr por la montaña, escuchar música "feel good" y el queso en todas sus variantes... ¿Alguien ha dicho pizza?. Soy la mamá de Nerea".\n\nLeandro Barreiro, biotecnólogo con especialización en genética, bioinformática y desarrollo de negocios, argentino residente en España. "Mi rol en Dana es de strategic partnerships & sales. Padre de Valeria y pareja de Laura. Me apasiona explorar nuevas culturas y disfruto los momentos en familia y con amigos, con un buen asado".\n\nAlejandra Sousa González,TCAE, asesora de lactancia y community manager en Dana, Ourense. "Enamorada de vivir cada segundo de la vida que Laira, de 3 años, da a mi corazón. Veo el mundo a través de sus ojos. Me gusta el mar, la playa, bailar y la tortilla de patatas con huevos caseros de mi madre".\n\nDulce Pulido, psicóloga sanitaria y community manager, Jaén. "Soy especialista en cognitivo conductual y mindfulness. Mi rol en Dana es dinamizar su comunidad. Madre de Marta de 5 años. Disfruto de la meditación, la naturaleza y pasar tiempo con la familia, salmón con brócoli y chocolate".\n\nJessica Pastor, enfermera holística oncológica (pediatría y adultos) especializada en cuidados paliativos y final de vida. Life & Death Coach, Barcelona. "Colaboro con Dana ayudando en el sector strategic partnership & sales. Me apasiona probar comida de todas las culturas y partes del mundo".\n\nJulieta Pérez García, periodista orientada a comunicación digital, Badalona. "Soy migrante de cuarta generación. Catalana, nacida en Venezuela. Madre de Julen & Jules. Me encanta caminar descalza en contacto con la naturaleza. Mi comida preferida es aquella que comparto en buena compañía".\n\n`
  String get pageLinkContentCollaboratorDescription2 {
    return Intl.message(
      'Roser Palau Costafreda, matrona, Barcelona. "Soy especialista en parto natural y terapias complementarias. Coordinadora de contenido y asociaciones científicas. Me encanta viajar y conocer nuevos puntos de vista. Mi comida favorita, el arroz negro frente al mar".\n\nCarmen Hernández, Doctora en psicología, especialista en psicología perinatal. Almoster. "Soy Investigadora del grupo de investigación Nutrición y Salud Mental en la Universitat Rovira i Virgili. Madre de dos niños de 8 y 11 años. Me gusta viajar, leer, la naturaleza, comer xató y la tarta de queso".\n\nIsabel Coca Camín, matrona, profesora de Hatha Yoga, Barcelona. "He trabajado a lo largo de 40 años, en prevención y atención a la gestación y al nacimiento. Colaboro con Dana creando contenidos. Me gusta viajar, leer, compartir conocimiento, las ensaladas y el chocolate. Soy madre de 3 y abuela de 4".\n\nSven Mulfinger, ingeniero, doctor en genética, Esplugues de Llobregat. "Soy responsable de equipo y talento en Dana, padre de 3 hijos (18, 16, 10). Me declaro fan de descubrir nuevos territorios y de los crepes con mermelada".\n\nVerónica Montesinos Cerro, economista, Barcelona. "Soy cofundadora y CEO en Dana, madre en espíritu y en el corazón. Me encanta la música, bailar y conversar con gente interesante; comidas: las del mundo, con todos sus olores y sabores".\n\nSara Victor, tech lead en Dana, Barcelona. "Trabajar con equipos organizados y apasionados es algo que me alegra el día a día. No admito críticas sobre que la mejor comida del mundo es el Ramen".\n\nSofía Veloso, diseñadora de experiencia de usuariXs y product manager en Dana. Argentina viviendo en Mallorca. "No puedo vivir sin el teatro o fuera de la naturaleza. Intento aportar un granito más a las luchas sociales y feministas desde los espacios de conversación diarios. Adoro las milanesas y la menta granizada".\n\nLaura Valls, graduada en periodismo, Lleida. "Soy una enamorada de todas las formas de expresión. Estoy aprendiendo a coser y a hacer “ganxet”. No puedo vivir sin mis trocitos de chocolate negro... Soy madre de Ainara desde hace (casi) 5 años".\n\nAina Frau-Pascual, ingeniera de telecomunicaciones, doctora en matemáticas aplicadas, Palma de Mallorca. "Soy data scientist en Dana. Me encanta bailar. Mi comida preferida son los macarrones de mi abuela, o cualquier plato que cocine ella, compartidos en familia".\n\nJuan Segundo Clavijo, médico psiquiatra, Buenos Aires, Argentina. "Soy especialista en salud mental comunitaria en Dana. Esposo de Flor y papá de Josefina, Joaquin y Trinidad. Lo mejor de la vida son los vínculos y la comunicación. Unas empanadas caseras, pero acompañado y en comunidad compartiendo con otros".\n\nCeleste Ferrari, psicóloga clínica y Magister en familia, vínculos y diversidad sociocultural, Argentina viviendo en Madrid. "En Dana soy UX Researcher. Me encanta leer y escribir. Descubrí hace poco que mi comida preferida son los chipirones en su tinta"\n\nSara Granado, escritora y redactora de contenido en Dana. Profesora de Yoga y Meditación, Gran Canaria. "Me encanta correr por la montaña, escuchar música "feel good" y el queso en todas sus variantes... ¿Alguien ha dicho pizza?. Soy la mamá de Nerea".\n\nLeandro Barreiro, biotecnólogo con especialización en genética, bioinformática y desarrollo de negocios, argentino residente en España. "Mi rol en Dana es de strategic partnerships & sales. Padre de Valeria y pareja de Laura. Me apasiona explorar nuevas culturas y disfruto los momentos en familia y con amigos, con un buen asado".\n\nAlejandra Sousa González,TCAE, asesora de lactancia y community manager en Dana, Ourense. "Enamorada de vivir cada segundo de la vida que Laira, de 3 años, da a mi corazón. Veo el mundo a través de sus ojos. Me gusta el mar, la playa, bailar y la tortilla de patatas con huevos caseros de mi madre".\n\nDulce Pulido, psicóloga sanitaria y community manager, Jaén. "Soy especialista en cognitivo conductual y mindfulness. Mi rol en Dana es dinamizar su comunidad. Madre de Marta de 5 años. Disfruto de la meditación, la naturaleza y pasar tiempo con la familia, salmón con brócoli y chocolate".\n\nJessica Pastor, enfermera holística oncológica (pediatría y adultos) especializada en cuidados paliativos y final de vida. Life & Death Coach, Barcelona. "Colaboro con Dana ayudando en el sector strategic partnership & sales. Me apasiona probar comida de todas las culturas y partes del mundo".\n\nJulieta Pérez García, periodista orientada a comunicación digital, Badalona. "Soy migrante de cuarta generación. Catalana, nacida en Venezuela. Madre de Julen & Jules. Me encanta caminar descalza en contacto con la naturaleza. Mi comida preferida es aquella que comparto en buena compañía".\n\n',
      name: 'pageLinkContentCollaboratorDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Más colibríes que contribuyen a llegar más lejos:\n`
  String get pageLinkContentCollaboratorTitle3 {
    return Intl.message(
      'Más colibríes que contribuyen a llegar más lejos:\n',
      name: 'pageLinkContentCollaboratorTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Ignacio Marrero, big data, inteligencia artificial\nAndré Kempe, marketing\nThorsten Faust, pediatra, director Dr. Faust Institute, Quirón\nSilvia Pérez, matrona\nDra. Juanita Cajiao, psicóloga perinatal\nDra. Clara Marín, yoga y medicina general\nBegoña Dorado, psicóloga perinatal\nJordi Gómez, formador en meditación y desarrollo personal en Sangha Activa\nSusana López, psicóloga, formadora en meditación en Sangha Activa\nAura María Ríos Gómez, psicóloga general sanitaria con formación en salud mental Elena Sanz, psicóloga y redactora\nDr. Teresa Escudero, médica de familia, doula\nDr. Ana Ripoll, pediatra\nAna Fragua, autora, impulsora de la red For Women\nAnder Martín, coordinador de formación en Instituto Esmindfulness\nIsabel de Navasqüés, escritora y health coach\nGraciana Piubello, logotipo\nWendy Kessler, audios by Takeaway Content\nBeatriz, Voz\nJanella Stephenson, experiencia de usuarias\nMing-ya Wang, experiencia de usuarias\nAlicia Santurde, podcasts\nDiana Sanchez, contenido de Sexualidad\nElisabet Gutierrez, contenido de Violencia de género\nAna España, contenido Plan de parto\nCarmen Moreno, contenido Parto positivo\nPatricia Roncallo, contenido matrescencia\nAna Camacho, contenido matrescencia\nAna Otero, contenido Lactancia, podcast\nEstibaliz Royuella, contenido Mindfulness\n\nMichaela Mairinger, Vega Pérez, Noemi Martín, Mariana Brito, Esther, Irene, Juan, Lisseth, Mariana, Patricia, Melanie, Rick, Ingrid, Julien, Marenid, Naomi, Jutta, Florencia, Teresa, Natalie, Navina, Holger, Nacho, Patrick, Anna, Fritz, Tugsan, Gerry, Thomas, Javier, Mariona, Ailín, Cecilia...\n\n`
  String get pageLinkContentCollaboratorDescription3 {
    return Intl.message(
      'Ignacio Marrero, big data, inteligencia artificial\nAndré Kempe, marketing\nThorsten Faust, pediatra, director Dr. Faust Institute, Quirón\nSilvia Pérez, matrona\nDra. Juanita Cajiao, psicóloga perinatal\nDra. Clara Marín, yoga y medicina general\nBegoña Dorado, psicóloga perinatal\nJordi Gómez, formador en meditación y desarrollo personal en Sangha Activa\nSusana López, psicóloga, formadora en meditación en Sangha Activa\nAura María Ríos Gómez, psicóloga general sanitaria con formación en salud mental Elena Sanz, psicóloga y redactora\nDr. Teresa Escudero, médica de familia, doula\nDr. Ana Ripoll, pediatra\nAna Fragua, autora, impulsora de la red For Women\nAnder Martín, coordinador de formación en Instituto Esmindfulness\nIsabel de Navasqüés, escritora y health coach\nGraciana Piubello, logotipo\nWendy Kessler, audios by Takeaway Content\nBeatriz, Voz\nJanella Stephenson, experiencia de usuarias\nMing-ya Wang, experiencia de usuarias\nAlicia Santurde, podcasts\nDiana Sanchez, contenido de Sexualidad\nElisabet Gutierrez, contenido de Violencia de género\nAna España, contenido Plan de parto\nCarmen Moreno, contenido Parto positivo\nPatricia Roncallo, contenido matrescencia\nAna Camacho, contenido matrescencia\nAna Otero, contenido Lactancia, podcast\nEstibaliz Royuella, contenido Mindfulness\n\nMichaela Mairinger, Vega Pérez, Noemi Martín, Mariana Brito, Esther, Irene, Juan, Lisseth, Mariana, Patricia, Melanie, Rick, Ingrid, Julien, Marenid, Naomi, Jutta, Florencia, Teresa, Natalie, Navina, Holger, Nacho, Patrick, Anna, Fritz, Tugsan, Gerry, Thomas, Javier, Mariona, Ailín, Cecilia...\n\n',
      name: 'pageLinkContentCollaboratorDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Política de privacidad`
  String get pageLinkContentPrivacyPolicy {
    return Intl.message(
      'Política de privacidad',
      name: 'pageLinkContentPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Introducción`
  String get pageLinkContentPrivacyIntroduction {
    return Intl.message(
      'Introducción',
      name: 'pageLinkContentPrivacyIntroduction',
      desc: '',
      args: [],
    );
  }

  /// `Dana es una aplicación móvil ("APP") que proporciona a las personas que han creado una cuenta acceso a contenidos, compartir en foros sociales, llevar un diario, llevar un seguimiento de su estado de ánimo y escuchar podcasts, entre otros. Todo ello describe los servicios de la aplicación. \n\nDana es un lugar de aprendizaje, reflexión, práctica e intercambio social. Basándose en la información que nos proporcionas, nuestro algoritmo recomienda servicios que se ajustan a tu perfil y a tus necesidades.\n\nParticipar en la APP puede implicar compartir experiencias y detalles sobre ti. En ATC nos preocupamos por tu privacidad y empleamos las mejores prácticas para protegerte en todo momento.\n\nTe recomendamos leer atentamente esta política de privacidad para comprender cómo recogemos, utilizamos, protegemos y tratamos tu información.\n\nEn esta política, el término “datos personales” se refiere a la información relacionada con una persona identificada o que se puede identificar. El término “identificador indirecto” significa datos personales que no se identifican directamente o que podrían utilizarse para identificarte. Tu nombre y dirección de correo electrónico son identificadores directos. Tu dirección e IP y el ID de publicidad de tu dispositivo móvil son identificadores indirectos. `
  String get pageLinkContentPrivacyWhatIsDana {
    return Intl.message(
      'Dana es una aplicación móvil ("APP") que proporciona a las personas que han creado una cuenta acceso a contenidos, compartir en foros sociales, llevar un diario, llevar un seguimiento de su estado de ánimo y escuchar podcasts, entre otros. Todo ello describe los servicios de la aplicación. \n\nDana es un lugar de aprendizaje, reflexión, práctica e intercambio social. Basándose en la información que nos proporcionas, nuestro algoritmo recomienda servicios que se ajustan a tu perfil y a tus necesidades.\n\nParticipar en la APP puede implicar compartir experiencias y detalles sobre ti. En ATC nos preocupamos por tu privacidad y empleamos las mejores prácticas para protegerte en todo momento.\n\nTe recomendamos leer atentamente esta política de privacidad para comprender cómo recogemos, utilizamos, protegemos y tratamos tu información.\n\nEn esta política, el término “datos personales” se refiere a la información relacionada con una persona identificada o que se puede identificar. El término “identificador indirecto” significa datos personales que no se identifican directamente o que podrían utilizarse para identificarte. Tu nombre y dirección de correo electrónico son identificadores directos. Tu dirección e IP y el ID de publicidad de tu dispositivo móvil son identificadores indirectos. ',
      name: 'pageLinkContentPrivacyWhatIsDana',
      desc: '',
      args: [],
    );
  }

  /// `Responsable de los datos personales `
  String get pageLinkContentPrivacyPersonalDataResponsibility {
    return Intl.message(
      'Responsable de los datos personales ',
      name: 'pageLinkContentPrivacyPersonalDataResponsibility',
      desc: '',
      args: [],
    );
  }

  /// `Empresa: A THOUSAND COLIBRIS SL (en adelante “DANA”)\nCIF: B01888437\nDirección: Calle Doctor Trueta, número 113, 1º, 08005, Barcelona, España\nCorreo electrónico: admin@athousandcolibris.com\nSitio web: www.dana-app.com\n\nTe Informamos que la web www.dana-app.com así como la APP de la cual es titular DANA (en adelante, “el portal o sitio web”), cumplen con las directrices de la normativa vigente en materia de protección de datos personales, el Reglamento (UE) 2016/679 de 27 de abril de 2016 (RGPD) así como la LO 3/2018, de 5 de Diciembre de Protección de Datos Personales y garantía de los derechos digitales, normativa en materia de protección de las personas físicas en cuanto al tratamiento de datos personales y a la libre circulación de estos datos.`
  String get pageLinkContentPrivacyPersonalDataResponsible {
    return Intl.message(
      'Empresa: A THOUSAND COLIBRIS SL (en adelante “DANA”)\nCIF: B01888437\nDirección: Calle Doctor Trueta, número 113, 1º, 08005, Barcelona, España\nCorreo electrónico: admin@athousandcolibris.com\nSitio web: www.dana-app.com\n\nTe Informamos que la web www.dana-app.com así como la APP de la cual es titular DANA (en adelante, “el portal o sitio web”), cumplen con las directrices de la normativa vigente en materia de protección de datos personales, el Reglamento (UE) 2016/679 de 27 de abril de 2016 (RGPD) así como la LO 3/2018, de 5 de Diciembre de Protección de Datos Personales y garantía de los derechos digitales, normativa en materia de protección de las personas físicas en cuanto al tratamiento de datos personales y a la libre circulación de estos datos.',
      name: 'pageLinkContentPrivacyPersonalDataResponsible',
      desc: '',
      args: [],
    );
  }

  /// `Principios para el tratamiento`
  String get pageLinkContentPrivacyTreatmentPrinciples {
    return Intl.message(
      'Principios para el tratamiento',
      name: 'pageLinkContentPrivacyTreatmentPrinciples',
      desc: '',
      args: [],
    );
  }

  /// `En el tratamiento de los datos personales aplicaremos los siguientes principios que se ajustan a las exigencias de la normativa en materia de Protección de Datos personales:\n\nPrincipio de licitud, lealtad y transparencia: requeriremos el consentimiento para el tratamiento de tus datos personales para uno o varios fines específicos de los cuales informaremos previamente con absoluta transparencia.\n\nPrincipio de minimización de datos: solicitaremos únicamente los datos estrictamente necesarios en relación con los fines para los que son necesarios.\n\nPrincipio de limitación del plazo de conservación: los datos serán mantenidos durante no más tiempo del necesario para los fines del tratamiento, en función a la finalidad, informaremos del plazo de conservación correspondiente\n\nPrincipio de integridad y confidencialidad: los datos serán tratados de tal manera que se garantice una seguridad adecuada de los datos personales y se garantice confidencialidad. `
  String get pageLinkContentPrivacyTreatmentPrinciples2 {
    return Intl.message(
      'En el tratamiento de los datos personales aplicaremos los siguientes principios que se ajustan a las exigencias de la normativa en materia de Protección de Datos personales:\n\nPrincipio de licitud, lealtad y transparencia: requeriremos el consentimiento para el tratamiento de tus datos personales para uno o varios fines específicos de los cuales informaremos previamente con absoluta transparencia.\n\nPrincipio de minimización de datos: solicitaremos únicamente los datos estrictamente necesarios en relación con los fines para los que son necesarios.\n\nPrincipio de limitación del plazo de conservación: los datos serán mantenidos durante no más tiempo del necesario para los fines del tratamiento, en función a la finalidad, informaremos del plazo de conservación correspondiente\n\nPrincipio de integridad y confidencialidad: los datos serán tratados de tal manera que se garantice una seguridad adecuada de los datos personales y se garantice confidencialidad. ',
      name: 'pageLinkContentPrivacyTreatmentPrinciples2',
      desc: '',
      args: [],
    );
  }

  /// `¿Qué datos recopilamos?`
  String get pageLinkContentPrivacyDataTitle {
    return Intl.message(
      '¿Qué datos recopilamos?',
      name: 'pageLinkContentPrivacyDataTitle',
      desc: '',
      args: [],
    );
  }

  /// `Como usuaria, eres la única responsable de la veracidad y corrección de los datos que nos remitas directamente o mediante el sitio web, exonerándonos de cualquier responsabilidad sobre los mismos. \n\nEn este sentido, te informamos que los datos que nos facilitas de forma voluntaria son recopilados y tratados con las siguientes finalidades:\n\nCategoría de datos personales: nombre y apellidos, dirección email, teléfono de contacto, datos necesarios para la facturación (datos bancarios), datos reflejados en tu diario personal, dirección de IP, ID de publicidad de tu dispositivo móvil. Ubicación del dispositivo, incluyendo localizaciones geográficas específicas, como por ejemplo a través de señales GPS, Bluetooth o WiFi. Atributos como el sistema operativo, la versión de hardware y la configuración del dispositivo.\n\nPara facilitar la recopilación automática de algunos de estos datos sobre tu dispositivo y actividad, almacenamos cookies y tecnologías similares en tu dispositivo. Para más información, puedes consultar nuestra política de cookies. (link política de cookies)\n\nEn el supuesto de que inicies tu sesión mediante Google o Apple, recopilamos automáticamente tu dirección de correo electrónico.`
  String get pageLinkContentPrivacyUserResponsability {
    return Intl.message(
      'Como usuaria, eres la única responsable de la veracidad y corrección de los datos que nos remitas directamente o mediante el sitio web, exonerándonos de cualquier responsabilidad sobre los mismos. \n\nEn este sentido, te informamos que los datos que nos facilitas de forma voluntaria son recopilados y tratados con las siguientes finalidades:\n\nCategoría de datos personales: nombre y apellidos, dirección email, teléfono de contacto, datos necesarios para la facturación (datos bancarios), datos reflejados en tu diario personal, dirección de IP, ID de publicidad de tu dispositivo móvil. Ubicación del dispositivo, incluyendo localizaciones geográficas específicas, como por ejemplo a través de señales GPS, Bluetooth o WiFi. Atributos como el sistema operativo, la versión de hardware y la configuración del dispositivo.\n\nPara facilitar la recopilación automática de algunos de estos datos sobre tu dispositivo y actividad, almacenamos cookies y tecnologías similares en tu dispositivo. Para más información, puedes consultar nuestra política de cookies. (link política de cookies)\n\nEn el supuesto de que inicies tu sesión mediante Google o Apple, recopilamos automáticamente tu dirección de correo electrónico.',
      name: 'pageLinkContentPrivacyUserResponsability',
      desc: '',
      args: [],
    );
  }

  /// `¿De dónde obtenemos los datos personales? `
  String get pageLinkContentPrivacyDataOrigin {
    return Intl.message(
      '¿De dónde obtenemos los datos personales? ',
      name: 'pageLinkContentPrivacyDataOrigin',
      desc: '',
      args: [],
    );
  }

  /// `La mayoría de los datos personales que obtenemos son proporcionados por ti directamente, como por ejemplo cuando ingresas tus datos en nuestra APP. De forma indirecta, los recopilamos (i) cuando inicias sesión con Google o Apple; (ii) los proporcionados automáticamente mediante tus dispositivos; (iii) mediante redes sociales o terceros que nos ofrecer servicios de marketing. `
  String get pageLinkContentPrivacyDataOrigin2 {
    return Intl.message(
      'La mayoría de los datos personales que obtenemos son proporcionados por ti directamente, como por ejemplo cuando ingresas tus datos en nuestra APP. De forma indirecta, los recopilamos (i) cuando inicias sesión con Google o Apple; (ii) los proporcionados automáticamente mediante tus dispositivos; (iii) mediante redes sociales o terceros que nos ofrecer servicios de marketing. ',
      name: 'pageLinkContentPrivacyDataOrigin2',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo y por qué utilizamos los datos personales?`
  String get pageLinkContentPrivacyDataUse {
    return Intl.message(
      '¿Cómo y por qué utilizamos los datos personales?',
      name: 'pageLinkContentPrivacyDataUse',
      desc: '',
      args: [],
    );
  }

  /// `Utilizamos tus datos personales con las siguientes finalidades:\n\n- Personalizar su uso de la APP para una mejor experiencia.\n\n- Responder a las cuestiones que nos plantee por correo electrónico o utilizando el formulario de contacto. \n\n- Gestión y administración de los productos y/o servicios contratados.\n\n- Envío de información comercial o de eventos por medios electrónicos.\n\n- Facturación y declaración de los impuestos oportunos.\n\n- Comercializar, desarrollar y mejorar nuestros productos y servicios. \n\n- Brindarte soporte y solución de problemas. \n\n- Realizar investigaciones clínicas y científicas. \n\n- Generar datos no identificados y datos estadísticos agregados. `
  String get pageLinkContentPrivacyDataFinality {
    return Intl.message(
      'Utilizamos tus datos personales con las siguientes finalidades:\n\n- Personalizar su uso de la APP para una mejor experiencia.\n\n- Responder a las cuestiones que nos plantee por correo electrónico o utilizando el formulario de contacto. \n\n- Gestión y administración de los productos y/o servicios contratados.\n\n- Envío de información comercial o de eventos por medios electrónicos.\n\n- Facturación y declaración de los impuestos oportunos.\n\n- Comercializar, desarrollar y mejorar nuestros productos y servicios. \n\n- Brindarte soporte y solución de problemas. \n\n- Realizar investigaciones clínicas y científicas. \n\n- Generar datos no identificados y datos estadísticos agregados. ',
      name: 'pageLinkContentPrivacyDataFinality',
      desc: '',
      args: [],
    );
  }

  /// `¿Con qué legitimación tratamos los datos? `
  String get pageLinkContentPrivacyDataLegitimate {
    return Intl.message(
      '¿Con qué legitimación tratamos los datos? ',
      name: 'pageLinkContentPrivacyDataLegitimate',
      desc: '',
      args: [],
    );
  }

  /// `Recopilamos, usamos y procesamos los datos personales según lo permitido por la ley aplicable, incluso cuando se basan en uno o más de los siguientes supuestos:\n\n- El consentimiento que nos otorgas en el momento en el que recopilamos tu información personal;\n\n- La ejecución de un contrato entre las partes;\n\n- El cumplimiento de una obligación legal a la que estamos sujetos;\n\n- La realización o investigaciones científicas. Elaboración de estadísticas o actividades de salud publica;\n\n- Los intereses legítimos de STC. `
  String get pageLinkContentPrivacyDataLegitimate2 {
    return Intl.message(
      'Recopilamos, usamos y procesamos los datos personales según lo permitido por la ley aplicable, incluso cuando se basan en uno o más de los siguientes supuestos:\n\n- El consentimiento que nos otorgas en el momento en el que recopilamos tu información personal;\n\n- La ejecución de un contrato entre las partes;\n\n- El cumplimiento de una obligación legal a la que estamos sujetos;\n\n- La realización o investigaciones científicas. Elaboración de estadísticas o actividades de salud publica;\n\n- Los intereses legítimos de STC. ',
      name: 'pageLinkContentPrivacyDataLegitimate2',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuándo compartimos los datos personales?`
  String get pageLinkContentPrivacyDataShare {
    return Intl.message(
      '¿Cuándo compartimos los datos personales?',
      name: 'pageLinkContentPrivacyDataShare',
      desc: '',
      args: [],
    );
  }

  /// `En ATC sólo tratamos los datos que nos facilitan los titulares. Si nos aportas datos de terceros, deberás con carácter previo, informar y solicitar su consentimiento a dichas personas, o de lo contrario nos eximes de cualquier responsabilidad por el incumplimiento de éste requisito.`
  String get pageLinkContentPrivacyDataTreatment {
    return Intl.message(
      'En ATC sólo tratamos los datos que nos facilitan los titulares. Si nos aportas datos de terceros, deberás con carácter previo, informar y solicitar su consentimiento a dichas personas, o de lo contrario nos eximes de cualquier responsabilidad por el incumplimiento de éste requisito.',
      name: 'pageLinkContentPrivacyDataTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Seguridad de los datos`
  String get pageLinkContentPrivacyDataSecurity {
    return Intl.message(
      'Seguridad de los datos',
      name: 'pageLinkContentPrivacyDataSecurity',
      desc: '',
      args: [],
    );
  }

  /// `ATC protege los datos personales con las medidas de seguridad que son consistentes con los estándares de la industria. \n\nTu información personal está contenida detrás de redes seguras y sólo es accesible por un número limitado de personas las cuales están obligados a mantener la información como confidencial.\n\nRecurrimos a determinados proveedores y empresas de alojamiento para que nos proporcionen el hardware, el software, la red, el almacenamiento y la tecnología relacionada necesarios para el funcionamiento de la APP. Estos terceros han sido seleccionados por sus elevados estándares de seguridad, tanto electrónica como física. `
  String get pageLinkContentPrivacyDataProtection {
    return Intl.message(
      'ATC protege los datos personales con las medidas de seguridad que son consistentes con los estándares de la industria. \n\nTu información personal está contenida detrás de redes seguras y sólo es accesible por un número limitado de personas las cuales están obligados a mantener la información como confidencial.\n\nRecurrimos a determinados proveedores y empresas de alojamiento para que nos proporcionen el hardware, el software, la red, el almacenamiento y la tecnología relacionada necesarios para el funcionamiento de la APP. Estos terceros han sido seleccionados por sus elevados estándares de seguridad, tanto electrónica como física. ',
      name: 'pageLinkContentPrivacyDataProtection',
      desc: '',
      args: [],
    );
  }

  /// `Consentimiento`
  String get pageLinkContentPrivacyConsent {
    return Intl.message(
      'Consentimiento',
      name: 'pageLinkContentPrivacyConsent',
      desc: '',
      args: [],
    );
  }

  /// `Mediante la introducción de los datos, como usuaria otorgas el consentimiento expreso e inequívoco, declarando haber sido informada de las condiciones sobre protección de datos de carácter personal, aceptando y consintiendo el tratamiento automatizado de los mismos, para que procedamos al tratamiento de los datos facilitados en pro de las finalidades mencionadas, cuando dicho consentimiento resulte la base que legitima el tratamiento en cuestión. También implica el consentimiento a la transferencia internacional de datos, debido exclusivamente a que alguno de los proveedores o terceros que proveen servicios necesarios para el desarrollo de esta web se encuentran ubicados en otros países. `
  String get pageLinkContentPrivacyConsent2 {
    return Intl.message(
      'Mediante la introducción de los datos, como usuaria otorgas el consentimiento expreso e inequívoco, declarando haber sido informada de las condiciones sobre protección de datos de carácter personal, aceptando y consintiendo el tratamiento automatizado de los mismos, para que procedamos al tratamiento de los datos facilitados en pro de las finalidades mencionadas, cuando dicho consentimiento resulte la base que legitima el tratamiento en cuestión. También implica el consentimiento a la transferencia internacional de datos, debido exclusivamente a que alguno de los proveedores o terceros que proveen servicios necesarios para el desarrollo de esta web se encuentran ubicados en otros países. ',
      name: 'pageLinkContentPrivacyConsent2',
      desc: '',
      args: [],
    );
  }

  /// `Menores de edad `
  String get pageLinkContentPrivacyUnderage {
    return Intl.message(
      'Menores de edad ',
      name: 'pageLinkContentPrivacyUnderage',
      desc: '',
      args: [],
    );
  }

  /// `Se hace expresa mención a los menores de 14 años, en relación con el tratamiento de sus datos personales. Los menores no podrán acceder al presente sitio web sin el consentimiento de sus padres o tutores. En este sentido, ATC no se hace responsable frente al incumplimiento de esta previsión. `
  String get pageLinkContentPrivacyUnderage2 {
    return Intl.message(
      'Se hace expresa mención a los menores de 14 años, en relación con el tratamiento de sus datos personales. Los menores no podrán acceder al presente sitio web sin el consentimiento de sus padres o tutores. En este sentido, ATC no se hace responsable frente al incumplimiento de esta previsión. ',
      name: 'pageLinkContentPrivacyUnderage2',
      desc: '',
      args: [],
    );
  }

  /// `Datos personales de terceros `
  String get pageLinkContentPrivacyThirdParty {
    return Intl.message(
      'Datos personales de terceros ',
      name: 'pageLinkContentPrivacyThirdParty',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo tratamos los enlaces de terceros?`
  String get pageLinkContentPrivacyThirdPartyTreatment {
    return Intl.message(
      '¿Cómo tratamos los enlaces de terceros?',
      name: 'pageLinkContentPrivacyThirdPartyTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Al utilizar Dana, puedes encontrar enlaces a sitios web de terceros en nuestra aplicación. Estos sitios de terceros tienen políticas de privacidad separadas e independientes. Por lo tanto, no tenemos ninguna responsabilidad por el contenido y las actividades de estos sitios enlazados. No obstante, tratamos de proteger la integridad de nuestra aplicación y agradecemos cualquier comentario sobre estos sitios.`
  String get pageLinkContentPrivacyThirdPartyLinks {
    return Intl.message(
      'Al utilizar Dana, puedes encontrar enlaces a sitios web de terceros en nuestra aplicación. Estos sitios de terceros tienen políticas de privacidad separadas e independientes. Por lo tanto, no tenemos ninguna responsabilidad por el contenido y las actividades de estos sitios enlazados. No obstante, tratamos de proteger la integridad de nuestra aplicación y agradecemos cualquier comentario sobre estos sitios.',
      name: 'pageLinkContentPrivacyThirdPartyLinks',
      desc: '',
      args: [],
    );
  }

  /// `¿Durante cuánto tiempo se van a conservar los datos? `
  String get pageLinkContentPrivacyDataTime {
    return Intl.message(
      '¿Durante cuánto tiempo se van a conservar los datos? ',
      name: 'pageLinkContentPrivacyDataTime',
      desc: '',
      args: [],
    );
  }

  /// `Los datos que nos has facilitado se conservarán mientras haya un interés mutuo para mantener el fin del tratamiento y/o durante el plazo por el cual pudieran derivase responsabilidades legales por los servicios prestados. Cuando ya no sea necesario para tal fin, se suprimirán con medidas de seguridad adecuadas para garantizar la seudonimización de los datos o destrucción total de los mismos. Si lo requieres, disponemos de una tabla con el período específico de duración del cada uno de los tratamientos realizados. `
  String get pageLinkContentPrivacyDataConservation {
    return Intl.message(
      'Los datos que nos has facilitado se conservarán mientras haya un interés mutuo para mantener el fin del tratamiento y/o durante el plazo por el cual pudieran derivase responsabilidades legales por los servicios prestados. Cuando ya no sea necesario para tal fin, se suprimirán con medidas de seguridad adecuadas para garantizar la seudonimización de los datos o destrucción total de los mismos. Si lo requieres, disponemos de una tabla con el período específico de duración del cada uno de los tratamientos realizados. ',
      name: 'pageLinkContentPrivacyDataConservation',
      desc: '',
      args: [],
    );
  }

  /// `¿Qué derechos te asisten?`
  String get pageLinkContentPrivacyRights {
    return Intl.message(
      '¿Qué derechos te asisten?',
      name: 'pageLinkContentPrivacyRights',
      desc: '',
      args: [],
    );
  }

  /// `ATC garantiza en todo caso como usuaria el ejercicio de los derechos de acceso, rectificación, cancelación, información y oposición, limitación y portabilidad, en los términos dispuestos en la legislación vigente. Por ello, podrás ejercer tus derechos remitiendo una solicitud expresa a la dirección postal indicada en el encabezamiento y/o enviando un correo electrónico a admin@athousandcolibris.com, indicando en el asunto: Derechos ARCO-POL, y adjuntando fotocopia de tu DNI. Si lo requieres, tenemos a tu disposición formularios para el correcto ejercicio de tus derechos.\n\nEn ambos casos deberás acompañar una copia de tu documento nacional de identidad, pasaporte u otro documento válido que te identifique. También puedes eliminar tu cuenta (y, por tanto, tu información personal) a través de su configuración cuando estés conectada. Es importante que tengas en cuenta que si solicita la eliminación de tu información personal, nos reservamos el derecho de conservar parte de tu información personal durante un tiempo exigido para cumplir con nuestras obligaciones legales.\n\nEres conocedora, entiendes y aceptas que la retirada del consentimiento y/o el ejercicio del derecho de supresión implicarán que ATC no pueda seguir prestando los servicios propios de la APP.\n\nTambién tienes derecho a presentar una reclamación ante la autoridad de control si consideras que pueden haberse visto vulnerados tus derechos en relación a la protección de sus datos ante la Agencia Española de Protección de Datos (AEPD), en la calle Jorge Juan, 6, 28001-Madrid o a través de la sede electrónica de la AEPD: https://sedeagpd.gob.es/sede-electronica-web/.`
  String get pageLinkContentPrivacyAccessRights {
    return Intl.message(
      'ATC garantiza en todo caso como usuaria el ejercicio de los derechos de acceso, rectificación, cancelación, información y oposición, limitación y portabilidad, en los términos dispuestos en la legislación vigente. Por ello, podrás ejercer tus derechos remitiendo una solicitud expresa a la dirección postal indicada en el encabezamiento y/o enviando un correo electrónico a admin@athousandcolibris.com, indicando en el asunto: Derechos ARCO-POL, y adjuntando fotocopia de tu DNI. Si lo requieres, tenemos a tu disposición formularios para el correcto ejercicio de tus derechos.\n\nEn ambos casos deberás acompañar una copia de tu documento nacional de identidad, pasaporte u otro documento válido que te identifique. También puedes eliminar tu cuenta (y, por tanto, tu información personal) a través de su configuración cuando estés conectada. Es importante que tengas en cuenta que si solicita la eliminación de tu información personal, nos reservamos el derecho de conservar parte de tu información personal durante un tiempo exigido para cumplir con nuestras obligaciones legales.\n\nEres conocedora, entiendes y aceptas que la retirada del consentimiento y/o el ejercicio del derecho de supresión implicarán que ATC no pueda seguir prestando los servicios propios de la APP.\n\nTambién tienes derecho a presentar una reclamación ante la autoridad de control si consideras que pueden haberse visto vulnerados tus derechos en relación a la protección de sus datos ante la Agencia Española de Protección de Datos (AEPD), en la calle Jorge Juan, 6, 28001-Madrid o a través de la sede electrónica de la AEPD: https://sedeagpd.gob.es/sede-electronica-web/.',
      name: 'pageLinkContentPrivacyAccessRights',
      desc: '',
      args: [],
    );
  }

  /// `Cambios en esta política de privacidad`
  String get pageLinkContentPrivacyPolicyChanges {
    return Intl.message(
      'Cambios en esta política de privacidad',
      name: 'pageLinkContentPrivacyPolicyChanges',
      desc: '',
      args: [],
    );
  }

  /// `Podemos actualizar nuestra Política de Privacidad de vez en cuando. Te notificaremos cualquier cambio publicando la nueva Política de Privacidad en esta página, momento a partir del cual adquieren total validez. Se te aconseja que revises esta Política de Privacidad periódicamente para ver si hay cambios. `
  String get pageLinkContentPrivacyUpdates {
    return Intl.message(
      'Podemos actualizar nuestra Política de Privacidad de vez en cuando. Te notificaremos cualquier cambio publicando la nueva Política de Privacidad en esta página, momento a partir del cual adquieren total validez. Se te aconseja que revises esta Política de Privacidad periódicamente para ver si hay cambios. ',
      name: 'pageLinkContentPrivacyUpdates',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo ponerte en contacto con nosotros?`
  String get pageLinkContentPrivacyContactUs {
    return Intl.message(
      '¿Cómo ponerte en contacto con nosotros?',
      name: 'pageLinkContentPrivacyContactUs',
      desc: '',
      args: [],
    );
  }

  /// `Si tienes alguna pregunta sobre esta Política, puedes ponerte en contacto con nosotros mediante correo electrónico en la siguiente dirección de correo: admin@athousandcolibris.com o bien por correo postal a las señas indicadas en el encabezamiento. \n\nActualización: 8 de octubre de 2021.`
  String get pageLinkContentPrivacyDoubts {
    return Intl.message(
      'Si tienes alguna pregunta sobre esta Política, puedes ponerte en contacto con nosotros mediante correo electrónico en la siguiente dirección de correo: admin@athousandcolibris.com o bien por correo postal a las señas indicadas en el encabezamiento. \n\nActualización: 8 de octubre de 2021.',
      name: 'pageLinkContentPrivacyDoubts',
      desc: '',
      args: [],
    );
  }

  /// `Términos y condiciones de uso`
  String get pageLinkContentTermsAndConditionsTitle {
    return Intl.message(
      'Términos y condiciones de uso',
      name: 'pageLinkContentTermsAndConditionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Bienvenida a Dana! Nos alegramos de que te hayas unido y que quieras disfrutar de tu maternidad.\n\nDana es una aplicación móvil ("Aplicación") que proporciona a las personas que han creado una cuenta acceso a programas (contenidos "texto", "audio"), compartir en foros sociales ("comunidad/ momentos"), llevar un seguimiento de su estado de ánimo ("mood tracker") y escuchar podcasts ("Podcasts"), entre otros. Todo ello describe los servicios de la aplicación ("Servicios"). Nuestras políticas desempeñan un papel importante en la creación de una comunidad atractiva para nuestros miembros.\n\nCuando utilizamos los términos "Dana", "Aplicación" o "Nosotros", en estas Condiciones de Uso (las "Condiciones" o el "Acuerdo"), nos referimos a la Aplicación online gestionada por A thousand colibris S.L. ("ATC") y a la página web www.dana-app.com (la "Web").\n\nCuando utilizamos los términos "usuarios" o "Usted" en este Acuerdo, nos referimos a las personas que utilizan nuestra Aplicación como miembros registrados de la Aplicación ("Miembros").\n\nCuando utilizamos el término "Dispositivo" en este Acuerdo, nos referimos al dispositivo que se utiliza para acceder a la Aplicación, incluidos, entre otros, ordenadores, teléfonos inteligentes y tabletas.\n\nCualquier Servicio al que se acceda a través de la Aplicación es para su uso personal y no comercial.\n\nLa Aplicación contiene audios y otros contenidos propiedad de ATC o con licencia ("Contenido de los Programas"). El Contenido de Programas está protegido por derechos de autor, marcas comerciales, patentes, secretos comerciales y otras leyes, y, entre Usted y ATC, ATC posee y retiene todos los derechos sobre el Contenidos de los Programas.\n\nAl acceder o utilizar la Aplicación y sus Servicios, acepta los términos del Acuerdo, por lo que le rogamos que lea atentamente los Términos que figuran a continuación. Si no está de acuerdo con nuestros Términos y Condiciones de uso en este Acuerdo, absténgase de utilizar la Aplicación. Actualizaremos este Acuerdo periódicamente, así que vuelva a comprobar si hay actualizaciones.`
  String get pageLinkContentTermsAndConditionsWelcome {
    return Intl.message(
      '¡Bienvenida a Dana! Nos alegramos de que te hayas unido y que quieras disfrutar de tu maternidad.\n\nDana es una aplicación móvil ("Aplicación") que proporciona a las personas que han creado una cuenta acceso a programas (contenidos "texto", "audio"), compartir en foros sociales ("comunidad/ momentos"), llevar un seguimiento de su estado de ánimo ("mood tracker") y escuchar podcasts ("Podcasts"), entre otros. Todo ello describe los servicios de la aplicación ("Servicios"). Nuestras políticas desempeñan un papel importante en la creación de una comunidad atractiva para nuestros miembros.\n\nCuando utilizamos los términos "Dana", "Aplicación" o "Nosotros", en estas Condiciones de Uso (las "Condiciones" o el "Acuerdo"), nos referimos a la Aplicación online gestionada por A thousand colibris S.L. ("ATC") y a la página web www.dana-app.com (la "Web").\n\nCuando utilizamos los términos "usuarios" o "Usted" en este Acuerdo, nos referimos a las personas que utilizan nuestra Aplicación como miembros registrados de la Aplicación ("Miembros").\n\nCuando utilizamos el término "Dispositivo" en este Acuerdo, nos referimos al dispositivo que se utiliza para acceder a la Aplicación, incluidos, entre otros, ordenadores, teléfonos inteligentes y tabletas.\n\nCualquier Servicio al que se acceda a través de la Aplicación es para su uso personal y no comercial.\n\nLa Aplicación contiene audios y otros contenidos propiedad de ATC o con licencia ("Contenido de los Programas"). El Contenido de Programas está protegido por derechos de autor, marcas comerciales, patentes, secretos comerciales y otras leyes, y, entre Usted y ATC, ATC posee y retiene todos los derechos sobre el Contenidos de los Programas.\n\nAl acceder o utilizar la Aplicación y sus Servicios, acepta los términos del Acuerdo, por lo que le rogamos que lea atentamente los Términos que figuran a continuación. Si no está de acuerdo con nuestros Términos y Condiciones de uso en este Acuerdo, absténgase de utilizar la Aplicación. Actualizaremos este Acuerdo periódicamente, así que vuelva a comprobar si hay actualizaciones.',
      name: 'pageLinkContentTermsAndConditionsWelcome',
      desc: '',
      args: [],
    );
  }

  /// `1. Membresía`
  String get pageLinkContentTermsAndConditionsPoint1 {
    return Intl.message(
      '1. Membresía',
      name: 'pageLinkContentTermsAndConditionsPoint1',
      desc: '',
      args: [],
    );
  }

  /// `1.1. Cómo convertirse en miembro de Dana`
  String get pageLinkContentTermsAndConditionsPoint1_1 {
    return Intl.message(
      '1.1. Cómo convertirse en miembro de Dana',
      name: 'pageLinkContentTermsAndConditionsPoint1_1',
      desc: '',
      args: [],
    );
  }

  /// `Para convertirse en miembro de la Aplicación (un "Miembro"), debe suscribirse a los Servicios de la Aplicación ("Servicios") y crear una cuenta de miembro. Una cuenta de miembro se crea enviando su dirección de correo electrónico y creando un nombre de usuario y una contraseña.\n\nNuestra recopilación de Información de Usuario (denominada en este Acuerdo "Información de Usuario") y las políticas de uso con respecto a la privacidad de dicha Información de Usuario se establecen en la Política de Privacidad de Dana (como se menciona en la sección 8). Al convertirse en miembro, Usted reconoce y acepta que es el único responsable de la exactitud y el contenido de la Información de Usuario.`
  String get pageLinkContentTermsAndConditionsPoint1_1Description {
    return Intl.message(
      'Para convertirse en miembro de la Aplicación (un "Miembro"), debe suscribirse a los Servicios de la Aplicación ("Servicios") y crear una cuenta de miembro. Una cuenta de miembro se crea enviando su dirección de correo electrónico y creando un nombre de usuario y una contraseña.\n\nNuestra recopilación de Información de Usuario (denominada en este Acuerdo "Información de Usuario") y las políticas de uso con respecto a la privacidad de dicha Información de Usuario se establecen en la Política de Privacidad de Dana (como se menciona en la sección 8). Al convertirse en miembro, Usted reconoce y acepta que es el único responsable de la exactitud y el contenido de la Información de Usuario.',
      name: 'pageLinkContentTermsAndConditionsPoint1_1Description',
      desc: '',
      args: [],
    );
  }

  /// `1.2. Después de registrarse como miembro de Dana`
  String get pageLinkContentTermsAndConditionsPoint1_2 {
    return Intl.message(
      '1.2. Después de registrarse como miembro de Dana',
      name: 'pageLinkContentTermsAndConditionsPoint1_2',
      desc: '',
      args: [],
    );
  }

  /// `Como miembro de Dana, Usted es responsable de mantener la confidencialidad de su cuenta de Dana, su contraseña y otra Información de Usuario y de restringir el acceso a su dispositivo para ayudar a proteger aún más dicha información. Usted es responsable de actualizar su Información de Usuario.\n\nComo miembro, puede recibir acceso a secciones, características y/o funciones de la aplicación que no son accesibles a los no miembros. Como miembro, acepta recibir ocasionalmente correos electrónicos y notificaciones de marketing y de comunicación relacionados con la aplicación. Puede darse de baja de estos correos electrónicos de comunicación y notificaciones optando por no recibirlos.`
  String get pageLinkContentTermsAndConditionsPoint1_2Description {
    return Intl.message(
      'Como miembro de Dana, Usted es responsable de mantener la confidencialidad de su cuenta de Dana, su contraseña y otra Información de Usuario y de restringir el acceso a su dispositivo para ayudar a proteger aún más dicha información. Usted es responsable de actualizar su Información de Usuario.\n\nComo miembro, puede recibir acceso a secciones, características y/o funciones de la aplicación que no son accesibles a los no miembros. Como miembro, acepta recibir ocasionalmente correos electrónicos y notificaciones de marketing y de comunicación relacionados con la aplicación. Puede darse de baja de estos correos electrónicos de comunicación y notificaciones optando por no recibirlos.',
      name: 'pageLinkContentTermsAndConditionsPoint1_2Description',
      desc: '',
      args: [],
    );
  }

  /// `1.3. Información de acceso y credenciales`
  String get pageLinkContentTermsAndConditionsPoint1_3 {
    return Intl.message(
      '1.3. Información de acceso y credenciales',
      name: 'pageLinkContentTermsAndConditionsPoint1_3',
      desc: '',
      args: [],
    );
  }

  /// `Usted es responsable de mantener su nombre de usuario y su contraseña de forma segura y privada, así como de cualquier actividad que se produzca desde su cuenta con y sin su conocimiento. No comparta su información de acceso con nadie más. Si lo hace, podemos cancelar su membresía temporal o permanentemente. Está obligado a notificar a ATC cualquier uso no autorizado de su cuenta.\n\nATC y sus Representantes no serán responsables de ninguna pérdida o daño, directo o indirecto, pecuniario o no pecuniario, que resulte de que usted no cierre la sesión al final de la misma, de una sesión iniciada sin supervisión, o de que un tercero utilice la Aplicación con la información de su cuenta y acceda a ella por cualquier medio, y declina toda responsabilidad al respecto.`
  String get pageLinkContentTermsAndConditionsPoint1_3Description {
    return Intl.message(
      'Usted es responsable de mantener su nombre de usuario y su contraseña de forma segura y privada, así como de cualquier actividad que se produzca desde su cuenta con y sin su conocimiento. No comparta su información de acceso con nadie más. Si lo hace, podemos cancelar su membresía temporal o permanentemente. Está obligado a notificar a ATC cualquier uso no autorizado de su cuenta.\n\nATC y sus Representantes no serán responsables de ninguna pérdida o daño, directo o indirecto, pecuniario o no pecuniario, que resulte de que usted no cierre la sesión al final de la misma, de una sesión iniciada sin supervisión, o de que un tercero utilice la Aplicación con la información de su cuenta y acceda a ella por cualquier medio, y declina toda responsabilidad al respecto.',
      name: 'pageLinkContentTermsAndConditionsPoint1_3Description',
      desc: '',
      args: [],
    );
  }

  /// `1.4. Uso de Dana por parte de menores de edad`
  String get pageLinkContentTermsAndConditionsPoint1_4 {
    return Intl.message(
      '1.4. Uso de Dana por parte de menores de edad',
      name: 'pageLinkContentTermsAndConditionsPoint1_4',
      desc: '',
      args: [],
    );
  }

  /// `Debe tener más de 18 años, o la mayoría de edad en su provincia, territorio o país, para inscribirse como usuario registrado de la Aplicación y sus Servicios. Los menores de 18 años, o la mayoría de edad aplicable, pueden utilizar la Aplicación y los Servicios únicamente con la participación y el consentimiento de uno de los padres o tutor legal, bajo la cuenta de dicha persona y, por lo demás, con sujeción a estas Condiciones. Nos reservamos la discreción absoluta para determinar su elegibilidad para convertirse en miembro. Si se descubre que un miembro es menor de 18 años, su cuenta será eliminada.`
  String get pageLinkContentTermsAndConditionsPoint1_4Description {
    return Intl.message(
      'Debe tener más de 18 años, o la mayoría de edad en su provincia, territorio o país, para inscribirse como usuario registrado de la Aplicación y sus Servicios. Los menores de 18 años, o la mayoría de edad aplicable, pueden utilizar la Aplicación y los Servicios únicamente con la participación y el consentimiento de uno de los padres o tutor legal, bajo la cuenta de dicha persona y, por lo demás, con sujeción a estas Condiciones. Nos reservamos la discreción absoluta para determinar su elegibilidad para convertirse en miembro. Si se descubre que un miembro es menor de 18 años, su cuenta será eliminada.',
      name: 'pageLinkContentTermsAndConditionsPoint1_4Description',
      desc: '',
      args: [],
    );
  }

  /// `2. Suscripciones`
  String get pageLinkContentTermsAndConditionsPoint2 {
    return Intl.message(
      '2. Suscripciones',
      name: 'pageLinkContentTermsAndConditionsPoint2',
      desc: '',
      args: [],
    );
  }

  /// `Se accede a los Servicios de Dana a través de un programa de subscripción de pago. Puede adquirir una subscripción a los servicios desde la aplicación móvil.`
  String get pageLinkContentTermsAndConditionsPoint2Description {
    return Intl.message(
      'Se accede a los Servicios de Dana a través de un programa de subscripción de pago. Puede adquirir una subscripción a los servicios desde la aplicación móvil.',
      name: 'pageLinkContentTermsAndConditionsPoint2Description',
      desc: '',
      args: [],
    );
  }

  /// `2.1. Facturación y cancelaciones`
  String get pageLinkContentTermsAndConditionsPoint2_1 {
    return Intl.message(
      '2.1. Facturación y cancelaciones',
      name: 'pageLinkContentTermsAndConditionsPoint2_1',
      desc: '',
      args: [],
    );
  }

  /// `Dana ofrece una opción de subscripción mensual o anual que proporciona acceso completo a los Servicios. A efectos de nuestras suscripciones anuales, un año constituye 365 días naturales.\n\nPara suscribirse a los Servicios de Dana debe proporcionar un método de pago actual, válido y aceptado, que puede actualizar cuando sea necesario ("Método de pago").\n\nA menos que cancele su subscripción con al menos 24 horas de antelación a la siguiente fecha de facturación, usted autoriza a ATC a cargar su próxima cuota de subscripción a su Método de Pago. Puede encontrar detalles específicos sobre su subscripción a Dana entrando en el área de configuración de la Aplicación móvil.\n\nNuestras suscripciones se pagan mediante un pago único por adelantado con renovaciones automáticas. Usted reconoce y acepta que ATC está autorizada a cargar en el Método de Pago utilizado (i) la cuota de subscripción inicial a la tarifa asegurada en el momento de la compra, y (ii) la(s) cuota(s) de subscripción de renovación a la tarifa efectiva en el momento de dicha renovación. Debe cancelar su subscripción al menos 24 horas antes de que se renueve para evitar la facturación de la cuota de renovación de la subscripción en el método de pago que haya proporcionado.\n\nPuede cancelar su subscripción a Dana en cualquier momento, y seguirá teniendo acceso a los Servicios de la Aplicación hasta el final de su período de facturación de la subscripción actual.\n\nPara cancelar, entre en el área de configuración de la Aplicación móvil y siga las instrucciones de cancelación. Cuando su subscripción haya expirado, su cuenta pasará a ser gratuita, lo que le proporcionará un acceso limitado a los Servicios de la Aplicación.`
  String get pageLinkContentTermsAndConditionsPoint2_1Description {
    return Intl.message(
      'Dana ofrece una opción de subscripción mensual o anual que proporciona acceso completo a los Servicios. A efectos de nuestras suscripciones anuales, un año constituye 365 días naturales.\n\nPara suscribirse a los Servicios de Dana debe proporcionar un método de pago actual, válido y aceptado, que puede actualizar cuando sea necesario ("Método de pago").\n\nA menos que cancele su subscripción con al menos 24 horas de antelación a la siguiente fecha de facturación, usted autoriza a ATC a cargar su próxima cuota de subscripción a su Método de Pago. Puede encontrar detalles específicos sobre su subscripción a Dana entrando en el área de configuración de la Aplicación móvil.\n\nNuestras suscripciones se pagan mediante un pago único por adelantado con renovaciones automáticas. Usted reconoce y acepta que ATC está autorizada a cargar en el Método de Pago utilizado (i) la cuota de subscripción inicial a la tarifa asegurada en el momento de la compra, y (ii) la(s) cuota(s) de subscripción de renovación a la tarifa efectiva en el momento de dicha renovación. Debe cancelar su subscripción al menos 24 horas antes de que se renueve para evitar la facturación de la cuota de renovación de la subscripción en el método de pago que haya proporcionado.\n\nPuede cancelar su subscripción a Dana en cualquier momento, y seguirá teniendo acceso a los Servicios de la Aplicación hasta el final de su período de facturación de la subscripción actual.\n\nPara cancelar, entre en el área de configuración de la Aplicación móvil y siga las instrucciones de cancelación. Cuando su subscripción haya expirado, su cuenta pasará a ser gratuita, lo que le proporcionará un acceso limitado a los Servicios de la Aplicación.',
      name: 'pageLinkContentTermsAndConditionsPoint2_1Description',
      desc: '',
      args: [],
    );
  }

  /// `2.2. Modificación de las tarifas y los cargos`
  String get pageLinkContentTermsAndConditionsPoint2_2 {
    return Intl.message(
      '2.2. Modificación de las tarifas y los cargos',
      name: 'pageLinkContentTermsAndConditionsPoint2_2',
      desc: '',
      args: [],
    );
  }

  /// `Podemos cambiar nuestros planes de subscripción y el precio de los Servicios de vez en cuando; sin embargo, cualquier cambio de precio o de nuestros planes de subscripción se le aplicará no antes de los 30 días siguientes a su notificación y siempre respetando la vigencia de la subscripción y/o servicio contratado previamente hasta su fin.`
  String get pageLinkContentTermsAndConditionsPoint2_2Description {
    return Intl.message(
      'Podemos cambiar nuestros planes de subscripción y el precio de los Servicios de vez en cuando; sin embargo, cualquier cambio de precio o de nuestros planes de subscripción se le aplicará no antes de los 30 días siguientes a su notificación y siempre respetando la vigencia de la subscripción y/o servicio contratado previamente hasta su fin.',
      name: 'pageLinkContentTermsAndConditionsPoint2_2Description',
      desc: '',
      args: [],
    );
  }

  /// `2.3. Prueba gratuita y precios con descuento`
  String get pageLinkContentTermsAndConditionsPoint2_3 {
    return Intl.message(
      '2.3. Prueba gratuita y precios con descuento',
      name: 'pageLinkContentTermsAndConditionsPoint2_3',
      desc: '',
      args: [],
    );
  }

  /// `Su experiencia en Dana comienza con una prueba gratuita. El periodo de prueba gratuito proporciona acceso por tiempo limitado a los Servicios de la Aplicación.\n\nTambién podemos ofrecer precios con descuento durante un periodo limitado de su subscripción.\n\nLa elegibilidad para la prueba gratuita o cualquier precio con descuento es determinada por ATC a su entera discreción y podemos limitar la elegibilidad para evitar el abuso de la prueba gratuita o de los precios con descuento. Nos reservamos el derecho a revocar la prueba gratuita o el precio con descuento y a poner su cuenta en espera en caso de que determinemos que usted no es elegible o está abusando de la oferta. Pueden aplicarse restricciones en caso de combinaciones con otras ofertas.\n\nCuando se convierta en suscriptor de pago, cargaremos en su método de pago la cuota de subscripción. El plan de subscripción se renovará automáticamente según proceda cada mes o anualmente.\n\nDurante el periodo de su subscripción, le concedemos una licencia limitada, no exclusiva e intransferible para acceder a la Aplicación y al Contenido de Dana.\n\nSu membresía y su subscripción no son transferibles y, por lo tanto, no pueden ser vendidas, intercambiadas o transferidas de ninguna manera.`
  String get pageLinkContentTermsAndConditionsPoint2_3Description {
    return Intl.message(
      'Su experiencia en Dana comienza con una prueba gratuita. El periodo de prueba gratuito proporciona acceso por tiempo limitado a los Servicios de la Aplicación.\n\nTambién podemos ofrecer precios con descuento durante un periodo limitado de su subscripción.\n\nLa elegibilidad para la prueba gratuita o cualquier precio con descuento es determinada por ATC a su entera discreción y podemos limitar la elegibilidad para evitar el abuso de la prueba gratuita o de los precios con descuento. Nos reservamos el derecho a revocar la prueba gratuita o el precio con descuento y a poner su cuenta en espera en caso de que determinemos que usted no es elegible o está abusando de la oferta. Pueden aplicarse restricciones en caso de combinaciones con otras ofertas.\n\nCuando se convierta en suscriptor de pago, cargaremos en su método de pago la cuota de subscripción. El plan de subscripción se renovará automáticamente según proceda cada mes o anualmente.\n\nDurante el periodo de su subscripción, le concedemos una licencia limitada, no exclusiva e intransferible para acceder a la Aplicación y al Contenido de Dana.\n\nSu membresía y su subscripción no son transferibles y, por lo tanto, no pueden ser vendidas, intercambiadas o transferidas de ninguna manera.',
      name: 'pageLinkContentTermsAndConditionsPoint2_3Description',
      desc: '',
      args: [],
    );
  }

  /// `2.4. Promociones u otras ofertas`
  String get pageLinkContentTermsAndConditionsPoint2_4 {
    return Intl.message(
      '2.4. Promociones u otras ofertas',
      name: 'pageLinkContentTermsAndConditionsPoint2_4',
      desc: '',
      args: [],
    );
  }

  /// `Cualquier código de promoción u oferta proporcionada por nosotros no puede utilizarse junto con ningún otro código de promoción u oferta, pasada o presente. Las ofertas introductorias sólo están disponibles para los nuevos usuarios de la Aplicación, salvo que se indique expresamente lo contrario. Los usuarios anteriores de la Aplicación no se consideran nuevos usuarios. No se aplicará ningún código de promoción o descuento a las suscripciones corporativas o a otras suscripciones comunitarias, a menos que se acuerde lo contrario. A menos que se establezca lo contrario en los términos de cualquier promoción, todas las promociones de precios o descuentos se aplicarán al período de la subscripción que aplique la oferta, y cualquier renovación fuera de ese periodo se cobrará a la tarifa vigente en el momento de la renovación para el tipo de subscripción adquirida.`
  String get pageLinkContentTermsAndConditionsPoint2_4Description {
    return Intl.message(
      'Cualquier código de promoción u oferta proporcionada por nosotros no puede utilizarse junto con ningún otro código de promoción u oferta, pasada o presente. Las ofertas introductorias sólo están disponibles para los nuevos usuarios de la Aplicación, salvo que se indique expresamente lo contrario. Los usuarios anteriores de la Aplicación no se consideran nuevos usuarios. No se aplicará ningún código de promoción o descuento a las suscripciones corporativas o a otras suscripciones comunitarias, a menos que se acuerde lo contrario. A menos que se establezca lo contrario en los términos de cualquier promoción, todas las promociones de precios o descuentos se aplicarán al período de la subscripción que aplique la oferta, y cualquier renovación fuera de ese periodo se cobrará a la tarifa vigente en el momento de la renovación para el tipo de subscripción adquirida.',
      name: 'pageLinkContentTermsAndConditionsPoint2_4Description',
      desc: '',
      args: [],
    );
  }

  /// `2.5. Reembolsos`
  String get pageLinkContentTermsAndConditionsPoint2_5 {
    return Intl.message(
      '2.5. Reembolsos',
      name: 'pageLinkContentTermsAndConditionsPoint2_5',
      desc: '',
      args: [],
    );
  }

  /// `Los reembolsos pueden solicitarse en las tiendas de Google Play o Apple y están sujetos a sus políticas de devolución.\n\nSi usted compra a través de uno o más de nuestros socios de subscripción por paquetes, la compra puede estar sujeta a los Términos y Condiciones de dichos socios, y el pago y la gestión de la subscripción por paquetes pueden ser administrados por ellos.`
  String get pageLinkContentTermsAndConditionsPoint2_5Description {
    return Intl.message(
      'Los reembolsos pueden solicitarse en las tiendas de Google Play o Apple y están sujetos a sus políticas de devolución.\n\nSi usted compra a través de uno o más de nuestros socios de subscripción por paquetes, la compra puede estar sujeta a los Términos y Condiciones de dichos socios, y el pago y la gestión de la subscripción por paquetes pueden ser administrados por ellos.',
      name: 'pageLinkContentTermsAndConditionsPoint2_5Description',
      desc: '',
      args: [],
    );
  }

  /// `3. Descargo de responsabilidad médica`
  String get pageLinkContentTermsAndConditionsPoint3 {
    return Intl.message(
      '3. Descargo de responsabilidad médica',
      name: 'pageLinkContentTermsAndConditionsPoint3',
      desc: '',
      args: [],
    );
  }

  /// `La Aplicación de Dana es un producto de software que proporciona contenido de aprendizaje e información en las áreas de autocuidado personal, salud y bienestar. No somos un proveedor de salud mental, atención médica o dispositivos médicos, ni nuestros Servicios deben considerarse como un consejo médico. Sólo su médico u otro proveedor de atención médica puede proporcionarle asesoramiento médico.\n\nEl contenido de la Aplicación de Dana, incluyendo, pero sin limitarse a ello, texto, gráficos, vídeo, audio, artículos, información de terceros y debates, puede incluir información médica que se proporciona sólo para su comodidad y está destinada únicamente a fines de información general.\n\nEsta información no constituye un consejo médico ni sustituye a un examen médico. Si tiene alguna duda médica, consulte a un profesional de la medicina o pida consejo a su médico u otro profesional de la salud. No retrase o ignore el consejo de su proveedor de atención médica ni retrase la obtención de atención por el contenido de esta Aplicación o sus Servicios. \n\nNo nos hacemos responsables de las consecuencias de que usted haya leído o se haya informado sobre dichos consejos u otros materiales, ya que usted asume la plena responsabilidad de sus decisiones y acciones. Su atención médica y de salud mental son únicamente su responsabilidad.`
  String get pageLinkContentTermsAndConditionsPoint3Description {
    return Intl.message(
      'La Aplicación de Dana es un producto de software que proporciona contenido de aprendizaje e información en las áreas de autocuidado personal, salud y bienestar. No somos un proveedor de salud mental, atención médica o dispositivos médicos, ni nuestros Servicios deben considerarse como un consejo médico. Sólo su médico u otro proveedor de atención médica puede proporcionarle asesoramiento médico.\n\nEl contenido de la Aplicación de Dana, incluyendo, pero sin limitarse a ello, texto, gráficos, vídeo, audio, artículos, información de terceros y debates, puede incluir información médica que se proporciona sólo para su comodidad y está destinada únicamente a fines de información general.\n\nEsta información no constituye un consejo médico ni sustituye a un examen médico. Si tiene alguna duda médica, consulte a un profesional de la medicina o pida consejo a su médico u otro profesional de la salud. No retrase o ignore el consejo de su proveedor de atención médica ni retrase la obtención de atención por el contenido de esta Aplicación o sus Servicios. \n\nNo nos hacemos responsables de las consecuencias de que usted haya leído o se haya informado sobre dichos consejos u otros materiales, ya que usted asume la plena responsabilidad de sus decisiones y acciones. Su atención médica y de salud mental son únicamente su responsabilidad.',
      name: 'pageLinkContentTermsAndConditionsPoint3Description',
      desc: '',
      args: [],
    );
  }

  /// `4. Conducta adecuada`
  String get pageLinkContentTermsAndConditionsPoint4 {
    return Intl.message(
      '4. Conducta adecuada',
      name: 'pageLinkContentTermsAndConditionsPoint4',
      desc: '',
      args: [],
    );
  }

  /// `Dana es una Aplicación que apoya los intercambios sociales entre nuestros Miembros y, como tal, nuestra política es apoyar el libre intercambio de ideas y las interacciones positivas de los Miembros. Exigimos a los Miembros que interactúen de forma respetuosa con los demás y que no impidan a nadie el uso de la Aplicación.\n\nUsted es responsable del contenido que publique o intercambie en Dana y de cualquier consecuencia de añadir esa información a la Aplicación.\n\nAl utilizar la Aplicación, usted se compromete a:\n\nPublicar contenidos que sean respetuosos con los demás. Evitar la incitación al odio: no incluir lenguaje amenazante, abusivo, acosador, difamatorio, fraudulento u obsceno. No publicar contenidos relacionados con consejos médicos que se presenten como hechos sin pruebas científicas adecuadas. No publicar o compartir información que viole los derechos legales de otros, incluyendo la violación de los derechos de privacidad, publicidad, derechos de autor, derechos contractuales o cualquier otro derecho, de cualquier persona o entidad. No utilizar la Aplicación para enlazar con cualquier sitio web de terceros que sea un sitio web de spam o phishing, con cualquier sitio web que venda bienes o servicios no relacionados con las actividades o temas de la Aplicación, o con cualquier sitio web que pueda violar cualquier ley aplicable. No utilizar la Aplicación de ninguna manera que pueda interrumpir su funcionamiento o dañar el servicio, o la infraestructura utilizada para ejecutar la Aplicación. No utilizar métodos automatizados para recolectar, raspar y/o reutilizar contenidos. Se prohíbe el uso de cualquier robot, araña, aplicación de búsqueda/recuperación de sitios o cualquier otro dispositivo para recuperar o indexar cualquier parte de la Aplicación o recopilar información sobre los Miembros para cualquier propósito no autorizado. El incumplimiento de cualquiera de los parámetros de uso mencionados anteriormente dará derecho a los administradores de Dana a eliminar o suspender su cuenta y puede dar lugar a la pérdida de todos y cada uno de los beneficios relacionados con la Aplicación acumulados, o de las cuotas de subscripción pagadas por Usted.\n\nUsted se compromete a que toda la información que proporcione durante el registro y el uso del Servicio y la Aplicación sea precisa, verdadera y no engañosa. No puede crear varias cuentas para hacerse pasar por alguien en la Aplicación o aprovecharse de los Servicios de la Aplicación. Si su cuenta ha sido cancelada, no podrá crear una nueva cuenta sin el permiso de ATC.\n\nAunque nos esforzamos por detectar contenidos perjudiciales en Dana, no realizamos un control previo ni garantizamos de otro modo que la Aplicación esté libre de contenidos o conductas inapropiadas. Aunque es raro, podría aparecer contenido inapropiado, y usted accede al contenido bajo su propio riesgo. Confiamos en que usted nos comunique los contenidos que puedan infringir nuestras políticas. Si ve algo que le parece inapropiado, infórmelo a admin@athousandcolibris.com. Después de revisar el contenido, podemos tomar medidas, como restringir el acceso al contenido, eliminar el contenido y limitar o cancelar el acceso de un miembro a la aplicación. Tenga en cuenta que podemos hacer excepciones a estas políticas con fines educativos, médicos o informativos y que nos reservamos el derecho a eliminar contenidos por otros motivos.\n\nLos miembros internacionales se comprometen a cumplir con sus propias normas locales relativas a la conducta en línea y al contenido aceptable, incluidas las leyes que regulan la exportación de datos a España o a su país de residencia.`
  String get pageLinkContentTermsAndConditionsPoint4Description {
    return Intl.message(
      'Dana es una Aplicación que apoya los intercambios sociales entre nuestros Miembros y, como tal, nuestra política es apoyar el libre intercambio de ideas y las interacciones positivas de los Miembros. Exigimos a los Miembros que interactúen de forma respetuosa con los demás y que no impidan a nadie el uso de la Aplicación.\n\nUsted es responsable del contenido que publique o intercambie en Dana y de cualquier consecuencia de añadir esa información a la Aplicación.\n\nAl utilizar la Aplicación, usted se compromete a:\n\nPublicar contenidos que sean respetuosos con los demás. Evitar la incitación al odio: no incluir lenguaje amenazante, abusivo, acosador, difamatorio, fraudulento u obsceno. No publicar contenidos relacionados con consejos médicos que se presenten como hechos sin pruebas científicas adecuadas. No publicar o compartir información que viole los derechos legales de otros, incluyendo la violación de los derechos de privacidad, publicidad, derechos de autor, derechos contractuales o cualquier otro derecho, de cualquier persona o entidad. No utilizar la Aplicación para enlazar con cualquier sitio web de terceros que sea un sitio web de spam o phishing, con cualquier sitio web que venda bienes o servicios no relacionados con las actividades o temas de la Aplicación, o con cualquier sitio web que pueda violar cualquier ley aplicable. No utilizar la Aplicación de ninguna manera que pueda interrumpir su funcionamiento o dañar el servicio, o la infraestructura utilizada para ejecutar la Aplicación. No utilizar métodos automatizados para recolectar, raspar y/o reutilizar contenidos. Se prohíbe el uso de cualquier robot, araña, aplicación de búsqueda/recuperación de sitios o cualquier otro dispositivo para recuperar o indexar cualquier parte de la Aplicación o recopilar información sobre los Miembros para cualquier propósito no autorizado. El incumplimiento de cualquiera de los parámetros de uso mencionados anteriormente dará derecho a los administradores de Dana a eliminar o suspender su cuenta y puede dar lugar a la pérdida de todos y cada uno de los beneficios relacionados con la Aplicación acumulados, o de las cuotas de subscripción pagadas por Usted.\n\nUsted se compromete a que toda la información que proporcione durante el registro y el uso del Servicio y la Aplicación sea precisa, verdadera y no engañosa. No puede crear varias cuentas para hacerse pasar por alguien en la Aplicación o aprovecharse de los Servicios de la Aplicación. Si su cuenta ha sido cancelada, no podrá crear una nueva cuenta sin el permiso de ATC.\n\nAunque nos esforzamos por detectar contenidos perjudiciales en Dana, no realizamos un control previo ni garantizamos de otro modo que la Aplicación esté libre de contenidos o conductas inapropiadas. Aunque es raro, podría aparecer contenido inapropiado, y usted accede al contenido bajo su propio riesgo. Confiamos en que usted nos comunique los contenidos que puedan infringir nuestras políticas. Si ve algo que le parece inapropiado, infórmelo a admin@athousandcolibris.com. Después de revisar el contenido, podemos tomar medidas, como restringir el acceso al contenido, eliminar el contenido y limitar o cancelar el acceso de un miembro a la aplicación. Tenga en cuenta que podemos hacer excepciones a estas políticas con fines educativos, médicos o informativos y que nos reservamos el derecho a eliminar contenidos por otros motivos.\n\nLos miembros internacionales se comprometen a cumplir con sus propias normas locales relativas a la conducta en línea y al contenido aceptable, incluidas las leyes que regulan la exportación de datos a España o a su país de residencia.',
      name: 'pageLinkContentTermsAndConditionsPoint4Description',
      desc: '',
      args: [],
    );
  }

  /// `5. Publicar y compartir información`
  String get pageLinkContentTermsAndConditionsPoint5 {
    return Intl.message(
      '5. Publicar y compartir información',
      name: 'pageLinkContentTermsAndConditionsPoint5',
      desc: '',
      args: [],
    );
  }

  /// `Usted añade información a la Aplicación cuando completa la creación de su cuenta y rellena los formularios de la Aplicación para crear un "Perfil de Miembro" ("Información") y a través de la publicación de contenido en los foros sociales -comunidad / momentos- ("Contenido generado por los miembros"). Más allá de la información requerida para registrarse, añadir información en la Aplicación es voluntario.\n\nLa información de su perfil no será visible en Internet, para que la vean los motores de búsqueda o los visitantes no registrados. Sí será visible lo que comparta con otros miembros registrados. Su dirección de correo electrónico, contraseña, tarjeta de crédito e información bancaria nunca se comparten con terceros. Por favor, consulte nuestra Política de Privacidad para más detalles.\n\nATC limita intencionadamente la solicitud de información que pueda ser utilizada por sí sola o con otra información para identificar, contactar o localizar a una sola persona, o para identificar a un individuo en su contexto ("Información de Identificación Personal" o "IIP"). \n\nAdemás, no filtramos la información que la gente publica. No podemos impedirle que introduzca información de identificación personal como texto libre en la Aplicación, y lo hace bajo su propia responsabilidad.\n\nUsted es responsable de la información y del “Contenido generado por los miembros” que introduzca en la aplicación. Sólo comparta la información y los contenidos que legalmente tenga derecho a compartir por ser de su propiedad o porque tenga permiso del propietario para compartirlos.\n\nEl contenido que Usted decida compartir es visible para otros miembros que pueden ver, compartir, distribuir, acceder y copiar este contenido. Además, cuando Usted publica contenido, otorga a ATC el derecho a utilizar, mostrar, copiar, distribuir, traducir y editar su "Contenido Generado por Miembros". Este contenido también puede ser utilizado para la investigación médica y de marketing o para la elaboración de informes de acuerdo con los términos descritos en nuestra Política de Privacidad.\n\nATC, sus afiliados y sus respectivos representantes, funcionarios, directores, propietarios, funcionarios, socios, asociaciones, directores, empleados, afiliados y otras entidades relacionadas, agentes, representantes, sucesores y cesionarios (en adelante "Representantes"), no serán responsables de ningún daño, pecuniario o de otro tipo, a usted o a cualquier tercero que surja de su presentación o uso del "Contenido Generado por Miembros", ya sea que viole estos Términos o no, y renuncia a cualquier responsabilidad en este sentido.`
  String get pageLinkContentTermsAndConditionsPoint5Description {
    return Intl.message(
      'Usted añade información a la Aplicación cuando completa la creación de su cuenta y rellena los formularios de la Aplicación para crear un "Perfil de Miembro" ("Información") y a través de la publicación de contenido en los foros sociales -comunidad / momentos- ("Contenido generado por los miembros"). Más allá de la información requerida para registrarse, añadir información en la Aplicación es voluntario.\n\nLa información de su perfil no será visible en Internet, para que la vean los motores de búsqueda o los visitantes no registrados. Sí será visible lo que comparta con otros miembros registrados. Su dirección de correo electrónico, contraseña, tarjeta de crédito e información bancaria nunca se comparten con terceros. Por favor, consulte nuestra Política de Privacidad para más detalles.\n\nATC limita intencionadamente la solicitud de información que pueda ser utilizada por sí sola o con otra información para identificar, contactar o localizar a una sola persona, o para identificar a un individuo en su contexto ("Información de Identificación Personal" o "IIP"). \n\nAdemás, no filtramos la información que la gente publica. No podemos impedirle que introduzca información de identificación personal como texto libre en la Aplicación, y lo hace bajo su propia responsabilidad.\n\nUsted es responsable de la información y del “Contenido generado por los miembros” que introduzca en la aplicación. Sólo comparta la información y los contenidos que legalmente tenga derecho a compartir por ser de su propiedad o porque tenga permiso del propietario para compartirlos.\n\nEl contenido que Usted decida compartir es visible para otros miembros que pueden ver, compartir, distribuir, acceder y copiar este contenido. Además, cuando Usted publica contenido, otorga a ATC el derecho a utilizar, mostrar, copiar, distribuir, traducir y editar su "Contenido Generado por Miembros". Este contenido también puede ser utilizado para la investigación médica y de marketing o para la elaboración de informes de acuerdo con los términos descritos en nuestra Política de Privacidad.\n\nATC, sus afiliados y sus respectivos representantes, funcionarios, directores, propietarios, funcionarios, socios, asociaciones, directores, empleados, afiliados y otras entidades relacionadas, agentes, representantes, sucesores y cesionarios (en adelante "Representantes"), no serán responsables de ningún daño, pecuniario o de otro tipo, a usted o a cualquier tercero que surja de su presentación o uso del "Contenido Generado por Miembros", ya sea que viole estos Términos o no, y renuncia a cualquier responsabilidad en este sentido.',
      name: 'pageLinkContentTermsAndConditionsPoint5Description',
      desc: '',
      args: [],
    );
  }

  /// `6. Aplicación para uso no comercial`
  String get pageLinkContentTermsAndConditionsPoint6 {
    return Intl.message(
      '6. Aplicación para uso no comercial',
      name: 'pageLinkContentTermsAndConditionsPoint6',
      desc: '',
      args: [],
    );
  }

  /// `El contenido de la Aplicación, incluyendo cualquier contenido disponible sólo para los Miembros, es sólo para el uso personal de los Miembros individuales y no puede ser utilizado en relación con cualquier actividad o iniciativa comercial sin el permiso de ATC.`
  String get pageLinkContentTermsAndConditionsPoint6Description {
    return Intl.message(
      'El contenido de la Aplicación, incluyendo cualquier contenido disponible sólo para los Miembros, es sólo para el uso personal de los Miembros individuales y no puede ser utilizado en relación con cualquier actividad o iniciativa comercial sin el permiso de ATC.',
      name: 'pageLinkContentTermsAndConditionsPoint6Description',
      desc: '',
      args: [],
    );
  }

  /// `7. Política de privacidad, información personal y permisos para la aplicación`
  String get pageLinkContentTermsAndConditionsPoint7 {
    return Intl.message(
      '7. Política de privacidad, información personal y permisos para la aplicación',
      name: 'pageLinkContentTermsAndConditionsPoint7',
      desc: '',
      args: [],
    );
  }

  /// `Usted está de acuerdo en que ha leído, entendido y aceptado la Política de Privacidad de Dana y el tratamiento de su Información Personal como se describe en ella. La política explica cómo recogemos, almacenamos de forma segura y utilizamos su Información Personal (tal y como se define este término en la política).\n\nAdemás de la información personal y no identificable, la política de privacidad también describe cómo la aplicación accede a funciones de su dispositivo que no forman parte de la aplicación y que son desarrolladas por terceros. Esto se conoce como permisos, y usted acepta que ATC tenga derecho a acceder al código informático de terceros en su Dispositivo de esta manera y como se describe en la Política de cookies.`
  String get pageLinkContentTermsAndConditionsPoint7Description {
    return Intl.message(
      'Usted está de acuerdo en que ha leído, entendido y aceptado la Política de Privacidad de Dana y el tratamiento de su Información Personal como se describe en ella. La política explica cómo recogemos, almacenamos de forma segura y utilizamos su Información Personal (tal y como se define este término en la política).\n\nAdemás de la información personal y no identificable, la política de privacidad también describe cómo la aplicación accede a funciones de su dispositivo que no forman parte de la aplicación y que son desarrolladas por terceros. Esto se conoce como permisos, y usted acepta que ATC tenga derecho a acceder al código informático de terceros en su Dispositivo de esta manera y como se describe en la Política de cookies.',
      name: 'pageLinkContentTermsAndConditionsPoint7Description',
      desc: '',
      args: [],
    );
  }

  /// `8. Derechos de autor y propiedad intelectual`
  String get pageLinkContentTermsAndConditionsPoint8 {
    return Intl.message(
      '8. Derechos de autor y propiedad intelectual',
      name: 'pageLinkContentTermsAndConditionsPoint8',
      desc: '',
      args: [],
    );
  }

  /// `Como miembro de la Aplicación, Usted se compromete a proteger los derechos de autor y la propiedad intelectual de otros. Usted no puede cargar, incrustar, publicar, enviar por correo electrónico, transmitir o poner a disposición cualquier material que infrinja cualquier derecho de autor, patente, marca registrada, secreto comercial u otros derechos de propiedad de cualquier persona o entidad. Cuando proceda, daremos de baja a un miembro que infrinja esta política.\n\nLos elementos de la Aplicación, excluyendo el "Contenido Generado por los Miembros" e incluyendo los logotipos, gráficos, imágenes, software, iconos y otros elementos son propiedad exclusiva de ATC o de nuestros socios y están protegidos por los derechos de autor y otras leyes de propiedad intelectual de España y otros países. La tecnología central de la Aplicación y todo el código de software relacionado sigue siendo propiedad exclusiva de ATC. Todos los derechos no concedidos explícitamente en este documento están reservados. Cualquier infracción de nuestros derechos dará lugar a las acciones legales pertinentes.\n\nSi cree que su trabajo ha sido copiado y publicado en la Aplicación o a través de ella de forma que constituya una infracción de los derechos de autor, puede solicitar la eliminación de esos materiales (o el acceso a ellos) de la Aplicación. Póngase en contacto con nosotros en admin@athousandcolibris.com para obtener más información.\n\nSi el "Contenido generado por los miembros" que Usted envió ha sido eliminado como resultado de una solicitud, y usted cree que su Contenido fue publicado legalmente, póngase en contacto con nosotros en admin@athousandcolibris.com para impugnar la reclamación y pedirnos que lo volvamos a publicar.\n\nSi decide comunicarnos sugerencias para mejorar la Aplicación o cualquier servicio disponible en la Aplicación (colectivamente, "Feedback"), ATC será el propietario de todos los derechos, títulos e intereses sobre el Feedback y tendrá derecho a utilizarlo sin restricciones. Por la presente, usted cede irrevocablemente a ATC todos los derechos, títulos e intereses sobre el Feedback y renuncia a favor de ATC, sus sucesores y cesionarios a todos y cada uno de los derechos sobre el Feedback y se compromete a proporcionar a ATC la asistencia que ésta pueda requerir para documentar, perfeccionar y mantener los derechos de ATC sobre el Feedback. Usted reconoce y acepta que, al proporcionar cualquier Feedback a ATC, no tiene derecho a ninguna compensación o reembolso de ningún tipo por parte de ATC bajo ninguna circunstancia.`
  String get pageLinkContentTermsAndConditionsPoint8Description {
    return Intl.message(
      'Como miembro de la Aplicación, Usted se compromete a proteger los derechos de autor y la propiedad intelectual de otros. Usted no puede cargar, incrustar, publicar, enviar por correo electrónico, transmitir o poner a disposición cualquier material que infrinja cualquier derecho de autor, patente, marca registrada, secreto comercial u otros derechos de propiedad de cualquier persona o entidad. Cuando proceda, daremos de baja a un miembro que infrinja esta política.\n\nLos elementos de la Aplicación, excluyendo el "Contenido Generado por los Miembros" e incluyendo los logotipos, gráficos, imágenes, software, iconos y otros elementos son propiedad exclusiva de ATC o de nuestros socios y están protegidos por los derechos de autor y otras leyes de propiedad intelectual de España y otros países. La tecnología central de la Aplicación y todo el código de software relacionado sigue siendo propiedad exclusiva de ATC. Todos los derechos no concedidos explícitamente en este documento están reservados. Cualquier infracción de nuestros derechos dará lugar a las acciones legales pertinentes.\n\nSi cree que su trabajo ha sido copiado y publicado en la Aplicación o a través de ella de forma que constituya una infracción de los derechos de autor, puede solicitar la eliminación de esos materiales (o el acceso a ellos) de la Aplicación. Póngase en contacto con nosotros en admin@athousandcolibris.com para obtener más información.\n\nSi el "Contenido generado por los miembros" que Usted envió ha sido eliminado como resultado de una solicitud, y usted cree que su Contenido fue publicado legalmente, póngase en contacto con nosotros en admin@athousandcolibris.com para impugnar la reclamación y pedirnos que lo volvamos a publicar.\n\nSi decide comunicarnos sugerencias para mejorar la Aplicación o cualquier servicio disponible en la Aplicación (colectivamente, "Feedback"), ATC será el propietario de todos los derechos, títulos e intereses sobre el Feedback y tendrá derecho a utilizarlo sin restricciones. Por la presente, usted cede irrevocablemente a ATC todos los derechos, títulos e intereses sobre el Feedback y renuncia a favor de ATC, sus sucesores y cesionarios a todos y cada uno de los derechos sobre el Feedback y se compromete a proporcionar a ATC la asistencia que ésta pueda requerir para documentar, perfeccionar y mantener los derechos de ATC sobre el Feedback. Usted reconoce y acepta que, al proporcionar cualquier Feedback a ATC, no tiene derecho a ninguna compensación o reembolso de ningún tipo por parte de ATC bajo ninguna circunstancia.',
      name: 'pageLinkContentTermsAndConditionsPoint8Description',
      desc: '',
      args: [],
    );
  }

  /// `9. Enlaces a otras páginas web`
  String get pageLinkContentTermsAndConditionsPoint9 {
    return Intl.message(
      '9. Enlaces a otras páginas web',
      name: 'pageLinkContentTermsAndConditionsPoint9',
      desc: '',
      args: [],
    );
  }

  /// `Dana puede contener enlaces a otras páginas web o servicios que no están bajo el control de ATC. La inclusión de cualquier enlace no implica la aprobación por parte de ATC de dicho sitio y ATC no es responsable del contenido de dichos sitios o servicios enlazados.\n\nEn ningún caso ATC o sus Representantes serán responsables de cualquier daño, directo o indirecto, pecuniario o no pecuniario (1) por el uso que Usted haga de los sitios web u otros servicios a los que se pueda enlazar desde la Aplicación o de la información contenida en ellos; (2) por cualquier virus, caballo de Troya, gusano u otro archivo destructivo similar que se reciba como resultado de su uso de esos sitios web o servicios; (3) causados por o en relación con, el uso o la confianza en cualquier contenido, o productos o servicios (ya sean gratuitos o de compra) disponibles en o a través de cualquier sitio web o servicio enlazado; o (4) por las acciones de los operadores de cualquiera de esos sitios web o servicios.`
  String get pageLinkContentTermsAndConditionsPoint9Description {
    return Intl.message(
      'Dana puede contener enlaces a otras páginas web o servicios que no están bajo el control de ATC. La inclusión de cualquier enlace no implica la aprobación por parte de ATC de dicho sitio y ATC no es responsable del contenido de dichos sitios o servicios enlazados.\n\nEn ningún caso ATC o sus Representantes serán responsables de cualquier daño, directo o indirecto, pecuniario o no pecuniario (1) por el uso que Usted haga de los sitios web u otros servicios a los que se pueda enlazar desde la Aplicación o de la información contenida en ellos; (2) por cualquier virus, caballo de Troya, gusano u otro archivo destructivo similar que se reciba como resultado de su uso de esos sitios web o servicios; (3) causados por o en relación con, el uso o la confianza en cualquier contenido, o productos o servicios (ya sean gratuitos o de compra) disponibles en o a través de cualquier sitio web o servicio enlazado; o (4) por las acciones de los operadores de cualquiera de esos sitios web o servicios.',
      name: 'pageLinkContentTermsAndConditionsPoint9Description',
      desc: '',
      args: [],
    );
  }

  /// `10. Terminación de la membresía`
  String get pageLinkContentTermsAndConditionsPoint10 {
    return Intl.message(
      '10. Terminación de la membresía',
      name: 'pageLinkContentTermsAndConditionsPoint10',
      desc: '',
      args: [],
    );
  }

  /// `ATC puede dar por terminada su membresía con o sin previo aviso o causa por:\n\n- Violaciones de este Acuerdo\n\n- La solicitud del miembro\n\n- Problemas técnicos inesperados\n\n- Peticiones de las fuerzas del orden\n\n- Período prolongado de inactividad\n\n- Si una cuenta ha sido cancelada, la información del usuario dejará de ser visible en la aplicación. Sin embargo, la información introducida en la Aplicación puede seguir utilizándose con fines de investigación, tal y como se indica en la Política de Privacidad.\n\nEn el caso de que su membresía sea cancelada como resultado del incumplimiento de este Acuerdo o de nuestra Política de Privacidad, no se le proporcionará ningún reembolso de las cuotas de subscripción.`
  String get pageLinkContentTermsAndConditionsPoint10Description {
    return Intl.message(
      'ATC puede dar por terminada su membresía con o sin previo aviso o causa por:\n\n- Violaciones de este Acuerdo\n\n- La solicitud del miembro\n\n- Problemas técnicos inesperados\n\n- Peticiones de las fuerzas del orden\n\n- Período prolongado de inactividad\n\n- Si una cuenta ha sido cancelada, la información del usuario dejará de ser visible en la aplicación. Sin embargo, la información introducida en la Aplicación puede seguir utilizándose con fines de investigación, tal y como se indica en la Política de Privacidad.\n\nEn el caso de que su membresía sea cancelada como resultado del incumplimiento de este Acuerdo o de nuestra Política de Privacidad, no se le proporcionará ningún reembolso de las cuotas de subscripción.',
      name: 'pageLinkContentTermsAndConditionsPoint10Description',
      desc: '',
      args: [],
    );
  }

  /// `11. Modificaciones de este Acuerdo`
  String get pageLinkContentTermsAndConditionsPoint11 {
    return Intl.message(
      '11. Modificaciones de este Acuerdo',
      name: 'pageLinkContentTermsAndConditionsPoint11',
      desc: '',
      args: [],
    );
  }

  /// `Nos reservamos el derecho de modificar este Acuerdo en cualquier momento, y sin previo aviso, publicando los términos modificados en la Aplicación. Le animamos a que revise este Acuerdo periódicamente para conocer cualquier actualización o cambio, que incluirá la fecha de entrada en vigor. Si realizamos algún cambio sustancial en este Acuerdo que afecte materialmente a su relación legal con ATC, haremos esfuerzos comercialmente razonables para notificárselo enviando un aviso a la dirección de correo electrónico principal especificada en su cuenta o publicando un aviso prominente cuando inicie sesión en su cuenta por primera vez tras dichos cambios.`
  String get pageLinkContentTermsAndConditionsPoint11Description {
    return Intl.message(
      'Nos reservamos el derecho de modificar este Acuerdo en cualquier momento, y sin previo aviso, publicando los términos modificados en la Aplicación. Le animamos a que revise este Acuerdo periódicamente para conocer cualquier actualización o cambio, que incluirá la fecha de entrada en vigor. Si realizamos algún cambio sustancial en este Acuerdo que afecte materialmente a su relación legal con ATC, haremos esfuerzos comercialmente razonables para notificárselo enviando un aviso a la dirección de correo electrónico principal especificada en su cuenta o publicando un aviso prominente cuando inicie sesión en su cuenta por primera vez tras dichos cambios.',
      name: 'pageLinkContentTermsAndConditionsPoint11Description',
      desc: '',
      args: [],
    );
  }

  /// `12. Renuncia a las garantías`
  String get pageLinkContentTermsAndConditionsPoint12 {
    return Intl.message(
      '12. Renuncia a las garantías',
      name: 'pageLinkContentTermsAndConditionsPoint12',
      desc: '',
      args: [],
    );
  }

  /// `No respaldamos a ningún proveedor de servicios, producto, proveedor de servicios sanitarios, pruebas u otra información que aparezca en la Aplicación. Le proporcionamos información para que la utilice en la toma de decisiones; sin embargo, usted utiliza la Aplicación bajo su propia responsabilidad.\n\nUsted entiende y acepta expresamente que su uso de la Aplicación, la información que aparece en ella (ya sea proporcionada por Dana o por terceros, incluyendo pero no limitándose a otros Miembros) o cualquier actividad derivada de su uso de la Aplicación o de la información que aparece en ella o de los materiales descargados de la misma es bajo su propio riesgo. La Aplicación, cualquier material descargado de la misma, o cualquier material de terceros, se proporcionan "tal cual" y "como están disponibles", y usted será el único responsable de cualquier daño a su sistema informático o pérdida de datos que resulte de la descarga, transmisión o acceso de cualquier material obtenido a través del uso de la Aplicación o de cualquier otra funcionalidad de la misma, o de las pérdidas o daños (financieros o de otro tipo) que resulten de su uso de la Aplicación, la información en ella, cualquier material descargado de la misma, o cualquier actividad derivada del uso de la Aplicación, la información en ella o cualquier material descargado de la misma.\n\nSe espera que la información o los recursos proporcionados a través de la Aplicación, escritos o producidos por el personal de ATC, escritores independientes u otros subcontratistas contratados por ATC sean tan precisos como sea razonablemente posible en el momento de la escritura o producción, y se ha hecho todo lo posible para garantizar que la información de la Aplicación sea lo más precisa y actualizada posible. Sin embargo, cierta información puede cambiar, y pueden producirse errores u omisiones, y ATC no será responsable de ninguna pérdida o daño, financiero o de otro tipo, resultante de cambios o errores en la información, o de cualquier omisión, en la Aplicación o en la información de la misma. ATC no garantiza en absoluto la exactitud de la información proporcionada por los Miembros en forma de Contenido Generado por los Miembros, y rechaza expresamente cualquier responsabilidad al respecto.\n\nATC rechaza expresamente toda garantía de cualquier tipo, ya sea expresa o implícita, incluyendo pero no limitándose a: garantías de título y no infracción; garantías de que la Aplicación, la información en ella o cualquier material descargado de la misma, y cualquier material de terceros será ininterrumpido, libre de errores, preciso, fiable y libre de virus y otros componentes dañinos; y las garantías implícitas de comerciabilidad y adecuación para un propósito particular. ATC y sus afiliados y sus respectivos Representantes, no garantizan que (i) la Aplicación sea segura o esté disponible en un momento o lugar determinado; (ii) se corrija cualquier defecto o error u omisión; (iii) cualquier contenido (ya sea proporcionado por ATC o por terceros) disponible en la Aplicación o a través de ella esté libre de virus u otros componentes dañinos; o (iv) los resultados del uso de la Aplicación o de cualquier contenido descargado satisfagan sus necesidades.\n\nAlgunos de los contenidos mostrados en la Aplicación (incluidos, entre otros, los “Contenidos generados por los miembros”) pueden incluir materiales (incluso con respecto a productos o servicios) que pertenecen a terceros o son proporcionados por ellos. Usted reconoce que no asumimos ninguna responsabilidad por dichos contenidos, productos y/o servicios.\n\nEn la medida en que la ley no permita una exención de garantías, todo el contenido accesible en esta Aplicación, o cualquier otro sitio web al que nos vinculemos, y todas las operaciones en esta Aplicación están garantizadas sólo en la medida mínima legalmente requerida.`
  String get pageLinkContentTermsAndConditionsPoint12Description {
    return Intl.message(
      'No respaldamos a ningún proveedor de servicios, producto, proveedor de servicios sanitarios, pruebas u otra información que aparezca en la Aplicación. Le proporcionamos información para que la utilice en la toma de decisiones; sin embargo, usted utiliza la Aplicación bajo su propia responsabilidad.\n\nUsted entiende y acepta expresamente que su uso de la Aplicación, la información que aparece en ella (ya sea proporcionada por Dana o por terceros, incluyendo pero no limitándose a otros Miembros) o cualquier actividad derivada de su uso de la Aplicación o de la información que aparece en ella o de los materiales descargados de la misma es bajo su propio riesgo. La Aplicación, cualquier material descargado de la misma, o cualquier material de terceros, se proporcionan "tal cual" y "como están disponibles", y usted será el único responsable de cualquier daño a su sistema informático o pérdida de datos que resulte de la descarga, transmisión o acceso de cualquier material obtenido a través del uso de la Aplicación o de cualquier otra funcionalidad de la misma, o de las pérdidas o daños (financieros o de otro tipo) que resulten de su uso de la Aplicación, la información en ella, cualquier material descargado de la misma, o cualquier actividad derivada del uso de la Aplicación, la información en ella o cualquier material descargado de la misma.\n\nSe espera que la información o los recursos proporcionados a través de la Aplicación, escritos o producidos por el personal de ATC, escritores independientes u otros subcontratistas contratados por ATC sean tan precisos como sea razonablemente posible en el momento de la escritura o producción, y se ha hecho todo lo posible para garantizar que la información de la Aplicación sea lo más precisa y actualizada posible. Sin embargo, cierta información puede cambiar, y pueden producirse errores u omisiones, y ATC no será responsable de ninguna pérdida o daño, financiero o de otro tipo, resultante de cambios o errores en la información, o de cualquier omisión, en la Aplicación o en la información de la misma. ATC no garantiza en absoluto la exactitud de la información proporcionada por los Miembros en forma de Contenido Generado por los Miembros, y rechaza expresamente cualquier responsabilidad al respecto.\n\nATC rechaza expresamente toda garantía de cualquier tipo, ya sea expresa o implícita, incluyendo pero no limitándose a: garantías de título y no infracción; garantías de que la Aplicación, la información en ella o cualquier material descargado de la misma, y cualquier material de terceros será ininterrumpido, libre de errores, preciso, fiable y libre de virus y otros componentes dañinos; y las garantías implícitas de comerciabilidad y adecuación para un propósito particular. ATC y sus afiliados y sus respectivos Representantes, no garantizan que (i) la Aplicación sea segura o esté disponible en un momento o lugar determinado; (ii) se corrija cualquier defecto o error u omisión; (iii) cualquier contenido (ya sea proporcionado por ATC o por terceros) disponible en la Aplicación o a través de ella esté libre de virus u otros componentes dañinos; o (iv) los resultados del uso de la Aplicación o de cualquier contenido descargado satisfagan sus necesidades.\n\nAlgunos de los contenidos mostrados en la Aplicación (incluidos, entre otros, los “Contenidos generados por los miembros”) pueden incluir materiales (incluso con respecto a productos o servicios) que pertenecen a terceros o son proporcionados por ellos. Usted reconoce que no asumimos ninguna responsabilidad por dichos contenidos, productos y/o servicios.\n\nEn la medida en que la ley no permita una exención de garantías, todo el contenido accesible en esta Aplicación, o cualquier otro sitio web al que nos vinculemos, y todas las operaciones en esta Aplicación están garantizadas sólo en la medida mínima legalmente requerida.',
      name: 'pageLinkContentTermsAndConditionsPoint12Description',
      desc: '',
      args: [],
    );
  }

  /// `13. Limitación de la responsabilidad`
  String get pageLinkContentTermsAndConditionsPoint13 {
    return Intl.message(
      '13. Limitación de la responsabilidad',
      name: 'pageLinkContentTermsAndConditionsPoint13',
      desc: '',
      args: [],
    );
  }

  /// `En ningún caso ATC o sus Representantes serán responsables de ningún daño indirecto, especial, consecuente, ejemplar, punitivo u otros daños, o de cualquier pérdida, daño, responsabilidad, coste y gasto que surja de o esté relacionado con (i) su acceso, uso, mal uso o incapacidad de acceso o uso de la Aplicación o (ii) la interrupción, suspensión o terminación de cualquier parte o de toda la Aplicación; y en ambos casos (i) y (ii) independientemente de la causa de la acción (ya sea en contrato, garantía, delito, cuasidelito, agravio, negligencia, responsabilidad estricta o cualquier otra teoría de responsabilidad) e incluso si hemos sido advertidos de la posibilidad de tales daños. \n\nUsted entiende y acepta expresamente que ATC y sus Representantes no serán responsables de ningún daño directo, indirecto, incidental, especial, consecuente, ejemplar; daños punitivos o de otro tipo, incluyendo, pero sin limitarse a, daños por pérdida de beneficios, fondo de comercio, uso, datos u otras pérdidas intangibles, en contrato, agravio, responsabilidad estricta, negligencia, responsabilidad civil general, o cualquier otra causa de acción bajo teoría legal o equitativa, relacionada con la Aplicación, la información en la Aplicación, el uso de la Aplicación, las actividades derivadas de su uso de la Aplicación, cualquier material de terceros (incluyendo, pero sin limitarse a, el “Contenido generado por los miembros”) en la Aplicación, o cualquier material descargado de la Aplicación. Esta limitación de responsabilidad se aplica, sin limitación, a cualquier daño o perjuicio causado por cualquier error, omisión u otro fallo en la actuación de ATC y sus Representantes; cualquier interrupción, defecto o retraso en la operación o transmisión, incluyendo fallos en las líneas de comunicación; cualquier virus informático; y cualquier robo, destrucción o alteración de, o acceso no autorizado a, o uso de, cualquier registro electrónico.`
  String get pageLinkContentTermsAndConditionsPoint13Description {
    return Intl.message(
      'En ningún caso ATC o sus Representantes serán responsables de ningún daño indirecto, especial, consecuente, ejemplar, punitivo u otros daños, o de cualquier pérdida, daño, responsabilidad, coste y gasto que surja de o esté relacionado con (i) su acceso, uso, mal uso o incapacidad de acceso o uso de la Aplicación o (ii) la interrupción, suspensión o terminación de cualquier parte o de toda la Aplicación; y en ambos casos (i) y (ii) independientemente de la causa de la acción (ya sea en contrato, garantía, delito, cuasidelito, agravio, negligencia, responsabilidad estricta o cualquier otra teoría de responsabilidad) e incluso si hemos sido advertidos de la posibilidad de tales daños. \n\nUsted entiende y acepta expresamente que ATC y sus Representantes no serán responsables de ningún daño directo, indirecto, incidental, especial, consecuente, ejemplar; daños punitivos o de otro tipo, incluyendo, pero sin limitarse a, daños por pérdida de beneficios, fondo de comercio, uso, datos u otras pérdidas intangibles, en contrato, agravio, responsabilidad estricta, negligencia, responsabilidad civil general, o cualquier otra causa de acción bajo teoría legal o equitativa, relacionada con la Aplicación, la información en la Aplicación, el uso de la Aplicación, las actividades derivadas de su uso de la Aplicación, cualquier material de terceros (incluyendo, pero sin limitarse a, el “Contenido generado por los miembros”) en la Aplicación, o cualquier material descargado de la Aplicación. Esta limitación de responsabilidad se aplica, sin limitación, a cualquier daño o perjuicio causado por cualquier error, omisión u otro fallo en la actuación de ATC y sus Representantes; cualquier interrupción, defecto o retraso en la operación o transmisión, incluyendo fallos en las líneas de comunicación; cualquier virus informático; y cualquier robo, destrucción o alteración de, o acceso no autorizado a, o uso de, cualquier registro electrónico.',
      name: 'pageLinkContentTermsAndConditionsPoint13Description',
      desc: '',
      args: [],
    );
  }

  /// `14. Indemnización`
  String get pageLinkContentTermsAndConditionsPoint14 {
    return Intl.message(
      '14. Indemnización',
      name: 'pageLinkContentTermsAndConditionsPoint14',
      desc: '',
      args: [],
    );
  }

  /// `A pesar de cualquier otro término de este Acuerdo o de cualquier acto u omisión por parte de ATC o sus Representantes, usted se compromete a indemnizar, defender y eximir de responsabilidad a ATC y sus Representantes, en su caso, de cualquier daño, responsabilidad, costes y gastos (incluidos los honorarios de abogados y contables), reclamaciones o demandas por parte de cualquier persona o entidad, que surjan de (i) su uso o conexión a la Aplicación, la información en ella (incluyendo pero no limitándose al “Contenido Generado por Miembros”), la información descargada de la misma; (ii) su participación en cualquier actividad derivada de la Aplicación o de la información contenida en ella (incluyendo, pero no limitándose, al “Contenido generado por los miembros”); (iii) su violación o incumplimiento de sus obligaciones en virtud del presente Acuerdo o de la Política de Privacidad; o (iv) su violación de cualquier derecho de un tercero.`
  String get pageLinkContentTermsAndConditionsPoint14Description {
    return Intl.message(
      'A pesar de cualquier otro término de este Acuerdo o de cualquier acto u omisión por parte de ATC o sus Representantes, usted se compromete a indemnizar, defender y eximir de responsabilidad a ATC y sus Representantes, en su caso, de cualquier daño, responsabilidad, costes y gastos (incluidos los honorarios de abogados y contables), reclamaciones o demandas por parte de cualquier persona o entidad, que surjan de (i) su uso o conexión a la Aplicación, la información en ella (incluyendo pero no limitándose al “Contenido Generado por Miembros”), la información descargada de la misma; (ii) su participación en cualquier actividad derivada de la Aplicación o de la información contenida en ella (incluyendo, pero no limitándose, al “Contenido generado por los miembros”); (iii) su violación o incumplimiento de sus obligaciones en virtud del presente Acuerdo o de la Política de Privacidad; o (iv) su violación de cualquier derecho de un tercero.',
      name: 'pageLinkContentTermsAndConditionsPoint14Description',
      desc: '',
      args: [],
    );
  }

  /// `15. Miembros internacionales`
  String get pageLinkContentTermsAndConditionsPoint15 {
    return Intl.message(
      '15. Miembros internacionales',
      name: 'pageLinkContentTermsAndConditionsPoint15',
      desc: '',
      args: [],
    );
  }

  /// `ATC no afirma que la información de la Aplicación sea apropiada o accesible fuera de España. La información personal que se envíe a esta Aplicación se recogerá, procesará, almacenará, divulgará y eliminará de acuerdo con la legislación española aplicable y nuestra Política de Privacidad. Si usted es un miembro no español, reconoce y acepta que ATC puede recoger y utilizar su información personal y revelarla a otras entidades fuera de su jurisdicción de residencia. Además, dicha información puede ser almacenada en servidores ubicados fuera de su jurisdicción de residencia. La legislación española puede no proporcionar el grado de protección de la Información Personal que está disponible en otros países. Al proporcionarnos su información, usted reconoce que consiente la transferencia de dicha información fuera de su jurisdicción de residencia, como se detalla en nuestra Política de Privacidad. Si no consiente dicha transferencia, no podrá utilizar la Aplicación.`
  String get pageLinkContentTermsAndConditionsPoint15Description {
    return Intl.message(
      'ATC no afirma que la información de la Aplicación sea apropiada o accesible fuera de España. La información personal que se envíe a esta Aplicación se recogerá, procesará, almacenará, divulgará y eliminará de acuerdo con la legislación española aplicable y nuestra Política de Privacidad. Si usted es un miembro no español, reconoce y acepta que ATC puede recoger y utilizar su información personal y revelarla a otras entidades fuera de su jurisdicción de residencia. Además, dicha información puede ser almacenada en servidores ubicados fuera de su jurisdicción de residencia. La legislación española puede no proporcionar el grado de protección de la Información Personal que está disponible en otros países. Al proporcionarnos su información, usted reconoce que consiente la transferencia de dicha información fuera de su jurisdicción de residencia, como se detalla en nuestra Política de Privacidad. Si no consiente dicha transferencia, no podrá utilizar la Aplicación.',
      name: 'pageLinkContentTermsAndConditionsPoint15Description',
      desc: '',
      args: [],
    );
  }

  /// `16. Avisos a los Miembros`
  String get pageLinkContentTermsAndConditionsPoint16 {
    return Intl.message(
      '16. Avisos a los Miembros',
      name: 'pageLinkContentTermsAndConditionsPoint16',
      desc: '',
      args: [],
    );
  }

  /// `Si se registra como Miembro, acepta que ATC le envíe notificaciones por correo electrónico a la dirección de correo electrónico que proporcionó cuando se registró para convertirse en Miembro (o que posteriormente actualizó utilizando la funcionalidad de la Aplicación).`
  String get pageLinkContentTermsAndConditionsPoint16Description {
    return Intl.message(
      'Si se registra como Miembro, acepta que ATC le envíe notificaciones por correo electrónico a la dirección de correo electrónico que proporcionó cuando se registró para convertirse en Miembro (o que posteriormente actualizó utilizando la funcionalidad de la Aplicación).',
      name: 'pageLinkContentTermsAndConditionsPoint16Description',
      desc: '',
      args: [],
    );
  }

  /// `17. Modificaciones, terminación, interrupción e interrupciones de la Aplicación`
  String get pageLinkContentTermsAndConditionsPoint17 {
    return Intl.message(
      '17. Modificaciones, terminación, interrupción e interrupciones de la Aplicación',
      name: 'pageLinkContentTermsAndConditionsPoint17',
      desc: '',
      args: [],
    );
  }

  /// `Usted entiende, acepta y reconoce que podemos modificar, suspender, interrumpir o interrumpir la Aplicación, cualquier parte de la Aplicación o el uso de la Aplicación, ya sea para todos los miembros o para usted específicamente, en cualquier momento con o sin previo aviso. Usted acepta y reconoce que no seremos responsables de ninguna de las acciones mencionadas ni de ninguna pérdida o daño, ya sea pecuniario o de otro tipo, que sea causado o esté relacionado con cualquiera de las acciones mencionadas. En caso de que la aplicación deje de funcionar, no se reembolsarán las cuotas de subscripción pagadas por los miembros.\n\nLa Aplicación depende de varios factores como el software, el hardware y las herramientas, ya sean propias o de nuestros contratistas y proveedores. Aunque hacemos esfuerzos comercialmente razonables para garantizar la fiabilidad y accesibilidad de la Aplicación, usted entiende y acepta que ninguna Aplicación puede ser 100% fiable y accesible, por lo que no podemos garantizar que el acceso a la Aplicación sea ininterrumpido o que sea accesible, consistente, oportuno o libre de errores en todo momento.`
  String get pageLinkContentTermsAndConditionsPoint17Description {
    return Intl.message(
      'Usted entiende, acepta y reconoce que podemos modificar, suspender, interrumpir o interrumpir la Aplicación, cualquier parte de la Aplicación o el uso de la Aplicación, ya sea para todos los miembros o para usted específicamente, en cualquier momento con o sin previo aviso. Usted acepta y reconoce que no seremos responsables de ninguna de las acciones mencionadas ni de ninguna pérdida o daño, ya sea pecuniario o de otro tipo, que sea causado o esté relacionado con cualquiera de las acciones mencionadas. En caso de que la aplicación deje de funcionar, no se reembolsarán las cuotas de subscripción pagadas por los miembros.\n\nLa Aplicación depende de varios factores como el software, el hardware y las herramientas, ya sean propias o de nuestros contratistas y proveedores. Aunque hacemos esfuerzos comercialmente razonables para garantizar la fiabilidad y accesibilidad de la Aplicación, usted entiende y acepta que ninguna Aplicación puede ser 100% fiable y accesible, por lo que no podemos garantizar que el acceso a la Aplicación sea ininterrumpido o que sea accesible, consistente, oportuno o libre de errores en todo momento.',
      name: 'pageLinkContentTermsAndConditionsPoint17Description',
      desc: '',
      args: [],
    );
  }

  /// `18. Leyes aplicables y jurisdicción`
  String get pageLinkContentTermsAndConditionsPoint18 {
    return Intl.message(
      '18. Leyes aplicables y jurisdicción',
      name: 'pageLinkContentTermsAndConditionsPoint18',
      desc: '',
      args: [],
    );
  }

  /// `Este Acuerdo y el uso que usted haga de la Aplicación se regirán e interpretarán de acuerdo con las leyes de España, vigentes en ese momento, sin tener en cuenta las disposiciones sobre conflicto de leyes. Usted acepta que cualquier acción o procedimiento legal entre usted y ATC se llevará a cabo exclusivamente en los tribunales ubicados en el Barcelona, España. Sin perjuicio de lo anterior, ATC tendrá derecho a emprender acciones contra usted en los tribunales de la jurisdicción competente en la que usted resida o se encuentre: (i) para solicitar medidas cautelares contra usted; (ii) para obtener una sentencia contra usted cuando una sentencia sea, o no, ejecutada por la jurisdicción en la que usted reside o se encuentra; o (iii) para ejecutar una sentencia obtenida contra usted.`
  String get pageLinkContentTermsAndConditionsPoint18Description {
    return Intl.message(
      'Este Acuerdo y el uso que usted haga de la Aplicación se regirán e interpretarán de acuerdo con las leyes de España, vigentes en ese momento, sin tener en cuenta las disposiciones sobre conflicto de leyes. Usted acepta que cualquier acción o procedimiento legal entre usted y ATC se llevará a cabo exclusivamente en los tribunales ubicados en el Barcelona, España. Sin perjuicio de lo anterior, ATC tendrá derecho a emprender acciones contra usted en los tribunales de la jurisdicción competente en la que usted resida o se encuentre: (i) para solicitar medidas cautelares contra usted; (ii) para obtener una sentencia contra usted cuando una sentencia sea, o no, ejecutada por la jurisdicción en la que usted reside o se encuentra; o (iii) para ejecutar una sentencia obtenida contra usted.',
      name: 'pageLinkContentTermsAndConditionsPoint18Description',
      desc: '',
      args: [],
    );
  }

  /// `19. Disposiciones varias`
  String get pageLinkContentTermsAndConditionsPoint19 {
    return Intl.message(
      '19. Disposiciones varias',
      name: 'pageLinkContentTermsAndConditionsPoint19',
      desc: '',
      args: [],
    );
  }

  /// `Este Acuerdo y la Política de Privacidad constituyen el acuerdo completo entre Usted y ATC con respecto a su uso de la Aplicación, sustituyendo cualquier acuerdo anterior entre usted y ATC. Cuando usted descarga la Aplicación, también está sujeto a las Condiciones de Servicio y a la Política de Privacidad del sistema de distribución de aplicaciones que utilizó para descargar la Aplicación (es decir, iOS App Store o Google Play, en adelante "Distribuidor de Aplicaciones de Terceros"). Le recomendamos encarecidamente que lea esos documentos antes de instalar la Aplicación. ATC y sus Representantes no se responsabilizarán en ningún caso de las pérdidas o daños, ya sean pecuniarios o de otro tipo, que sufra usted o cualquier tercero por el hecho de que no se adhiera a las Condiciones de Servicio y/o a la Política de Privacidad de cualquier Distribuidor de Aplicaciones de Terceros al descargar y/o utilizar la Aplicación. ATC no será responsable de ningún incumplimiento de sus obligaciones en virtud de este Acuerdo cuando dicho incumplimiento se deba a cualquier causa más allá del control razonable de ATC, incluyendo, pero sin limitarse a, fallos o degradación mecánica, electrónica o de las comunicaciones. En caso de terminación de este Acuerdo (por las razones establecidas en este Acuerdo o por cualquier otra razón), todas las disposiciones de este Acuerdo que por su naturaleza sobrevivirán a la terminación, incluyendo, sin limitación, las disposiciones de propiedad intelectual, renuncias, indemnizaciones y limitaciones de responsabilidad. Si un tribunal de la jurisdicción competente considera que alguna de las disposiciones del presente Acuerdo o de la Política de Privacidad no es válida, las partes acuerdan, no obstante, que el tribunal debe tratar de hacer efectivas las intenciones de las partes reflejadas en la disposición en cuestión, así como las demás disposiciones del presente Acuerdo o de la Política de Privacidad, según sea el caso, y que las demás disposiciones seguirán siendo plenamente vigentes. Las partes reconocen haber exigido expresamente que el presente Acuerdo y la Política de Privacidad se redacten en lengua Castellana (Español). Las versiones en otros idiomas del presente Acuerdo o de la Política de Privacidad se facilitan únicamente con fines informativos y de conveniencia y pueden no ser 100% exactas. En caso de discrepancia entre la versión en Castellano y cualquier otra versión lingüística de este Acuerdo o de la Política de Privacidad, usted acepta que la versión en Castellano será la que prevalezca. Los títulos de las secciones de este Acuerdo y de la Política de Privacidad son sólo por conveniencia y no tienen ningún efecto legal o contractual. \n\nPuede ponerse en contacto con nosotros si tiene alguna pregunta sobre este Acuerdo, en admin@athousandcolibris.com. \n\nEditado por última vez el 8 de Octubre de 2021.`
  String get pageLinkContentTermsAndConditionsPoint19Description {
    return Intl.message(
      'Este Acuerdo y la Política de Privacidad constituyen el acuerdo completo entre Usted y ATC con respecto a su uso de la Aplicación, sustituyendo cualquier acuerdo anterior entre usted y ATC. Cuando usted descarga la Aplicación, también está sujeto a las Condiciones de Servicio y a la Política de Privacidad del sistema de distribución de aplicaciones que utilizó para descargar la Aplicación (es decir, iOS App Store o Google Play, en adelante "Distribuidor de Aplicaciones de Terceros"). Le recomendamos encarecidamente que lea esos documentos antes de instalar la Aplicación. ATC y sus Representantes no se responsabilizarán en ningún caso de las pérdidas o daños, ya sean pecuniarios o de otro tipo, que sufra usted o cualquier tercero por el hecho de que no se adhiera a las Condiciones de Servicio y/o a la Política de Privacidad de cualquier Distribuidor de Aplicaciones de Terceros al descargar y/o utilizar la Aplicación. ATC no será responsable de ningún incumplimiento de sus obligaciones en virtud de este Acuerdo cuando dicho incumplimiento se deba a cualquier causa más allá del control razonable de ATC, incluyendo, pero sin limitarse a, fallos o degradación mecánica, electrónica o de las comunicaciones. En caso de terminación de este Acuerdo (por las razones establecidas en este Acuerdo o por cualquier otra razón), todas las disposiciones de este Acuerdo que por su naturaleza sobrevivirán a la terminación, incluyendo, sin limitación, las disposiciones de propiedad intelectual, renuncias, indemnizaciones y limitaciones de responsabilidad. Si un tribunal de la jurisdicción competente considera que alguna de las disposiciones del presente Acuerdo o de la Política de Privacidad no es válida, las partes acuerdan, no obstante, que el tribunal debe tratar de hacer efectivas las intenciones de las partes reflejadas en la disposición en cuestión, así como las demás disposiciones del presente Acuerdo o de la Política de Privacidad, según sea el caso, y que las demás disposiciones seguirán siendo plenamente vigentes. Las partes reconocen haber exigido expresamente que el presente Acuerdo y la Política de Privacidad se redacten en lengua Castellana (Español). Las versiones en otros idiomas del presente Acuerdo o de la Política de Privacidad se facilitan únicamente con fines informativos y de conveniencia y pueden no ser 100% exactas. En caso de discrepancia entre la versión en Castellano y cualquier otra versión lingüística de este Acuerdo o de la Política de Privacidad, usted acepta que la versión en Castellano será la que prevalezca. Los títulos de las secciones de este Acuerdo y de la Política de Privacidad son sólo por conveniencia y no tienen ningún efecto legal o contractual. \n\nPuede ponerse en contacto con nosotros si tiene alguna pregunta sobre este Acuerdo, en admin@athousandcolibris.com. \n\nEditado por última vez el 8 de Octubre de 2021.',
      name: 'pageLinkContentTermsAndConditionsPoint19Description',
      desc: '',
      args: [],
    );
  }

  /// `¡Bienvenida!`
  String get pageLinkContentTitleProfileLinksWelcome {
    return Intl.message(
      '¡Bienvenida!',
      name: 'pageLinkContentTitleProfileLinksWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda`
  String get pageLinkContentTitleProfileLinksHelp {
    return Intl.message(
      'Ayuda',
      name: 'pageLinkContentTitleProfileLinksHelp',
      desc: '',
      args: [],
    );
  }

  /// `Somos 1.000 colibrís`
  String get pageLinkContentTitleProfileLinksCollaborators {
    return Intl.message(
      'Somos 1.000 colibrís',
      name: 'pageLinkContentTitleProfileLinksCollaborators',
      desc: '',
      args: [],
    );
  }

  /// `Privacidad`
  String get pageLinkContentTitleProfileLinksPrivacity {
    return Intl.message(
      'Privacidad',
      name: 'pageLinkContentTitleProfileLinksPrivacity',
      desc: '',
      args: [],
    );
  }

  /// `Términos y condiciones`
  String get pageLinkContentTitleProfileLinksTermsAndConditions {
    return Intl.message(
      'Términos y condiciones',
      name: 'pageLinkContentTitleProfileLinksTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `La ciencia detrás de Dana`
  String get pageLinkContentTitleProfileLinksScienceBehindDana {
    return Intl.message(
      'La ciencia detrás de Dana',
      name: 'pageLinkContentTitleProfileLinksScienceBehindDana',
      desc: '',
      args: [],
    );
  }

  /// `Política de Cookies`
  String get pageLinkContentTitleProfileLinksCookies {
    return Intl.message(
      'Política de Cookies',
      name: 'pageLinkContentTitleProfileLinksCookies',
      desc: '',
      args: [],
    );
  }

  /// `Política de Cookies`
  String get pageLinkContentCookiesContentPolicy {
    return Intl.message(
      'Política de Cookies',
      name: 'pageLinkContentCookiesContentPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Datos identificativos`
  String get pageLinkContentCookiesContentIdData {
    return Intl.message(
      'Datos identificativos',
      name: 'pageLinkContentCookiesContentIdData',
      desc: '',
      args: [],
    );
  }

  /// `Responsable de los datos personales `
  String get pageLinkContentCookiesContentPersonalDataResponsible {
    return Intl.message(
      'Responsable de los datos personales ',
      name: 'pageLinkContentCookiesContentPersonalDataResponsible',
      desc: '',
      args: [],
    );
  }

  /// `Empresa: A THOUSAND COLIBRIS SL (en adelante “DANA”)\nCIF: B01888437\nDirección: Calle Doctor Trueta, número 113, 1º, 08005, Barcelona, España\nCorreo electrónico: admin@athousandcolibris.com\nSitio web: www.dana-app.com\n\nDe conformidad con lo establecido en la Ley 34/2002 de Servicios de la Sociedad de la Información, te informamos que el sitio web y/o APP www.dana-app.com, utiliza cookies. Las cookies son pequeños ficheros de información del sitio web que el usuario que lo visita almacena en su ordenador o dispositivo. Ello, nos permite entre otras cosas, mejorar el proceso de navegación. `
  String get pageLinkContentCookiesContentATCData {
    return Intl.message(
      'Empresa: A THOUSAND COLIBRIS SL (en adelante “DANA”)\nCIF: B01888437\nDirección: Calle Doctor Trueta, número 113, 1º, 08005, Barcelona, España\nCorreo electrónico: admin@athousandcolibris.com\nSitio web: www.dana-app.com\n\nDe conformidad con lo establecido en la Ley 34/2002 de Servicios de la Sociedad de la Información, te informamos que el sitio web y/o APP www.dana-app.com, utiliza cookies. Las cookies son pequeños ficheros de información del sitio web que el usuario que lo visita almacena en su ordenador o dispositivo. Ello, nos permite entre otras cosas, mejorar el proceso de navegación. ',
      name: 'pageLinkContentCookiesContentATCData',
      desc: '',
      args: [],
    );
  }

  /// `Cookies utilizadas en el sitio web.`
  String get pageLinkContentCookiesContentUsedCookies {
    return Intl.message(
      'Cookies utilizadas en el sitio web.',
      name: 'pageLinkContentCookiesContentUsedCookies',
      desc: '',
      args: [],
    );
  }

  /// `Podemos clasificar las cookies ateniendo a los siguientes parámetros: \n\nEntidad gestora\n\nDependiendo de qué entidad gestione el sitio web o dominio desde el que se configuran y procesan las Cookies, existen los siguientes tipos de Cookies:\n\nCookies de origen. Son cookies que se envían al ordenador del usuario desde un dispositivo o dominio gestionado por nosotros y desde el que se presta el servicio solicitado por el usuario.\n\nCookies de terceros. Son cookies que se envían al ordenador del usuario desde un dispositivo o dominio no gestionado por el editor, sino por otra entidad que procesa los datos obtenidos a través de las cookies.\n\nTiempo de instalación\n\nDependiendo de la cantidad de tiempo que permanezca activo en su Dispositivo, estos son los siguientes tipos de Cookies:\n\nCookies de sesión. Estas cookies están diseñadas para recibir y almacenar datos mientras accede al sitio web. Estas cookies no permanecen almacenadas en su dispositivo cuando sale de la sesión del navegador o del sitio web.\n\nCookies persistentes. Estas cookies permanecen almacenadas en su dispositivo y se puede acceder y procesar después de salir del sitio web, así como cuando navega en él durante un período de tiempo predeterminado. La cookie permanece en el disco duro hasta que alcanza su fecha de vencimiento. El tiempo máximo por el usamos cookies persistentes en nuestro sitio web es de un (1) año. En este punto, el navegador purgaría la cookie del disco duro.\n\nFinalidad\n\nDependiendo de la función de la cookie, las cookies se pueden agrupar de la siguiente manera:\n\nCookies necesarias. Las cookies necesarias ayudan a que un sitio web sea utilizable al habilitar funciones básicas como la navegación de páginas y el acceso a áreas seguras del sitio web. El sitio web no puede funcionar correctamente sin estas cookies.\n\nCookies de preferencias: Cookies que permiten recordar información, de forma que los usuarios puedan acceder al servicio en determinadas condiciones que distinguen su experiencia de la de otros usuarios, como el idioma, el número de resultados de búsqueda a mostrar, el aspecto o contenido del servicio según el navegador a través del cual acceden o la región desde la que se accede. Este tipo de cookies permiten ofrecer un servicio personalizado.\n\nCookies analíticas: son aquellas que permiten cuantificar el número de visitantes y analizar estadísticamente la utilización que hacen los usuarios del portal web. La información recogida mediante este tipo de cookies se utiliza en la medición de la actividad del Sitio Web y para la elaboración de perfiles de navegación anonimizados de los usuarios, con el fin de introducir mejoras en función del análisis de los datos de uso que hacen los usuarios del servicio y/o portal.\n\nCookies de marketing: Las cookies de marketing se utilizan para rastrear visitantes en sitios web. La intención es mostrar anuncios que sean relevantes y atractivos para el usuario individual y, por lo tanto, más valiosos para los editores y anunciantes externos.`
  String get pageLinkContentCookiesContentCookiesClassification {
    return Intl.message(
      'Podemos clasificar las cookies ateniendo a los siguientes parámetros: \n\nEntidad gestora\n\nDependiendo de qué entidad gestione el sitio web o dominio desde el que se configuran y procesan las Cookies, existen los siguientes tipos de Cookies:\n\nCookies de origen. Son cookies que se envían al ordenador del usuario desde un dispositivo o dominio gestionado por nosotros y desde el que se presta el servicio solicitado por el usuario.\n\nCookies de terceros. Son cookies que se envían al ordenador del usuario desde un dispositivo o dominio no gestionado por el editor, sino por otra entidad que procesa los datos obtenidos a través de las cookies.\n\nTiempo de instalación\n\nDependiendo de la cantidad de tiempo que permanezca activo en su Dispositivo, estos son los siguientes tipos de Cookies:\n\nCookies de sesión. Estas cookies están diseñadas para recibir y almacenar datos mientras accede al sitio web. Estas cookies no permanecen almacenadas en su dispositivo cuando sale de la sesión del navegador o del sitio web.\n\nCookies persistentes. Estas cookies permanecen almacenadas en su dispositivo y se puede acceder y procesar después de salir del sitio web, así como cuando navega en él durante un período de tiempo predeterminado. La cookie permanece en el disco duro hasta que alcanza su fecha de vencimiento. El tiempo máximo por el usamos cookies persistentes en nuestro sitio web es de un (1) año. En este punto, el navegador purgaría la cookie del disco duro.\n\nFinalidad\n\nDependiendo de la función de la cookie, las cookies se pueden agrupar de la siguiente manera:\n\nCookies necesarias. Las cookies necesarias ayudan a que un sitio web sea utilizable al habilitar funciones básicas como la navegación de páginas y el acceso a áreas seguras del sitio web. El sitio web no puede funcionar correctamente sin estas cookies.\n\nCookies de preferencias: Cookies que permiten recordar información, de forma que los usuarios puedan acceder al servicio en determinadas condiciones que distinguen su experiencia de la de otros usuarios, como el idioma, el número de resultados de búsqueda a mostrar, el aspecto o contenido del servicio según el navegador a través del cual acceden o la región desde la que se accede. Este tipo de cookies permiten ofrecer un servicio personalizado.\n\nCookies analíticas: son aquellas que permiten cuantificar el número de visitantes y analizar estadísticamente la utilización que hacen los usuarios del portal web. La información recogida mediante este tipo de cookies se utiliza en la medición de la actividad del Sitio Web y para la elaboración de perfiles de navegación anonimizados de los usuarios, con el fin de introducir mejoras en función del análisis de los datos de uso que hacen los usuarios del servicio y/o portal.\n\nCookies de marketing: Las cookies de marketing se utilizan para rastrear visitantes en sitios web. La intención es mostrar anuncios que sean relevantes y atractivos para el usuario individual y, por lo tanto, más valiosos para los editores y anunciantes externos.',
      name: 'pageLinkContentCookiesContentCookiesClassification',
      desc: '',
      args: [],
    );
  }

  /// `Listado de cookies detectadas `
  String get pageLinkContentCookiesContentDetectedCookiesList {
    return Intl.message(
      'Listado de cookies detectadas ',
      name: 'pageLinkContentCookiesContentDetectedCookiesList',
      desc: '',
      args: [],
    );
  }

  /// `A continuación, se muestran las cookies que utilizadas por ATC:`
  String get pageLinkContentCookiesContentATCUsedCookies {
    return Intl.message(
      'A continuación, se muestran las cookies que utilizadas por ATC:',
      name: 'pageLinkContentCookiesContentATCUsedCookies',
      desc: '',
      args: [],
    );
  }

  /// `Cookies necesarias`
  String get pageLinkContentCookiesContentNeededCookies {
    return Intl.message(
      'Cookies necesarias',
      name: 'pageLinkContentCookiesContentNeededCookies',
      desc: '',
      args: [],
    );
  }

  /// `Nombre: __cf_bm \nProveedor: typeform.com\nCaducidad: 1 día\nDescripción: Esta cookie se utiliza para distinguir entre humanos y robots. Esto es beneficioso para el sitio web, con el fin de hacer informes válidos sobre el uso de su sitio web.\n\nNombre: bSession \nProveedor: dana-app.com\nCaducidad: 1 día\nDescripción: Registra qué clúster de servidores está atendiendo al visitante. Se utiliza en relación con el equilibrio de carga para optimizar la experiencia del usuario.\n\nNombre: hs \nProveedor: dana-app.com\nCaducidad: Sesión\nDescripción: Garantiza la seguridad de las entradas de los visitantes al evitar la falsificación de solicitudes entre sitios. Esta cookie es esencial para la seguridad del sitio web y del visitante.\n\nNombre: ssr-caching \nProveedor: dana-app.com\nCaducidad: 1 día\nDescripción: Esta cookie es necesaria para la función de la caché. El sitio web utiliza la caché para optimizar el tiempo de respuesta entre el visitante y el sitio web. La caché se almacena normalmente en el navegador del visitante.\n\nNombre: TS#\nProveedor: dana-app.com\nCaducidad: Sesión\nDescripción: No clasificada.\n\nNombre: XSRF-TOKEN\nProveedor: dana-app.com\nCaducidad: Sesión\nDescripción: Garantiza la seguridad de las entradas de los visitantes al evitar la falsificación de solicitudes entre sitios. Esta cookie es esencial para la seguridad del sitio web y del visitante.`
  String get pageLinkContentCookiesContentCookiesDetails {
    return Intl.message(
      'Nombre: __cf_bm \nProveedor: typeform.com\nCaducidad: 1 día\nDescripción: Esta cookie se utiliza para distinguir entre humanos y robots. Esto es beneficioso para el sitio web, con el fin de hacer informes válidos sobre el uso de su sitio web.\n\nNombre: bSession \nProveedor: dana-app.com\nCaducidad: 1 día\nDescripción: Registra qué clúster de servidores está atendiendo al visitante. Se utiliza en relación con el equilibrio de carga para optimizar la experiencia del usuario.\n\nNombre: hs \nProveedor: dana-app.com\nCaducidad: Sesión\nDescripción: Garantiza la seguridad de las entradas de los visitantes al evitar la falsificación de solicitudes entre sitios. Esta cookie es esencial para la seguridad del sitio web y del visitante.\n\nNombre: ssr-caching \nProveedor: dana-app.com\nCaducidad: 1 día\nDescripción: Esta cookie es necesaria para la función de la caché. El sitio web utiliza la caché para optimizar el tiempo de respuesta entre el visitante y el sitio web. La caché se almacena normalmente en el navegador del visitante.\n\nNombre: TS#\nProveedor: dana-app.com\nCaducidad: Sesión\nDescripción: No clasificada.\n\nNombre: XSRF-TOKEN\nProveedor: dana-app.com\nCaducidad: Sesión\nDescripción: Garantiza la seguridad de las entradas de los visitantes al evitar la falsificación de solicitudes entre sitios. Esta cookie es esencial para la seguridad del sitio web y del visitante.',
      name: 'pageLinkContentCookiesContentCookiesDetails',
      desc: '',
      args: [],
    );
  }

  /// `Cookies estadísticas`
  String get pageLinkContentCookiesContentStatisticCookies {
    return Intl.message(
      'Cookies estadísticas',
      name: 'pageLinkContentCookiesContentStatisticCookies',
      desc: '',
      args: [],
    );
  }

  /// `Nombre: fedops.logger.sessionId \nProveedor: dana-app.com\nCaducidad: Permanente\nDescripción: Registra datos estadísticos sobre el comportamiento de los usuarios en el sitio web. Se utiliza para la analítica interna del operador del sitio web.\n\nNombre: s_cc\nProveedor: analytics\nCaducidad: Sesión\nDescripción: se encarga de configurar y leer esta cookie para determinar si las cookies están habilitadas.\n\nNombre: s_sq\nProveedor: analytics\nCaducidad: Sesión\nDescripción: se encarga de configurar y leer esta cookie cuando la funcionalidad SelectMap o Activity Map están habilitadas.\n\nNombre: s_vi\nProveedor: analytics\nCaducidad: 1 día\nDescripción: marca de fecha y hora del ID único de visitante.`
  String get pageLinkContentCookiesContentStatisticCookiesDetails {
    return Intl.message(
      'Nombre: fedops.logger.sessionId \nProveedor: dana-app.com\nCaducidad: Permanente\nDescripción: Registra datos estadísticos sobre el comportamiento de los usuarios en el sitio web. Se utiliza para la analítica interna del operador del sitio web.\n\nNombre: s_cc\nProveedor: analytics\nCaducidad: Sesión\nDescripción: se encarga de configurar y leer esta cookie para determinar si las cookies están habilitadas.\n\nNombre: s_sq\nProveedor: analytics\nCaducidad: Sesión\nDescripción: se encarga de configurar y leer esta cookie cuando la funcionalidad SelectMap o Activity Map están habilitadas.\n\nNombre: s_vi\nProveedor: analytics\nCaducidad: 1 día\nDescripción: marca de fecha y hora del ID único de visitante.',
      name: 'pageLinkContentCookiesContentStatisticCookiesDetails',
      desc: '',
      args: [],
    );
  }

  /// `Cookies de marketing`
  String get pageLinkContentCookiesContentMarketingCookies {
    return Intl.message(
      'Cookies de marketing',
      name: 'pageLinkContentCookiesContentMarketingCookies',
      desc: '',
      args: [],
    );
  }

  /// `Nombre: attribution_user_id\nProveedor: typeform.com\nCaducidad: 1 año\nDescripción: Se utiliza en el contexto de los cuestionarios emergentes y la mensajería del sitio web. Los datos se utilizan con fines estadísticos o de marketing.\n\nNombre: svSession\nProveedor: dana-app.com\nCaducidad: 2 años\nDescripción: Rastrea a un visitante en todos los sitios de wix.com. La información recopilada puede utilizarse para hacer que la publicidad sea más relevante para el visitante.`
  String get pageLinkContentCookiesContentMarketingCookiesDetails {
    return Intl.message(
      'Nombre: attribution_user_id\nProveedor: typeform.com\nCaducidad: 1 año\nDescripción: Se utiliza en el contexto de los cuestionarios emergentes y la mensajería del sitio web. Los datos se utilizan con fines estadísticos o de marketing.\n\nNombre: svSession\nProveedor: dana-app.com\nCaducidad: 2 años\nDescripción: Rastrea a un visitante en todos los sitios de wix.com. La información recopilada puede utilizarse para hacer que la publicidad sea más relevante para el visitante.',
      name: 'pageLinkContentCookiesContentMarketingCookiesDetails',
      desc: '',
      args: [],
    );
  }

  /// `Cookies de redes sociales externas`
  String get pageLinkContentCookiesContentExternalSocialNetworkCookies {
    return Intl.message(
      'Cookies de redes sociales externas',
      name: 'pageLinkContentCookiesContentExternalSocialNetworkCookies',
      desc: '',
      args: [],
    );
  }

  /// `Se utilizan para que el usuario pueda interactuar con el contenido de diferentes plataformas sociales. Las condiciones de utilización de estas cookies y la información recopilada se regulan por la política de privacidad de la plataforma social correspondiente. Actualmente hacemos uso de las diferentes redes sociales:\n\n- https://www.google.com/intl/es_es/policies/technologies/types/\n\n- https://www.instagram.com/legal/cookies/\n\n- https://www.facebook.com/policies/cookies/\n\n- https://es.linkedin.com/legal/privacy-policy?_l=es_ES`
  String get pageLinkContentCookiesContentExternalSocialNetworkCookiesDetails {
    return Intl.message(
      'Se utilizan para que el usuario pueda interactuar con el contenido de diferentes plataformas sociales. Las condiciones de utilización de estas cookies y la información recopilada se regulan por la política de privacidad de la plataforma social correspondiente. Actualmente hacemos uso de las diferentes redes sociales:\n\n- https://www.google.com/intl/es_es/policies/technologies/types/\n\n- https://www.instagram.com/legal/cookies/\n\n- https://www.facebook.com/policies/cookies/\n\n- https://es.linkedin.com/legal/privacy-policy?_l=es_ES',
      name: 'pageLinkContentCookiesContentExternalSocialNetworkCookiesDetails',
      desc: '',
      args: [],
    );
  }

  /// `Desactivación o eliminación de cookies `
  String get pageLinkContentCookiesContentCookiesElimination {
    return Intl.message(
      'Desactivación o eliminación de cookies ',
      name: 'pageLinkContentCookiesContentCookiesElimination',
      desc: '',
      args: [],
    );
  }

  /// `En el caso de querer modificar la configuración de cookies del navegador, como usuario puedes hacerlo mediante la configuración de las opciones del mismo. Podrás encontrar información sobre cómo modificar las políticas de cookies de los distintos navegadores en los siguientes enlaces:\n\n(i) Para Microsoft Internet Explorer: https://support.microsoft.com/es-es/help/17442/windows-internet-explorer-delete-manage-cookies    \n\n(ii) Para Firefox: http://support.mozilla.org/es/kb/habilitar-y-deshabilitar-cookies-que-los-sitios-we  \n\n (iii) Para Safari: https://support.apple.com/kb/PH19214?viewlocale=es_ES&locale=es_ES\n\n (iv) Para Google Chrome:  http://support.google.com/chrome/bin/answer.py?hl=es&answer=95647`
  String get pageLinkContentCookiesContentCookiesEliminationDetails {
    return Intl.message(
      'En el caso de querer modificar la configuración de cookies del navegador, como usuario puedes hacerlo mediante la configuración de las opciones del mismo. Podrás encontrar información sobre cómo modificar las políticas de cookies de los distintos navegadores en los siguientes enlaces:\n\n(i) Para Microsoft Internet Explorer: https://support.microsoft.com/es-es/help/17442/windows-internet-explorer-delete-manage-cookies    \n\n(ii) Para Firefox: http://support.mozilla.org/es/kb/habilitar-y-deshabilitar-cookies-que-los-sitios-we  \n\n (iii) Para Safari: https://support.apple.com/kb/PH19214?viewlocale=es_ES&locale=es_ES\n\n (iv) Para Google Chrome:  http://support.google.com/chrome/bin/answer.py?hl=es&answer=95647',
      name: 'pageLinkContentCookiesContentCookiesEliminationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Notas adicionales `
  String get pageLinkContentCookiesContentAdditionalNotes {
    return Intl.message(
      'Notas adicionales ',
      name: 'pageLinkContentCookiesContentAdditionalNotes',
      desc: '',
      args: [],
    );
  }

  /// `Los navegadores web son las herramientas encargadas de almacenar las cookies y desde este lugar como usuario puedes ejercitar tu derecho a eliminación o desactivación de las mismas. Ni esta web ni sus representantes legales podemos garantizar la correcta o incorrecta manipulación de las cookies por parte de los mencionados navegadores. Informamos que si no deseas que los sitios web pongan ninguna cookie en el equipo puedes adaptar la configuración del navegador de modo que se notifique antes de que se coloque ninguna cookie en tu dispositivo.\n\nLa aceptación de la presente política de cookies implica que como usuario has sido informado de una forma clara y completa sobre el uso de dispositivos de almacenamiento y recuperación de datos (cookies) así como que Somos Estupendas dispone de tu consentimiento para el uso de las mismas tal y como establece la normativa. \n\nEn el caso de que tengas alguna duda sobre la política de cookies del sitio web, puedes dirigirse a: admin@athousandcolibris.com.\n\nEn el supuesto de querer conocer con más detalles en qué consisten las cookies, en este link se puede acceder a la guía de cookies editada por la Agencia Española de Protección de Datos: https://www.aepd.es/sites/default/files/2020-07/guia-cookies.pdf`
  String get pageLinkContentCookiesContentAdditionalNotesDetails {
    return Intl.message(
      'Los navegadores web son las herramientas encargadas de almacenar las cookies y desde este lugar como usuario puedes ejercitar tu derecho a eliminación o desactivación de las mismas. Ni esta web ni sus representantes legales podemos garantizar la correcta o incorrecta manipulación de las cookies por parte de los mencionados navegadores. Informamos que si no deseas que los sitios web pongan ninguna cookie en el equipo puedes adaptar la configuración del navegador de modo que se notifique antes de que se coloque ninguna cookie en tu dispositivo.\n\nLa aceptación de la presente política de cookies implica que como usuario has sido informado de una forma clara y completa sobre el uso de dispositivos de almacenamiento y recuperación de datos (cookies) así como que Somos Estupendas dispone de tu consentimiento para el uso de las mismas tal y como establece la normativa. \n\nEn el caso de que tengas alguna duda sobre la política de cookies del sitio web, puedes dirigirse a: admin@athousandcolibris.com.\n\nEn el supuesto de querer conocer con más detalles en qué consisten las cookies, en este link se puede acceder a la guía de cookies editada por la Agencia Española de Protección de Datos: https://www.aepd.es/sites/default/files/2020-07/guia-cookies.pdf',
      name: 'pageLinkContentCookiesContentAdditionalNotesDetails',
      desc: '',
      args: [],
    );
  }

  /// `unidades | progreso`
  String get pageProgramDetailUnitsOrProgress {
    return Intl.message(
      'unidades | progreso',
      name: 'pageProgramDetailUnitsOrProgress',
      desc: '',
      args: [],
    );
  }

  /// `Espero haberte ayudado a disfrutar aún más de tu maternidad\n¡Gracias por tu feedback!`
  String get pageProgramDetailHappyToHelp {
    return Intl.message(
      'Espero haberte ayudado a disfrutar aún más de tu maternidad\n¡Gracias por tu feedback!',
      name: 'pageProgramDetailHappyToHelp',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo valoras el programa?`
  String get pageProgramDetailValueProgram {
    return Intl.message(
      '¿Cómo valoras el programa?',
      name: 'pageProgramDetailValueProgram',
      desc: '',
      args: [],
    );
  }

  /// `Ha recibido un email para recuperar la contraseña`
  String get pageForgotPasswordSentEmail {
    return Intl.message(
      'Ha recibido un email para recuperar la contraseña',
      name: 'pageForgotPasswordSentEmail',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, indica un email`
  String get pageForgotPasswordIndicateEmail {
    return Intl.message(
      'Por favor, indica un email',
      name: 'pageForgotPasswordIndicateEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get pageForgotPasswordEmailText {
    return Intl.message(
      'Email',
      name: 'pageForgotPasswordEmailText',
      desc: '',
      args: [],
    );
  }

  /// `No se encontró usuario con el email indicado`
  String get pageLoginMailEmailNotFound {
    return Intl.message(
      'No se encontró usuario con el email indicado',
      name: 'pageLoginMailEmailNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña incorrecta`
  String get pageLoginMailWrongPassword {
    return Intl.message(
      'Contraseña incorrecta',
      name: 'pageLoginMailWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, indica un email`
  String get pageLoginMailIndicateMail {
    return Intl.message(
      'Por favor, indica un email',
      name: 'pageLoginMailIndicateMail',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, indica una contraseña`
  String get pageLoginMailIndicatePassword {
    return Intl.message(
      'Por favor, indica una contraseña',
      name: 'pageLoginMailIndicatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get pageLoginMailPasswordText {
    return Intl.message(
      'Contraseña',
      name: 'pageLoginMailPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Para iniciar sesión, usa el método que usaste anteriormente`
  String get pageLoginSocialOtherSocialLoginAlreadyExists {
    return Intl.message(
      'Para iniciar sesión, usa el método que usaste anteriormente',
      name: 'pageLoginSocialOtherSocialLoginAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Debe aceptar la Política de Privacidad`
  String get pageRegisterMailPrivacyPolicyMandatory {
    return Intl.message(
      'Debe aceptar la Política de Privacidad',
      name: 'pageRegisterMailPrivacyPolicyMandatory',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña es demasiado débil`
  String get pageRegisterMailWeakPassword {
    return Intl.message(
      'La contraseña es demasiado débil',
      name: 'pageRegisterMailWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `La dirección de email ya existe`
  String get pageRegisterMailExistingEmail {
    return Intl.message(
      'La dirección de email ya existe',
      name: 'pageRegisterMailExistingEmail',
      desc: '',
      args: [],
    );
  }

  /// `Parece que algo salió mal, intentelo de nuevo mas tarde`
  String get pageRegisterNoControlError {
    return Intl.message(
      'Parece que algo salió mal, intentelo de nuevo mas tarde',
      name: 'pageRegisterNoControlError',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe tu email`
  String get pageRegisterMailWriteEmail {
    return Intl.message(
      'Por favor, escribe tu email',
      name: 'pageRegisterMailWriteEmail',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe una contraseña`
  String get pageRegisterMailWritePassword {
    return Intl.message(
      'Por favor, escribe una contraseña',
      name: 'pageRegisterMailWritePassword',
      desc: '',
      args: [],
    );
  }

  /// `Crea tu Contraseña`
  String get pageRegisterMailCreatePassword {
    return Intl.message(
      'Crea tu Contraseña',
      name: 'pageRegisterMailCreatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe de nuevo la contraseña`
  String get pageRegisterMailRewritePassword {
    return Intl.message(
      'Por favor, escribe de nuevo la contraseña',
      name: 'pageRegisterMailRewritePassword',
      desc: '',
      args: [],
    );
  }

  /// `Las contraseñas no coinciden`
  String get pageRegisterMailPasswordsNotMatching {
    return Intl.message(
      'Las contraseñas no coinciden',
      name: 'pageRegisterMailPasswordsNotMatching',
      desc: '',
      args: [],
    );
  }

  /// `Repite tu Contraseña`
  String get pageRegisterMailRepeatPassword {
    return Intl.message(
      'Repite tu Contraseña',
      name: 'pageRegisterMailRepeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `He leído y acepto la `
  String get pageRegisterMailReadAndAccept {
    return Intl.message(
      'He leído y acepto la ',
      name: 'pageRegisterMailReadAndAccept',
      desc: '',
      args: [],
    );
  }

  /// `Política de Privacidad`
  String get pageRegisterMailPrivacyPolicy {
    return Intl.message(
      'Política de Privacidad',
      name: 'pageRegisterMailPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Al identificarte aceptas nuestros `
  String get pageRegisterMailAcceptingOur {
    return Intl.message(
      'Al identificarte aceptas nuestros ',
      name: 'pageRegisterMailAcceptingOur',
      desc: '',
      args: [],
    );
  }

  /// `Términos y Condiciones.`
  String get pageRegisterMailTermsAndConditions {
    return Intl.message(
      'Términos y Condiciones.',
      name: 'pageRegisterMailTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Consulta nuestra `
  String get pageRegisterMailConsultOur {
    return Intl.message(
      'Consulta nuestra ',
      name: 'pageRegisterMailConsultOur',
      desc: '',
      args: [],
    );
  }

  /// `Política de Privacidad de datos `
  String get pageRegisterMailDataPrivacyPolicy {
    return Intl.message(
      'Política de Privacidad de datos ',
      name: 'pageRegisterMailDataPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `y`
  String get pageRegisterMailAnd {
    return Intl.message(
      'y',
      name: 'pageRegisterMailAnd',
      desc: '',
      args: [],
    );
  }

  /// `Política de cookies.`
  String get pageRegisterMailCookiesPolicy {
    return Intl.message(
      'Política de cookies.',
      name: 'pageRegisterMailCookiesPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get pageProfileEditName {
    return Intl.message(
      'Nombre',
      name: 'pageProfileEditName',
      desc: '',
      args: [],
    );
  }

  /// `Ciudad`
  String get pageProfileEditCity {
    return Intl.message(
      'Ciudad',
      name: 'pageProfileEditCity',
      desc: '',
      args: [],
    );
  }

  /// `Género`
  String get pageProfileEditGender {
    return Intl.message(
      'Género',
      name: 'pageProfileEditGender',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de nacimiento`
  String get pageProfileEditBirthdate {
    return Intl.message(
      'Fecha de nacimiento',
      name: 'pageProfileEditBirthdate',
      desc: '',
      args: [],
    );
  }

  /// `Estado`
  String get pageProfileEditState {
    return Intl.message(
      'Estado',
      name: 'pageProfileEditState',
      desc: '',
      args: [],
    );
  }

  /// `Semana`
  String get pageProfileEditWeek {
    return Intl.message(
      'Semana',
      name: 'pageProfileEditWeek',
      desc: '',
      args: [],
    );
  }

  /// `Enhorabuena por haber tomado la decisión de cuidar de ti durante tu maternidad. ¿Nos conocemos un poco más para que te pueda acompañar mejor?`
  String get pageInitialProfileOnboarding {
    return Intl.message(
      'Enhorabuena por haber tomado la decisión de cuidar de ti durante tu maternidad. ¿Nos conocemos un poco más para que te pueda acompañar mejor?',
      name: 'pageInitialProfileOnboarding',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, escribe tu nombre`
  String get pageInitialProfile1WriteYourName {
    return Intl.message(
      'Por favor, escribe tu nombre',
      name: 'pageInitialProfile1WriteYourName',
      desc: '',
      args: [],
    );
  }

  /// `Completa esta información`
  String get pageInitialProfile1CompleteInfo {
    return Intl.message(
      'Completa esta información',
      name: 'pageInitialProfile1CompleteInfo',
      desc: '',
      args: [],
    );
  }

  /// `Nombre y apellidos`
  String get pageInitialProfile1FullName {
    return Intl.message(
      'Nombre y apellidos',
      name: 'pageInitialProfile1FullName',
      desc: '',
      args: [],
    );
  }

  /// `Escribe tu nombre y apellidos`
  String get pageInitialProfile1WriteFullName {
    return Intl.message(
      'Escribe tu nombre y apellidos',
      name: 'pageInitialProfile1WriteFullName',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, selecciona tu fecha de nacimiento`
  String get pageInitialProfile2SelectBirthDate {
    return Intl.message(
      'Por favor, selecciona tu fecha de nacimiento',
      name: 'pageInitialProfile2SelectBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Completa esta información`
  String get pageInitialProfile2CompleteInfo {
    return Intl.message(
      'Completa esta información',
      name: 'pageInitialProfile2CompleteInfo',
      desc: '',
      args: [],
    );
  }

  /// `Selecciona fecha de nacimiento`
  String get pageInitialProfile2SelectBirthdate {
    return Intl.message(
      'Selecciona fecha de nacimiento',
      name: 'pageInitialProfile2SelectBirthdate',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de nacimiento`
  String get pageInitialProfile2Birthdate {
    return Intl.message(
      'Fecha de nacimiento',
      name: 'pageInitialProfile2Birthdate',
      desc: '',
      args: [],
    );
  }

  /// `El teléfono debe contener al menos 9 números`
  String get widgetBannerPhoneError {
    return Intl.message(
      'El teléfono debe contener al menos 9 números',
      name: 'widgetBannerPhoneError',
      desc: '',
      args: [],
    );
  }

  /// `¡Bienvenida a la Comunidad de Dana!`
  String get pageCommunityRulesWelcome {
    return Intl.message(
      '¡Bienvenida a la Comunidad de Dana!',
      name: 'pageCommunityRulesWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Aquí puedes compartir todas tus preguntas e inquietudes, tus retos, dificultades, y también tus alegrías, y en general todo lo que quieras compartir de manera segura con otras mujeres de la comunidad.`
  String get pageCommunityRulesIntro {
    return Intl.message(
      'Aquí puedes compartir todas tus preguntas e inquietudes, tus retos, dificultades, y también tus alegrías, y en general todo lo que quieras compartir de manera segura con otras mujeres de la comunidad.',
      name: 'pageCommunityRulesIntro',
      desc: '',
      args: [],
    );
  }

  /// `Las reglas de la comunidad son:`
  String get pageCommunityRulesNumerationTitle {
    return Intl.message(
      'Las reglas de la comunidad son:',
      name: 'pageCommunityRulesNumerationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sé amable y respetuosa`
  String get pageCommunityRulesNumeration1 {
    return Intl.message(
      'Sé amable y respetuosa',
      name: 'pageCommunityRulesNumeration1',
      desc: '',
      args: [],
    );
  }

  /// `Sé honesta`
  String get pageCommunityRulesNumeration2 {
    return Intl.message(
      'Sé honesta',
      name: 'pageCommunityRulesNumeration2',
      desc: '',
      args: [],
    );
  }

  /// `Genera un ambiente de seguridad`
  String get pageCommunityRulesNumeration3 {
    return Intl.message(
      'Genera un ambiente de seguridad',
      name: 'pageCommunityRulesNumeration3',
      desc: '',
      args: [],
    );
  }

  /// `Muestra tu apoyo y ayuda a los demás`
  String get pageCommunityRulesNumeration4 {
    return Intl.message(
      'Muestra tu apoyo y ayuda a los demás',
      name: 'pageCommunityRulesNumeration4',
      desc: '',
      args: [],
    );
  }

  /// `¡Es muy sencillo! En caso de que necesites más detalles, a continuación te explicamos algunos de los principios básicos.`
  String get pageCommunityRulesNumerationDetailIntro {
    return Intl.message(
      '¡Es muy sencillo! En caso de que necesites más detalles, a continuación te explicamos algunos de los principios básicos.',
      name: 'pageCommunityRulesNumerationDetailIntro',
      desc: '',
      args: [],
    );
  }

  /// `Si tienes cualquier pregunta, sugerencia o duda, o quieres informar sobre un abuso de las reglas de la comunidad, escríbenos a hola@dana.health.`
  String get pageCommunityRulesNumerationDetailIntro2 {
    return Intl.message(
      'Si tienes cualquier pregunta, sugerencia o duda, o quieres informar sobre un abuso de las reglas de la comunidad, escríbenos a hola@dana.health.',
      name: 'pageCommunityRulesNumerationDetailIntro2',
      desc: '',
      args: [],
    );
  }

  /// `Ayúdanos a hacer de la Comunidad Dana un espacio seguro y acogedor para todas las mujeres. Apoyémonos unas a otras. Seamos respetuosas, amables y corteses con los demás miembros de la Comunidad, sobre todo cuando no estemos de acuerdo. Aquí no se acepta el acoso, la intimidación, la humillación ni el odio.`
  String get pageCommunityRulesNumeration1Detail {
    return Intl.message(
      'Ayúdanos a hacer de la Comunidad Dana un espacio seguro y acogedor para todas las mujeres. Apoyémonos unas a otras. Seamos respetuosas, amables y corteses con los demás miembros de la Comunidad, sobre todo cuando no estemos de acuerdo. Aquí no se acepta el acoso, la intimidación, la humillación ni el odio.',
      name: 'pageCommunityRulesNumeration1Detail',
      desc: '',
      args: [],
    );
  }

  /// `No se permiten los ataques personales o insultos.`
  String get pageCommunityRulesNumeration1DetailPoint1 {
    return Intl.message(
      'No se permiten los ataques personales o insultos.',
      name: 'pageCommunityRulesNumeration1DetailPoint1',
      desc: '',
      args: [],
    );
  }

  /// `Sé cortés. Puedes discrepar sin ser desagradable.`
  String get pageCommunityRulesNumeration1DetailPoint2 {
    return Intl.message(
      'Sé cortés. Puedes discrepar sin ser desagradable.',
      name: 'pageCommunityRulesNumeration1DetailPoint2',
      desc: '',
      args: [],
    );
  }

  /// `No se permite el acoso, bullying o discurso de odio.`
  String get pageCommunityRulesNumeration1DetailPoint3 {
    return Intl.message(
      'No se permite el acoso, bullying o discurso de odio.',
      name: 'pageCommunityRulesNumeration1DetailPoint3',
      desc: '',
      args: [],
    );
  }

  /// `No humilles a los demás. El lenguaje humillante no está permitido. Puedes estar en desacuerdo sin recurrir a la humillación.`
  String get pageCommunityRulesNumeration1DetailPoint4 {
    return Intl.message(
      'No humilles a los demás. El lenguaje humillante no está permitido. Puedes estar en desacuerdo sin recurrir a la humillación.',
      name: 'pageCommunityRulesNumeration1DetailPoint4',
      desc: '',
      args: [],
    );
  }

  /// `No se permiten comentarios racistas, sexistas, homofóbicos, transfóbicos o de cualquier otro tipo, incluidos los prejuicios contra otras personas debido a su etnicidad, nacionalidad o religión.`
  String get pageCommunityRulesNumeration1DetailPoint5 {
    return Intl.message(
      'No se permiten comentarios racistas, sexistas, homofóbicos, transfóbicos o de cualquier otro tipo, incluidos los prejuicios contra otras personas debido a su etnicidad, nacionalidad o religión.',
      name: 'pageCommunityRulesNumeration1DetailPoint5',
      desc: '',
      args: [],
    );
  }

  /// `La confianza es vital para la comunidad de Dana. Hablamos de muchos temas delicados en la comunidad y queremos que todas las usuarias se sientan seguras al hacerlo. Seamos honestas en nuestras publicaciones y comentarios.`
  String get pageCommunityRulesNumeration2Detail {
    return Intl.message(
      'La confianza es vital para la comunidad de Dana. Hablamos de muchos temas delicados en la comunidad y queremos que todas las usuarias se sientan seguras al hacerlo. Seamos honestas en nuestras publicaciones y comentarios.',
      name: 'pageCommunityRulesNumeration2Detail',
      desc: '',
      args: [],
    );
  }

  /// `No engañes sobre quién eres`
  String get pageCommunityRulesNumeration2DetailPoint1 {
    return Intl.message(
      'No engañes sobre quién eres',
      name: 'pageCommunityRulesNumeration2DetailPoint1',
      desc: '',
      args: [],
    );
  }

  /// `Usa solo una cuenta`
  String get pageCommunityRulesNumeration2DetailPoint2 {
    return Intl.message(
      'Usa solo una cuenta',
      name: 'pageCommunityRulesNumeration2DetailPoint2',
      desc: '',
      args: [],
    );
  }

  /// `La comunidad de Dana es un lugar donde las mujeres deben sentirse seguras para compartir su experiencia en la maternidad, detalles sensibles e íntimos de sus vidas, de su salud y de su fertilidad. En Dana, el respeto y la seguridad son la base de todo. Usa el sentido común cuando publiques en la comunidad de Dana y protege la seguridad de otros miembros denunciando a aquellas usuarias y aquellas publicaciones que infrinjan nuestras reglas.`
  String get pageCommunityRulesNumeration3Detail {
    return Intl.message(
      'La comunidad de Dana es un lugar donde las mujeres deben sentirse seguras para compartir su experiencia en la maternidad, detalles sensibles e íntimos de sus vidas, de su salud y de su fertilidad. En Dana, el respeto y la seguridad son la base de todo. Usa el sentido común cuando publiques en la comunidad de Dana y protege la seguridad de otros miembros denunciando a aquellas usuarias y aquellas publicaciones que infrinjan nuestras reglas.',
      name: 'pageCommunityRulesNumeration3Detail',
      desc: '',
      args: [],
    );
  }

  /// `Denuncia a usuarios que acosan a otros o que infringen las reglas.`
  String get pageCommunityRulesNumeration3DetailPoint1 {
    return Intl.message(
      'Denuncia a usuarios que acosan a otros o que infringen las reglas.',
      name: 'pageCommunityRulesNumeration3DetailPoint1',
      desc: '',
      args: [],
    );
  }

  /// `Se permiten fotos de lactancia. No se permite desnudez, fotos sexualmente explícitas o fotos de genitales.`
  String get pageCommunityRulesNumeration3DetailPoint2 {
    return Intl.message(
      'Se permiten fotos de lactancia. No se permite desnudez, fotos sexualmente explícitas o fotos de genitales.',
      name: 'pageCommunityRulesNumeration3DetailPoint2',
      desc: '',
      args: [],
    );
  }

  /// `No vendas, intercambies ni dones medicamentos recetados.`
  String get pageCommunityRulesNumeration3DetailPoint3 {
    return Intl.message(
      'No vendas, intercambies ni dones medicamentos recetados.',
      name: 'pageCommunityRulesNumeration3DetailPoint3',
      desc: '',
      args: [],
    );
  }

  /// `No publiques tus datos de contacto en la comunidad de Dana.`
  String get pageCommunityRulesNumeration3DetailPoint4 {
    return Intl.message(
      'No publiques tus datos de contacto en la comunidad de Dana.',
      name: 'pageCommunityRulesNumeration3DetailPoint4',
      desc: '',
      args: [],
    );
  }

  /// `No sigas consejos médicos sin consultar a tu médico primero.`
  String get pageCommunityRulesNumeration3DetailPoint5 {
    return Intl.message(
      'No sigas consejos médicos sin consultar a tu médico primero.',
      name: 'pageCommunityRulesNumeration3DetailPoint5',
      desc: '',
      args: [],
    );
  }

  /// `Ten en cuenta que podemos notificar, suspender o bloquear a aquellos usuarios que no siguen las reglas de nuestra comunidad. A los usuarios que infrinjan las reglas repetidamente se les puede bloquear permanentemente.`
  String get pageCommunityRulesNumeration3DetailPoint6 {
    return Intl.message(
      'Ten en cuenta que podemos notificar, suspender o bloquear a aquellos usuarios que no siguen las reglas de nuestra comunidad. A los usuarios que infrinjan las reglas repetidamente se les puede bloquear permanentemente.',
      name: 'pageCommunityRulesNumeration3DetailPoint6',
      desc: '',
      args: [],
    );
  }

  /// `La Comunidad de Dana es un lugar donde sus miembros hacen preguntas, comparten sus experiencias y obtienen consejos. Apoya a tus compañeras de la comunidad respondiendo a sus preguntas, brindándoles información útil desde tu propia experiencia. Respeta que todas y cada una tendrán diferentes opiniones y puntos de vista. Sé sensible a los sentimientos de los demás.`
  String get pageCommunityRulesNumeration4Detail {
    return Intl.message(
      'La Comunidad de Dana es un lugar donde sus miembros hacen preguntas, comparten sus experiencias y obtienen consejos. Apoya a tus compañeras de la comunidad respondiendo a sus preguntas, brindándoles información útil desde tu propia experiencia. Respeta que todas y cada una tendrán diferentes opiniones y puntos de vista. Sé sensible a los sentimientos de los demás.',
      name: 'pageCommunityRulesNumeration4Detail',
      desc: '',
      args: [],
    );
  }

  /// `No envíes spam a la comunidad. No se permite publicar el mismo tema en varios grupos.`
  String get pageCommunityRulesNumeration4DetailPoint1 {
    return Intl.message(
      'No envíes spam a la comunidad. No se permite publicar el mismo tema en varios grupos.',
      name: 'pageCommunityRulesNumeration4DetailPoint1',
      desc: '',
      args: [],
    );
  }

  /// `La Comunidad de Dana no es un lugar para promocionar negocios personales o cualquier otro tipo de promoción comercial. Publicaciones y comentarios promocionales serán eliminados.`
  String get pageCommunityRulesNumeration4DetailPoint2 {
    return Intl.message(
      'La Comunidad de Dana no es un lugar para promocionar negocios personales o cualquier otro tipo de promoción comercial. Publicaciones y comentarios promocionales serán eliminados.',
      name: 'pageCommunityRulesNumeration4DetailPoint2',
      desc: '',
      args: [],
    );
  }

  /// `No está permitido compartir enlaces externos. Todos los enlaces serán eliminados.`
  String get pageCommunityRulesNumeration4DetailPoint3 {
    return Intl.message(
      'No está permitido compartir enlaces externos. Todos los enlaces serán eliminados.',
      name: 'pageCommunityRulesNumeration4DetailPoint3',
      desc: '',
      args: [],
    );
  }

  /// `No publiques ningún tipo de contenido gráfico o enlaces que contengan pornografía, sexo explícito, violencia flagrante u otro contenido que los moderadores determinen que es inapropiado para la comunidad.`
  String get pageCommunityRulesNumeration4DetailPoint4 {
    return Intl.message(
      'No publiques ningún tipo de contenido gráfico o enlaces que contengan pornografía, sexo explícito, violencia flagrante u otro contenido que los moderadores determinen que es inapropiado para la comunidad.',
      name: 'pageCommunityRulesNumeration4DetailPoint4',
      desc: '',
      args: [],
    );
  }

  /// `Sé sensible a los sentimientos de los demás cuando comentes temas delicados.`
  String get pageCommunityRulesNumeration4DetailPoint5 {
    return Intl.message(
      'Sé sensible a los sentimientos de los demás cuando comentes temas delicados.',
      name: 'pageCommunityRulesNumeration4DetailPoint5',
      desc: '',
      args: [],
    );
  }

  /// `Otros aspectos a tener en cuenta:`
  String get pageCommunityRulesOtherAspectsTitle {
    return Intl.message(
      'Otros aspectos a tener en cuenta:',
      name: 'pageCommunityRulesOtherAspectsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Animamos a los usuarios de la Comunidad de Dana a que nos informen sobre el uso inapropiado de otros usuarios a través del sistema de informe dentro de la aplicación o por correo electrónico a hola@dana.health`
  String get pageCommunityRulesOtherAspectsDetail1 {
    return Intl.message(
      'Animamos a los usuarios de la Comunidad de Dana a que nos informen sobre el uso inapropiado de otros usuarios a través del sistema de informe dentro de la aplicación o por correo electrónico a hola@dana.health',
      name: 'pageCommunityRulesOtherAspectsDetail1',
      desc: '',
      args: [],
    );
  }

  /// `Si tu cuenta ha sido suspendida, no crees otra cuenta para acceder a la comunidad. Si lo haces tus cuentas serán bloqueadas permanentemente.`
  String get pageCommunityRulesOtherAspectsDetail2 {
    return Intl.message(
      'Si tu cuenta ha sido suspendida, no crees otra cuenta para acceder a la comunidad. Si lo haces tus cuentas serán bloqueadas permanentemente.',
      name: 'pageCommunityRulesOtherAspectsDetail2',
      desc: '',
      args: [],
    );
  }

  /// `Los usuarios falsos que no respeten las reglas de la Comunidad serán bloqueados permanentemente.`
  String get pageCommunityRulesOtherAspectsDetail3 {
    return Intl.message(
      'Los usuarios falsos que no respeten las reglas de la Comunidad serán bloqueados permanentemente.',
      name: 'pageCommunityRulesOtherAspectsDetail3',
      desc: '',
      args: [],
    );
  }

  /// `Si tienes alguna pregunta o inquietud con respecto a estas pautas, envíanos un correo electrónico a hola@dana.health.`
  String get pageCommunityRulesOtherAspectsDetail4 {
    return Intl.message(
      'Si tienes alguna pregunta o inquietud con respecto a estas pautas, envíanos un correo electrónico a hola@dana.health.',
      name: 'pageCommunityRulesOtherAspectsDetail4',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get pageCommunityRulesAccept {
    return Intl.message(
      'Entendido',
      name: 'pageCommunityRulesAccept',
      desc: '',
      args: [],
    );
  }

  /// `Reglas de la comunidad`
  String get pageCommunityRulesTitle {
    return Intl.message(
      'Reglas de la comunidad',
      name: 'pageCommunityRulesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Denunciar`
  String get pageCommunityPublicationCommentReportAction {
    return Intl.message(
      'Denunciar',
      name: 'pageCommunityPublicationCommentReportAction',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get pageCommunityPublicationCommentCancelAction {
    return Intl.message(
      'Cancelar',
      name: 'pageCommunityPublicationCommentCancelAction',
      desc: '',
      args: [],
    );
  }

  /// `Comunidad`
  String get pagePublicationDetailsTitle {
    return Intl.message(
      'Comunidad',
      name: 'pagePublicationDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Experiencia madres`
  String get pagePublicationDetailsTagRecent {
    return Intl.message(
      'Experiencia madres',
      name: 'pagePublicationDetailsTagRecent',
      desc: '',
      args: [],
    );
  }

  /// `Opinión experta`
  String get pagePublicationDetailsTagExpert {
    return Intl.message(
      'Opinión experta',
      name: 'pagePublicationDetailsTagExpert',
      desc: '',
      args: [],
    );
  }

  /// `Comparte tu experiencia`
  String get pagePublicationDetailsWriteYourComment {
    return Intl.message(
      'Comparte tu experiencia',
      name: 'pagePublicationDetailsWriteYourComment',
      desc: '',
      args: [],
    );
  }

  /// `Publicar`
  String get pagePublicationDetailsPublish {
    return Intl.message(
      'Publicar',
      name: 'pagePublicationDetailsPublish',
      desc: '',
      args: [],
    );
  }

  /// `Editar`
  String get pagePublicationDetailsEdit {
    return Intl.message(
      'Editar',
      name: 'pagePublicationDetailsEdit',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás segura de que\n deseas publicar?`
  String get pagePublicationDetailsTitleConfirm {
    return Intl.message(
      '¿Estás segura de que\n deseas publicar?',
      name: 'pagePublicationDetailsTitleConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Mi evolución`
  String get widgetMoodTrackerMoodSectionTitle {
    return Intl.message(
      'Mi evolución',
      name: 'widgetMoodTrackerMoodSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Solo puedes cambiar aquello de lo que eres consciente`
  String get pageMoodtrackerInfoQuote {
    return Intl.message(
      'Solo puedes cambiar aquello de lo que eres consciente',
      name: 'pageMoodtrackerInfoQuote',
      desc: '',
      args: [],
    );
  }

  /// `Las emociones surgen como resultado de eventos o situaciones específicas. No son ni positivas, ni negativas: surgen por distintas razones y se pueden gestionar con más o menos facilidad.`
  String get pageMoodtrackerEmotionDetail {
    return Intl.message(
      'Las emociones surgen como resultado de eventos o situaciones específicas. No son ni positivas, ni negativas: surgen por distintas razones y se pueden gestionar con más o menos facilidad.',
      name: 'pageMoodtrackerEmotionDetail',
      desc: '',
      args: [],
    );
  }

  /// `Comprender tus emociones te ayuda a gestionarlas y a tomar decisiones para lograr una mejor calidad de vida. Esto tendrá un impacto directamente en ti, tanto en el embarazo como en el posparto, y en tu bebé.`
  String get pageMoodtrackerEmotionDetail2 {
    return Intl.message(
      'Comprender tus emociones te ayuda a gestionarlas y a tomar decisiones para lograr una mejor calidad de vida. Esto tendrá un impacto directamente en ti, tanto en el embarazo como en el posparto, y en tu bebé.',
      name: 'pageMoodtrackerEmotionDetail2',
      desc: '',
      args: [],
    );
  }

  /// `Te invitamos a recoger diariamente cómo te sientes y a escribir un corto texto relacionado con tu estado de ánimo. Te permitirá detectar patrones y poder afrontar mejor las situaciones en futuras ocasiones.`
  String get pageMoodtrackerWhatWeOffer {
    return Intl.message(
      'Te invitamos a recoger diariamente cómo te sientes y a escribir un corto texto relacionado con tu estado de ánimo. Te permitirá detectar patrones y poder afrontar mejor las situaciones en futuras ocasiones.',
      name: 'pageMoodtrackerWhatWeOffer',
      desc: '',
      args: [],
    );
  }

  /// `¿CÓMO INTERPRETO LOS RESULTADOS?`
  String get pageMoodtrackerResultInterpretationTitle {
    return Intl.message(
      '¿CÓMO INTERPRETO LOS RESULTADOS?',
      name: 'pageMoodtrackerResultInterpretationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Visión semanal`
  String get pageMoodtrackerResultInterpretationWeeklyTitle {
    return Intl.message(
      'Visión semanal',
      name: 'pageMoodtrackerResultInterpretationWeeklyTitle',
      desc: '',
      args: [],
    );
  }

  /// `La línea representa el estado emocional que has registrado en el día.`
  String get pageMoodtrackerResultInterpretationWeeklyDescription {
    return Intl.message(
      'La línea representa el estado emocional que has registrado en el día.',
      name: 'pageMoodtrackerResultInterpretationWeeklyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Visión mensual`
  String get pageMoodtrackerResultInterpretationMonthlyTitle {
    return Intl.message(
      'Visión mensual',
      name: 'pageMoodtrackerResultInterpretationMonthlyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cada barra representa un estado emocional, correspondiendo la barra más alta a la emoción predominante durante el mes visualizado, y por contraposición, la barra más pequeña representando la emoción menos registrada durante el mes.`
  String get pageMoodtrackerResultInterpretationMonthlyDescription {
    return Intl.message(
      'Cada barra representa un estado emocional, correspondiendo la barra más alta a la emoción predominante durante el mes visualizado, y por contraposición, la barra más pequeña representando la emoción menos registrada durante el mes.',
      name: 'pageMoodtrackerResultInterpretationMonthlyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Visión anual`
  String get pageMoodtrackerResultInterpretationAnnualTitle {
    return Intl.message(
      'Visión anual',
      name: 'pageMoodtrackerResultInterpretationAnnualTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cada mes está representado por una barra acumulada de todas las emociones que has sentido. Podrás ver cómo se reparten tus emociones durante el año y si ha habido fluctuaciones según el mes. Dentro de cada mes, cuánto más alta sea una barra, más días habrás registrado dicho estado de ánimo.`
  String get pageMoodtrackerResultInterpretationAnnualDescription {
    return Intl.message(
      'Cada mes está representado por una barra acumulada de todas las emociones que has sentido. Podrás ver cómo se reparten tus emociones durante el año y si ha habido fluctuaciones según el mes. Dentro de cada mes, cuánto más alta sea una barra, más días habrás registrado dicho estado de ánimo.',
      name: 'pageMoodtrackerResultInterpretationAnnualDescription',
      desc: '',
      args: [],
    );
  }

  /// `¿TIENES PREGUNTAS?`
  String get pageMoodtrackerQuestionsTitle {
    return Intl.message(
      '¿TIENES PREGUNTAS?',
      name: 'pageMoodtrackerQuestionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `En caso de preguntas, conecta en nuestra comunidad.`
  String get pageMoodtrackerQuestionsDescription {
    return Intl.message(
      'En caso de preguntas, conecta en nuestra comunidad.',
      name: 'pageMoodtrackerQuestionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `ir a los programas`
  String get pageNewHomeGoToPage {
    return Intl.message(
      'ir a los programas',
      name: 'pageNewHomeGoToPage',
      desc: '',
      args: [],
    );
  }

  /// `Todavía no has empezado ningún programa. ¡Quizás es hora de empezar!`
  String get pageNewHomeNotStarted {
    return Intl.message(
      'Todavía no has empezado ningún programa. ¡Quizás es hora de empezar!',
      name: 'pageNewHomeNotStarted',
      desc: '',
      args: [],
    );
  }

  /// `Nos alegra saber que cuidas de ti y de tu bebé. Tienes nuevos programas para empezar, ¿te animas ahora?`
  String get pageNewHomeStarted {
    return Intl.message(
      'Nos alegra saber que cuidas de ti y de tu bebé. Tienes nuevos programas para empezar, ¿te animas ahora?',
      name: 'pageNewHomeStarted',
      desc: '',
      args: [],
    );
  }

  /// `¡Enhorabuena! Has completado todos los programas. Contacta con nosotros para que puedas recibir una recompensa.`
  String get pageNewHomeEnd {
    return Intl.message(
      '¡Enhorabuena! Has completado todos los programas. Contacta con nosotros para que puedas recibir una recompensa.',
      name: 'pageNewHomeEnd',
      desc: '',
      args: [],
    );
  }

  /// `Tu post para hoy`
  String get pageNewHomeRecommendPost {
    return Intl.message(
      'Tu post para hoy',
      name: 'pageNewHomeRecommendPost',
      desc: '',
      args: [],
    );
  }

  /// `ver más`
  String get pageNewHomeShowMore {
    return Intl.message(
      'ver más',
      name: 'pageNewHomeShowMore',
      desc: '',
      args: [],
    );
  }

  /// `Todavía no tienes estado, ¿Lo definimos?`
  String get pageNewHomeDefineNewState {
    return Intl.message(
      'Todavía no tienes estado, ¿Lo definimos?',
      name: 'pageNewHomeDefineNewState',
      desc: '',
      args: [],
    );
  }

  /// `¡Descubre todos los programas!`
  String get discoverPrograms {
    return Intl.message(
      '¡Descubre todos los programas!',
      name: 'discoverPrograms',
      desc: '',
      args: [],
    );
  }

  /// `ver programas`
  String get showPrograms {
    return Intl.message(
      'ver programas',
      name: 'showPrograms',
      desc: '',
      args: [],
    );
  }

  /// `Tu programa para hoy`
  String get recommendedToday {
    return Intl.message(
      'Tu programa para hoy',
      name: 'recommendedToday',
      desc: '',
      args: [],
    );
  }

  /// `Mis programas`
  String get myProgramsRecommended {
    return Intl.message(
      'Mis programas',
      name: 'myProgramsRecommended',
      desc: '',
      args: [],
    );
  }

  /// `Contáctanos ahora`
  String get contactWithUs {
    return Intl.message(
      'Contáctanos ahora',
      name: 'contactWithUs',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get userPremmium {
    return Intl.message(
      'Premium',
      name: 'userPremmium',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get userFree {
    return Intl.message(
      'Free',
      name: 'userFree',
      desc: '',
      args: [],
    );
  }

  /// `Elige 5 programas PREMIUM y disfruta sin límites durante 3 meses`
  String get premmiumBeneficit5Pack1 {
    return Intl.message(
      'Elige 5 programas PREMIUM y disfruta sin límites durante 3 meses',
      name: 'premmiumBeneficit5Pack1',
      desc: '',
      args: [],
    );
  }

  /// `Usos ilimitadas durante 3 meses.`
  String get premmiumBeneficit5Pack2 {
    return Intl.message(
      'Usos ilimitadas durante 3 meses.',
      name: 'premmiumBeneficit5Pack2',
      desc: '',
      args: [],
    );
  }

  /// `Elige esta opción y sigue cuidando de tí durante la matrescencia.`
  String get premmiumBeneficit5Pack3 {
    return Intl.message(
      'Elige esta opción y sigue cuidando de tí durante la matrescencia.',
      name: 'premmiumBeneficit5Pack3',
      desc: '',
      args: [],
    );
  }

  /// `Subscripción mensual con acceso ilimitado a todos los programas PREMIUM`
  String get premiumMonthly1 {
    return Intl.message(
      'Subscripción mensual con acceso ilimitado a todos los programas PREMIUM',
      name: 'premiumMonthly1',
      desc: '',
      args: [],
    );
  }

  /// `Tendrás acceso ilimitado a todos los programas.`
  String get premiumMonthly2 {
    return Intl.message(
      'Tendrás acceso ilimitado a todos los programas.',
      name: 'premiumMonthly2',
      desc: '',
      args: [],
    );
  }

  /// `Luego de la prueba podrás acceder a tu subscripción mensual y dedicar cada día un momento para tu bienestar y autoconocimiento.`
  String get premiumMonthly3 {
    return Intl.message(
      'Luego de la prueba podrás acceder a tu subscripción mensual y dedicar cada día un momento para tu bienestar y autoconocimiento.',
      name: 'premiumMonthly3',
      desc: '',
      args: [],
    );
  }

  /// `Subscripción anual con acceso ilimitado a todos los programas PREMIUM a un precio único (solo 7,50€/mes)`
  String get premiumYearly1 {
    return Intl.message(
      'Subscripción anual con acceso ilimitado a todos los programas PREMIUM a un precio único (solo 7,50€/mes)',
      name: 'premiumYearly1',
      desc: '',
      args: [],
    );
  }

  /// `Tendrás acceso ilimitado a todos los programas.`
  String get premiumYearly2 {
    return Intl.message(
      'Tendrás acceso ilimitado a todos los programas.',
      name: 'premiumYearly2',
      desc: '',
      args: [],
    );
  }

  /// `Luego de la prueba disfrutarás de la subscripción anual con todos los beneficios, disfrutando de tu plan por sólo 7€ por mes.`
  String get premiumYearly3 {
    return Intl.message(
      'Luego de la prueba disfrutarás de la subscripción anual con todos los beneficios, disfrutando de tu plan por sólo 7€ por mes.',
      name: 'premiumYearly3',
      desc: '',
      args: [],
    );
  }

  /// `¡Wow! ¡Acabas de dar un gran paso!`
  String get dialogSuccesPurchasesProgramsTitle {
    return Intl.message(
      '¡Wow! ¡Acabas de dar un gran paso!',
      name: 'dialogSuccesPurchasesProgramsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Descubre tu matrescencia y recuerda que tienes 3 meses para disfrutar de los 5 programas que desees.\n\n¡Respira profundamente y descubre tu propio ritmo!`
  String get dialogSuccesPurchasesProgramsDescription {
    return Intl.message(
      'Descubre tu matrescencia y recuerda que tienes 3 meses para disfrutar de los 5 programas que desees.\n\n¡Respira profundamente y descubre tu propio ritmo!',
      name: 'dialogSuccesPurchasesProgramsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Empezar mi programa`
  String get dialogSuccesPurchasesProgramsButton {
    return Intl.message(
      'Empezar mi programa',
      name: 'dialogSuccesPurchasesProgramsButton',
      desc: '',
      args: [],
    );
  }

  /// `¡Enhorabuena! ¡Has dado un gran paso!`
  String get dialogSuccesPurchasesSubscriptionTitle {
    return Intl.message(
      '¡Enhorabuena! ¡Has dado un gran paso!',
      name: 'dialogSuccesPurchasesSubscriptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ya tienes tu subscripción activa.\n\n¡Respira profundamente y descubre tu propio ritmo!`
  String get dialogSuccesPurchasesSubscriptionDescription {
    return Intl.message(
      'Ya tienes tu subscripción activa.\n\n¡Respira profundamente y descubre tu propio ritmo!',
      name: 'dialogSuccesPurchasesSubscriptionDescription',
      desc: '',
      args: [],
    );
  }

  /// `¡Gracias!`
  String get dialogSuccesPurchasesSubscriptionButton {
    return Intl.message(
      '¡Gracias!',
      name: 'dialogSuccesPurchasesSubscriptionButton',
      desc: '',
      args: [],
    );
  }

  /// `Espera...`
  String get dialogLockedUnitTitle {
    return Intl.message(
      'Espera...',
      name: 'dialogLockedUnitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nos encanta que quieras avanzar pero esta unidad se libera al completar las anteriores. ¡Que el ritmo no pare!`
  String get dialogLockedUnitDescription {
    return Intl.message(
      'Nos encanta que quieras avanzar pero esta unidad se libera al completar las anteriores. ¡Que el ritmo no pare!',
      name: 'dialogLockedUnitDescription',
      desc: '',
      args: [],
    );
  }

  /// `¡Seguir con mi programa!`
  String get dialogLockedUnitButton {
    return Intl.message(
      '¡Seguir con mi programa!',
      name: 'dialogLockedUnitButton',
      desc: '',
      args: [],
    );
  }

  /// `Quiero mi plan`
  String get dialogErrorButtonPlan {
    return Intl.message(
      'Quiero mi plan',
      name: 'dialogErrorButtonPlan',
      desc: '',
      args: [],
    );
  }

  /// `Compraré más tarde`
  String get dialogErrorButtonBack {
    return Intl.message(
      'Compraré más tarde',
      name: 'dialogErrorButtonBack',
      desc: '',
      args: [],
    );
  }

  /// `Toc, toc...`
  String get dialogErrorPurchasesTitle {
    return Intl.message(
      'Toc, toc...',
      name: 'dialogErrorPurchasesTitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Qué ha pasado? No te preocupes, haz click en ayuda y nosotros nos encargamos.`
  String get dialogErrorPurchasesDescription {
    return Intl.message(
      '¿Qué ha pasado? No te preocupes, haz click en ayuda y nosotros nos encargamos.',
      name: 'dialogErrorPurchasesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Contactar con Ayuda`
  String get connectWithHelpButton {
    return Intl.message(
      'Contactar con Ayuda',
      name: 'connectWithHelpButton',
      desc: '',
      args: [],
    );
  }

  /// `Atrás`
  String get backButton {
    return Intl.message(
      'Atrás',
      name: 'backButton',
      desc: '',
      args: [],
    );
  }

  /// `¿Te está ha parecido útil este programa?`
  String get dialogFooterLikeTitle {
    return Intl.message(
      '¿Te está ha parecido útil este programa?',
      name: 'dialogFooterLikeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Si, mucho`
  String get dialogFooterLikeAfirmative {
    return Intl.message(
      'Si, mucho',
      name: 'dialogFooterLikeAfirmative',
      desc: '',
      args: [],
    );
  }

  /// `No, esperaba otro contenido`
  String get dialogFooterLikeNegative {
    return Intl.message(
      'No, esperaba otro contenido',
      name: 'dialogFooterLikeNegative',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres saber más sobre este tema?`
  String get dialogFooterDeeplinkThemeTitle {
    return Intl.message(
      '¿Quieres saber más sobre este tema?',
      name: 'dialogFooterDeeplinkThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Descubre contenido relacionado, y si lo deseas...\n ¡Te invitamos a compartir tu experiencia o tu opinión!`
  String get dialogFooterDeeplinkThemeDescription {
    return Intl.message(
      'Descubre contenido relacionado, y si lo deseas...\n ¡Te invitamos a compartir tu experiencia o tu opinión!',
      name: 'dialogFooterDeeplinkThemeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Visitar comunidad`
  String get dialogFooterDeeplinkVisitTheme {
    return Intl.message(
      'Visitar comunidad',
      name: 'dialogFooterDeeplinkVisitTheme',
      desc: '',
      args: [],
    );
  }

  /// `Tu opinión nos importa`
  String get dialogFooterDeeplinkDislikeTitle {
    return Intl.message(
      'Tu opinión nos importa',
      name: 'dialogFooterDeeplinkDislikeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tu experiencia nos ayuda a mejorar.\n\n\n¿Qué te hubiera gustado encontrarte en esta unidad?\n\n\nContacta con nosotras para enviarnos tus ideas.`
  String get dialogFooterDeeplinkDislikeDescription {
    return Intl.message(
      'Tu experiencia nos ayuda a mejorar.\n\n\n¿Qué te hubiera gustado encontrarte en esta unidad?\n\n\nContacta con nosotras para enviarnos tus ideas.',
      name: 'dialogFooterDeeplinkDislikeDescription',
      desc: '',
      args: [],
    );
  }

  /// `¿Hemos despertado tu curiosidad?`
  String get dialogFooterDeeplinkLikeTitle {
    return Intl.message(
      '¿Hemos despertado tu curiosidad?',
      name: 'dialogFooterDeeplinkLikeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Si quieres navegar y descubrir más, pásate por la comunidad.`
  String get dialogFooterDeeplinkLikeDescription {
    return Intl.message(
      'Si quieres navegar y descubrir más, pásate por la comunidad.',
      name: 'dialogFooterDeeplinkLikeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Contacto`
  String get dialogFooterShareExperience {
    return Intl.message(
      'Contacto',
      name: 'dialogFooterShareExperience',
      desc: '',
      args: [],
    );
  }

  /// `Oops...`
  String get dialogExitPurchaseTitle {
    return Intl.message(
      'Oops...',
      name: 'dialogExitPurchaseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Parece que le has dado a cerrar sin darte cuenta...\n\n¿Seguro que deseas salir de esta pantalla?`
  String get dialogExitPurchaseDescription {
    return Intl.message(
      'Parece que le has dado a cerrar sin darte cuenta...\n\n¿Seguro que deseas salir de esta pantalla?',
      name: 'dialogExitPurchaseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Abandonar`
  String get dialogExitPurchaseButton1 {
    return Intl.message(
      'Abandonar',
      name: 'dialogExitPurchaseButton1',
      desc: '',
      args: [],
    );
  }

  /// `Contactar con Ayuda`
  String get dialogExitPurchaseButton2 {
    return Intl.message(
      'Contactar con Ayuda',
      name: 'dialogExitPurchaseButton2',
      desc: '',
      args: [],
    );
  }

  /// `Sigue tu bienestar diario`
  String get purchasePageSubtitle {
    return Intl.message(
      'Sigue tu bienestar diario',
      name: 'purchasePageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Ampliar mi plan!`
  String get purchasePageTitle {
    return Intl.message(
      '¡Ampliar mi plan!',
      name: 'purchasePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Con tu subscripción ayudas a que Dana acompañe a más mujeres en su matrescencia`
  String get purchasePageDescription {
    return Intl.message(
      'Con tu subscripción ayudas a que Dana acompañe a más mujeres en su matrescencia',
      name: 'purchasePageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Programas esenciales`
  String get purchasePageBenefit1 {
    return Intl.message(
      'Programas esenciales',
      name: 'purchasePageBenefit1',
      desc: '',
      args: [],
    );
  }

  /// `La comunidad`
  String get purchasePageBenefit2 {
    return Intl.message(
      'La comunidad',
      name: 'purchasePageBenefit2',
      desc: '',
      args: [],
    );
  }

  /// `Tu diario de emociones`
  String get purchasePageBenefit3 {
    return Intl.message(
      'Tu diario de emociones',
      name: 'purchasePageBenefit3',
      desc: '',
      args: [],
    );
  }

  /// `Siempre GRATIS\npara ti`
  String get purchasePageBenefit4 {
    return Intl.message(
      'Siempre GRATIS\npara ti',
      name: 'purchasePageBenefit4',
      desc: '',
      args: [],
    );
  }

  /// `¡Quiero este plan!`
  String get purchasePageButton {
    return Intl.message(
      '¡Quiero este plan!',
      name: 'purchasePageButton',
      desc: '',
      args: [],
    );
  }

  /// `Términos y condiciones`
  String get purchasePageTerms {
    return Intl.message(
      'Términos y condiciones',
      name: 'purchasePageTerms',
      desc: '',
      args: [],
    );
  }

  /// `Nuevo programa`
  String get unlockedProgramDialogTitle {
    return Intl.message(
      'Nuevo programa',
      name: 'unlockedProgramDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Este programa es PREMIUM y\ntienes crédito disponible.\n\nSi lo desbloqueas, formará parte de tus programas consumibles hasta  {date}.`
  String unlockedProgramDialogDescription(Object date) {
    return Intl.message(
      'Este programa es PREMIUM y\ntienes crédito disponible.\n\nSi lo desbloqueas, formará parte de tus programas consumibles hasta  $date.',
      name: 'unlockedProgramDialogDescription',
      desc: '',
      args: [date],
    );
  }

  /// `Desbloquear programa`
  String get unlockedProgramDialogButton {
    return Intl.message(
      'Desbloquear programa',
      name: 'unlockedProgramDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get unlockedProgramDialogButton2 {
    return Intl.message(
      'Cancelar',
      name: 'unlockedProgramDialogButton2',
      desc: '',
      args: [],
    );
  }

  /// `0%`
  String get noCreditBuyProgramDialogTitle {
    return Intl.message(
      '0%',
      name: 'noCreditBuyProgramDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Has agotado el crédito disponible de tus 5 programas. ¡Bien hecho! \n\nNo nos gustan las despedidas... \n¿Te apetece descubrir nuevas ofertas en este momento?`
  String get noCreditBuyProgramDialogDescription {
    return Intl.message(
      'Has agotado el crédito disponible de tus 5 programas. ¡Bien hecho! \n\nNo nos gustan las despedidas... \n¿Te apetece descubrir nuevas ofertas en este momento?',
      name: 'noCreditBuyProgramDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Quiero nueva oferta`
  String get noCreditBuyProgramDialogButton {
    return Intl.message(
      'Quiero nueva oferta',
      name: 'noCreditBuyProgramDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Prefiero ir a la comunidad`
  String get noCreditBuyProgramDialogButton2 {
    return Intl.message(
      'Prefiero ir a la comunidad',
      name: 'noCreditBuyProgramDialogButton2',
      desc: '',
      args: [],
    );
  }

  /// `¡Comienza tu viaje!`
  String get unlockedSuccessFirstDialogTitle {
    return Intl.message(
      '¡Comienza tu viaje!',
      name: 'unlockedSuccessFirstDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// ` ¡Programa desbloqueado! \nPuedes disfrutarlo hasta {date}\nGracias por elegir Dana para explorar tu matrescencia.`
  String unlockedSuccessFirstDialogDescription(Object date) {
    return Intl.message(
      ' ¡Programa desbloqueado! \nPuedes disfrutarlo hasta $date\nGracias por elegir Dana para explorar tu matrescencia.',
      name: 'unlockedSuccessFirstDialogDescription',
      desc: '',
      args: [date],
    );
  }

  /// `El viaje continúa`
  String get unlockedSuccessSecondDialogTitle {
    return Intl.message(
      'El viaje continúa',
      name: 'unlockedSuccessSecondDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Programa desbloqueado correctamente. Recuerda que podrás disfrutarlo hasta {date}\n`
  String unlockedSuccessSecondDialogDescription(Object date) {
    return Intl.message(
      'Programa desbloqueado correctamente. Recuerda que podrás disfrutarlo hasta $date\n',
      name: 'unlockedSuccessSecondDialogDescription',
      desc: '',
      args: [date],
    );
  }

  /// `Empezar mi programa`
  String get unlockedSuccessDialogButton {
    return Intl.message(
      'Empezar mi programa',
      name: 'unlockedSuccessDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Mi plan actual`
  String get accountPageTitle {
    return Intl.message(
      'Mi plan actual',
      name: 'accountPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Actualmente tienes activo un plan de pago.\n\nEstamos felices de que formes parte de nuestra comunidad y deseamos que puedas gestionar tu cuenta para que tu matrescencia sea como tú decidas.`
  String get accountPageDescriptionActive {
    return Intl.message(
      'Actualmente tienes activo un plan de pago.\n\nEstamos felices de que formes parte de nuestra comunidad y deseamos que puedas gestionar tu cuenta para que tu matrescencia sea como tú decidas.',
      name: 'accountPageDescriptionActive',
      desc: '',
      args: [],
    );
  }

  /// `Actualmente tienes activo el plan gratuito.\n\nEstamos felices de que formes parte de nuestra comunidad y deseamos que puedas gestionar tu cuenta para que tu matrescencia sea como tú decidas.`
  String get accountPageDescriptionInactive {
    return Intl.message(
      'Actualmente tienes activo el plan gratuito.\n\nEstamos felices de que formes parte de nuestra comunidad y deseamos que puedas gestionar tu cuenta para que tu matrescencia sea como tú decidas.',
      name: 'accountPageDescriptionInactive',
      desc: '',
      args: [],
    );
  }

  /// `Sobre mi plan`
  String get accountPageTitleAboutPlan {
    return Intl.message(
      'Sobre mi plan',
      name: 'accountPageTitleAboutPlan',
      desc: '',
      args: [],
    );
  }

  /// `Renovación subscripción`
  String get accountPageCardDate {
    return Intl.message(
      'Renovación subscripción',
      name: 'accountPageCardDate',
      desc: '',
      args: [],
    );
  }

  /// `Fecha fin`
  String get accountPageCardDate2 {
    return Intl.message(
      'Fecha fin',
      name: 'accountPageCardDate2',
      desc: '',
      args: [],
    );
  }

  /// `Tus programas`
  String get accountPageCardProgram {
    return Intl.message(
      'Tus programas',
      name: 'accountPageCardProgram',
      desc: '',
      args: [],
    );
  }

  /// `Descubrir mis ofertas`
  String get accountPageCardDiscover {
    return Intl.message(
      'Descubrir mis ofertas',
      name: 'accountPageCardDiscover',
      desc: '',
      args: [],
    );
  }

  /// `Dar de baja la cuenta`
  String get accountPageDelete {
    return Intl.message(
      'Dar de baja la cuenta',
      name: 'accountPageDelete',
      desc: '',
      args: [],
    );
  }

  /// `Histórico de pagos`
  String get accountPageHistory {
    return Intl.message(
      'Histórico de pagos',
      name: 'accountPageHistory',
      desc: '',
      args: [],
    );
  }

  /// `Mi histórico de pagos`
  String get historyPageTitle {
    return Intl.message(
      'Mi histórico de pagos',
      name: 'historyPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `En Dana somos transparentes. Aquí podrás ver todas tus transacciones.`
  String get historyPageDescription {
    return Intl.message(
      'En Dana somos transparentes. Aquí podrás ver todas tus transacciones.',
      name: 'historyPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Mis pagos recientes`
  String get historyPageMyPayments {
    return Intl.message(
      'Mis pagos recientes',
      name: 'historyPageMyPayments',
      desc: '',
      args: [],
    );
  }

  /// `No has realizado ninguna compra aún. Puedes enviarnos una consulta si lo deseas por el botón.`
  String get historyPageNoPayments {
    return Intl.message(
      'No has realizado ninguna compra aún. Puedes enviarnos una consulta si lo deseas por el botón.',
      name: 'historyPageNoPayments',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de inicio:`
  String get historyPageInitDate {
    return Intl.message(
      'Fecha de inicio:',
      name: 'historyPageInitDate',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de fin:`
  String get historyPageEndDate {
    return Intl.message(
      'Fecha de fin:',
      name: 'historyPageEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda`
  String get historyPageButton {
    return Intl.message(
      'Ayuda',
      name: 'historyPageButton',
      desc: '',
      args: [],
    );
  }

  /// `Mi subscripción`
  String get subscriptionPageTitle {
    return Intl.message(
      'Mi subscripción',
      name: 'subscriptionPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Gestiona tu subscripción de la forma que creas más conveniente para ti.\n\nEstamos felices de que formes parte de la comunidad de Dana y cuando nos necesites, aquí estaremos.\n\n¿Te apetece cambiar tu experiencia?`
  String get subscriptionPageDescription {
    return Intl.message(
      'Gestiona tu subscripción de la forma que creas más conveniente para ti.\n\nEstamos felices de que formes parte de la comunidad de Dana y cuando nos necesites, aquí estaremos.\n\n¿Te apetece cambiar tu experiencia?',
      name: 'subscriptionPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Plan de pago`
  String get subscriptionPageButton {
    return Intl.message(
      'Plan de pago',
      name: 'subscriptionPageButton',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar subscripción`
  String get subscriptionPageButton2 {
    return Intl.message(
      'Cancelar subscripción',
      name: 'subscriptionPageButton2',
      desc: '',
      args: [],
    );
  }

  /// `subscripción y facturación:`
  String get unsubscribeDialogTitle {
    return Intl.message(
      'subscripción y facturación:',
      name: 'unsubscribeDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo puedo cancelar mi subscripción en IOS?`
  String get unsubscribeDialogQuestionIos1 {
    return Intl.message(
      '¿Cómo puedo cancelar mi subscripción en IOS?',
      name: 'unsubscribeDialogQuestionIos1',
      desc: '',
      args: [],
    );
  }

  /// `1. Abre la aplicación estándar de Ajustes de IOS.\n2.Pulsa tu nombre.\n3.Pulsa Suscripciones.\n4.Pulsa la subscripción que deseas cancelar.\n5.Pulsa Cancelar subscripción/prueba (si esta opción no está visible, ya se ha cancelado o no se renovará la subscripción.)\n6.Pulsar en Confirmar cuando se te pida que confirmes que deseas cancelar tu subscripción.\n`
  String get unsubscribeDialogAskIos1 {
    return Intl.message(
      '1. Abre la aplicación estándar de Ajustes de IOS.\n2.Pulsa tu nombre.\n3.Pulsa Suscripciones.\n4.Pulsa la subscripción que deseas cancelar.\n5.Pulsa Cancelar subscripción/prueba (si esta opción no está visible, ya se ha cancelado o no se renovará la subscripción.)\n6.Pulsar en Confirmar cuando se te pida que confirmes que deseas cancelar tu subscripción.\n',
      name: 'unsubscribeDialogAskIos1',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo puedo cancelar mi subscripción en Android?`
  String get unsubscribeDialogQuestionAndroid1 {
    return Intl.message(
      '¿Cómo puedo cancelar mi subscripción en Android?',
      name: 'unsubscribeDialogQuestionAndroid1',
      desc: '',
      args: [],
    );
  }

  /// `Para cancelar tu subscripción en tu dispositivo Android, sigue los pasos a continuación.\nAbre la aplicación Google Play Store en tu teléfono o tablet Android.\n2. Arriba a la derecha, toca el icono de perfil.\n3. Toca Pagos y suscripciones.\n4. Luego toca, suscripciones.\n5. Selecciona la subscripción que desees cancelar.\n6. Pulsa Cancelar subscripción.\n7. Sigue las instrucciones.\nEsto se tiene que hacer 24 horas antes de que finalice el período de prueba o subscripción gratuita. \n`
  String get unsubscribeDialogAskAndroid1 {
    return Intl.message(
      'Para cancelar tu subscripción en tu dispositivo Android, sigue los pasos a continuación.\nAbre la aplicación Google Play Store en tu teléfono o tablet Android.\n2. Arriba a la derecha, toca el icono de perfil.\n3. Toca Pagos y suscripciones.\n4. Luego toca, suscripciones.\n5. Selecciona la subscripción que desees cancelar.\n6. Pulsa Cancelar subscripción.\n7. Sigue las instrucciones.\nEsto se tiene que hacer 24 horas antes de que finalice el período de prueba o subscripción gratuita. \n',
      name: 'unsubscribeDialogAskAndroid1',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo puedo obtener un reembolso en IOS?`
  String get unsubscribeDialogQuestionIos2 {
    return Intl.message(
      '¿Cómo puedo obtener un reembolso en IOS?',
      name: 'unsubscribeDialogQuestionIos2',
      desc: '',
      args: [],
    );
  }

  /// `Lamentablemente no podemos gestionar ni controlar tu subscripción y pagos ya que Apple no nos proporciona acceso a tu información de facturación.\nLa decisión del reembolso es responsabilidad de Apple. Sin embargo, estaremos encantados de guiarte a través del proceso de solicitud de reembolso.\n1. Ve a la página reportaproblema.apple.com.\n2.Inicia sesión con el ID de Apple y la contraseña.\n3.Pulsa o haz clic en “Me gustaría”\n4.Selecciona “Solicitar reembolso”.\n5.Elige el motivo por el que quieres un reembolso y , a continuación, selecciona “Siguiente”.\n6.Elige el artículo o artículos que has comprado y, a continuación, selecciona “Enviar”.\nDespués recibirás un correo electrónico de Apple con una decisión.\nSi utilizas un dispositivo Android, descubre cómo hacerlo a continuación.\n`
  String get unsubscribeDialogAskIos2 {
    return Intl.message(
      'Lamentablemente no podemos gestionar ni controlar tu subscripción y pagos ya que Apple no nos proporciona acceso a tu información de facturación.\nLa decisión del reembolso es responsabilidad de Apple. Sin embargo, estaremos encantados de guiarte a través del proceso de solicitud de reembolso.\n1. Ve a la página reportaproblema.apple.com.\n2.Inicia sesión con el ID de Apple y la contraseña.\n3.Pulsa o haz clic en “Me gustaría”\n4.Selecciona “Solicitar reembolso”.\n5.Elige el motivo por el que quieres un reembolso y , a continuación, selecciona “Siguiente”.\n6.Elige el artículo o artículos que has comprado y, a continuación, selecciona “Enviar”.\nDespués recibirás un correo electrónico de Apple con una decisión.\nSi utilizas un dispositivo Android, descubre cómo hacerlo a continuación.\n',
      name: 'unsubscribeDialogAskIos2',
      desc: '',
      args: [],
    );
  }

  /// `Si en alguno de estos pasos ha fallado, por favor, ponte en contacto con nuestro email: hola@dana.health o haciendo click en el botón de la app “Ayuda” y contacta con nuestro email enviando los detalles del problema del pago, junto a tu GPA (Confirmación de pago) y nos encargaremos de buscar una solución a la brevedad.`
  String get unsubscribeDialogAskIos3 {
    return Intl.message(
      'Si en alguno de estos pasos ha fallado, por favor, ponte en contacto con nuestro email: hola@dana.health o haciendo click en el botón de la app “Ayuda” y contacta con nuestro email enviando los detalles del problema del pago, junto a tu GPA (Confirmación de pago) y nos encargaremos de buscar una solución a la brevedad.',
      name: 'unsubscribeDialogAskIos3',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo puedo obtener un reembolso en Android?`
  String get unsubscribeDialogQuestionAndroid2 {
    return Intl.message(
      '¿Cómo puedo obtener un reembolso en Android?',
      name: 'unsubscribeDialogQuestionAndroid2',
      desc: '',
      args: [],
    );
  }

  /// `Sentimos escuchar que no estás satisfecha con tu subscripción. Estaremos encantados de ayudarte para obtener un reembolso.\nNecesitamos el número de pedido para emitir un reembolso. Cuando te suscribes, deberías haber recibido un mensaje e correo electrónico de confirmación que puedes emplear como recibo. Este recibo incluye tu número de pedido.\nSi no encuentras tu correo electrónico de confirmación, puedes obtener un recibo en Internet. \n1.Visita pay.google.com e inicia sesión con tu cuenta google.\n2.En la izquierda, pulsa suscripciones y servicios.\n3.Pulsa Ver compras.\n4.Elige un pedido para visualizar tu recibo.\n5.Pulsa el botón Contáctanos en la parte inferior de la página, envía el ID de la transacción de la siguiente forma: GPA.XXXX-XXXX-XXXX-XXXXX..X y procederemos a emitir un reembolso.\nEsperamos que esta información haya sido de utilidad para solucionar tus dudas.\n`
  String get unsubscribeDialogAskAndroid2 {
    return Intl.message(
      'Sentimos escuchar que no estás satisfecha con tu subscripción. Estaremos encantados de ayudarte para obtener un reembolso.\nNecesitamos el número de pedido para emitir un reembolso. Cuando te suscribes, deberías haber recibido un mensaje e correo electrónico de confirmación que puedes emplear como recibo. Este recibo incluye tu número de pedido.\nSi no encuentras tu correo electrónico de confirmación, puedes obtener un recibo en Internet. \n1.Visita pay.google.com e inicia sesión con tu cuenta google.\n2.En la izquierda, pulsa suscripciones y servicios.\n3.Pulsa Ver compras.\n4.Elige un pedido para visualizar tu recibo.\n5.Pulsa el botón Contáctanos en la parte inferior de la página, envía el ID de la transacción de la siguiente forma: GPA.XXXX-XXXX-XXXX-XXXXX..X y procederemos a emitir un reembolso.\nEsperamos que esta información haya sido de utilidad para solucionar tus dudas.\n',
      name: 'unsubscribeDialogAskAndroid2',
      desc: '',
      args: [],
    );
  }

  /// `Si en alguno de estos pasos ha fallado, por favor, ponte en contacto con nuestro email: hola@dana.health o haciendo click en el botón de la app “Ayuda” y contacta con nuestro equipo técnico enviando los detalles del problema del pago, junto a tu GPA (Confirmación de pago) y nos encargaremos de buscar una solución a la brevedad.\nEsperamos que esta información haya sido de utilidad para solucionar tus dudas.`
  String get unsubscribeDialogAskAndroid3 {
    return Intl.message(
      'Si en alguno de estos pasos ha fallado, por favor, ponte en contacto con nuestro email: hola@dana.health o haciendo click en el botón de la app “Ayuda” y contacta con nuestro equipo técnico enviando los detalles del problema del pago, junto a tu GPA (Confirmación de pago) y nos encargaremos de buscar una solución a la brevedad.\nEsperamos que esta información haya sido de utilidad para solucionar tus dudas.',
      name: 'unsubscribeDialogAskAndroid3',
      desc: '',
      args: [],
    );
  }

  /// `filtrar por`
  String get tagSelectorTitle {
    return Intl.message(
      'filtrar por',
      name: 'tagSelectorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mi cuenta`
  String get profilePageAccount {
    return Intl.message(
      'Mi cuenta',
      name: 'profilePageAccount',
      desc: '',
      args: [],
    );
  }

  /// `Mis unidades favoritas`
  String get profilePageFavorites {
    return Intl.message(
      'Mis unidades favoritas',
      name: 'profilePageFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Mi progreso`
  String get profilePageProgress {
    return Intl.message(
      'Mi progreso',
      name: 'profilePageProgress',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar mi subscripción`
  String get profilePageUnSubscribe {
    return Intl.message(
      'Cancelar mi subscripción',
      name: 'profilePageUnSubscribe',
      desc: '',
      args: [],
    );
  }

  /// `Histórico de pagos`
  String get profilePageHistory {
    return Intl.message(
      'Histórico de pagos',
      name: 'profilePageHistory',
      desc: '',
      args: [],
    );
  }

  /// `Gestionar subscripción`
  String get profilePageSubscriptions {
    return Intl.message(
      'Gestionar subscripción',
      name: 'profilePageSubscriptions',
      desc: '',
      args: [],
    );
  }

  /// `¡Has llegado al final\nde este camino de programas!`
  String get dialogFinishProgramsTitle {
    return Intl.message(
      '¡Has llegado al final\nde este camino de programas!',
      name: 'dialogFinishProgramsTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Ya has concluído tus 3 meses Premium! \n¡Ahora es un gran momento para decidir qué nuevo camino quieres seguir. \nRespira profundamente y gracias por permitirnos acompañarte. `
  String get dialogFinishProgramsMessage {
    return Intl.message(
      '¡Ya has concluído tus 3 meses Premium! \n¡Ahora es un gran momento para decidir qué nuevo camino quieres seguir. \nRespira profundamente y gracias por permitirnos acompañarte. ',
      name: 'dialogFinishProgramsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Descubrir nueva Oferta`
  String get dialogFinishProgramsButton {
    return Intl.message(
      'Descubrir nueva Oferta',
      name: 'dialogFinishProgramsButton',
      desc: '',
      args: [],
    );
  }

  /// `Prefiero ir a la comunidad`
  String get dialogFinishProgramsButton2 {
    return Intl.message(
      'Prefiero ir a la comunidad',
      name: 'dialogFinishProgramsButton2',
      desc: '',
      args: [],
    );
  }

  /// `Tu suscripción ha terminado`
  String get dialogFinishSubscriptionsTitle {
    return Intl.message(
      'Tu suscripción ha terminado',
      name: 'dialogFinishSubscriptionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hemos visto que has decidido dar de baja tu suscripción o que no se ha registrado el pago.\nPor favor, si ha habido un error, contacta con nosotros desde el botón “Ayuda”.\nPero si lo que deseas es seguir cuidando de tí, haz click en el botón “Descubrir nueva Oferta”.`
  String get dialogFinishSubscriptionsMessage {
    return Intl.message(
      'Hemos visto que has decidido dar de baja tu suscripción o que no se ha registrado el pago.\nPor favor, si ha habido un error, contacta con nosotros desde el botón “Ayuda”.\nPero si lo que deseas es seguir cuidando de tí, haz click en el botón “Descubrir nueva Oferta”.',
      name: 'dialogFinishSubscriptionsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda`
  String get dialogFinishSubscriptionsButton {
    return Intl.message(
      'Ayuda',
      name: 'dialogFinishSubscriptionsButton',
      desc: '',
      args: [],
    );
  }

  /// `¡Nueva versión disponible!`
  String get dialogForceUpdateTitle {
    return Intl.message(
      '¡Nueva versión disponible!',
      name: 'dialogForceUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Puedes actualizar Dana para mejorar tu experiencia en la app y conocer todas las novedades.`
  String get dialogForceUpdateMessage {
    return Intl.message(
      'Puedes actualizar Dana para mejorar tu experiencia en la app y conocer todas las novedades.',
      name: 'dialogForceUpdateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Actualizar`
  String get dialogForceUpdateButton {
    return Intl.message(
      'Actualizar',
      name: 'dialogForceUpdateButton',
      desc: '',
      args: [],
    );
  }

  /// `Espera...`
  String get dialogBlockPurchaseTitle {
    return Intl.message(
      'Espera...',
      name: 'dialogBlockPurchaseTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Nos encanta que descubras Dana! Recuerda que aún tienes crédito disponible de tu plan actual para desbloquear programas. Disfrútalos y... ¡Que el ritmo no pare!\n`
  String get dialogBlockPurchaseMessage {
    return Intl.message(
      '¡Nos encanta que descubras Dana! Recuerda que aún tienes crédito disponible de tu plan actual para desbloquear programas. Disfrútalos y... ¡Que el ritmo no pare!\n',
      name: 'dialogBlockPurchaseMessage',
      desc: '',
      args: [],
    );
  }

  /// `Comprar otra oferta`
  String get dialogBlockPurchaseButton {
    return Intl.message(
      'Comprar otra oferta',
      name: 'dialogBlockPurchaseButton',
      desc: '',
      args: [],
    );
  }

  /// `Hemos diseñado una colección específica - Colección Ayuda - donde encontrarás diferentes programas que contienen reflexiones, materiales y contactos de asociaciones y centros especializados que acompañan a las mujeres durante su maternidad.\nAlgunos de los programas que podrás encontrar en este apartado son:`
  String get helpPageText {
    return Intl.message(
      'Hemos diseñado una colección específica - Colección Ayuda - donde encontrarás diferentes programas que contienen reflexiones, materiales y contactos de asociaciones y centros especializados que acompañan a las mujeres durante su maternidad.\nAlgunos de los programas que podrás encontrar en este apartado son:',
      name: 'helpPageText',
      desc: '',
      args: [],
    );
  }

  /// `Duelo perinatal`
  String get helpPagePerinatal {
    return Intl.message(
      'Duelo perinatal',
      name: 'helpPagePerinatal',
      desc: '',
      args: [],
    );
  }

  /// `Ansiedad perinatal`
  String get helpPageAnxiety {
    return Intl.message(
      'Ansiedad perinatal',
      name: 'helpPageAnxiety',
      desc: '',
      args: [],
    );
  }

  /// `Violencia de Género`
  String get helpPageViolence {
    return Intl.message(
      'Violencia de Género',
      name: 'helpPageViolence',
      desc: '',
      args: [],
    );
  }

  /// `¿Necesito ayuda?`
  String get helpPageNeedHelp {
    return Intl.message(
      '¿Necesito ayuda?',
      name: 'helpPageNeedHelp',
      desc: '',
      args: [],
    );
  }

  /// `Parto prematuro`
  String get helpPagePrem {
    return Intl.message(
      'Parto prematuro',
      name: 'helpPagePrem',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'helpPageLactancy ' key

  /// `Dificultades en la lactancia`
  String get helpPageDifficulties {
    return Intl.message(
      'Dificultades en la lactancia',
      name: 'helpPageDifficulties',
      desc: '',
      args: [],
    );
  }

  /// `Parto traumático`
  String get helpPageChildbirth {
    return Intl.message(
      'Parto traumático',
      name: 'helpPageChildbirth',
      desc: '',
      args: [],
    );
  }

  /// `El email ya existe`
  String get emailExist {
    return Intl.message(
      'El email ya existe',
      name: 'emailExist',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña debe tener al menos 6 caracteres`
  String get weakPassword {
    return Intl.message(
      'La contraseña debe tener al menos 6 caracteres',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña erronea`
  String get wrongPassword {
    return Intl.message(
      'Contraseña erronea',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `No se encontro el usuario`
  String get userNotFound {
    return Intl.message(
      'No se encontro el usuario',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Usuario o contraseña invalidos`
  String get invalidCredentials {
    return Intl.message(
      'Usuario o contraseña invalidos',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Error desconocido `
  String get unknown {
    return Intl.message(
      'Error desconocido ',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Estamos configurando tu sesión`
  String get loadingSession {
    return Intl.message(
      'Estamos configurando tu sesión',
      name: 'loadingSession',
      desc: '',
      args: [],
    );
  }

  /// `En tu semana {number} te recomendamos`
  String formattedPregnancyPostRecommendationTitle(int number) {
    final NumberFormat numberNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String numberString = numberNumberFormat.format(number);

    return Intl.message(
      'En tu semana $numberString te recomendamos',
      name: 'formattedPregnancyPostRecommendationTitle',
      desc: '',
      args: [numberString],
    );
  }

  /// `En esta semana te recomendamos`
  String get pregnancyPostRecommendationTitleNoWeeks {
    return Intl.message(
      'En esta semana te recomendamos',
      name: 'pregnancyPostRecommendationTitleNoWeeks',
      desc: '',
      args: [],
    );
  }

  /// `Reflexiones para tu semana`
  String get pregnancyPostRecommendationTitle {
    return Intl.message(
      'Reflexiones para tu semana',
      name: 'pregnancyPostRecommendationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Conversaciones de posparto`
  String get motherPostRecommendationTitle {
    return Intl.message(
      'Conversaciones de posparto',
      name: 'motherPostRecommendationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Éste es tu espacio`
  String get socialCategoryTitle {
    return Intl.message(
      'Éste es tu espacio',
      name: 'socialCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Elige un tema de interés y disfruta la experiencia.\n¡Te esperan muchos temas de conversación!`
  String get socialCategoryDescription {
    return Intl.message(
      'Elige un tema de interés y disfruta la experiencia.\n¡Te esperan muchos temas de conversación!',
      name: 'socialCategoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Notificaciones`
  String get notifications {
    return Intl.message(
      'Notificaciones',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `AutoPlay`
  String get autoPlay {
    return Intl.message(
      'AutoPlay',
      name: 'autoPlay',
      desc: '',
      args: [],
    );
  }

  /// `Sin notificaciones`
  String get notifications_empty {
    return Intl.message(
      'Sin notificaciones',
      name: 'notifications_empty',
      desc: '',
      args: [],
    );
  }

  /// `Hoy`
  String get today {
    return Intl.message(
      'Hoy',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Ayer`
  String get yesterday {
    return Intl.message(
      'Ayer',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Actividad anterior`
  String get old_activity {
    return Intl.message(
      'Actividad anterior',
      name: 'old_activity',
      desc: '',
      args: [],
    );
  }

  /// `Esta semana`
  String get actual_activity {
    return Intl.message(
      'Esta semana',
      name: 'actual_activity',
      desc: '',
      args: [],
    );
  }

  /// `Iniciados`
  String get myProgressTabTextIniciados {
    return Intl.message(
      'Iniciados',
      name: 'myProgressTabTextIniciados',
      desc: '',
      args: [],
    );
  }

  /// `Completados`
  String get myProgressTabTextCompletados {
    return Intl.message(
      'Completados',
      name: 'myProgressTabTextCompletados',
      desc: '',
      args: [],
    );
  }

  /// `Mis semanas`
  String get myProgressTabTextMisSemanas {
    return Intl.message(
      'Mis semanas',
      name: 'myProgressTabTextMisSemanas',
      desc: '',
      args: [],
    );
  }

  /// `El embarazo es momento de espera. La próxima semana, se activará un nuevo programa. Descubre más contenido, en tu sección {programas}`
  String lockerWeekDialogContent(Object programas) {
    return Intl.message(
      'El embarazo es momento de espera. La próxima semana, se activará un nuevo programa. Descubre más contenido, en tu sección $programas',
      name: 'lockerWeekDialogContent',
      desc: '',
      args: [programas],
    );
  }

  /// `¡Entendido!`
  String get lockerWeekDialogButtonText {
    return Intl.message(
      '¡Entendido!',
      name: 'lockerWeekDialogButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Respira...`
  String get weeDialogLockedUnitTitle {
    return Intl.message(
      'Respira...',
      name: 'weeDialogLockedUnitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Disponible ahora`
  String get currentWeekButtonText {
    return Intl.message(
      'Disponible ahora',
      name: 'currentWeekButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Disponible en semana {week}`
  String disableWeekButtonText(Object week) {
    return Intl.message(
      'Disponible en semana $week',
      name: 'disableWeekButtonText',
      desc: '',
      args: [week],
    );
  }

  /// `ver mi progreso`
  String get seeMoreMyWeekText {
    return Intl.message(
      'ver mi progreso',
      name: 'seeMoreMyWeekText',
      desc: '',
      args: [],
    );
  }

  /// `¡Genial! \n Has terminado tu programa semanal`
  String get programDialogSuccesTitle {
    return Intl.message(
      '¡Genial! \n Has terminado tu programa semanal',
      name: 'programDialogSuccesTitle',
      desc: '',
      args: [],
    );
  }

  /// `¡Quiero ver mi progreso!`
  String get programDialogSuccesHighButtonText {
    return Intl.message(
      '¡Quiero ver mi progreso!',
      name: 'programDialogSuccesHighButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Volver a la Home`
  String get programDialogSuccesSubText {
    return Intl.message(
      'Volver a la Home',
      name: 'programDialogSuccesSubText',
      desc: '',
      args: [],
    );
  }

  /// `Actualmente tienes una suscripción en curso. Si quieres cambiar tu subscripción, antes tendrás que cancelar tu subscripción actual desde la consola. Si por el contrario, lo que quieres es ponerte en contacto con nosotros, puedes hacer click en el botón ayuda`
  String get planDeGoDescription {
    return Intl.message(
      'Actualmente tienes una suscripción en curso. Si quieres cambiar tu subscripción, antes tendrás que cancelar tu subscripción actual desde la consola. Si por el contrario, lo que quieres es ponerte en contacto con nosotros, puedes hacer click en el botón ayuda',
      name: 'planDeGoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ir a Store`
  String get goToStore {
    return Intl.message(
      'Ir a Store',
      name: 'goToStore',
      desc: '',
      args: [],
    );
  }

  /// `No se encontró ninguna aplicación de correo.`
  String get noMailWay {
    return Intl.message(
      'No se encontró ninguna aplicación de correo.',
      name: 'noMailWay',
      desc: '',
      args: [],
    );
  }

  /// `Tus emociones de hoy son`
  String get questionnareSuccessFirstBadgeListTitle {
    return Intl.message(
      'Tus emociones de hoy son',
      name: 'questionnareSuccessFirstBadgeListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Los factores que te influyen son`
  String get questionnareSuccessSecondBadgeListTitle {
    return Intl.message(
      'Los factores que te influyen son',
      name: 'questionnareSuccessSecondBadgeListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Vínculos`
  String get vinculosGrapichTypeText {
    return Intl.message(
      'Vínculos',
      name: 'vinculosGrapichTypeText',
      desc: '',
      args: [],
    );
  }

  /// `Emociones`
  String get emocionesGrapichTypeText {
    return Intl.message(
      'Emociones',
      name: 'emocionesGrapichTypeText',
      desc: '',
      args: [],
    );
  }

  /// `Consulta con un profesional`
  String get homePageConsultaText {
    return Intl.message(
      'Consulta con un profesional',
      name: 'homePageConsultaText',
      desc: '',
      args: [],
    );
  }

  /// `PSICOLOGÍA Y OTROS`
  String get homePageConsultaLeftText {
    return Intl.message(
      'PSICOLOGÍA Y OTROS',
      name: 'homePageConsultaLeftText',
      desc: '',
      args: [],
    );
  }

  /// `Videoconsulta`
  String get homePageConsultaLeftSubText {
    return Intl.message(
      'Videoconsulta',
      name: 'homePageConsultaLeftSubText',
      desc: '',
      args: [],
    );
  }

  /// `CHAT24 HORAS`
  String get homePageConsultaRightText {
    return Intl.message(
      'CHAT24 HORAS',
      name: 'homePageConsultaRightText',
      desc: '',
      args: [],
    );
  }

  /// `Consultas\ninmediatas`
  String get homePageConsultaRightSubText {
    return Intl.message(
      'Consultas\ninmediatas',
      name: 'homePageConsultaRightSubText',
      desc: '',
      args: [],
    );
  }

  /// `En este vínculo, el autoconocimiento será la pieza clave para cultivar una autoestima que te sostenga y ayude a desplegar tu experiencia vital.`
  String get moodTrackerExpansionBody1Text {
    return Intl.message(
      'En este vínculo, el autoconocimiento será la pieza clave para cultivar una autoestima que te sostenga y ayude a desplegar tu experiencia vital.',
      name: 'moodTrackerExpansionBody1Text',
      desc: '',
      args: [],
    );
  }

  /// `Un vínculo basado en nuevos roles y tareas, pero sobre todo de una nueva identidad. El vínculo materno filial no sólo es condición necesaria para la salud mental del nuevo ser que crece, sino que puede ser una inagotable fuente de aprendizajes para facilitar tu crecimiento personal.`
  String get moodTrackerExpansionBody2Text {
    return Intl.message(
      'Un vínculo basado en nuevos roles y tareas, pero sobre todo de una nueva identidad. El vínculo materno filial no sólo es condición necesaria para la salud mental del nuevo ser que crece, sino que puede ser una inagotable fuente de aprendizajes para facilitar tu crecimiento personal.',
      name: 'moodTrackerExpansionBody2Text',
      desc: '',
      args: [],
    );
  }

  /// `Entendido como la capacidad de adaptación al profundo cambio vital. Esta adaptación necesitará una enorme cuota de confianza. No solo en información, en redes de apoyo, en la seguridad de los vínculos primarios, sino especialmente en esa confianza que es un activo que nace cuando logras la aceptación de ser quién eres con la libertad de elegir y crear.`
  String get moodTrackerExpansionBody3Text {
    return Intl.message(
      'Entendido como la capacidad de adaptación al profundo cambio vital. Esta adaptación necesitará una enorme cuota de confianza. No solo en información, en redes de apoyo, en la seguridad de los vínculos primarios, sino especialmente en esa confianza que es un activo que nace cuando logras la aceptación de ser quién eres con la libertad de elegir y crear.',
      name: 'moodTrackerExpansionBody3Text',
      desc: '',
      args: [],
    );
  }

  /// `Centrado especialmente en las relaciones de pareja, los proyectos de familia, las redes de apoyo y relevo tan necesarias para el éxito y salud del proceso de matrescencia. También incluimos aquí el vínculo comunitario allí donde estés. Tu contexto cultural, incluso la naturaleza que te rodea.`
  String get moodTrackerExpansionBody4Text {
    return Intl.message(
      'Centrado especialmente en las relaciones de pareja, los proyectos de familia, las redes de apoyo y relevo tan necesarias para el éxito y salud del proceso de matrescencia. También incluimos aquí el vínculo comunitario allí donde estés. Tu contexto cultural, incluso la naturaleza que te rodea.',
      name: 'moodTrackerExpansionBody4Text',
      desc: '',
      args: [],
    );
  }

  /// `El vínculo contigo misma`
  String get moodTrackerExpansionTitle1Text {
    return Intl.message(
      'El vínculo contigo misma',
      name: 'moodTrackerExpansionTitle1Text',
      desc: '',
      args: [],
    );
  }

  /// `El vínculo con tu bebé`
  String get moodTrackerExpansionTitle2Text {
    return Intl.message(
      'El vínculo con tu bebé',
      name: 'moodTrackerExpansionTitle2Text',
      desc: '',
      args: [],
    );
  }

  /// `El vínculo con la propia matrescencia`
  String get moodTrackerExpansionTitle3Text {
    return Intl.message(
      'El vínculo con la propia matrescencia',
      name: 'moodTrackerExpansionTitle3Text',
      desc: '',
      args: [],
    );
  }

  /// `El vínculo con tu entorno`
  String get moodTrackerExpansionTitle4Text {
    return Intl.message(
      'El vínculo con tu entorno',
      name: 'moodTrackerExpansionTitle4Text',
      desc: '',
      args: [],
    );
  }

  /// `¡Bienvenida a tu autocuidado!`
  String get moodTrackerInfoPageTitle {
    return Intl.message(
      '¡Bienvenida a tu autocuidado!',
      name: 'moodTrackerInfoPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hemos diseñado un viaje muy especial para ti y para tu bienestar. Aquí podrás experimentar la matrescencia desde una perspectiva diferente: tú en el centro.`
  String get moodTrackerInfoPageDetail1 {
    return Intl.message(
      'Hemos diseñado un viaje muy especial para ti y para tu bienestar. Aquí podrás experimentar la matrescencia desde una perspectiva diferente: tú en el centro.',
      name: 'moodTrackerInfoPageDetail1',
      desc: '',
      args: [],
    );
  }

  /// `Nuestro equipo de salud maternal ha creado una definición de bienestar en la matrescencia a partir de 4 vínculos principales:\n`
  String get moodTrackerInfoPageDetail2 {
    return Intl.message(
      'Nuestro equipo de salud maternal ha creado una definición de bienestar en la matrescencia a partir de 4 vínculos principales:\n',
      name: 'moodTrackerInfoPageDetail2',
      desc: '',
      args: [],
    );
  }

  /// `El viaje es sencillo, cada acción que realices en nuestra app te ayudará a descubrir tus  vínculos y a conectar contigo. El poder está en ti y en tus elecciones, tú decides lo que necesitas en cada momento.`
  String get moodTrackerInfoPageDetail3 {
    return Intl.message(
      'El viaje es sencillo, cada acción que realices en nuestra app te ayudará a descubrir tus  vínculos y a conectar contigo. El poder está en ti y en tus elecciones, tú decides lo que necesitas en cada momento.',
      name: 'moodTrackerInfoPageDetail3',
      desc: '',
      args: [],
    );
  }

  /// `Observar tu evolución te ayudará a tomar conciencia de tus propios patrones, reconociendo los factores que influyen en tu bienestar y en tu autocuidado en el tiempo.`
  String get moodTrackerInfoPageEvolucionDetail {
    return Intl.message(
      'Observar tu evolución te ayudará a tomar conciencia de tus propios patrones, reconociendo los factores que influyen en tu bienestar y en tu autocuidado en el tiempo.',
      name: 'moodTrackerInfoPageEvolucionDetail',
      desc: '',
      args: [],
    );
  }

  /// `Encontrarás allí dos “pestañas”, una, la que se ve en la imagen a continuación, para tu registro de emociones, donde podrás ver la representación semanal, mensual y anual, observando en el tiempo, tus respuestas predominantes en un cuadro de doble entrada. `
  String get moodTrackerInfoPageVinculosGraphDetail {
    return Intl.message(
      'Encontrarás allí dos “pestañas”, una, la que se ve en la imagen a continuación, para tu registro de emociones, donde podrás ver la representación semanal, mensual y anual, observando en el tiempo, tus respuestas predominantes en un cuadro de doble entrada. ',
      name: 'moodTrackerInfoPageVinculosGraphDetail',
      desc: '',
      args: [],
    );
  }

  /// `En la pestaña “Vínculos”, encontrarás los 4 vínculos de tu bienestar, y cuánto has estado cuidando cada uno en la última semana, mes o año. ¿Cómo podrás ver esto? Cada acción que realices en la app contribuye a tu bienestar a través de estos vínculos, viéndose reflejado en este apartado para que puedas hacer seguimiento y percibir tu evolución.`
  String get moodTrackerInfoPageEmotionGraphDetail {
    return Intl.message(
      'En la pestaña “Vínculos”, encontrarás los 4 vínculos de tu bienestar, y cuánto has estado cuidando cada uno en la última semana, mes o año. ¿Cómo podrás ver esto? Cada acción que realices en la app contribuye a tu bienestar a través de estos vínculos, viéndose reflejado en este apartado para que puedas hacer seguimiento y percibir tu evolución.',
      name: 'moodTrackerInfoPageEmotionGraphDetail',
      desc: '',
      args: [],
    );
  }

  /// `Mi diario de emociones`
  String get miDiarioDeEmociones {
    return Intl.message(
      'Mi diario de emociones',
      name: 'miDiarioDeEmociones',
      desc: '',
      args: [],
    );
  }

  /// `Diariamente te invitamos a parar y a registrar cómo estás y qué necesitas, como una forma de autocuidado.\nTambién tendrás espacio para escribir tus propias palabras si lo deseas.  Podrás registrar diariamente tus emociones y lo que influye en tu bienestar.\nUn chequeo rápido para tomar conciencia y conectar con el presente, o una parada profunda para reconocer esas emociones difíciles que nos señalan lo que necesitamos. Tú elegirás. Lo sabrás.\nTe invitamos a desvelar distintas capas de profundidad, ubicando tu ánimo, las emociones que predominan y los factores que influyen en cada momento.\nPodemos aprender y dejarnos guiar por nuestras emociones, si les damos un espacio amable para observarlas.`
  String get miDiarioDeEmocionesDetail {
    return Intl.message(
      'Diariamente te invitamos a parar y a registrar cómo estás y qué necesitas, como una forma de autocuidado.\nTambién tendrás espacio para escribir tus propias palabras si lo deseas.  Podrás registrar diariamente tus emociones y lo que influye en tu bienestar.\nUn chequeo rápido para tomar conciencia y conectar con el presente, o una parada profunda para reconocer esas emociones difíciles que nos señalan lo que necesitamos. Tú elegirás. Lo sabrás.\nTe invitamos a desvelar distintas capas de profundidad, ubicando tu ánimo, las emociones que predominan y los factores que influyen en cada momento.\nPodemos aprender y dejarnos guiar por nuestras emociones, si les damos un espacio amable para observarlas.',
      name: 'miDiarioDeEmocionesDetail',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo interpreto los resultados?`
  String get howCommentOfResult {
    return Intl.message(
      '¿Cómo interpreto los resultados?',
      name: 'howCommentOfResult',
      desc: '',
      args: [],
    );
  }

  /// `Visión semanal`
  String get visionSemanal {
    return Intl.message(
      'Visión semanal',
      name: 'visionSemanal',
      desc: '',
      args: [],
    );
  }

  /// `La línea representa el estado emocional que has registrado en el día.`
  String get visionSemanalDetail {
    return Intl.message(
      'La línea representa el estado emocional que has registrado en el día.',
      name: 'visionSemanalDetail',
      desc: '',
      args: [],
    );
  }

  /// `Visión mensual`
  String get visionMensual {
    return Intl.message(
      'Visión mensual',
      name: 'visionMensual',
      desc: '',
      args: [],
    );
  }

  /// `Cada barra representa un estado emocional, correspondiendo la barra más alta a la emoción predominante durante el mes visualizado, y por contraposición, la barra más pequeña representando la emoción menos registrada durante el mes.`
  String get visionMensualDetail {
    return Intl.message(
      'Cada barra representa un estado emocional, correspondiendo la barra más alta a la emoción predominante durante el mes visualizado, y por contraposición, la barra más pequeña representando la emoción menos registrada durante el mes.',
      name: 'visionMensualDetail',
      desc: '',
      args: [],
    );
  }

  /// `Visión anual`
  String get visionAnual {
    return Intl.message(
      'Visión anual',
      name: 'visionAnual',
      desc: '',
      args: [],
    );
  }

  /// `Cada mes está representado por una barra acumulada de todas las emociones que has sentido. Podrás ver cómo se reparten tus emociones durante el año y si ha habido fluctuaciones según el mes. Dentro de cada mes, cuanto más alta sea una barra, más días habrás registrado dicho estado de ánimo. \n\nEn caso de preguntas, conecta en nuestra comunidad.`
  String get visionAnualDetail {
    return Intl.message(
      'Cada mes está representado por una barra acumulada de todas las emociones que has sentido. Podrás ver cómo se reparten tus emociones durante el año y si ha habido fluctuaciones según el mes. Dentro de cada mes, cuanto más alta sea una barra, más días habrás registrado dicho estado de ánimo. \n\nEn caso de preguntas, conecta en nuestra comunidad.',
      name: 'visionAnualDetail',
      desc: '',
      args: [],
    );
  }

  /// `Nuestro compromiso`
  String get moodTrackerInfoPageFooterTitle {
    return Intl.message(
      'Nuestro compromiso',
      name: 'moodTrackerInfoPageFooterTitle',
      desc: '',
      args: [],
    );
  }

  /// `En Dana estamos comprometidos con tu autocuidado, entendiéndolo como un derecho de todos y de todas. \n\nQuizás se trate de aprender a tomar buenas decisiones. Decisiones saludables que nos conecten desde dentro hacia fuera.\n\nPensemos en el autocuidado como una brújula. Una guía que nos lleva al norte, al centro, a nuestro destino..\n\nTe invitamos a coger tu brújula, te recordaremos cómo usarla para orientar el viento a tu favor y fijar la dirección que necesites.\n\n¿Comenzamos?\n\nSi tienes alguna duda, pregunta o sugerencia, escríbenos a hola@dana.health`
  String get moodTrackerInfoPageFooterText {
    return Intl.message(
      'En Dana estamos comprometidos con tu autocuidado, entendiéndolo como un derecho de todos y de todas. \n\nQuizás se trate de aprender a tomar buenas decisiones. Decisiones saludables que nos conecten desde dentro hacia fuera.\n\nPensemos en el autocuidado como una brújula. Una guía que nos lleva al norte, al centro, a nuestro destino..\n\nTe invitamos a coger tu brújula, te recordaremos cómo usarla para orientar el viento a tu favor y fijar la dirección que necesites.\n\n¿Comenzamos?\n\nSi tienes alguna duda, pregunta o sugerencia, escríbenos a hola@dana.health',
      name: 'moodTrackerInfoPageFooterText',
      desc: '',
      args: [],
    );
  }

  /// `¿Necesitas hablar con un profesional?`
  String get consulationPageTitle {
    return Intl.message(
      '¿Necesitas hablar con un profesional?',
      name: 'consulationPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Accede a una consulta online con un/a psicólogo/a, ginecólogo/a, pediatra u otras especialidades médicas siempre que lo necesites.`
  String get consulationVidoePageText {
    return Intl.message(
      'Accede a una consulta online con un/a psicólogo/a, ginecólogo/a, pediatra u otras especialidades médicas siempre que lo necesites.',
      name: 'consulationVidoePageText',
      desc: '',
      args: [],
    );
  }

  /// `Resuelve tus dudas de forma inmediata con un cuadro de especialistas médicos en un chat abierto 48h. por sesión`
  String get consulationChatPageText {
    return Intl.message(
      'Resuelve tus dudas de forma inmediata con un cuadro de especialistas médicos en un chat abierto 48h. por sesión',
      name: 'consulationChatPageText',
      desc: '',
      args: [],
    );
  }

  /// `Quiero mi videoconsulta`
  String get consulationPageButton1Text {
    return Intl.message(
      'Quiero mi videoconsulta',
      name: 'consulationPageButton1Text',
      desc: '',
      args: [],
    );
  }

  /// `Quiero mi chat médico`
  String get consulationPageButton2Text {
    return Intl.message(
      'Quiero mi chat médico',
      name: 'consulationPageButton2Text',
      desc: '',
      args: [],
    );
  }

  /// `Salud digital MAPFRE es un servicio médico externo.\n\nAl hacer click en la opción elegida, abandonas nuestra app Dana, entras en Savia, la plataforma de servicios de salud digital de MAPFRE, nuestro colaborador/partner.\n\nNo nos hacemos responsables de los servicios médicos prestados por terceros.`
  String get consulationPageBottomText {
    return Intl.message(
      'Salud digital MAPFRE es un servicio médico externo.\n\nAl hacer click en la opción elegida, abandonas nuestra app Dana, entras en Savia, la plataforma de servicios de salud digital de MAPFRE, nuestro colaborador/partner.\n\nNo nos hacemos responsables de los servicios médicos prestados por terceros.',
      name: 'consulationPageBottomText',
      desc: '',
      args: [],
    );
  }

  /// `Puede ingresar hasta 4.`
  String get childCountMaxText {
    return Intl.message(
      'Puede ingresar hasta 4.',
      name: 'childCountMaxText',
      desc: '',
      args: [],
    );
  }

  /// `No, gracias.`
  String get noGracias {
    return Intl.message(
      'No, gracias.',
      name: 'noGracias',
      desc: '',
      args: [],
    );
  }

  /// `¡Claro, quiero ver mis resultados!`
  String get questionnareFinalScreenButtonText {
    return Intl.message(
      '¡Claro, quiero ver mis resultados!',
      name: 'questionnareFinalScreenButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Muchas gracias por tomarte el tiempo para responder.\n\nEste es un cuestionario validado por profesionales de la salud,\n\n¿te interesa conocer tus resultados?`
  String get questionnareFinalScreenContentText {
    return Intl.message(
      'Muchas gracias por tomarte el tiempo para responder.\n\nEste es un cuestionario validado por profesionales de la salud,\n\n¿te interesa conocer tus resultados?',
      name: 'questionnareFinalScreenContentText',
      desc: '',
      args: [],
    );
  }

  /// `¿Tienes más de un hijo/a?`
  String get iHaveMoreThanOneChild {
    return Intl.message(
      '¿Tienes más de un hijo/a?',
      name: 'iHaveMoreThanOneChild',
      desc: '',
      args: [],
    );
  }

  /// `Tengo más hijos/as`
  String get iHaveMoreChild {
    return Intl.message(
      'Tengo más hijos/as',
      name: 'iHaveMoreChild',
      desc: '',
      args: [],
    );
  }

  /// `Indica aquí cuántos hijos/as tienes`
  String get howManyChild {
    return Intl.message(
      'Indica aquí cuántos hijos/as tienes',
      name: 'howManyChild',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es la fecha de nacimiento de tu primer hijo/a?`
  String get firstChildTextFieldHintText {
    return Intl.message(
      '¿Cuál es la fecha de nacimiento de tu primer hijo/a?',
      name: 'firstChildTextFieldHintText',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es la  fecha de nacimiento de tu segundo/a hijo/a?`
  String get secondChildTextFieldHintText {
    return Intl.message(
      '¿Cuál es la  fecha de nacimiento de tu segundo/a hijo/a?',
      name: 'secondChildTextFieldHintText',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es la  fecha de nacimiento de tu tercer hijo/a?`
  String get thirdChildTextFieldHintText {
    return Intl.message(
      '¿Cuál es la  fecha de nacimiento de tu tercer hijo/a?',
      name: 'thirdChildTextFieldHintText',
      desc: '',
      args: [],
    );
  }

  /// `¿Cuál es la  fecha de nacimiento de tu cuarto hijo/a?`
  String get fourthChildTextFieldHintText {
    return Intl.message(
      '¿Cuál es la  fecha de nacimiento de tu cuarto hijo/a?',
      name: 'fourthChildTextFieldHintText',
      desc: '',
      args: [],
    );
  }

  /// `El viaje es hacia ti`
  String get onboardingComplatedPage1Title {
    return Intl.message(
      'El viaje es hacia ti',
      name: 'onboardingComplatedPage1Title',
      desc: '',
      args: [],
    );
  }

  /// `La matrescencia es una etapa de cambios en la que tú estás en el centro.\n\nEn Dana acompañamos tu autocuidado a través de 4 vínculos: La conexión contigo misma, con tu bebé, con tu entorno y con tu matrescencia.\n\nCuídate para cuidar.`
  String get onboardingComplatedPage1Body {
    return Intl.message(
      'La matrescencia es una etapa de cambios en la que tú estás en el centro.\n\nEn Dana acompañamos tu autocuidado a través de 4 vínculos: La conexión contigo misma, con tu bebé, con tu entorno y con tu matrescencia.\n\nCuídate para cuidar.',
      name: 'onboardingComplatedPage1Body',
      desc: '',
      args: [],
    );
  }

  /// `En Dana personalizamos la experiencia para madres y embarazadas.\n\nPara perfiles como el tuyo, te invitamos a explorar nuestra app y`
  String get onboardingComplatedPage2Title {
    return Intl.message(
      'En Dana personalizamos la experiencia para madres y embarazadas.\n\nPara perfiles como el tuyo, te invitamos a explorar nuestra app y',
      name: 'onboardingComplatedPage2Title',
      desc: '',
      args: [],
    );
  }

  /// `• participar en nuestra comunidad,\n• navegar en nuestros programas\ndiseñados por expertos/as,\n• descubrir nuestro concepto de\nautocuidado.`
  String get onboardingComplatedPage2Body {
    return Intl.message(
      '• participar en nuestra comunidad,\n• navegar en nuestros programas\ndiseñados por expertos/as,\n• descubrir nuestro concepto de\nautocuidado.',
      name: 'onboardingComplatedPage2Body',
      desc: '',
      args: [],
    );
  }

  /// `¡Bienvenida/o!\nNos gusta tenerte cerca.`
  String get onboardingComplatedPage2BottomText {
    return Intl.message(
      '¡Bienvenida/o!\nNos gusta tenerte cerca.',
      name: 'onboardingComplatedPage2BottomText',
      desc: '',
      args: [],
    );
  }

  /// `Te recomendamos`
  String get onboardingQuestionnareComplatedPageTitle {
    return Intl.message(
      'Te recomendamos',
      name: 'onboardingQuestionnareComplatedPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Utilizar Dana un mínimo de 3 veces por semana genera mayor sensación de bienestar y fortalece tus vínculos.\n\nEn Dana nos comprometemos con tu bienestar.`
  String get onboardingQuestionnareComplatedPageBody {
    return Intl.message(
      'Utilizar Dana un mínimo de 3 veces por semana genera mayor sensación de bienestar y fortalece tus vínculos.\n\nEn Dana nos comprometemos con tu bienestar.',
      name: 'onboardingQuestionnareComplatedPageBody',
      desc: '',
      args: [],
    );
  }

  /// `Cargando tus resultados`
  String get loadingScreenText {
    return Intl.message(
      'Cargando tus resultados',
      name: 'loadingScreenText',
      desc: '',
      args: [],
    );
  }

  /// `Para tu acompañamiento`
  String get homePageMatronasAreaTitle {
    return Intl.message(
      'Para tu acompañamiento',
      name: 'homePageMatronasAreaTitle',
      desc: '',
      args: [],
    );
  }

  /// `SERVICIOS\nMATRONAS`
  String get homePageMatronasCardText {
    return Intl.message(
      'SERVICIOS\nMATRONAS',
      name: 'homePageMatronasCardText',
      desc: '',
      args: [],
    );
  }

  /// `Online y a domicilio`
  String get homePageMatronasCardSubText {
    return Intl.message(
      'Online y a domicilio',
      name: 'homePageMatronasCardSubText',
      desc: '',
      args: [],
    );
  }

  /// `Acompañamos tu maternidad y atendemos tus necesidades de forma personalizada`
  String get midwifePageTitle {
    return Intl.message(
      'Acompañamos tu maternidad y atendemos tus necesidades de forma personalizada',
      name: 'midwifePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Preparación al parto`
  String get midwifePageSection1Title {
    return Intl.message(
      'Preparación al parto',
      name: 'midwifePageSection1Title',
      desc: '',
      args: [],
    );
  }

  /// `Hipnoparto y respiración`
  String get midwifePageSection2Title {
    return Intl.message(
      'Hipnoparto y respiración',
      name: 'midwifePageSection2Title',
      desc: '',
      args: [],
    );
  }

  /// `Recursos para el acompañante`
  String get midwifePageSection3Title {
    return Intl.message(
      'Recursos para el acompañante',
      name: 'midwifePageSection3Title',
      desc: '',
      args: [],
    );
  }

  /// `Consultas sobre lactancia, suelo pélvico, fertilidad, sexualidad`
  String get midwifePageSection4Title {
    return Intl.message(
      'Consultas sobre lactancia, suelo pélvico, fertilidad, sexualidad',
      name: 'midwifePageSection4Title',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get midwifePageOnlineButtonText {
    return Intl.message(
      'Online',
      name: 'midwifePageOnlineButtonText',
      desc: '',
      args: [],
    );
  }

  /// `A domicilio`
  String get midwifePageDomiclioButtonText {
    return Intl.message(
      'A domicilio',
      name: 'midwifePageDomiclioButtonText',
      desc: '',
      args: [],
    );
  }

  /// `¡Hola {name}!`
  String midwifePageModalTitle(Object name) {
    return Intl.message(
      '¡Hola $name!',
      name: 'midwifePageModalTitle',
      desc: '',
      args: [name],
    );
  }

  /// `Tienes disponible tu primera llamada gratis con una de nuestras matronas.\n\nEn esa llamada, entenderemos mejor dónde estás y cómo podemos apoyarte.\n\nDéjanos tu número de teléfono y contactaremos por whatsapp lo antes posible para agendar nuestra primera llamada.`
  String get midwifePageModalText {
    return Intl.message(
      'Tienes disponible tu primera llamada gratis con una de nuestras matronas.\n\nEn esa llamada, entenderemos mejor dónde estás y cómo podemos apoyarte.\n\nDéjanos tu número de teléfono y contactaremos por whatsapp lo antes posible para agendar nuestra primera llamada.',
      name: 'midwifePageModalText',
      desc: '',
      args: [],
    );
  }

  /// `Tu teléfono...`
  String get midwifePageModalTextFieldHintText {
    return Intl.message(
      'Tu teléfono...',
      name: 'midwifePageModalTextFieldHintText',
      desc: '',
      args: [],
    );
  }

  /// `Enviar`
  String get midwifePageModalButtonText {
    return Intl.message(
      'Enviar',
      name: 'midwifePageModalButtonText',
      desc: '',
      args: [],
    );
  }

  /// `¡Teléfono enviado!`
  String get midwifePageSuccessModalTitle {
    return Intl.message(
      '¡Teléfono enviado!',
      name: 'midwifePageSuccessModalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tu teléfono ha sido enviado.\n\nTe llamaremos cuanto antes.\n\nQue tengas un gran día :)`
  String get midwifePageSuccessModalSubTitle {
    return Intl.message(
      'Tu teléfono ha sido enviado.\n\nTe llamaremos cuanto antes.\n\nQue tengas un gran día :)',
      name: 'midwifePageSuccessModalSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get midwifePageSuccessModalButton {
    return Intl.message(
      'Entendido',
      name: 'midwifePageSuccessModalButton',
      desc: '',
      args: [],
    );
  }

  /// `Hay un problema`
  String get midwifePageProblemText {
    return Intl.message(
      'Hay un problema',
      name: 'midwifePageProblemText',
      desc: '',
      args: [],
    );
  }

  /// `Soy Roser, en nombre de las\nmatronas del equipo Dana...`
  String get midwifePageModalMidWifeDesc {
    return Intl.message(
      'Soy Roser, en nombre de las\nmatronas del equipo Dana...',
      name: 'midwifePageModalMidWifeDesc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
