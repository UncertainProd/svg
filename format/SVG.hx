package format;

import format.svg.SVGData;
import format.svg.SVGRenderer;
import openfl.display.Graphics;
import openfl.geom.Matrix;
import openfl.geom.Rectangle;

class SVG
{
	public var data:SVGData;

	public function new(content:String)
	{
		if (content != null)
		{
			data = new SVGData(Xml.parse(content));
		}
	}

	// public function render(graphics:Graphics, x:Float = 0, y:Float = 0, width:Int = -1, height:Int = -1, ?inLayer:String = null)
	// public function render(graphics:Graphics, x:Float = 0, y:Float = 0, width:Int = -1, height:Int = -1, angle:Float = 0.0, ?inMatrix:Matrix,
	// 		?inLayer:String = null)
	public function render(graphics:Graphics, matrix:Matrix, ?inLayer:String = null)
	{
		if (data == null)
			return;

		// var matrix = new Matrix();
		// matrix.identity();

		// if (width > -1 && height > -1)
		// {
		// 	matrix.scale(width / data.width, height / data.height);
		// }

		// matrix.translate(x, y);

		var renderer = new SVGRenderer(data, inLayer);

		renderer.render(graphics, matrix);
	}
}
