export default function generateUniqueId() {
    // Ambil timestamp saat ini
    var timestamp = Date.now();

    // Buat bagian unik menggunakan Math.random
    var uniquePart = Math.random().toString(36).substr(2, 9);

    // Gabungkan timestamp dan bagian unik
    var uniqueId = timestamp + uniquePart;

    return uniqueId;
}