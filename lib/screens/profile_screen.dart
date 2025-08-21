/*
 * PROFILE SCREEN - Profil Ekranı
 * 
 * Kullanıcının profil bilgilerini görüntülediği ve düzenlediği sayfa.
 * İstatistikler, avatar seçimi ve kullanıcı adı değiştirme imkanı sunar.
 * 
 * Özellikler:
 * - Kullanıcı adı düzenleme
 * - Avatar seçimi
 * - Quiz istatistikleri (toplam oyun, en yüksek skor)
 * - Başarı yüzdesi gösterimi
 * - Kategori bazlı performans
 * - Provider pattern ile veri yönetimi
 * - Responsive tasarım
 * - LOTR teması
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/character_avatar_widget.dart';
import '../data/character_data.dart';
import '../constants/app_constants.dart';

// Profil Widget - kullanıcı profil yönetimi

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.strings.profileTitle)),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final profile = userProvider.userProfile;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: GestureDetector(
                  onTap: () => _showAvatarDialog(userProvider, profile.selectedAvatar),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.amber,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: CharacterAvatarWidget(
                      characterId: profile.selectedAvatar,
                      size: 80,
                      onTap: () => _showAvatarDialog(userProvider, profile.selectedAvatar),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profile.username,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: () => _showUsernameDialog(userProvider, profile.username),
                      tooltip: AppConstants.strings.editUsername,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _stat(AppConstants.strings.quiz, profile.totalQuizzes.toString()),
                  _stat(AppConstants.strings.score, '${profile.highestScore}/10'),
                  _stat(AppConstants.strings.accuracy, '${profile.accuracy.toStringAsFixed(1)}%'),
                ],
              ),
              const SizedBox(height: 24),
              if (profile.achievements.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppConstants.strings.achievements, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ...profile.achievements.map((achievement) => ListTile(
                          leading: const Icon(Icons.emoji_events),
                          title: Text(achievement),
                        )),
                  ],
                ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  userProvider.resetProfile();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppConstants.strings.profileReset)),
                  );
                },
                child: Text(AppConstants.strings.resetProfile),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _stat(String label, String value) => Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      );

  void _showAvatarDialog(UserProvider userProvider, String selectedAvatar) {
    showDialog(
      context: context,
      builder: (context) {
        final currentAvatar = userProvider.userProfile.selectedAvatar;
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppConstants.strings.avatarSelection,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  AppConstants.strings.favoriteCharacter,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: CharacterData.getMainCharacterAvatars().length,
                    itemBuilder: (context, index) {
                      final characterId = CharacterData.getMainCharacterAvatars()[index];
                      final isSelected = currentAvatar == characterId;
                      
                      return GestureDetector(
                        onTap: () {
                          userProvider.updateAvatar(characterId);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(AppConstants.strings.avatarUpdated)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: isSelected
                                ? Border.all(color: Colors.amber, width: 3)
                                : Border.all(color: Colors.grey.shade300, width: 1),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Colors.amber.withOpacity(0.5),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ]
                                : null,
                          ),
                          child: CharacterAvatarWidget(
                            characterId: characterId,
                            size: 48,
                            onTap: () {
                              userProvider.updateAvatar(characterId);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.brown,
                  ),
                  child: Text(AppConstants.strings.close),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showUsernameDialog(UserProvider userProvider, String currentUsername) {
    final TextEditingController controller = TextEditingController(text: currentUsername);
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppConstants.strings.enterUsername),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: AppConstants.strings.usernameLabel,
              hintText: AppConstants.strings.usernameHint,
              border: const OutlineInputBorder(),
            ),
            maxLength: 20,
            textCapitalization: TextCapitalization.words,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppConstants.strings.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                final newUsername = controller.text.trim();
                if (newUsername.isNotEmpty) {
                  userProvider.updateUsername(newUsername);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppConstants.strings.usernameUpdated)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppConstants.strings.usernameCannotBeEmpty)),
                  );
                }
              },
              child: Text(AppConstants.strings.save),
            ),
          ],
        );
      },
    );
  }
}

