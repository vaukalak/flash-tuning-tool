/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 3/16/13
 * Time: 6:03 PM
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.tuning.serialization
{
import by.vaukalak.tuning.core.IDisplayObjectContainerPresenter;
import by.vaukalak.tuning.core.IDisplayObjectPresenter;

public class DisplayListSerializer
{
    public function serialize(value:IDisplayObjectPresenter):*
    {
        var object:Object = {
            "x": value.x,
            "y": value.y,
            "z": value.z,
            "width": value.width,
            "height": value.height,
            "alpha": value.alpha,
            "uniqueID":value.uniqueID
        };
        var container:IDisplayObjectContainerPresenter = value as IDisplayObjectContainerPresenter;
        if(container)
        {
            object.children = [];
            for (var i:uint = 0; i < container.numChildren; i++)
            {
                object.children.push(serialize(container.getChildAt(i)));
            }
        }
        return object;
    }


}
}
