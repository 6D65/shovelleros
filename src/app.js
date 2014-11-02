
var GameLayer = cc.Layer.extend({
    _sprite:null,
    _place: null,
    _shoveller: null,
    _frameCount: null,
    _footsteps: null,
    ctor:function () {
        //////////////////////////////
        // 1. super init first
        this._super();

        this._footsteps = [];
        /////////////////////////////
        // 2. add a menu item with "X" image, which is clicked to quit the program
        //    you may modify it.
        // ask the window size
        var size = cc.winSize;

        this._sprite = new cc.Sprite(res.SnowBackground_png);
        this._sprite.attr({
            x: size.width / 2,
            y: size.height / 2,
            scale: 1.0,
            rotation: 0
        });
        this.addChild(this._sprite, 0);

        console.log("middle of the screen : {" + size.width / 2 + " : " + size.height / 2 + "}");

        this._shoveller = new Shoveller(size.width / 2, size.height /2);
        this.addChild(this._shoveller, 1);
        //this._shoveller.number(getNumberOfRunningActions()

        this._place = 1.0;
        console.log("Created myself");
        this._frameCount = 60;

        // this._shoveller.runAction(
            // cc.moveBy(10, cc.p(0, size.height - 40))
            // cc.rotateTo(2, 0)
        // );

        this.schedule(this.update, 0.1);

        return true;
    },
    update:function(dt) {
        this._place = this._place + 0.01;
        console.log("time elapsed : " + dt);

        if(this._shoveller.getNumberOfRunningActions() === 0)
        {
            var nextPosition = ShovellersPath.getCurrent();

            var footSteps = this._shoveller.getFootSteps(nextPosition);
            this._footsteps.push({steps: footSteps, time: 0});

            this._shoveller.moveToPoint(nextPosition);

            this.addChild(footSteps, 0);
        }

        // udpate the elapsed time for all the footsteps
        for (var i = this._footsteps.length - 1; i >= 0; i--) {
            this._footsteps[i].time += dt;
            if(this._footsteps[i].time > 10)
            {
                this.removeChild(this._footsteps[i].steps);
                // this._footsteps.steps.removeSelf()
            }
        };
    }
});

var ShovellersPath = {
    points: [
        {x: 100, y: 110},
        {x: 300, y: 240},
        {x: 600, y: 280},
        {x: 400, y: 240},
        {x: 300, y: 210},
        {x: 100, y: 190}
    ],
    current: 0
};

ShovellersPath.getCurrent = function () {
    if(this.current === 5)
    {
        this.current = 0;
        return this.points[5];
    }
    this.current = this.current + 1;
    return this.points[this.current - 1];
}

var MainScene = cc.Scene.extend({
    onEnter:function () {
        this._super();
        var layer = new GameLayer();
        this.addChild(layer);
    }
});

