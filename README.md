# 🧙‍♂️ Lord of the Rings Quiz App

**Yüzüklerin Efendisi** evreninden karakterler hakkında bilgi yarışması uygulaması. Flutter ile geliştirilmiş interaktif quiz oyunu.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![LOTR](https://img.shields.io/badge/Theme-LOTR-8B4513?style=for-the-badge)

## 📱 Uygulama Özellikleri

### 🎮 **Quiz Sistemi**
- **Kategori Bazlı Sorular**: 6 farklı karakter kategorisi
- **Türkçe İçerik**: Tamamen Türkçe sorular ve açıklamalar
- **Etkileşimli Arayüz**: Modern ve kullanıcı dostu tasarım
- **Gerçek Zamanlı Puanlama**: Anlık puan hesaplama

### 🎭 **Karakter Kategorileri**
- 🧝‍♂️ **Elfler** (Legolas, Elrond, Galadriel...)
- 🍻 **Hobbitler** (Frodo, Sam, Merry, Pippin...)
- ⛏️ **Cüceler** (Gimli, Thorin, Balin...)
- ⚔️ **İnsanlar** (Aragorn, Boromir, Faramir...)
- 🧙‍♂️ **Büyücüler** (Gandalf, Saruman, Radagast...)
- 👹 **Kara Güçler** (Sauron, Nazgûl...)

### 🎵 **Ses ve Müzik**
- **Karakter Sesleri**: Her karakter için özel ses efektleri
- **Arka Plan Müziği**: Kategori bazlı tema müzikleri
- **Ses Kontrolü**: Açma/kapama ve seviye ayarları

### 🎨 **Görsel Özellikler**
- **Zengin Görsel İçerik**: Yüksek kaliteli karakter görselleri
- **Tema Sistemi**: Kategori bazlı renk paleteri
- **Responsive Tasarım**: Farklı ekran boyutları için uyumlu
- **Smooth Animasyonlar**: Akıcı sayfa geçişleri

## 🏗️ **Teknik Özellikler**

### **Mimari**
- ✅ **MVVM Pattern**: Clean architecture prensiplerine uygun
- ✅ **Provider State Management**: Efficient state handling
- ✅ **Helper Classes**: Modüler ve yeniden kullanılabilir kod
- ✅ **Factory Pattern**: Widget factory metodları

### **Kod Kalitesi**
- ✅ **Clean Code**: SOLID prensiplerine uygun
- ✅ **Type Safety**: Güçlü tip kontrolü
- ✅ **Null Safety**: Dart 3.0 null safety desteği
- ✅ **Documentation**: Kapsamlı Türkçe dokümantasyon

### **Performance**
- ✅ **Optimized Assets**: Optimize edilmiş görsel ve ses dosyaları
- ✅ **Memory Management**: Düzgün kaynak yönetimi
- ✅ **Lazy Loading**: İhtiyaç halinde yükleme
- ✅ **Production Ready**: Üretim ortamı için hazır

## 📂 **Proje Yapısı**

```
lib/
├── 📁 constants/          # Sabitler ve konfigürasyon
│   ├── app_constants.dart # Merkezi sabitler
│   └── app_strings.dart   # String yönetimi
├── 📁 data/              # Veri katmanı
│   ├── character_data.dart # Karakter verileri
│   └── question_data.dart  # Quiz soruları
├── 📁 helpers/           # MVVM helper sınıfları
│   └── character_detail_helpers.dart
├── 📁 models/            # Data modelleri
│   ├── character.dart    # Karakter modeli
│   ├── question.dart     # Soru modeli
│   └── quiz_result.dart  # Quiz sonuç modeli
├── 📁 providers/         # State management
│   ├── quiz_provider.dart
│   └── user_provider.dart
├── 📁 screens/           # Ekran bileşenleri
│   ├── main_menu_screen.dart
│   ├── quiz_screen.dart
│   ├── quiz_result_screen.dart
│   └── character_detail_screen.dart
├── 📁 services/          # Servis katmanı
│   └── audio_service.dart
├── 📁 utils/             # Yardımcı sınıflar
│   ├── app_colors.dart
│   └── app_shadows.dart
└── 📁 widgets/           # Özel widget'lar
    └── custom_widgets.dart
```

## 🚀 **Kurulum ve Çalıştırma**

### **Gereksinimler**
- Flutter SDK 3.0+
- Dart 3.0+
- Android Studio / VS Code
- Git

### **Kurulum Adımları**

1. **Projeyi klonlayın:**
```bash
git clone https://github.com/username/lotr-quiz-app.git
cd lotr-quiz-app
```

2. **Bağımlılıkları yükleyin:**
```bash
flutter pub get
```

3. **Uygulamayı çalıştırın:**
```bash
flutter run
```

### **Platform Desteği**
- ✅ Android
- ✅ iOS  
- ✅ Windows
- ✅ macOS
- ✅ Linux
- ✅ Web

## 🎯 **Kullanım**

### **Ana Menü**
1. Uygulama açıldığında ana menüde 6 farklı kategori görürsünüz
2. Kategori sayfaları arasında kaydırarak gezinebilirsiniz
3. "Karakterler" butonuna basarak tüm karakterleri görüntüleyebilirsiniz

### **Quiz Oyunu**
1. Bir kategori seçin ve "Quiz Başlat" butonuna basın
2. Soruları okuyun ve doğru cevabı seçin
3. Her cevap sonrası açıklama gösterilir
4. Quiz sonunda puanınızı görün

### **Karakter Detayları**
1. Herhangi bir karaktere tıklayın
2. Karakter hakkında detaylı bilgi görün
3. Ses butonuna basarak karakter sesini dinleyin

## 🛠️ **Geliştirme**

### **Yeni Soru Ekleme**
`lib/data/question_data.dart` dosyasından yeni sorular ekleyebilirsiniz:

```dart
Question(
  id: 'unique_id',
  text: 'Soru metni?',
  options: ['Seçenek 1', 'Seçenek 2', 'Seçenek 3', 'Seçenek 4'],
  correctAnswerIndex: 0,
  explanation: 'Cevap açıklaması',
  category: CharacterCategory.elves,
  difficulty: 'easy',
),
```

### **Yeni Karakter Ekleme**
`lib/data/character_data.dart` dosyasından yeni karakterler ekleyebilirsiniz.

## 📝 **Lisans**

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## 🤝 **Katkıda Bulunma**

1. Projeyi fork edin
2. Feature branch oluşturun (`git checkout -b feature/yeni-ozellik`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni özellik eklendi'`)
4. Branch'i push edin (`git push origin feature/yeni-ozellik`)
5. Pull Request oluşturun

## 📞 **İletişim**

Proje hakkında sorularınız için issue açabilir veya e-posta gönderebilirsiniz.

---

**⚡ "One App to Rule Them All" ⚡**

*Lord of the Rings Quiz App ile Orta Dünya bilginizi test edin!*
