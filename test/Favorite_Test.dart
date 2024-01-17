import 'package:aaaaaaa/provider/komikprovider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aaaaaaa/model/komikmodel.dart'; // Sesuaikan dengan path ke file komik_model.dart

void main() {
  test('Test initial value content', () {
    final komik = KomikModel(
      judul: "Naruto",
      url:
          "https://th.bing.com/th/id/R.ae4787f8dd5e3e02efcd29b27d170cac?rik=NdF7lHerzPNMMA&riu=http%3a%2f%2fwallpapercave.com%2fwp%2fwc1705192.jpg&ehk=6WMh5%2fmZNizgDg7XG8qON%2bH9YJURJ6sA5G08r5docfk%3d&risl=&pid=ImgRaw&r=0",
      eps: [
        {
          "id": "1",
          "title": "Fighting",
        },
        {"id": "2", "title": "Istirahat"}
      ],
    );
    expect(komik.judul, isNotEmpty);
    expect(komik.url, isNotEmpty);
    expect(komik.eps, isNotEmpty);
  });

  test('Test initial value of content - Empty', () {
    final komik = KomikModel(judul: '', url: '', eps: []);

    expect(komik.judul, isEmpty);
    expect(komik.url, isEmpty);
    expect(komik.eps, isEmpty);
  });

  test('Toggle favorite status should change isFavorite', () {
    final komik = KomikModel(
      judul: "Sample Judul",
      url: "https://sample.url",
      eps: [],
      isFavorite: false,
    );
    final provider = KomikProvider(listModel: [komik]);

    // Panggil metode toggleFavoriteStatus untuk mengubah status isFavorite
    provider.toggleFavoriteStatus(komik);

    // Periksa apakah isFavorite telah berubah menjadi true setelah pemanggilan metode
    expect(komik.isFavorite, isTrue);

    // Panggil metode toggleFavoriteStatus lagi untuk mengubahnya kembali
    provider.toggleFavoriteStatus(komik);

    // Periksa apakah isFavorite telah berubah menjadi false setelah pemanggilan metode
    expect(komik.isFavorite, isFalse);
  });
}
