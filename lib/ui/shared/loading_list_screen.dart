import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.3),
              highlightColor: Colors.grey.withOpacity(0.1),
              child: ListView.builder(
                itemBuilder: (_, __) => Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 64.0,
                        height: 48.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 14,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3),
                            ),
                            Container(
                              width: 120.0,
                              height: 8.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
