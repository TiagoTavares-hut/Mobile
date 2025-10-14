import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: ImageGalleryScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// Modelo de imagem com informações extras
class PickedImage {
  final File file;
  final DateTime date;
  final String location;

  PickedImage({
    required this.file,
    required this.date,
    required this.location,
  });
}

class ImageGalleryScreen extends StatefulWidget {
  const ImageGalleryScreen({super.key});

  @override
  State<ImageGalleryScreen> createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<PickedImage> _images = [];

  // Pega a localização atual
  Future<String> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço está ativo
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return "Localização desativada";

    // Verifica permissão
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return "Permissão negada";
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return "Permissão negada permanentemente";
    }

    Position pos = await Geolocator.getCurrentPosition();
    return "Lat: ${pos.latitude.toStringAsFixed(4)}, Long: ${pos.longitude.toStringAsFixed(4)}";
  }

  // Selecionar imagem (da câmera ou galeria)
  Future<void> _addImage(ImageSource source) async {
    final XFile? foto = await _picker.pickImage(source: source);

    if (foto != null) {
      final location = await _getLocation();
      final image = PickedImage(
        file: File(foto.path),
        date: DateTime.now(),
        location: location,
      );

      setState(() {
        _images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Galeria de Imagens"),
        centerTitle: true,
      ),
      floatingActionButton: PopupMenuButton<String>(
        icon: Icon(Icons.add_a_photo, size: 32),
        onSelected: (value) {
          if (value == 'camera') {
            _addImage(ImageSource.camera);
          } else {
            _addImage(ImageSource.gallery);
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'camera',
            child: Row(
              children: [
                Icon(Icons.camera_alt, color: Colors.blue),
                SizedBox(width: 10),
                Text("Tirar Foto"),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'gallery',
            child: Row(
              children: [
                Icon(Icons.photo_library, color: Colors.green),
                SizedBox(width: 10),
                Text("Escolher da Galeria"),
              ],
            ),
          ),
        ],
      ),
      body: _images.isEmpty
          ? Center(child: Text("Nenhuma imagem adicionada ainda"))
          : GridView.builder(
              padding: EdgeInsets.all(8),
              itemCount: _images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemBuilder: (context, index) {
                final img = _images[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ImageDetailScreen(image: img),
                      ),
                    );
                  },
                  child: Hero(
                    tag: img.file.path,
                    child: Image.file(
                      img.file,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// Tela de detalhes da imagem
class ImageDetailScreen extends StatelessWidget {
  final PickedImage image;

  const ImageDetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(image.date);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da Imagem"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: image.file.path,
              child: Image.file(
                image.file,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("📅 Data: $formattedDate", style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text("📍 Local: ${image.location}", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
