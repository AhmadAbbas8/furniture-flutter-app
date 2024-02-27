import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_flutter_app/bloc_observer.dart';
import 'package:furniture_flutter_app/core/service_locator/service_locator.dart';
import 'package:furniture_flutter_app/core/utils/colors_palette.dart';
import 'package:furniture_flutter_app/views/home_view/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  await ServiceLocator.setup();
  runApp(const FurnitureApp());
}

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.dmSansTextTheme()
              .apply(displayColor: ColorsPalette.kTextColor),
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        title: 'Furniture Flutter App',
        home: child,
      ),
      child: const HomeView(),
    );
  }
}
