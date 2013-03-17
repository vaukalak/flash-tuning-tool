/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 3/16/13
 * Time: 2:32 PM
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.tuning.core
{
public interface IDisplayObjectPresenter
{
    function get parent():IDisplayObjectContainerPresenter;
    function get x():Number;
    function set x(value:Number):void;
    function get y():Number;
    function set y(value:Number):void;
    function get z():Number;
    function set z(value:Number):void;
    function set width(value:Number):void;
    function get width():Number;
    function set height(value:Number):void;
    function get height():Number;
    function get alpha():Number;
    function set alpha(value:Number);
    function get uniqueID():String;
}
}
