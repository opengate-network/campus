import 'package:flutter/material.dart';
import 'package:ui/blocs/authentication/authentication_bloc.dart';
import 'package:ui/pages/login/view/login_page.dart';
import 'package:ui/pages/main/view/main_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    AuthenticationStatus state,
    List<Page<dynamic>> pages,
    ) {
  switch (state) {
    case AuthenticationStatus.authenticated:
      return [MainPage.page()];
    case AuthenticationStatus.unauthenticated:
      return [LoginPage.page()];
  }
}