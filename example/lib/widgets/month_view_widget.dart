import 'package:custom_calendar_view/custom_calendar_view.dart';
import 'package:flutter/material.dart';

import '../pages/event_details_page.dart';

class MonthViewWidget extends StatelessWidget {
  final GlobalKey<MonthViewState>? state;
  final double? width;

  const MonthViewWidget({
    super.key,
    this.state,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return MonthView(
      key: state,
      width: width,
      hideDaysNotInMonth: false,
     // headerBuilder: (e)=>Container(color: Colors.transparent),
      primaryColor: Colors.amberAccent,
      secondaryColor: Colors.yellowAccent.shade400,
      secondaryOffsetColor: Colors.yellow.shade900,
      startDay: WeekDays.sunday,
      onEventTap: (event, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsPage(
              event: event,
            ),
          ),
        );
      },
      headerStyle: HeaderStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          )),
      onEventLongTap: (event, date) {
        SnackBar snackBar = SnackBar(content: Text("on LongTap"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
