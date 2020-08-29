import 'package:http/http.dart' as http;
import 'package:paquetes/classes/currency.dart';
import 'package:paquetes/classes/language.dart';

import 'classes/country.dart';
import 'classes/request_response.dart';

void getRequestResponseService() {
  final url = 'https://reqres.in/api/users?page=2';
  http.get(url).then((res) {
    final resReq = requestResponseFromJson(res.body);
    print('page: ${resReq.page}');
    print('per_page: ${resReq.perPage}');
    print('id del tercero: ${resReq.data[2].id}');
  });
}

void getCountry() {
  final url = 'https://restcountries.eu/rest/v2/alpha/cl';
  http.get(url).then((res) {
    final country = countryFromJson(res.body);
    print('===========================');
    print('Pais: ${country.name}');
    print('Población: ${country.population}');
    print('Fronteras:');
    country.borders.forEach((border) =>
        print('    ${border[0]}${border.substring(1).toLowerCase()}'));

    print('Idiomas:');
    country.languages.forEach((lang) => print('    ${lang.nativeName}'));
    print('Latitud: ${country.latlng[0]}');
    print('Longitud: ${country.latlng[1]}');
    print('Monedas:');
    country.currencies.forEach((currency) => print('    ${currency.name}'));
    print('Bandera: ${country.flag}');
    print('===========================');
  }).catchError((error) => print);
}
