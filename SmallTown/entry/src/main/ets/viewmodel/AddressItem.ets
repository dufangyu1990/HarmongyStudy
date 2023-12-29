
export class AddressItem{
  name?:Resource;
  icon?:Resource;
  locations:Array<Location>=[];
  textColor:Resource;
}

export class Location{
  positionX:number;
  positionY:number;
  oriPositionX:number;
  oriPositionY:number;

  constructor(positionX:number,positionY:number) {
    this.positionX = positionX;
    this.positionY = positionY;
    this.oriPositionX = positionX;
    this.oriPositionY = positionY;
  }

}