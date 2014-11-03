
var GameLayer = cc.Layer.extend({
    _backgroundSprite:null,
    _shoveller: null,
    _frameCount: null,
    _footsteps: null,

    ctor:function() {
        this._super();

        this._footsteps = [];

        var size = cc.winSize;
        this.createBackground(size);

        // console.log("middle of the screen : {" + size.width / 2 + " : " + size.height / 2 + "}");
        this._shoveller = new Shoveller(size.width / 2, size.height /2);
        this.addChild(this._shoveller, 1);

        // console.log("Created myself");
        this._frameCount = 5;

        this.schedule(this.update, 0.1);
        return true;
    },

    update:function(dt) {
        // console.log("time elapsed : " + dt);

        if(this._shoveller.getNumberOfRunningActions() === 0)
        {
            var nextPosition = ShovellersPath.getCurrent();
            this._shoveller.moveToPoint(nextPosition);
        }

        this._shoveller.manageFootSteps(this, dt);
    },

    createBackground: function (winSize) {
        this._backgroundSprite = new cc.Sprite(res.SnowBackground_png);
        this._backgroundSprite.attr({
            x: winSize.width / 2,
            y: winSize.height / 2,
            scale: 1.0,
            rotation: 0
        });
        this.addChild(this._backgroundSprite, 0);
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