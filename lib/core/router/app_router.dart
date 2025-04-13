import 'package:go_router/go_router.dart';
import 'package:practica2/presentations/screens/login_screen.dart';
import 'package:practica2/presentations/screens/phones_detail_screen.dart';
import 'package:practica2/presentations/screens/phones_screen.dart';



final GoRouter appRouter = GoRouter(
  initialLocation: '/login',//FIXME, prueba con lista 
  routes:[
    GoRoute(path: '/login', builder:(context, state) => const LoginScreen(),),
    GoRoute(path: '/phones', builder: (context, state) => PhonesScreen(),),
    GoRoute(path: '/phones_detail', builder: (context, state) =>  PhonesDetailScreen(
      phoneId: state.pathParameters['phoneId']!),)
  ] 
  );







