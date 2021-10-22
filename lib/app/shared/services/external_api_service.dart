import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

part 'external_api_service.g.dart';

@Injectable()
class ExternalApiService extends Disposable {
  static String baseUrl = "https://pleasant-caiman-76.hasura.app/v1/graphql";
  static Map<String, String> headers = {
    "content-type": "application/json",
    "x-hasura-admin-secret":
        "L2OakOXLLu9EWF9BIJYLJlIw1xceFxSyRRUQioHqs4G2aNMUTLorYXKfARxLbJFZ",
    "x-hasura-role": "user",
  };

  static HasuraConnect getInstance({Map<String, String> header}) {
    headers.addAll(header ?? Map<String, String>());
    HasuraConnect hasuraConnect = HasuraConnect(baseUrl, headers: headers);
    return hasuraConnect;
  }

  @override
  void dispose() {}
}
