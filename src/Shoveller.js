var Shoveller = cc.Sprite.extend({
    _x : null,
    _y : null,

    ctor: function(x, y) {
        this._super(res.Shoveller_png);
        _x = x;
        _y = y;
        this.attr({x: _x, y: _y});
    },

    init: function () {
        // do stuff
    },

    moveToPoint: function (nextPosition) {
        // body...
        // var nextPosition = ShovellersPath.getCurrent();
        console.log("encapsulated movement... yay");
        // console.log("currentPostion x = " + nextPosition.x + " y = " + nextPosition.y);

        var angle = Math.atan2(this.y - nextPosition.y, 
                               nextPosition.x - this.x );
        angle = angle * (180/Math.PI);

        this.runAction(
            cc.sequence(
                cc.rotateTo(1, 90 + angle),
                cc.moveTo(2, 
                    cc.p(nextPosition.x, nextPosition.y)
                    )
                )
            );
    },

    getFootSteps: function (nextPosition) {
        var angle = this.getRotationAngle(nextPosition);
        var footsteps = new Footsteps(this.x, this.y);

        footsteps.attr({rotation: 90 + angle});

        return footsteps;
    },

    getRotationAngle: function (nextPosition) {
        var angle = Math.atan2(this.y - nextPosition.y, 
                               nextPosition.x - this.x );
        return angle * (180/Math.PI);
    }
});