import '../interfaces/client_http_interface.dart';

class LoginRepository {
  final IClientHttp client;

  LoginRepository(this.client);

  Future<dynamic> login(String email, String password) async {
    var dataBody = {"acc_email": email, "acc_senha": password};

    var resposta = await client.post('/login', dataBody);
    if (resposta['r'] == 'no') {
      throw (resposta['data']);
    }

    return resposta['data'];
  }
}
