/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 3/16/13
 * Time: 2:46 PM
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.tuning.nativedo
{
import by.vaukalak.tuning.core.IDisplayObjectContainerPresenter;
import by.vaukalak.tuning.core.IDisplayObjectPresenter;

import flash.display.DisplayObject;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.utils.Dictionary;

public class NativeDiplayObjectContainerPresenter extends NativeDisplayObjectPresenter implements IDisplayObjectContainerPresenter
{

    private static const _linker:Dictionary = new Dictionary(true);

    public function addChild(value:IDisplayObjectPresenter):IDisplayObjectPresenter
    {
        ($target as DisplayObjectContainer).addChild((value as NativeDisplayObjectPresenter).$target);
        return value;
    }

    public function getChildAt(index:uint):IDisplayObjectPresenter
    {
        var targetChild:DisplayObject = ($target as DisplayObjectContainer).getChildAt(index);
        return _linker[targetChild] ||= createPresenter(targetChild);
    }

    public function removeChild(value:IDisplayObjectPresenter):IDisplayObjectPresenter
    {
        ($target as DisplayObjectContainer).removeChild((value as NativeDisplayObjectPresenter).$target);
        return value;
    }

    public function get numChildren():uint
    {
        return ($target as DisplayObjectContainer).numChildren;
    }

    //---------------------------------
    //
    //  PRIVATE METHODS
    //
    //---------------------------------

    private function createPresenter(target:DisplayObject):IDisplayObjectPresenter
    {
        var presenter:NativeDisplayObjectPresenter = new (target is DisplayObjectContainer ? NativeDiplayObjectContainerPresenter : NativeDisplayObjectPresenter)();
        presenter.$target = target;
        return presenter;
    }

}
}
