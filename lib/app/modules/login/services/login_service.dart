import 'package:carrinho_compras/app/shared/services/external_api_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

part 'login_service.g.dart';

@Injectable()
class LoginService extends Disposable {
  static Future<List<dynamic>> loginUserOnBackEnd(
      {String identification}) async {
    final HasuraConnect hasura = ExternalApiService.getInstance();
    dynamic response;
    final String query = """
      query{
        users(where: {_or: [{name: {_eq: "$identification"}}, {mail: {_eq: "$identification"}}]}) {
          id
        }
      }
    """;

    try {
      print(identification);
      response = await hasura.query(query);
      return response["data"]["users"];
    } catch (e) {
      response = "error";
      return [];
    }
  }

  @override
  void dispose() {}
}
