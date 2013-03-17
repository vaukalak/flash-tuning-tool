/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 3/16/13
 * Time: 3:48 PM
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.tuning.nativedo
{
import by.vaukalak.tuning.core.IDisplayListProvider;
import by.vaukalak.tuning.core.IDisplayObjectContainerPresenter;

import flash.display.DisplayObjectContainer;
import flash.net.registerClassAlias;

public class NativeDiplayListProvider implements IDisplayListProvider
{
    private var _root:NativeDiplayObjectContainerPresenter;

    public function NativeDiplayListProvider(targetRoot:DisplayObjectContainer)
    {
        registerClassAlias("by.vaukalak.tuning.IDisplayObjectContainerPresenter", IDisplayObjectContainerPresenter);
        _root = new NativeDiplayObjectContainerPresenter();
        _root.$target = targetRoot;
    }

    public function getRootNode():IDisplayObjectContainerPresenter
    {
        return _root;
    }

    public function updateProperty(hostID:String, property:String, value:*):void
    {
        NativeDisplayObjectPresenter.$hash[hostID][property] = value;
    }
}
}
