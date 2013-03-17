/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 3/16/13
 * Time: 2:40 PM
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.tuning.nativedo
{
import by.vaukalak.tuning.core.IDisplayObjectContainerPresenter;
import by.vaukalak.tuning.core.IDisplayObjectPresenter;

import flash.display.DisplayObject;
import flash.utils.Dictionary;

public class NativeDisplayObjectPresenter implements IDisplayObjectPresenter
{
    private static var _nextID:uint = 0;
    internal static const $hash:Object = {};
    internal var $target:DisplayObject;
    internal var $parent:IDisplayObjectContainerPresenter;
    private var _id:String;


    public function NativeDisplayObjectPresenter()
    {
        _id = String(_nextID++);
        $hash[_id] = this;
    }

    public function get parent():IDisplayObjectContainerPresenter
    {
        return $parent;
    }

    public function get x():Number
    {
        return $target.x;
    }

    public function set x(value:Number):void
    {
        $target.x = value;
    }

    public function get y():Number
    {
        return $target.y;
    }

    public function set y(value:Number):void
    {
        $target.y = value;
    }

    public function get z():Number
    {
        return $target.z;
    }

    public function set z(value:Number):void
    {
        $target.z = value;
    }

    public function get alpha():Number
    {
        return $target.alpha;
    }

    public function set alpha(value:Number)
    {
        $target.alpha = value;
    }

    public function get uniqueID():String
    {
        return _id;
    }

    public function set width(value:Number):void
    {
        $target.width = value;
    }

    public function get width():Number
    {
        return $target.width;
    }

    public function set height(value:Number):void
    {
        $target.height = value;
    }

    public function get height():Number
    {
        return $target.height;
    }
}
}
