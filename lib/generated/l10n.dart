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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Telephone number`
  String get telephone_number {
    return Intl.message(
      'Telephone number',
      name: 'telephone_number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Telephone number *`
  String get require_number {
    return Intl.message(
      'Telephone number *',
      name: 'require_number',
      desc: '',
      args: [],
    );
  }

  /// `Referral number`
  String get nominate_number {
    return Intl.message(
      'Referral number',
      name: 'nominate_number',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get activation {
    return Intl.message(
      'Register',
      name: 'activation',
      desc: '',
      args: [],
    );
  }

  /// `Activation code`
  String get activation_code {
    return Intl.message(
      'Activation code',
      name: 'activation_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get emphasis {
    return Intl.message(
      'Verify',
      name: 'emphasis',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation`
  String get password_confirmation {
    return Intl.message(
      'Password confirmation',
      name: 'password_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Sports questionnaire`
  String get sports_questionnaire {
    return Intl.message(
      'Sports questionnaire',
      name: 'sports_questionnaire',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for sharing your opinion.\n  The points have been transferred to your points wallet.`
  String get thanks_text {
    return Intl.message(
      'Thanks for sharing your opinion.\n  The points have been transferred to your points wallet.',
      name: 'thanks_text',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get thanks {
    return Intl.message(
      'Thank you',
      name: 'thanks',
      desc: '',
      args: [],
    );
  }

  /// `We will contact you in the shortest time.`
  String get help_text {
    return Intl.message(
      'We will contact you in the shortest time.',
      name: 'help_text',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use and privacy`
  String get term_condition {
    return Intl.message(
      'Terms of use and privacy',
      name: 'term_condition',
      desc: '',
      args: [],
    );
  }

  /// `I agree`
  String get agree {
    return Intl.message(
      'I agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Main Menu`
  String get list {
    return Intl.message(
      'Main Menu',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get main {
    return Intl.message(
      'Dashboard',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get arithmetic {
    return Intl.message(
      'My Profile',
      name: 'arithmetic',
      desc: '',
      args: [],
    );
  }

  /// `My points`
  String get my_points {
    return Intl.message(
      'My points',
      name: 'my_points',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `You can also email us through`
  String get email_us {
    return Intl.message(
      'You can also email us through',
      name: 'email_us',
      desc: '',
      args: [],
    );
  }

  /// `Your inquiry`
  String get your_inquiry {
    return Intl.message(
      'Your inquiry',
      name: 'your_inquiry',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Available gifts`
  String get available_gift {
    return Intl.message(
      'Available gifts',
      name: 'available_gift',
      desc: '',
      args: [],
    );
  }

  /// `50 MB from Vodafone for 50 points`
  String get text_gift {
    return Intl.message(
      '50 MB from Vodafone for 50 points',
      name: 'text_gift',
      desc: '',
      args: [],
    );
  }

  /// `Provide your account information now and get additional points`
  String get account_info_text {
    return Intl.message(
      'Provide your account information now and get additional points',
      name: 'account_info_text',
      desc: '',
      args: [],
    );
  }

  /// `My previous surveys`
  String get previous_surveys {
    return Intl.message(
      'My previous surveys',
      name: 'previous_surveys',
      desc: '',
      args: [],
    );
  }

  /// `Redeem`
  String get recover_now {
    return Intl.message(
      'Redeem',
      name: 'recover_now',
      desc: '',
      args: [],
    );
  }

  /// `Polls today`
  String get polls_today {
    return Intl.message(
      'Polls today',
      name: 'polls_today',
      desc: '',
      args: [],
    );
  }

  /// `Body care products questionnaire`
  String get dash_title {
    return Intl.message(
      'Body care products questionnaire',
      name: 'dash_title',
      desc: '',
      args: [],
    );
  }

  /// `20 minutes`
  String get time {
    return Intl.message(
      '20 minutes',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `7 points`
  String get point_7 {
    return Intl.message(
      '7 points',
      name: 'point_7',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `My surveys`
  String get my_survey {
    return Intl.message(
      'My surveys',
      name: 'my_survey',
      desc: '',
      args: [],
    );
  }

  /// `For every person that joins برأيك via your unique referral link and completes 6 surveys, you will receive 200 points.\nCopy your unique link and send it to your friends – you'll get 20% points earned by them`
  String get dialog_text {
    return Intl.message(
      'For every person that joins برأيك via your unique referral link and completes 6 surveys, you will receive 200 points.\nCopy your unique link and send it to your friends – you\'ll get 20% points earned by them',
      name: 'dialog_text',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notice {
    return Intl.message(
      'Notifications',
      name: 'notice',
      desc: '',
      args: [],
    );
  }

  /// `New questionnaire`
  String get new_q {
    return Intl.message(
      'New questionnaire',
      name: 'new_q',
      desc: '',
      args: [],
    );
  }

  /// `Click for details`
  String get click_n {
    return Intl.message(
      'Click for details',
      name: 'click_n',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday at 10.58`
  String get yes_10 {
    return Intl.message(
      'Yesterday at 10.58',
      name: 'yes_10',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Admin`
  String get hello_admin {
    return Intl.message(
      'Hello, Admin',
      name: 'hello_admin',
      desc: '',
      args: [],
    );
  }

  /// `Add Survey`
  String get add_survey {
    return Intl.message(
      'Add Survey',
      name: 'add_survey',
      desc: '',
      args: [],
    );
  }

  /// `Add Reward`
  String get add_rewards {
    return Intl.message(
      'Add Reward',
      name: 'add_rewards',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name_s {
    return Intl.message(
      'Name',
      name: 'name_s',
      desc: '',
      args: [],
    );
  }

  /// `Time Needed`
  String get time_need {
    return Intl.message(
      'Time Needed',
      name: 'time_need',
      desc: '',
      args: [],
    );
  }

  /// `Number of Points`
  String get numer_of_point {
    return Intl.message(
      'Number of Points',
      name: 'numer_of_point',
      desc: '',
      args: [],
    );
  }

  /// `Survey Link`
  String get survey_link {
    return Intl.message(
      'Survey Link',
      name: 'survey_link',
      desc: '',
      args: [],
    );
  }

  /// `Attach Survey Photo`
  String get attach_survey_photo {
    return Intl.message(
      'Attach Survey Photo',
      name: 'attach_survey_photo',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `Attach Reward Photo`
  String get attach_reward_photo {
    return Intl.message(
      'Attach Reward Photo',
      name: 'attach_reward_photo',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Points Worth`
  String get points_worth {
    return Intl.message(
      'Points Worth',
      name: 'points_worth',
      desc: '',
      args: [],
    );
  }

  /// `Redeem Code`
  String get redeem_code {
    return Intl.message(
      'Redeem Code',
      name: 'redeem_code',
      desc: '',
      args: [],
    );
  }

  /// `Or Register here`
  String get register_here {
    return Intl.message(
      'Or Register here',
      name: 'register_here',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
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
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}