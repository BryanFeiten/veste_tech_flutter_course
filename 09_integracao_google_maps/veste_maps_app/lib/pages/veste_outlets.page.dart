import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:veste_maps_app/stores/geolocator.store.dart';
import 'package:veste_maps_app/stores/map.store.dart';
import 'package:veste_maps_app/stores/outlets.store.dart';
import 'package:veste_maps_app/widgets/loading_state.widget.dart';

class VesteOutletsPage extends StatefulWidget {
  const VesteOutletsPage({super.key});

  @override
  State<VesteOutletsPage> createState() => _VesteOutletsPageState();
}

class _VesteOutletsPageState extends State<VesteOutletsPage> {
  final store = MapStore(
    outletStore: OutletsStore(GetIt.I()),
    geolocatorStore: GeolocatorStore(),
  );

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();

    // Adicionar as permissões no Manifest e Info.plist antes de solicitar aqui
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   store.geolocatorStore.getUserPosition(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              Observer(
                builder: (_) {
                  return GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      if (!store.isLoadingMap) return;

                      Future.delayed(
                        Duration(seconds: 1),
                      ).then((_) => store.fillState(controller));
                    },
                    markers: store.markers ?? {},
                  );
                },
              ),
              if (store.isLoadingMap) const LoadingStateLayerWidget(),
            ],
          );
        },
      ),
    );
  }
}

class ContentModal extends StatelessWidget {
  const ContentModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24, vertical: 12),
      child: Column(children: [Text('Teste')]),
    );
  }
}
