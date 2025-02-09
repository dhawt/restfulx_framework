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
package org.restfulx.events {
  import flash.events.Event;
  
  import org.restfulx.commands.CommandsEventDispatcher;
  
  /**
   * Generic execution event (used by commands).
   */
  public class CommandExecutionEvent extends Event {

    /** command data */
    public var data:*;
    
    /** 
     * Since we deal with many services commands may need to know which service 
     * to delegate low-level behaviour to
     */
    public var targetServiceId:int;
    
    /**
     * @see flash.events.Event
     */
    public function CommandExecutionEvent(type:String, bubbles:Boolean = false, 
      cancelable:Boolean = false) {
      super(type, bubbles, cancelable);
    }
    
    /**
     * Dispatches current instance of the event using RxCommandsEventDispatcher.
     * Event handlers are typically org.restfulx.controllers.ICommand#execute implementations.
     *  
     * @return boolean indicating if event was dispatched successfully
     */
    public function dispatch():Boolean {
      return CommandsEventDispatcher.getInstance().dispatchEvent(this);
    }
  }
}