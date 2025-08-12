enum AppStatus {
  initial('initial'),
  loading('loading'),
  success('submit'),
  error('error');

  const AppStatus(this.status);

  final String status;
}
