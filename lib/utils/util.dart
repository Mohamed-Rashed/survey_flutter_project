import 'package:survey/models/sign_up_response.dart';
import 'package:survey/utils/controller.dart';
import 'package:survey/utils/sharedPreference_helper.dart';

String BASE_URL = "https://bera2yak2.herokuapp.com";
String LOGIN = "/login";
String SIGN_UP = "/user/sign_up";
String ACCOUNT_PAGE = "/user/me";
String SEND_QUERY = "/user/sendemail";
String GET_SURVEY = "/surveys";
String GET_AWARDS = "/rewards";
String GET_SURVEY_DETAIL = "/{surveyid}?id=";
String ADD_SURVEY = "/surveys";
String UPDATE_SURVEY = "/{surveyid}?id=";
String DELETE_SURVEY = "/{surveyid}?id=";
String SEND_OTP = "/user/takephone";
String OTP_VERIFIED = "/user/takeotp";
 String TOKEN_PRE= "bearer ";
 String notificationList= "/notification";
 String token="";



SignUpResponse response;

Controller c = Controller();

SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();