import 'package:flutter/material.dart';

class Aula09Imagens extends StatelessWidget {
  const Aula09Imagens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📖 Aula 09: Imagens no Flutter')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🔹 Imagem local com Image.asset:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.shade200,
              child: Image.asset(
                'images/gremio.jpg', // lembre-se de adicionar ao pubspec.yaml
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              '🔸 Imagem da internet com Image.network:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.shade200,
              child: Image.network(
                'https://picsum.photos/id/1025/300/200',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              '🔹 BoxFit: contain, cover, fill, none, scaleDown:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Image.network(
                    'https://picsum.photos/id/237/200/200',
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Image.network(
                    'https://picsum.photos/id/237/200/200',
                    fit: BoxFit.contain,
                    height: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              '🔸 Bordas arredondadas com ClipRRect:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/250?image=9',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              '🔹 Imagem com carregamento suave (FadeInImage):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif', // imagem de loading
              image: 'https://picsum.photos/300/200',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
