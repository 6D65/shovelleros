Footsteps = cc.Sprite.extend({
    ctor: (x_, y_) ->
        this._super(res.FootSteps_png)
        this.attr({x: x_, y: y_, scale: 0.75})

    init: () ->
        console.log("init something")
})