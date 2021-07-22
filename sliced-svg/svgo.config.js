module.exports = {
  plugins: [
	{
		name: "convertShapeToPath",
		params: { "convertArcs": true }
	},
    "reusePaths",
    "mergePaths",
    "removeOffCanvasPaths",
    "removeViewBox",
    "removeUselessStrokeAndFill"
  ]
}
