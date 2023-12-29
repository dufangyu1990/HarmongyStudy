
import { PositionType } from '../common/constants/CommonConstants';
export class PositionItem{
  icon:Resource = $r('app.media.ic_train_station');
  text:Resource =  $r('app.string.train_station');

  type:PositionType = PositionType.TRAIN_STATION;

  lngLat:Array<GeoCoordinates>=[];

}

/**
 * Geographical coordinates, longitude and latitude.
 */
export class GeoCoordinates {
  longitude: number = 0;
  latitude: number = 0;
}

/**
 * PixelCoordinates.
 */
export class PixelCoordinates{
  coordinateX: number = 0;
  coordinateY: number = 0;
}