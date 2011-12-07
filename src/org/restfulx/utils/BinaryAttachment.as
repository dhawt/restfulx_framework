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
package org.restfulx.utils {
  import flash.utils.ByteArray;
  
  /**
   * BinaryAttachments work much the same way RxFileReferences do, except they allow
   * you to attach arbitrary binary data to models instead of files. This is quite
   * useful for things like screenshots, webcam output, etc.
   */
  public class BinaryAttachment {
    
    /** The name to use for this attachment (can be something like snapshot.png) */
    public var name:String;
    
    /** 
     * The key this attachment should be submitted under, can be things like 
     * "avatar", or "uploaded_data" or whatever user server expects as the variable
     */
    public var key:String;
    
    /** actual binary data to send */
    public var data:ByteArray;
    
    public function BinaryAttachment(name:String, key:String, data:ByteArray) {
      this.name = name;
      this.key = key;
      this.data = data;
    }
  }
}