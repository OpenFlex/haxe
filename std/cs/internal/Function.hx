/*
 * Copyright (C)2005-2012 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
package cs.internal;

/**
 These classes are automatically generated by the compiler. They are only
 here so there is an option for e.g. defining them as externs if you are compiling
 in modules (untested).
**/

@:keep @:abstract @:nativegen @:native("haxe.lang.Function") private class Function
{
	function new(arity:Int, type:Int)
	{

	}
}

@:keep @:nativegen @:native("haxe.lang.VarArgsBase") private class VarArgsBase extends Function
{
	public function __hx_invokeDynamic(dynArgs:Array<Dynamic>):Dynamic
	{
		throw "Abstract implementation";
		return null;
	}
}

@:keep @:nativegen @:native('haxe.lang.VarArgsFunction') class VarArgsFunction extends VarArgsBase
{
	private var fun:Array<Dynamic>->Dynamic;

	public function new(fun)
	{
		super(-1, -1);
		this.fun = fun;
	}

	override public function __hx_invokeDynamic(dynArgs:Array<Dynamic>):Dynamic
	{
		return fun(dynArgs);
	}
}

@:keep @:nativegen @:native('haxe.lang.Closure') class Closure extends VarArgsBase
{
	private var obj:Dynamic;
	private var field:String;
	private var hash:Int;

	public function new(obj:Dynamic, field, hash)
	{
		super(-1, -1);
		this.obj = obj;
		this.field = field;
		this.hash = hash;
	}

	override public function __hx_invokeDynamic(dynArgs:Array<Dynamic>):Dynamic
	{
		return Runtime.callField(obj, field, hash, dynArgs);
	}
}