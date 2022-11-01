import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty_app/feature/presentation/pages/person_detail_page.dart';
import 'package:rick_and_morty_app/feature/presentation/widgets/person_cached_image.dart';
import 'package:rick_and_morty_app/utilities/app_colors_util.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity person;

  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonDetailPage(person: person),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            PersonCacheImage(
              imageUrl: person.image,
              height: 166,
              width: 166,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Text(
                    person.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Container(
                        height: 8.0,
                        width: 8.0,
                        decoration: BoxDecoration(
                          color: person.status == 'Alive'
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${person.status}',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Last known location',
                    style: TextStyle(
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    person.location.name,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Origin:',
                    style: TextStyle(
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    person.origin.name,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            SizedBox(width: 12.0),
          ],
        ),
      ),
    );
  }
}
