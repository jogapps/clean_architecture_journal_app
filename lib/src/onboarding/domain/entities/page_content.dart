import 'package:equatable/equatable.dart';
import 'package:journal_app/core/res/asset_images.dart';

class PageContent extends Equatable {
  const PageContent.second()
      : this(
            image: AssetImages.welcome,
            title: 'Welcome to JournalApp',
            description: 'Start your journey to better mental clarity!');

  const PageContent.first()
      : this(
            image: AssetImages.trackProgress,
            title: 'Track Your Progress',
            description: 'Visualize your daily activities and mood.');

  const PageContent.third({required String desc})
      : this(
            image: AssetImages.stayMotivated,
            title: 'Stay Motivated',
            description: desc);

  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  List<Object?> get props => [image, title, description];
}
