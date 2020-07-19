// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:pomotoro/screens/timer/timer_presenter.dart';

import '../../counter.dart';
import 'timer_view.dart';

final _backgroundColor = Colors.green[100];

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class TimerScreen extends StatefulWidget {
  const TimerScreen();

  @override
  State<StatefulWidget> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> implements TimerView {
  String _playButtonText = "";
  int _count = 0;
  TimerPresenter _presenter;

  _TimerScreenState();

  @override
  void initState() {
    super.initState();
    _presenter = TimerPresenter(this, Counter());
  }

  @override
  void dispose() {
    _presenter.detach();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final body = Center(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_countText(), SizedBox(height: 16), _playButton()],
      ),
    ));

    return Scaffold(
      appBar: _appBar(),
      body: Container(padding: EdgeInsets.only(top: 8), child: body),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0.0,
      title: Text(
        'Pomotoro',
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );
  }

  Widget _countText() {
    return Text("$_count", style: TextStyle(fontSize: 50));
  }

  Widget _playButton() {
    return FlatButton(
      child: Text(_playButtonText),
      onPressed: () => _presenter.onPlayClick(),
    );
  }

  @override
  void setCountText(int count) {
    setState(() {
      _count = count;
    });
  }

  @override
  void setPlayButtonText(String text) {
    setState(() {
      _playButtonText = text;
    });
  }
}
