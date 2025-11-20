import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/data/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool isOffline;

  const RecipeCard({super.key, required this.recipe, this.isOffline = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final id = recipe.id;
        if (id == null || id.isEmpty) {
          debugPrint("Invalid recipe id, skipping navigation");
          return;
        }
        context.push('/recipe/$id');
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              const SizedBox(width: 12),
              Expanded(child: _buildInfo()),
            ],
          ),
        ),
      ),
    );
  }

  String _shorten(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return "${text.substring(0, maxLength)}...";
  }

  Widget _buildImage() {
    if ((recipe.image ?? "").isEmpty) {
      return _placeholder();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: recipe.image!,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        placeholder: (_, __) => _placeholder(),
        errorWidget: (_, __, ___) => _placeholder(),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.image_not_supported),
    );
  }

  Widget _buildInfo() {
    final title = recipe.title ?? "Без названия";
    final preview = _shorten(recipe.text ?? "", 80);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(preview, maxLines: 3, overflow: TextOverflow.ellipsis),
        if ((recipe.prepTime ?? "").isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            "Время: ${recipe.prepTime} мин",
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
        if (isOffline)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              "Офлайн данные",
              style: TextStyle(fontSize: 12, color: Colors.orange.shade700),
            ),
          ),
      ],
    );
  }
}
