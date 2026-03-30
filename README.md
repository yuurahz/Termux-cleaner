# ⚡ Termux Junk Cleaner (V2.5.0)

**Termux Junk Cleaner** adalah alat optimasi sistem yang ringan dan kuat, dirancang khusus untuk membersihkan sampah file, cache, dan log di lingkungan Termux Anda agar performa tetap maksimal.

---

## ✨ Fitur Utama

- 🚀 **Auto-Clean Mode (`-y`)**: Bersihkan semua sampah dalam satu kali enter.
- 🎨 **Modern UI**: Tampilan cyberpunk dengan animasi _typing effect_ dan _progress bar_.
- 🧹 **Deep Cleaning**:
    - Membersihkan Cache aplikasi & system.
    - Menghapus paket instalasi (`.deb`) yang tersisa.
    - Membersihkan paket yang tidak lagi dibutuhkan (`autoremove`).
    - Menghapus file sementara (`tmp`) dan file backup (`.bak`).
    - Membersihkan file log lama untuk menghemat ruang penyimpanan.
- 📝 **Logging System**: Semua aktivitas pembersihan dicatat secara rapi di `cleanup_log.txt`.

---

## 🚀 Instalasi

Buka Termux dan jalankan perintah berikut:

1. **Clone repository:**

    ```bash
    git clone https://github.com/yuurahz/Termux-cleaner
    ```

2. **Masuk ke direktori:**

    ```bash
    cd Termux-cleaner
    ```

3. **Berikan izin eksekusi:**

    ```bash
    chmod +x cleaner.sh
    ```

4. **Jalankan program:**
    ```bash
    ./cleaner.sh
    ```

---

## 🛠️ Penggunaan & Argumen

Anda dapat menjalankan script ini dengan berbagai mode sesuai kebutuhan:

### 1. Mode Sekali Enter (Full Auto)

Gunakan flag `-y` untuk membersihkan semua kategori sampah secara otomatis tanpa konfirmasi manual:

```bash
./cleaner.sh -y
```

### 2. Mode Interaktif

Jalankan tanpa argumen untuk memilih pembersihan secara manual:

```bash
./cleaner.sh
```

### 3. Pilihan Flag (Opsi Spesifik)

| Flag           | Deskripsi                                        |
| :------------- | :----------------------------------------------- |
| `-h`, `--help` | Menampilkan pesan bantuan                        |
| `-y`, `--yes`  | **Auto-Clean**: Bersihkan semua tanpa konfirmasi |
| `-a`           | Bersihkan semua (dengan konfirmasi)              |
| `-c`           | Bersihkan file Cache saja                        |
| `-p`           | Bersihkan paket Cache (pkg clean)                |
| `-n`           | Hapus paket yang tidak terpakai (autoremove)     |
| `-t`           | Bersihkan file Temporary                         |
| `-b`           | Bersihkan file Backup (.bak)                     |
| `-l`           | Bersihkan Log sistem                             |

**Contoh menggabungkan opsi:**

```bash
./cleaner.sh -c -p -l
```

---

## 📄 Catatan (Log)

Setiap kali Anda melakukan pembersihan, detail file yang dihapus akan dicatat di file `cleanup_log.txt`. Anda bisa mengeceknya dengan perintah:

```bash
cat cleanup_log.txt
```

---

_Gunakan alat ini secara berkala agar Termux Anda tetap responsif dan penyimpanan internal tidak cepat penuh!_

---
