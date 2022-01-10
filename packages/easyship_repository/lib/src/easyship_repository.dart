import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class EasyshipRepository {
  final EasyshipRepository apiClient;

  EasyshipRepository({required this.apiClient});

  getAll() {
    return apiClient.getAll();
  }

  getId(id) {
    return apiClient.getId(id);
  }
}
