/*******************************************************************************
 * Copyright (c) 2008-2011 Dima Berastau and Contributors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Redistributions of files must retain the above copyright notice.
 ******************************************************************************/
package org.restfulx.services {
  import mx.rpc.IResponder;

  /**
   * This interface identifies Service Providers that are capable of tracking
   * synchronization related metadata.
   */
  public interface ISyncingServiceProvider extends IServiceProvider {
    /**
     * Idenfies all the instances for a particular class of models that need to be
     *  synchronized
     *
     * @param object object to find versions for (typically a model class)
     * @param responder the responder that must be called on versions
     * @param metadata any metadata that must be appended with the index request
     * @param nestedBy an array of model instances that will be used to nest this request, e.g.:
     *  [project, user] where project is some Project model instance and user is some User model
     *  instance. In case of XMLHTTPServiceProvider nesting may require additional configuration on the server.
     *  If you are using Rails see config/routes.rb for more details.
     * @return an ArrayCollection of versions that are currently known for this object
     */
	  function dirty(object:Object, responder:IResponder, metadata:Object = null, nestedBy:Array = null):void;

    /**
     * Tries to *really* delete an object as opposed to just mark it for deletion.
     *
     * @param object object to find versions for (typically a model class)
     * @param responder the responder that must be called on versions
     * @param metadata any metadata that must be appended with the index request
     * @param nestedBy an array of model instances that will be used to nest this request, e.g.:
     *  [project, user] where project is some Project model instance and user is some User model
     *  instance. In case of XMLHTTPServiceProvider nesting may require additional configuration on the server.
     *  If you are using Rails see config/routes.rb for more details.
     * @param recursive indicates if a purge operations should be recusrive
     * @return an ArrayCollection of versions that are currently known for this object
     */
    function purge(object:Object, responder:IResponder, metadata:Object = null, nestedBy:Array = null, recursive:Boolean = false):void;
    
    /**
     * Mark a specific model object as synced
     *
     * @param object object to find versions for (typically a model class instance)
     * @param responder the responder that must be called on versions
     * @param metadata any metadata that must be appended with the index request
     * @param nestedBy an array of model instances that will be used to nest this request, e.g.:
     *  [project, user] where project is some Project model instance and user is some User model
     *  instance. In case of XMLHTTPServiceProvider nesting may require additional configuration on the server.
     *  If you are using Rails see config/routes.rb for more details.
     * @return an ArrayCollection of versions that are currently known for this object
     */
    function sync(object:Object, responder:IResponder, metadata:Object = null, nestedBy:Array = null):void;
    
    /**
     * Gets the last time (timestamp originates on the server) a sync was performed with the central server
     *
     * @param object object to get timestamp for (typically a model class)
     */
    function getLastPullTimeStamp(object:Object, responder:IResponder):void;
    
    /**
     * Updates the last time (timestamp originates on the server) a sync was performed with the central server
     *
     * @param object object object to update timestamp for (typically a model class)
     */
    function updateLastPullTimeStamp(object:Object, value:String):void;
    
    /**
     * If the service provider supports it, this begins a transaction
     */
    function beginTransaction():void;
    
    /**
     * If the service provider supports it, this commits the currently active transaction
     */
    function commitTransaction(responder:IResponder = null):void;
    
    /**
     * Indicates if this service provider is currently involved in a transaction
     */
    function inTransaction():Boolean;
  }
}

