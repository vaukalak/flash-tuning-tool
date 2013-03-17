/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 3/16/13
 * Time: 2:18 PM
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.tuning.client
{
import by.vaukalak.tuning.core.IDisplayListProvider;
import by.vaukalak.tuning.core.IDisplayObjectContainerPresenter;
import by.vaukalak.tuning.serialization.DisplayListSerializer;

import flash.net.LocalConnection;
import flash.utils.ByteArray;

public class TuningManager
{
    private var _provider:IDisplayListProvider;
    private var receivingConnection:LocalConnection;

    public function TuningManager()
    {
    }

    public function set provider(value:IDisplayListProvider):void
    {
        _provider = value;
    }

    public function start():void
    {
        var sendingConnection:LocalConnection = new LocalConnection();
        var serialized:* = new DisplayListSerializer().serialize(_provider.getRootNode());
        var time:String = new Date().time.toString();

        receivingConnection = new LocalConnection();
        receivingConnection.allowDomain("*");
        receivingConnection.connect("by.vaukalak.tuning-client");
        receivingConnection.client = {
            "update":function(host:String, name:String, value:*):void
            {
                trace(host);
                _provider.updateProperty(host, name, value);
            }
        }
//        receivingConnection.client = new ProxyClient(_provider.updateProperty);

        sendingConnection.send("by.vaukalak.tuning-tool", "updateRootNode", serialized, time);
    }
}
}

import flash.utils.Proxy;
import flash.utils.flash_proxy;

use namespace flash_proxy;

dynamic class ProxyClient extends Proxy
{
    private var _callback:Function;

    public function ProxyClient(callback:Function)
    {
        _callback = callback;
    }


    override flash_proxy function getProperty(name:*):*
    {
        return super.flash_proxy::getProperty(name);
    }

    override flash_proxy function callProperty(name:*, ...params):*
    {
        super.flash_proxy::callProperty(name, params[0]);
        var split:Array = (name as String).split(":");
        _callback(split[0], split[1], params[0]);
    }
}