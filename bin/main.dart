import 'package:http/http.dart' as http;
import 'package:paquetes/classes/request_response.dart';

//import 'package:paquetes/paquetes.dart' as paquetes;

void main(List<String> arguments) {
  final url = 'https://reqres.in/api/users?page=2';
  http.get(url).then((res) {
    final resReq = requestResponseFromJson(res.body);
    print('page: ${resReq.page}');
    print('per_page: ${resReq.perPage}');
    print('id del tercero: ${resReq.data[2].id}');
  });
}
