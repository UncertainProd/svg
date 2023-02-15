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

	public function render(graphics:Graphics, ?x:Float = 0, ?y:Float = 0, ?width:Int = -1, ?height:Int = -1, ?matrix:Matrix, ?inLayer:String = null)
	{
		if (data == null)
			return;

		// backwards compatibility with openfl/svg
		var finalMatrix = new Matrix();
		finalMatrix.identity();

		if (width > -1 && height > -1)
		{
			finalMatrix.scale(width / data.width, height / data.height);
		}

		finalMatrix.translate(x, y);

		if (matrix != null)
			finalMatrix.concat(matrix);

		var renderer = new SVGRenderer(data, inLayer);

		renderer.render(graphics, matrix);
	}
}
