import 'package:flutter/cupertino.dart';

import '../../feature/al_kuran/pregentation/screen/al_kuran_page.dart' show AlKuranPage;
import '../../feature/asmaul_husna/pregentation/screen/asmaul_husna.dart' show AsmaulHusna;
import '../../feature/home_page/pregentation/screen/home_page.dart';
import '../../feature/home_page/pregentation/screen/location_drop_down.dart';
import '../../feature/jummatul_khutba/pregentation/screen/jummatul_khutba_page.dart' show JummatulKhutbaPage;
import '../../feature/kibla_compas/pregentation/screen/kibla_compas.dart';
import '../../feature/live/pregentation/screen/live_page.dart';
import '../../feature/login_page/login_screen.dart';
import '../../feature/namazer_somoysuci/pregentation/screen/namazer_somoysuci_page.dart' show NamazerSomoysuciPage;
import '../../feature/oaj/pregentation/screen/oaj_page.dart';
import '../../feature/reg_page/registation_screen.dart';
import '../../feature/sahri_iftar/pregentation/screen/sahri_iftar_page.dart';
import '../../feature/setting_page/pregentation/screen/setting_page.dart';
import '../../feature/surah_details_page/pregentation/screen/surah_details_page.dart';
import '../../feature/tasbih/pregentation/screen/tasbih_page.dart';

class RouteHelper{
  static String homePage="/";
  static String locationDropDown="/LocationDropDown";
  static String settingPage="/SettingPage";
  static String namazerSomoysuciPage="/NamazerSomoysuciPage";
  static String alKuranPage="/AlKuranPage";
  static String sahriIftarPage="/SahriIftarPage";
  static String tasbih="/Tasbih";
  static String kiblaCompas="/KiblaCompas";
  static String asmaulHusna="/AsmaulHusna";
  static String jummatulKhutbaPage="/jummatulKhutbaPage";
  static String oajPage="/OajPage";
  static String livePage="/LivePage";
  static String surahDetailsPage="/SurahDetailsPage";
  static String loginPage="/LoginPage";
  static String registrationPage="/registrationPage";

  static Map<String,WidgetBuilder>getRoute(){
    return{
      RouteHelper.homePage:(context)=>HomePage(),
      RouteHelper.locationDropDown:(context)=>LocationDropDown(),
      RouteHelper.settingPage:(context)=>SettingPage(),
      RouteHelper.namazerSomoysuciPage:(context)=>NamazerSomoysuciPage(),
      RouteHelper.alKuranPage:(context)=>AlKuranPage(),
      RouteHelper.sahriIftarPage:(context)=>SahriIftarPage(),
      RouteHelper.tasbih:(context)=>Tasbih(),
      RouteHelper.kiblaCompas:(context)=>KiblaCompas(),
      RouteHelper.asmaulHusna:(context)=>AsmaulHusna(),
      RouteHelper.jummatulKhutbaPage:(context)=>JummatulKhutbaPage(),
      RouteHelper.oajPage:(context)=>OajPage(),
      RouteHelper.livePage:(context)=>LivePage(),
      RouteHelper.surahDetailsPage:(context)=>SurahDetailsPage(),
      RouteHelper.loginPage:(context)=>LoginPage(),
      RouteHelper.registrationPage:(context)=>RegistrationPage(),
    };
  }

}