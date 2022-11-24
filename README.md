# Assignment 7 PBP: Counter_7

### Nama: Joshua Mihai Daniel Nadeak.
### NPM: 2106635285.
### Kelas: PBP-E.

## Stateless Widget dan Stateful Widget, serta Perbedaan dari Keduanya
Sebelum bisa mengetahui perbedaan antara keduanya, tentunya perlu dianalisis terlebih dahulu definisi dari **_State_**, **_Stateless Widget_**, dan **_Stateful Widget_**.
1. **_State_** adalah berbagai informasi yang bisa dibaca secara sinkronus ketika _widget_ dibangun dan mungkin berubah selama masa hidup _widget_-nya.
2. **_Stateless Widget_** adalah sebuah _widget_ yang state-nya tidak bisa diganggu gugat setelah dibangun. _Widget_ ini immutable ketika mereka dibangun dalam kata lain perubahan apapun pada variabel, icon, tombol, atau pengambilan data tidak akan mengubah state app-nya. Contoh sederhananya adalah `Text`.
3. **_Stateful Widget_** adalah sebuah _widget_ yang state-nya bisa diubah setelah dibangun. State dari _widget_ ini mutable dan bisa diubah berkali-kali dalam waktu hidupnya. Artinya state dari aplikasi bisa berubah berkali-kali dengan sekumpulan variabel, input, dan data yang berbeda. Contoh sederhananya adalah `Form` dan `TextField`. <br />
Sumber: [GeeksforGeeks](https://www.geeksforgeeks.org/flutter-stateful-vs-stateless-widgets/)

Perbedaan antara **_Stateless Widget_** dan **_Stateful Widget_** antara lain sebagai berikut:
**_Stateless Widget_**
1.  _Widgetnya Static_
2. Hal ini tidak bergantung pada perubahan data atau perubahan _behavior_ apapun
3. Tidak memiliki state, akan di _render_ sekali dan tidak akan di-_update_ sendiri, tetapi hanya akan diperbarui saat data eksternalnya berubah <br />
Contohnya: `Text`. 

**_Stateful Widget_**
1. _Widgetnya Dynamic_
2. Dilakukan _update_ selama _runtime_ berdasarkan _action_ atau perubahan data yang dilakukan oleh _user_
3. Memiliki _internal state_ dan dapat dilakukan _re-render_ jika input data nya berubah atau saat _state_ dari _widget_ berubah <br />
Contohnya: `Form` dan `TextField`.

## Widget Apa Saja yang Dipakai pada Proyek Kali Ini Beserta Fungsinya
1. `MaterialApp`: Widget untuk membuat aplikasi material
2. `Scaffold`: Widget untuk mengimplementasikan layout Material Design
3. `AppBar`: Widget untuk bar yang ada di atas layar
4. `Center`: Widget untuk meletakkan child widget di tengah-tengah parent
5. `Column`: Widget untuk menaruh widget children di suatu kolom (dari atas ke bawah)
6. `Text`: Widget untuk menaruh teks
7. `Padding`: Widget untuk memberi spasi di sekitar child widget
8. `FloatingActionButton`: Widget untuk menampilkan button lingkaran yang melayang
9. `Stack`: Widget untuk membuat lapisan widget dengan meletakkannya di atas satu sama lain
10. `Align`: Widget untuk melakukan _align_/mengatur 'letak' _child_-nya di dalam dirinya sendiri dan mengukur dirinya sendiri berdasarkan ukurang _child_-nya

## Fungsi dari `setState()` dan Variabel yang Terdampak
Fungsi `setState()` akan mengubah data yang ada pada program dan efeknya akan terlihat pada layar. Misalnya ketika user memencet tombol increment, maka variabel _counter akan bertambah dan layar akan menunjukkan nilai _counter yang telah ditambah dengan 1. Fungsi ini dapat meningkatkan elemen dinamis aplikasi, sehingga lebih interaktif dengan user.

## Perbedaan antara `const` dengan `final`
Secara definisi:
1. `final` secara sederhana berarti single-assignment.
Dengan begitu, sebuah variabel atau field `final` harus memiliki inisiasi. Setelah diberikan nilai, sebuah variabel `final` tidak bisa diubah nilainya. `Final` memodifikasi variabel.

2. Dalam Dart, `const` memiliki definisi yang lebih spesifik dan mendalam. `const` memodifikasi nilai. `Const` bisa digunakan ketika membuat sebuah _collections_, seperti `const [13,69,420]`, dan ketika membuat sebuah objek (di luar `new`), misal `const Point(1,2)`. Di sini, `const` berarti seluruh _deep state_ dari objek bisa ditentukan seluruhnya pada _compile time_ dan objek itu bisa dibekukan serta seluruhnya _immutable_

Dalam penggunaan, kedua hal ini cukup sama, yakni bahwa kedua hal ini merupakan variabel yang tidak dapat dirubah (_immutable_). Namun, `const` memiliki perbedaan karena bersifat _immutable_ sejak _compile-time_, sehingga objek yang merupakan `const` adalah _deeply immutable_, di mana setiap atribut tidak dapat diganti sama sekali.

## Cara Implementasi yang Dilakukan
### Membuat app Flutter bernama counter_7
Tentunya, harus diawali dahulu dengan melakukan `flutter create counter_7` pada bash folder yang dituju untuk memulai proyek ini.
### Membuat fungsi `_decrementCounter()` untuk mengurangi counter.
Berikut ini implementasinya:
```
void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _setJenisBilangan();
      }
      else if (_counter == 0) {
        _counter = 0;
        _setJenisBilangan();
      }
    });
}
```
### Membuat fungsi `_setJenisBilangan()` untuk menghandle ganjil dan genap.
Berikut ini implementasinya:
```
void _setJenisBilangan() {
    setState(() {
        if (_counter % 2 != 0) {
        _jenisbilangan = 'GANJIL';
        }
        else {
        _jenisbilangan = 'GENAP';
        }
    });
}
```
### Melakukan Handle Untuk Display Tulisan GANJIL GENAP dan angka counter
Berikut ini implementasinya:
```
children: <Widget>[
            if (_counter % 2 != 0) 
              Text(
                _jenisbilangan,
                style: TextStyle(color: Colors.blue)
              )
            else
              Text(
                _jenisbilangan,
                style: TextStyle(color: Colors.red)
              ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
        ],
```

### Membuat child: Stack dan menambah button dengan Align
Berikut ini implementasinya:
```
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                if (_counter > 0)
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                    ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ))
```

### Melakukan Push Ke Repo
Gunakan perintah `git add .`, `git commit -m "Comment"`, dan `git push`

---
---

# Assignment 8 PBP: Flutter Form

### Nama: Joshua Mihai Daniel Nadeak.
### NPM: 2106635285.
### Kelas: PBP-E.

## Perbedaan Navigator.push dan Navigator.pushReplacement
Pada dasarnya, `Navigator.pushReplacement` melakukan pergantian halaman dengan cara melakukan pop terlebih dahulu halaman yang ada saat ini dari stack, kemudian melakukan push terhadap halaman yang dituju (seperti mengganti elemen teratas pada stack dengan halaman baru).
Sementara itu, `Navigator.push` langsung melakukan push terhadap stack halaman tanpa melakukan pop sehingga halaman sebelumnya masih tetap ada dalam stack.

Jadi, sesungguhnya `Navigator.push` dan `Navigator.pushReplacement` sama-sama menambahkan rute ke Navigator. Yang menjadi pembeda adalah `Navigator.push` rute yang ada di bawahnya akan tetap tersimpan di dalam Stack, sedangkan `Navigator.pushReplacement` akan membuang rute yang sebelumnya ditimpa.

## Widget Yang Dipergunakan Di Proyek Kali Ini
1. `Form` : untuk menghimpun elemen-elemen pada halaman input budget.
2. `TextFormField` : untuk menampilkan textbox untuk menginput judul dan nominal budget.
3. `DropdownButtonFormField` : untuk menampilkan menu dropdown berisi tipe budget.
4. `Drawer` : sebagai bagian untuk navigasi antar halaman layaknya Navbar di Django, terdapat di bagian atas aplikasi (bisa di bawah, kiri, atau kanan juga tergantung pemosisiannya).
5. `Padding` : Memberikan padding kepada widget child-nya.
6. `TextButton` : untuk menambahkan tombol submisi budget
7. `Card` : untuk menampilkan informasi mengenai suatu budget dalam bentuk kotak kartu.
8. `InputDecoration` : untuk mengkustomisasi tampilan dari TextFormField, seperti menambahkan teks bantuan, label, ikon, serta border.

## Jenis-jenis _Event_ Pada Flutter
1.  `onTapDown`
2.  `onTapUp`
3.  `onTapCancel` 
4.  `onScaleStart `
5.  `onScaleUpdate `
6.  `onScaleEnd`
7.  `onPressed `
8.  `onTap`
9.  `onChanged `
10. `onSubmitted `
11. `onLongPress `
12. `onDoubleTap `
13. `onVerticalDragStart`
14. `onVerticalDragUpdate` 
15. `onVerticalDragEnd`
16. `onPanStart`
17. `onSemanticsTap `
18. `onSemanticsLongPress` 
19. `onSemanticsScrollLeft` 
20. `onDismissed`
21. `onResize`
22. `onReorder `
23. `onRefresh `
24. `onLoading `
25. `onError`
26. `onEditingComplete`

## Cara Kerja Navigator Dalam "Mengganti" Halaman Pada Flutter
Pada dasarnya, perlu diketahui bahwa `Navigator` bekerja sebagai manager untuk setiap _child_ yang ada layaknya Stack. Tujuan dari hal ini adalah nantinya `Navigator` akan menjadi urutan logika dalam menampilkan halaman pada aplikasi. Yang disimpan pada `Navigator` adalah rute-rute pada _app_. Untuk berpindah dari satu halaman ke halaman lain, terdapat method `push` dan `pop`. `push` adalah untuk menambahkan rute baru pada Navigator serta pindah ke rute tersebut sedangkan `pop` adalah untuk melepas rute yang ada di paling atas `Navigator` dan kembali ke rute sebelumnya.

## Cara Implementasi Yang Dilakukan
### Credits To Rendy For The Ideas (Thanks!)

### Membuat `model.dart`
Pertama-tama, akan dibuat kelas baru yang akan dinamakan `Budget`, di mana atributnya adalah _title, type, nominal_ dan nantinya ada `BudgetModel` yang mengambil dari `ChangeNotifier` untuk melakukan manage stage dari `Budget` bila akan ada penambahan data baru pada list yang dibuat.

### Membuat `form.dart`
Pada bagiamn ini, akan dibuat suatu kelas baru bernama `FormBudget` yang nantinya akan dipergunakan di `Drawer` dan `_FormBudgetState` untuk mengatur bagaimana nantinya widget `FormBudget` dibuat. Lalu akan ditambahkan `Form` dan elemen-elemen yang terkait sesuai gambaran soal, di mana saya menambahkan `textbox`, `button`, dan juga `dropdown menu`.

### Membuat `list.dart`
Awalnya akan dibuat kelas baru bernama `ListBudget` sehingga nantinya akan dapat dipanggil `Drawer` serta `_ListBudgetState`, yang nantinya ini akan mengatur apa yang akan terjadi ketika ditampilkan elemen pada List yang berisi data dari budget. Nantinya representasinya akan divisualisasikan berbentuk `Card`.

### Membuat `drawer.dart`
Pertama-tama akan dibuat terlebih dahulu kelas `LabDrawer` dan nantinya pun `_LabDrawerState`. Ini nantinya akan mengatur bagaimana yang terjadi ketika widget `LabDrawer` dibuat. Dalam implementasi saya, diutilisasikan `ListTile` yang akan memuat nama-nama rute untuk melakukan perpindahan antar _page_ dan nantinya akan ditambahkan event listener `onTap`, sehingga ketika diklik akan pindah _page_.

### Melakukan Push Ke Repo
Gunakan perintah `git add .`, `git commit -m "Comment"`, dan `git push`

---
---

# Assignment 9 PBP: Integrasi Web Service pada Flutter

### Nama: Joshua Mihai Daniel Nadeak.
### NPM: 2106635285.
### Kelas: PBP-E.

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Secara sederhana, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Namun, tentunya terdapat kekurangan dari pelaksanaan metode ini, yakni bahwa ini bukanlah _best practice_ yang seharusnya diterapkan dan akan lebih buruk bentuknya dari ketika dibuat model terlebih dahulu, dengan kata lain tentunya penyimpanan data yang di-_fetch_ akan lebih berantakan. Jika kita membuat model terlebih dahulu, penyimpanan data akan lebih terstruktur sehingga pengambilan data yang sudah disimpan akan lebih mudah. Sehingga, jika model dibuat terlebih dulu akan mempermudah dalam penyimpanan dan pengaksesan data.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. `LabDrawer` : untuk berfungsi sebagai bagian dalam navigasi antar halaman layaknya `Navbar` di Django, terdapat pada bagian atas aplikasi (bisa di bawah, kiri, atau kanan juga tergantung pemosisiannya, cuma dalam kasus ini di bagian atas). Ini merupakan kustomisasi Drawer buatan sendiri.
2. `DateFormat`: untuk melakukan format data tanggal agar ditampilkan dengan standar penulisan tanggal yang sesuai (pada kasus ini digunakan sistem penanggalan yMMMMd).
3. `ListView` : telah dikerjakan dengan method `builder()`, di mana ini berfungsi untuk membuat _cards_ pada layar sesuai dengan banyak data yang di-_fetch_ sebelumnya.
4. `FutureBuilder`: untuk berperan sebagai widget yang dapat membangun dirinya sendiri sesuai dengan status pada _future_ sebagai wujud komputasi asinkronus
5. `ElevatedButton`: untuk menampilkan button untuk kembali ke mywatchlistpage setelah masuk ke bagian mywatchlistdetails.
6. `InputDecoration`  : untuk mengkustomisasi tampilan dari `TextFormField`, seperti menambahkan teks bantuan, label, ikon, serta border.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. Menambahkan dependency `http` ke proyek
2. Membuat model sesuai dengan respons dari data yang berasal dari _web service_ yang digunakan (Opsional tapi direkomendasikan).
3. Membuat `http` request ke web service menggunakan dependency `http`
4. Decode data yang sudah diambil dan jadikan ke bentuk JSON
5. Data dalam bentuk JSON ini ubah ke dalam bentuk model yang sudah dibuat di langkah 2
6. Menampilkan data yang telah dikonversi ke aplikasi dengan `FutureBuilder` atau cara lainnya yang Anda inginkan

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
### Menambahkan _dependendy_ `http` untuk nantinya melakukan fetch data dan `intl` untuk melakukan sistem penganggalan
```
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
```

### Membuat Folder dan Menyortir Untuk Mengatur Masing-masing Fungsi
Dibuat 3 folder, yakni `page`, `model`, juga `data` dan nantinya `main.dart` ada di dalam folder `lib`. Lalu, file `list.dart`, `form.dart`, `drawer.dart` dimasukkan ke folder `page`, `model.dart` dimasukkan ke folder `model`. Setelah itu nantinya akan dibentuk beberapa file untuk pengerjaan tugas ini, yakni `data.dart` yang dimasukkan ke folder `data`, `mywatchlistmodel.dart` yang dimasukkan ke folder `model`, `mywatchlistpage.dart` yang dimasukkan ke folder `page`, dan `mywatchlistdetails.dart` yang dimasukkan ke folder `page`.

### Mengerjakan bagian `mywatchlistmodel.dart`
Nantinya ini akan dibentuk beberapa field yang akan disesuaikan dengan apa yang telah dikerjakan di lab 3 PBP menggunakan Django sebelumnya. berikut ini implementasinya:
```
import 'dart:convert';

List<MyWatchlist> myWatchlistFromJson(String str) => List<MyWatchlist>.from(json.decode(str).map((x) => MyWatchlist.fromJson(x)));

String myWatchlistToJson(List<MyWatchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchlist {
    MyWatchlist({
        required this.pk,
        required this.fields,
    });

    int pk;
    Fields fields;

    factory MyWatchlist.fromJson(Map<String, dynamic> json) => MyWatchlist(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.watched,
        required this.title,
        required this.rating,
        required this.releaseDate,
        required this.review,
    });

    bool watched;
    String title;
    int rating;
    DateTime releaseDate;
    String review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watched: json["watched"],
        title: json["title"],
        rating: json["rating"],
        releaseDate: DateTime.parse(json["release_date"]),
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "watched": watched,
        "title": title,
        "rating": rating,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "review": review,
    };
}
```

### Mengerjakan bagian `mywatchlistpage.dart`
Pada bagian ini, `mywatchlistpage.dart` digunakan untuk menampilkan setiap identitas film yang di-_fetch_ sebelumnya. Data-datanya akan ditampilkan dalam bentuk tumpukan _cards_ yang dapat di-_scroll_ dan dapat ditekan untuk mengakses halaman detail yaitu `mywatchlistdetails.dart`. Kemudian tampilan dan rutenya akan diatur juga. Berikut sedikit bagian dari implementasi kodenya:
```
import 'package:flutter/material.dart';
import 'package:counter_7/page/mywatchlistdetails.dart';
import 'package:counter_7/data/data.dart';
import 'package:counter_7/page/drawer.dart';

class MyWatchlistPage extends StatefulWidget {
    const MyWatchlistPage({Key? key}) : super(key: key);

    @override
    _MyWatchlistPageState createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
    appBar: AppBar(
        title: const Text('My Watch List'),
    ),
    drawer: const LabDrawer(),
    body: FutureBuilder(
...
...
```

### Mengerjakan bagian `mywatchlistdetails.dart`
Pada bagian ini, `mywatchlistdetails.dart` berfungsi untuk menampilkan setiap detail dari objek `MyWatchlist` yaitu setiap atribut yang dimilikinya. Dapat diakses dengan menekan salah satu _card_ pada halaman `mywatchlistpage.dart`. Nantinya akan diatur juga tampilan dan rutenya. Berikut sedikit bagian dari implementasinya:
```
import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlistmodel.dart';
import 'package:counter_7/page/mywatchlistpage.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:intl/intl.dart';


class MyWatchlistPageDetails extends StatefulWidget {
  MyWatchlistPageDetails({Key? key, required this.movie})
      : super(key: key);

  MyWatchlist movie;

  @override
  State<MyWatchlistPageDetails> createState() =>
      _MyWatchlistPageDetailsState(movie);
}

class _MyWatchlistPageDetailsState extends State<MyWatchlistPageDetails> {
  MyWatchlist movie;
  _MyWatchlistPageDetailsState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail WatchList'),
        ),
        drawer: const LabDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movie.fields.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
...
...
```

### Mengerjakan bagian `data.dart`
Pada bagian ini akan di-_fetch_ data JSON dari tugas 3 PBP mengenai mywatchlist yang telah dikerjakan sebelumnya, sehingga nantinya dapat dipergunakan untuk bagian page mywatchlist di Flutternya.


### Membuat button `back`
Ini dilakukan menggunakan `ElevatedButton` di halaman `mywatchlistdetails.dart` agar _user_ dapat kembali ke halaman sebelumnya.

### Melakukan _refactoring files_ dari tugas 6 dan 7 sebelumnya

### Melakukan Push Ke Repo
Gunakan perintah `git add .`, `git commit -m "Comment"`, dan `git push`