import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty_app/feature/presentation/widgets/person_cached_image.dart';
import 'package:rick_and_morty_app/utilities/app_colors_util.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;

  const PersonDetailPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24.0),
            Text(
              person.name,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white70,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.0),
            PersonCacheImage(
              imageUrl: person.image,
              height: 260,
              width: 260,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: person.status == 'Alive' ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  person.status,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                  maxLines: 1,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            if (person.type.isNotEmpty) ...buildText('Type:', person.type),
            ...buildText('Gender', person.gender),
            ...buildText(
                'Number of episodes', person.episode.length.toString()),
            ...buildText('Species', person.species),
            ...buildText('Last known location', person.location.name),
            ...buildText('Origin', person.origin.name),
            ...buildText('Was created', person.created.toString()),
          ],
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style: TextStyle(
          color: AppColors.greyColor,
        ),
      ),
      SizedBox(height: 4.0),
      Text(
        value,
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      SizedBox(height: 12.0),
    ];
  }
}
