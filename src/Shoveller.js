var Shoveller = cc.Sprite.extend({
    _footSteps : null,
    _footStepsTimer : null,
    _FOOTSTEPS_TIMER_LENGTH : 3,
    _FOOTSTEPS_LIFE_LENGHT : 5,

    ctor: function(x_, y_) {
        this._super(res.Shoveller_png);
        this.attr({x: x_, y: y_, scale: 0.75});

        this.init();
    },

    init: function () {
        this._footSteps = [];
        this._footStepsTimer = this._FOOTSTEPS_TIMER_LENGTH;
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

    createFootSteps: function() {
        var footsteps = new Footsteps(this.x, this.y);
        footsteps.attr({rotation: this.rotation});

        // var audioEngine = cc.AudioEngine.getInstance();
        cc.audioEngine.playEffect(res.S_Music_Snow_Walking);

        return footsteps;
    },

    getRotationAngle: function(nextPosition) {
        var angle = Math.atan2(this.y - nextPosition.y, 
                               nextPosition.x - this.x );
        return angle * (180/Math.PI);
    },

    manageFootSteps: function(parentLayer, dt) {
        if(this.isTimeToCreateFootSteps())
        {
            var steps = this.createFootSteps();
            this._footSteps.push({steps: steps, time: 0});
            parentLayer.addChild(steps, 0);
        }

        for (var i = this._footSteps.length - 1; i >= 0; i--) {
            this._footSteps[i].time += dt;
            if(this._footSteps[i].time > this._FOOTSTEPS_LIFE_LENGHT)
            {
                parentLayer.removeChild(this._footSteps[i].steps);
            }
        };
    },

    isTimeToCreateFootSteps: function () {
        var current = this._footStepsTimer;

        if(current === 0)
        {
            this._footStepsTimer = this._FOOTSTEPS_TIMER_LENGTH;
        }

        this._footStepsTimer -= 1;

        return current === 0 ? true : false;
    }
});