import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/maps/mpas_cubit/map_cubit.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/maps/mpas_cubit/map_states.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/styles/icon_broken.dart';

class MapsScreen extends StatefulWidget {
   MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  bool visible =false ;
  Position? c1;
  var lat;
  var long;
  var anotherLat = 29.9996792;
  var anotherLong = 31.1856295;
  static CameraPosition? _kGooglePlex;
  // start polyline
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAsBtCE0ew6X6KsEbC90as-oqjz0h8L-mE";
  //end polyline

/* لو عاوزين نحط صورة الشخص الي رايحله*/
  setMakerCustomIcon()async{
    /*متنساش تشغلها في ال init*/
    /*خد بالك ال visiple false*/
      myMarker!.add(Marker(
        visible: false,
          onTap: (){},
          markerId: MarkerId('your app'),
          position: LatLng(29.9996792,31.1856295),
          icon:await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, ''),
          infoWindow: InfoWindow(title: 'هتروح لدا',
              onTap: (){})),);
  }
/* لو عاوزين نحط صورة الشخص الي رايحله*/

  Set<Marker>? myMarker ;
  late GoogleMapController gmc ;
  Future getPer()async{
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    per = await Geolocator.checkPermission();
    if(per == LocationPermission.denied){
      per = await Geolocator.requestPermission();
      if(per == LocationPermission.denied)
        {
          Navigator.pop(context);
        }
    }
  }

  Future<void> getLatAndLong()async{
      print('انا هنااااااا في اول الميثوووووووود');
      c1=await Geolocator.getCurrentPosition().then((value) => value);
      print('وصلت هنااااا');
      lat=c1!.latitude;
      long=c1!.longitude;
      print('${lat}+${long}');



      myMarker={
      Marker(
        visible: true,
        draggable: true,
        onDragEnd: (LatLng t){

        },
        onTap: (){},
          markerId: MarkerId('my marker'),
          position: LatLng(lat,long),
          infoWindow: InfoWindow(title: 'دا انت',
              onTap: (){})),
        Marker(
            visible: visible,
            onTap: (){},
            markerId: MarkerId('your app'),
            position: LatLng(29.9996792,31.1856295),
            icon:await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, ''),
            infoWindow: InfoWindow(title: 'هتروح لدا',
                onTap: (){}))
      };
    _kGooglePlex= CameraPosition(
        target: LatLng(lat,long),
        zoom: 14.4746,
      );
      setState(() {

      });
  }

 @override
  void initState() {
   getPer();
   getLatAndLong();

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>MapsCubit(),
      child: BlocConsumer<MapsCubit,MapsStates>(
        listener:(context , state){

        } ,
        builder: (context , state){
          var cubit = MapsCubit.get(context);
          return ConditionalBuilder(
              condition: _kGooglePlex !=null,
              builder: (context)=>Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  leading:
                  IconButton(onPressed: (){
                    Navigator.pop(context);

                  }, icon: Icon(IconBroken.Arrow___Left_2)),
                  title: Text('Choose location'),
                ),
                body: Column(
                  children: [
                    SizedBox(
                      height: 530,
                      width: double.infinity,
                      child: GoogleMap(
                        polylines: Set<Polyline>.of(polylines.values),
                        myLocationEnabled: true,
                        tiltGesturesEnabled: true,
                        compassEnabled: true,
                        scrollGesturesEnabled: true,
                        zoomGesturesEnabled: true,
                        onTap: (latlng){
                            myMarker!.remove(Marker(markerId:MarkerId('my marker') ));
                            myMarker!.add(Marker(markerId:MarkerId('my marker'), position: latlng ));
                            lat = latlng.latitude;
                            long = latlng.longitude;
                            cubit.getAddress(lat,long);
                            print('==============> ana hena 1   ${latlng}');
                            setState(() {

                            });
                        },
                        markers: myMarker!,
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex!,
                      onMapCreated: (GoogleMapController controller) {
                            gmc = controller ;
                                       },),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Expanded(
                          child: defaultButton(
                              background: Colors.blue,
                              text: 'another location',
                              function: ()async{
                                // // anotherLat anotherLong
                                // LatLng latlng = LatLng(21.422390, 39.722958);
                                //   gmc.animateCamera(CameraUpdate.newLatLng(latlng));

                                if(lat != null && long != null) {
                                  visible = true;
                                  getPolyline();

                                }
                              },
                              width: double.infinity,
                              height: 60),

                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: defaultButton(
                              background: Colors.blue,
                              text: 'Send details',
                              function: () async{
                                if( _kGooglePlex !=null) {
                                  cubit.getAddress(lat, long);

                                }else{
                                  AwesomeDialog(
                                      context: context,
                                      title: 'Waiting please',
                                      body: const Text('Wait While information Processed')
                                  ).show();

                                }
                              },
                              width: double.infinity,
                              height: 60),
                        ),
                        SizedBox(width: 20,),
                      ],
                    )
                  ],
                ),
          ),
              fallback: (context)=>Center(child: CircularProgressIndicator())
          );
        },
      ),
    );
  }

  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      width: 10,
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
       await PointLatLng(lat, long), //start
      await  PointLatLng(anotherLat, anotherLong),//end
        travelMode: TravelMode.driving,
        );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(lat, long)); //start
        polylineCoordinates.add(LatLng(anotherLat, anotherLong)); //end
      });
    }
    addPolyLine();
  }
}


