/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 3/16/13
 * Time: 2:32 PM
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.tuning.core
{
public interface IDisplayObjectContainerPresenter extends IDisplayObjectPresenter
{
    function addChild(value:IDisplayObjectPresenter):IDisplayObjectPresenter;
    function getChildAt(index:uint):IDisplayObjectPresenter;
    function removeChild(value:IDisplayObjectPresenter):IDisplayObjectPresenter;
    function get numChildren():uint;
}
}
