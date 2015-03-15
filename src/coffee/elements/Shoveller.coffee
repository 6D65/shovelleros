Shoveller = cc.Sprite.extend({
    _footSteps : null,
    _footStepsTimer : null,
    _FOOTSTEPS_TIMER_LENGTH : 3,
    _FOOTSTEPS_LIFE_LENGHT : 5,

    ctor: (x_, y_) ->
        @_super(res.Shoveller_png)
        @attr({x: x_, y: y_, scale: 0.75})
        @init()

    init: () ->
        @_footSteps = []
        @_footStepsTimer = @_FOOTSTEPS_TIMER_LENGTH

    moveToPoint: (nextPosition) ->
        rotationAngle = @getRotationAngle(nextPosition)

        @runAction(
            cc.sequence(
                cc.rotateTo(1, 90 + rotationAngle),
                cc.moveTo(2, 
                    cc.p(nextPosition.x, nextPosition.y)
                    )
                )
            )

    createFootSteps: () ->
        footsteps = new Footsteps(@x, @y)
        footsteps.attr({rotation: @rotation})
        return footsteps

    getRotationAngle: (nextPosition) ->
        angle = Math.atan2(@y - nextPosition.y, 
                               nextPosition.x - @x )
        return angle * (180/Math.PI)

    manageFootSteps: (parentLayer, dt) ->
        if(@isTimeToCreateFootSteps())
            steps = @createFootSteps()
            @_footSteps.push({steps: steps, time: 0})
            parentLayer.addChild(steps, 0)

        for step in @_footSteps
            step.time += dt
            if (step.time > @_FOOTSTEPS_LIFE_LENGHT) 
                parentLayer.removeChild(step.steps)

#        for (i = @_footSteps.length - 1 i >= 0 i--)
#            @_footSteps[i].time += dt
#            if(@_footSteps[i].time > @_FOOTSTEPS_LIFE_LENGHT)
#                parentLayer.removeChild(@_footSteps[i].steps)

    isTimeToCreateFootSteps: () ->
        current = @_footStepsTimer

        if(current == 0)
            @_footStepsTimer = @_FOOTSTEPS_TIMER_LENGTH
        @_footStepsTimer -= 1

        return current == 0 ? true : false
})