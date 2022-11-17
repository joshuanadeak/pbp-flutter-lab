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