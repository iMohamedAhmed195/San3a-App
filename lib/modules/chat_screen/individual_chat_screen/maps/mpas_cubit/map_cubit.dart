
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/maps/mpas_cubit/map_states.dart';

class MapsCubit extends Cubit<MapsStates>{

  MapsCubit(): super(MapsInitialStates());

  static MapsCubit get(context) => BlocProvider.of(context);

   void getAddress (double lat , double long)async{
     List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
     print(placemarks[0].country);
     print(placemarks[0].street);
     print(placemarks[0].administrativeArea);
     print(placemarks[0].locality);
     print(placemarks[0].subAdministrativeArea);
   }

}