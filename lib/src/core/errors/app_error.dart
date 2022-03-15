class AppError {
  final String? msg;

  AppError([this.msg]);

  @override
  String toString() => msg ?? 'Erro Genérico';
}
