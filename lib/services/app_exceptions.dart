/// Thrown when a network error prevents the operation (e.g. offline, timeout).
class NetworkException implements Exception {
  final String message;
  final dynamic cause;

  NetworkException([this.message = 'Network error', this.cause]);

  @override
  String toString() => message;
}

/// Thrown when Firestore/data sync fails for non-network reasons.
class DataSyncException implements Exception {
  final String message;
  final dynamic cause;

  DataSyncException([this.message = 'Could not save; try again', this.cause]);

  @override
  String toString() => message;
}
