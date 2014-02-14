/*
 * This file is part of alphaSynth.
 * Copyright (c) 2014, T3866, PerryCodes, Daniel Kuschny and Contributors, All rights reserved.
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or at your option any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.
 */
package as.sf2.chunks;

import as.ds.FixedArray.FixedArray;
import as.sf2.SampleHeader;
import haxe.io.BytesInput;

class SampleHeaderChunk extends Chunk
{
    public var sampleHeaders:FixedArray<SampleHeader>;
    
    public function new(id:String, size:Int, input:BytesInput) 
    {
        super(id, size);
        if (size % 46 != 0)
            throw ("Invalid SoundFont. The sample header chunk was invalid.");
        sampleHeaders = new FixedArray<SampleHeader>(Std.int((size / 46.0) - 1));
        
        for (x in 0 ... sampleHeaders.length)
        {
            sampleHeaders[x] = new SampleHeader(input);
        }
        new SampleHeader(input); //read terminal record
    }
}