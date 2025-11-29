// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/Persons/data/repos/person_repo.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_person_pdf_cubit/get_person_pdf_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPersonPdfCubit extends Cubit<GetPersonPdfState> {
  PersonRepo personRepo;
  String personUrl = '';

  GetPersonPdfCubit(this.personRepo) : super(GetPersonPdfInitial());

  Future<void> getPersonPdf({required int id}) async {
    emit(GetPersonPdfLoading());
    var result = await personRepo.getPersonPDF(id: id);
    result.fold(
      (failure) =>
          emit(GetPersonPdfFailure(errorMessage: failure.errorMessage)),
      (url) {
        personUrl = url;

        emit(GetPersonPdfSuccess(personPdfUrl: url));
      },
    );
  }
}
