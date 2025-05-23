import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp_mobile/bloc/camera_bloc.dart';
import 'package:plantapp_mobile/bloc/camera_event.dart';
import 'package:plantapp_mobile/bloc/camera_state.dart';
import 'package:plantapp_mobile/components/my_bottom_nav_bar.dart';
import 'package:plantapp_mobile/constrants.dart';
import 'package:plantapp_mobile/screens/home/home_screen.dart';

class PicturePage extends StatelessWidget {
  const PicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: BlocConsumer<CameraBloc, CameraState>(
          listener: (context, state) {
            if (state is CameraReady && state.snackbarMessage != null) {
              final messenger = ScaffoldMessenger.of(context);
              messenger.hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.snackbarMessage!),
                  backgroundColor: kPrimaryColor,),
              );
              context.read<CameraBloc>().add(ClearSnackbar());
            }
          },
          builder: (context, state) {
            final File? imageFile = state is CameraReady ? state.imageFile : null;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: imageFile != null
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              imageFile,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Gambar disimpan di:\n${imageFile.path}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.white,),
                            label: const Text('Hapus Gambar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 198, 29, 29),
                              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            onPressed: () =>
                                context.read<CameraBloc>().add(DeleteImage()),
                          )
                        ],
                      )
                    : const Text(
                        'Belum ada gambar yang diambil/dipilih',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'cameraBtn',
              onPressed: () {
                final bloc = context.read<CameraBloc>();
                if (bloc.state is! CameraReady) {
                  bloc.add(InitializeCamera());
                }
                bloc.add(OpenCameraAndCapture(context));
              },
              tooltip: 'Ambil Foto',
              backgroundColor: kPrimaryColor, 
              foregroundColor: Colors.white, 
              child: const Icon(Icons.camera_alt),
            ),
            const SizedBox(height: 12),
            FloatingActionButton(
              heroTag: 'galleryBtn',
              onPressed: () {
                context.read<CameraBloc>().add(PickImageFromGallery());
              },
              tooltip: 'Pilih dari Galeri',
              backgroundColor: kPrimaryColor, 
              foregroundColor: Colors.white, 
              child: const Icon(Icons.photo_library),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}