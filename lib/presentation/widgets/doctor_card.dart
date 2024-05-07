import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DoctorCard extends StatefulWidget {
  final Doctor doctor;
  final bool showAbout;
  final bool showMoreInformation;

  const DoctorCard({
    Key? key, 
    required this.doctor,
    this.showAbout = true,
    this.showMoreInformation = true,
  }) : super(key: key);

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final moreInformation = [
      {
        "icon": Icons.account_circle_outlined,
        "label": "Patients",
        "value": widget.doctor.patientCount
      },
      {
        "icon": Icons.star_border,
        "label": "Experience",
        "value": "3 years",
      },
      {
        "icon": Icons.favorite_border,
        "label": "Rating",
        "value": widget.doctor.rating
      },
      {
        "icon": Icons.numbers,
        "label": "Reviews",
        "value": widget.doctor.reviewCount
      }
    ];

    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.doctor.profileImageUrl),
                radius: 48,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctor.name,
                      style: textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ), 
                    ),
                    Text(widget.doctor.category.name),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: colorScheme.secondary,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "New York, USA",
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          // About
          if (widget
              .showAbout) // Changed '...widget.showAbout' to 'if (widget.showAbout)'
            ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Text(
                "About",
                style: textTheme.bodyMedium!.copyWith(
                  // Changed textTheme.bodyMedium to textTheme.subtitle1
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.doctor.bio,
                maxLines: showAll ? null : 3,
                textAlign: TextAlign.justify,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  showAll = !showAll;
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                child: Text(
                  showAll ? "Show less" : "Show more",
                  style: textTheme.bodyMedium!.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
          if (widget
              .showMoreInformation) // Changed '...widget.showMoreInformation' to 'if (widget.showMoreInformation)'
            Row(
              children: moreInformation
                  .map(
                    (e) => Expanded(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Icon(e["icon"] as IconData),
                          ),
                          Text(
                            e["value"].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(e["label"] as String),
                        ],
                      ),
                    ),
                  )
                  .toList(), // Added .toList() to convert Iterable<Widget> to List<Widget>
            ),
        ],
      ),
    );
  }
}
