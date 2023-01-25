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

	public function render(graphics:Graphics, matrix:Matrix, ?inLayer:String = null)
	{
		if (data == null)
			return;

		var renderer = new SVGRenderer(data, inLayer);

		renderer.render(graphics, matrix);
	}
}
