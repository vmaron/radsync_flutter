class Constants {
  static Pattern host = 'https://staging-radsync.mskcc.org';
  static Pattern redirectUri = 'https://staging-radsync.mskcc.org/sso';
}

enum FetchStatus { initial, loading, success, failure }

extension FetchStatusExtension on FetchStatus {
  bool get isInitial => this == FetchStatus.initial;
  bool get isLoading => this == FetchStatus.loading;
  bool get isSuccess => this == FetchStatus.success;
  bool get isFailure => this == FetchStatus.failure;
}