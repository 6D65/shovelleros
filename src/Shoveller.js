var Shoveller = cc.Sprite.extend({
    _x : null,
    _y : null,

    ctor: function(x, y) {
        this._super(res.Shoveller_png);
        _x = x;
        _y = y;
        this.attr({x: _x, y: _y, scale: 0.75});
    },

    init: function () {
        // do stuff
    },

    moveToPoint: function (nextPosition) {

        // console.log("encapsulated movement... yay");
        // console.log("currentPostion x = " + nextPosition.x + " y = " + nextPosition.y);

        rotationAngle = this.getRotationAngle(nextPosition);

        this.runAction(
            cc.sequence(
                cc.rotateTo(1, 90 + rotationAngle),
                cc.moveTo(2, 
                    cc.p(nextPosition.x, nextPosition.y)
                    )
                )
            );
    },

    getFootSteps: function () {
        var footsteps = new Footsteps(this.x, this.y);
        footsteps.attr({rotation: this.rotation});
        return footsteps;
    },

    getRotationAngle: function (nextPosition) {
        var angle = Math.atan2(this.y - nextPosition.y, 
                               nextPosition.x - this.x );
        return angle * (180/Math.PI);
    }
});