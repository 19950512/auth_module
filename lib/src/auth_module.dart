import 'package:flutter_modular/flutter_modular.dart';
import 'blocs/login_bloc.dart';
import 'repositories/login_repository.dart';
import 'services/client_http_service.dart';
import 'views/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => ClientHttpService()),
        Bind.factory((i) => LoginRepository(i())),
        Bind.singleton((i) => LoginBloc(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
      ];
}
