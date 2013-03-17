/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 3/16/13
 * Time: 2:31 PM
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.tuning.core
{
public interface IDisplayListProvider
{
    function getRootNode():IDisplayObjectContainerPresenter;

    function updateProperty(hostID:String, property:String, value:*):void;
}
}
