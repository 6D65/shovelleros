var Footsteps = cc.Sprite.extend({
	ctor: function (x_, y_) {
		this._super(res.FootSteps_png);
		this.attr({x: x_, y: y_});
	},
	init: function () {
		// body...
	}
})