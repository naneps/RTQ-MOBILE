import 'package:tahfidz/model/pelajaran.dart';

var dataKategoriPenilaian = [
  {
    'id_kategori': '1',
    'kategori': 'Tadrkbat',
  },
  {
    'id_kategori': '2',
    'kategori': 'Hafalan',
  },
  {
    'id_kategori': '3',
    'kategori': 'Imla',
  },
  {
    'id_kategori': '4',
    'kategori': 'Adab',
  },
];

List<Map<String, String>> dataPelajaran = [
  // Data Pelajran Qiroah 1
  {
    "id": "1",
    "id_jenjang": "1",
    "id_kategori": "1",
    "pelajaran": "Mengenal Huruf Hijaiyah"
  },
  {
    "id": "2",
    "id_jenjang": "1",
    "id_kategori": "1",
    "pelajaran": "Mengenal Harakat Fathah"
  },
  {
    "id": "3",
    "id_jenjang": "1",
    "id_kategori": "1",
    "pelajaran": "Mengenal Harakat Kasrah Dan Dhammah"
  },
  {
    "id": "4",
    "id_jenjang": "1",
    "id_kategori": "1",
    "pelajaran": "Menyambung Huruf-huruf Hijaiyah"
  },
  {
    "id": "5",
    "id_jenjang": "1",
    "id_kategori": "1",
    "pelajaran": "Mengenal Tanwin"
  },
  {"id": "6", "id_jenjang": "1", "id_kategori": "2", "pelajaran": "١١١ اللهب"},
  {"id": "7", "id_jenjang": "1", "id_kategori": "2", "pelajaran": "١١٣ الفلق"},
  {"id": "8", "id_jenjang": "1", "id_kategori": "2", "pelajaran": "١١٤ الناس"},

  // Data Pelajaran  Qiroah 2
  {
    "id": "9",
    "id_jenjang": "2",
    "id_kategori": "1",
    "pelajaran": "Membedakan 2 Huruf Yang sering Tertukar"
  },
  {
    "id": "10",
    "id_jenjang": "2",
    "id_kategori": "1",
    "pelajaran": "Mengenal Sukun"
  },
  {
    "id": "11",
    "id_jenjang": "2",
    "id_kategori": "1",
    "pelajaran": "Mengenal Tasydid"
  },
  {"id": "12", "id_jenjang": "2", "id_kategori": "2", "pelajaran": "١٠٦ قريش"},
  {
    "id": "13",
    "id_jenjang": "2",
    "id_kategori": "2",
    "pelajaran": "١٠٧ الماعون"
  },
  {
    "id": "14",
    "id_jenjang": "2",
    "id_kategori": "2",
    "pelajaran": "١٠٨ الكوثر"
  },
  {
    "id": "15",
    "id_jenjang": "2",
    "id_kategori": "2",
    "pelajaran": "١٠٩ الكافرون"
  },
  {"id": "16", "id_jenjang": "2", "id_kategori": "2", "pelajaran": "١١٠ النصر"},
];

List<Pelajaran> filterPelajaran(String idJenjang, String idkategori) {
  List<Pelajaran> pelajaran = [];
  for (var i = 0; i < dataPelajaran.length; i++) {
    if (dataPelajaran[i]['id_jenjang'] == idJenjang &&
        dataPelajaran[i]['id_kategori'] == idkategori) {
      pelajaran.add(Pelajaran(
          id: dataPelajaran[i]['id'],
          idJenjang: dataPelajaran[i]['id_jenjang'],
          idKategori: dataPelajaran[i]['id_kategori'],
          pelajaran: dataPelajaran[i]['pelajaran']));
    }
  }
  print(pelajaran);
  return pelajaran;
}


// var dataNilai = [
//   {
//     "id_nilai": "1",
//     "id_pelajaran": "1",
//     "nilai": "0",
//     "id_santri": "1",
//   },
//   {
//     "id_nilai": "2",
//     "id_pelajaran": "1",
//     "nilai": "0",
//     "id_santri": "1",
//   },
//   {
//     "id_nilai": "2",
//     "id_pelajaran": "1",
//     "nilai": "0",
//     "id_santri": "1",
//   },
//   {
//     "id_nilai": "1",
//     "id_pelajaran": "1",
//     "nilai": "0",
//     "id_santri": "1",
//   },
//   {
//     "id_nilai": "1",
//     "id_pelajaran": "1",
//     "nilai": "0",
//     "id_santri": "1",
//   }
// ];


