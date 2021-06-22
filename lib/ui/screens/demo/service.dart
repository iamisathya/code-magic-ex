import 'package:code_magic_ex/ui/screens/demo/model.dart';
import 'package:dio/dio.dart';

class ContactService {
  static Future<List<Contacts>> browse() async {
    final Dio client = Dio();
    final Response response =
        await client.get('https://jsonplaceholder.typicode.com/users');
    final List<dynamic> content = response.data as List;
    final List<Contacts> temp = content
        .map((itemWord) => Contacts.fromJson(itemWord as Map<String, dynamic>))
        .toList();

    final List<Contacts> collections = temp;
    return collections;
  }
}
