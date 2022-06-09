import 'dart:convert';
import 'dart:io';

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

var dataNilai = [
  // Ilham

  // {
  //   "id": "1",
  //   "id_pelajaran": "1",
  //   "nis_santri": "29092002",
  //   "nilai": 100,
  // },
  // {
  //   "id": "2",
  //   "id_pelajaran": "2",
  //   "nis_santri": "29092002",
  //   "nilai": 100,
  // },
  // {
  //   "id": "3",
  //   "id_pelajaran": "3",
  //   "nis_santri": "29092002",
  //   "nilai": 100,
  // },
  // {
  //   "id": "4",
  //   "id_pelajaran": "4",
  //   "nis_santri": "29092002",
  //   "nilai": 0,
  // },
  // {
  //   "id": "5",
  //   "id_pelajaran": "5",
  //   "nis_santri": "29092002",
  //   "nilai": 0,
  // },
  // {
  //   "id": "6",
  //   "id_pelajaran": "6",
  //   "nis_santri": "29092002",
  //   "nilai": 0,
  // },
  // {
  //   "id": "7",
  //   "id_pelajaran": "7",
  //   "nis_santri": "29092002",
  //   "nilai": 0,
  // },
  // {
  //   "id": "8",
  //   "id_pelajaran": "8",
  //   "nis_santri": "29092002",
  //   "nilai": 0,
  // },
  // {
  //   "id": "9",
  //   "id_pelajaran": "9",
  //   "nis_santri": "29092002",
  //   "nilai": 0,
  // },
  // {
  //   "id": "10",
  //   "id_pelajaran": "10",
  //   "nis_santri": "29092002",
  //   "nilai": 0,
  // },
  // {
  //   "id": "11",
  //   "id_pelajaran": "11",
  //   "nis_santri": "29092002",
  //   "nilai": 0,
  // },

  // Budi
  {
    "id": "12",
    "id_pelajaran": "1",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "14",
    "id_pelajaran": "2",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "15",
    "id_pelajaran": "3",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "16",
    "id_pelajaran": "4",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "17",
    "id_pelajaran": "5",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "18",
    "id_pelajaran": "6",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "19",
    "id_pelajaran": "6",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "20",
    "id_pelajaran": "7",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "21",
    "id_pelajaran": "8",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "22",
    "id_pelajaran": "9",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "23",
    "id_pelajaran": "10",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "24",
    "id_pelajaran": "11",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "25",
    "id_pelajaran": "12",
    "nis_santri": "29092003",
    "nilai": 0,
  },
  {
    "id": "26",
    "id_pelajaran": "17",
    "nis_santri": "29092003",
    "nilai": 0,
  },
];

filterNilai(String idPelajaran, String nis) {
  List<Map> list = [];
  for (int i = 0; i < dataNilai.length; i++) {
    if (dataNilai[i]['id_pelajaran'] == idPelajaran &&
        dataNilai[i]['nis_santri'] == nis) {
      list.add(dataNilai[i]);
    }
  }
  return list;
}

// List<Pelajaran> filterPelajaran(String idJenjang, String idkategori) {
//   List<Pelajaran> pelajaran = [];
//   for (var i = 0; i < dataPelajaran.length; i++) {
//     if (dataPelajaran[i]['id_jenjang'] == idJenjang &&
//         dataPelajaran[i]['id_kategori'] == idkategori) {
//       pelajaran.add(Pelajaran(
//           id: dataPelajaran[i]['id'],
//           idJenjang: dataPelajaran[i]['id_jenjang'],
//           idKategori: dataPelajaran[i]['id_kategori'],
//           pelajaran: dataPelajaran[i]['pelajaran']));
//     } else if (dataPelajaran[i]['id_jenjang'] != idJenjang &&
//         dataPelajaran[i]['id_kategori'] != idkategori) {
//       print("Data Tidak Ada");
//     }
//   }
//   print(pelajaran);
//   return pelajaran;
// }

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

List<Map<String, dynamic>> dataAbensi = [];

Future<bool> sendAbsen(DateTime tanggal, File gambar, String alamat) async {
  print("Absen dikirim");
  dataAbensi.add({
    'tanggal': tanggal.day.toString() +
        '-' +
        tanggal.month.toString() +
        '-' +
        tanggal.year.toString(),
    'gambar': gambar,
    'alamat': alamat,
  });
  return true;
}

Future<List<Map<String, dynamic>>> getAbensi() async {
  print("Absen diterima");
  return dataAbensi;
}

Future<bool> isAbsen() async {
  return true;
}

Future<bool> isNotAbsen() async {
  return false;
}

Future<void> chekcAbsen() async {
  if (await isAbsen()) {
    print("Absen diterima");
  } else {
    print("Absen ditolak");
  }

  Future<bool?> checkAbsenToday(DateTime date) async {
    date = DateTime.now();
    for (var tanggal in dataAbensi) {
      if (tanggal['tanggal'] == date.toString()) {
        print("hari ini Sudah Absen ");
        return await isAbsen();
      } else {
        print("Absen hari ini");
        return await isNotAbsen();
      }
    }
  }
}

List<Map<String, dynamic>> datahakAkses = [
  {
    "id": '3',
    "hakAkses": 'Asatidz',
    "gambar": 'assets/images/',
  },
  {
    "id": '4',
    "hakAkses": 'Wali Santri',
    "gambar": 'assets/images/ ',
  },
];

List<Map<String, dynamic>> dataKeteranganAbsen = [
  {
    "id": '1',
    "keterangan": 'Sakit',
    "gambar": 'assets/images/',
  },
  {
    "id": '2',
    "keterangan": 'Izin',
    "gambar": 'assets/images/',
  },
  {
    "id": '3',
    "keterangan": 'Alpha',
    "gambar": 'assets/images/',
  },
  {
    "id": '4',
    "keterangan": 'Hadir',
    "gambar": 'assets/images/',
  },
];

List<Map<String, dynamic>> dataAbsenAantri = [
  {
    "id": '1',
    "nis": '29092003',
    "nama": 'Rizki',
    "kelas": 'XI RPL 1',
    "tanggal": '12-12-2020',
    "keterangan": 'Hadir',
  },
];

// create fomat numver
String formatRupiah(int number) {
  return 'Rp. ' +
      number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
}

// creat function formatTanggal untuk mengubah tanggal ke format yang bisa dibaca
String formatTanggal(DateTime tanggal) {
  return tanggal.day.toString() +
      '-' +
      tanggal.month.toString() +
      '-' +
      tanggal.year.toString();
}

// format tanggal and time id
String formatTanggalTimeId(DateTime tanggal) {
  return tanggal.day.toString() +
      '-' +
      tanggal.month.toString() +
      '-' +
      tanggal.year.toString() +
      '-' +
      tanggal.hour.toString() +
      '-' +
      tanggal.minute.toString() +
      '-' +
      tanggal.second.toString();
}

//  time indonesia
String formatTimeIndonesia(DateTime tanggal) {
  return tanggal.hour.toString() + ':' + tanggal.minute.toString() + ':';
}
