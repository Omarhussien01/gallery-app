import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_gallery_state.dart';

class GetGalleryCubit extends Cubit<GetGalleryState> {
  GetGalleryCubit() : super(GetGalleryInitial());
}
