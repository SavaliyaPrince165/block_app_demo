import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;

  const CarouselLoadEvent({this.defaultIndex = 0}) : assert(defaultIndex >= 0, 'defultIndex cannot be less than 0');

  @override
  List<Object> get props => [defaultIndex];
}
