abstract class GetPersonPdfState {}

final class GetPersonPdfInitial extends GetPersonPdfState {}

final class GetPersonPdfLoading extends GetPersonPdfState {}

final class GetPersonPdfFailure extends GetPersonPdfState {
  final String errorMessage;

  GetPersonPdfFailure({required this.errorMessage});
}

final class GetPersonPdfSuccess extends GetPersonPdfState {
  final String personPdfUrl;

  GetPersonPdfSuccess({required this.personPdfUrl});
}
