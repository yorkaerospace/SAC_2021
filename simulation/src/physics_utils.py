class Derivative:


    def __init__(self):
        self._dx = 0.0
        self._dm = 0.0


    @property
    def dm(self):
        return self._dm


    @dm.setter
    def dm(self, new_dm):
        self._dm = new_dm


    @property
    def dx(self):
        return self._dx


    @dx.setter
    def dx(self, new_dx):
        self._dx = new_dx


class State:


    def __init__(self):
        self._mass = 0.0
        self._pos = 0.0
        self._vel = 0.0
        self._accel = 0.0
        self._momentum = 0.0


    def recalc_secondary_props(self):
        if self._mass > 0.0:
            self._vel = self._momentum / self._mass


    @property
    def mass(self):
        return self._mass


    @mass.setter
    def mass(self, new_mass):
        self._mass = new_mass
        self._momentum = self._mass * self._vel


    @property
    def pos(self):
        return self._pos


    @pos.setter
    def pos(self, new_pos):
        self._pos = new_pos


    @property
    def vel(self):
        return self._vel


    @vel.setter
    def vel(self, new_vel):
        self._vel = new_vel
        self._momentum = self._vel * self._mass


    @property
    def accel(self):
        return self._accel


    @accel.setter
    def accel(self, new_accel):
        self._accel = new_accel


    @property
    def momentum(self):
        return self._momentum


    @momentum.setter
    def momentum(self, new_momentum):
        self._momentum = new_momentum

        if self._mass > 0.0:
            self._vel = self._momentum / self._mass


class Particle:


    def __init__(self):
        self._state = State()
        self._total_force = 0.0
        self._forces = []


    def integrate(self, t, dt):
        change_with_time = self._euler(t, dt)
        self._state.momentum += change_with_time._dm * dt
        self._state.pos += change_with_time._dx * dt
        self._state.recalc_secondary_props()

        # Acceleration is calculated afterwards, because the simulation is force-based
        if(self._state.mass > 0.0):
            self._state.accel = change_with_time.dm / self._state.mass
        else:
            self._state.accel = 0.0


    @property
    def state(self):
        return self._state


    def _euler(self, t, dt):
        d1 = self._evaluate(self._state, t, 0.0, Derivative())
        d2 = self._evaluate(self._state, t, dt, d1)

        return d2


    def _evaluate(self, initialState, t, dt, derivative):
        """Takes a state and calculates the derivative of this new state at t + dt"""

        # `initialState` after time `dt`, given the derivative at time `t` is `derivative`
        nextState = State()
        nextState.mass = initialState.mass
        nextState.pos = initialState.pos + derivative.dx * dt
        nextState.momentum = initialState.momentum + derivative.dm * dt

        # calculate the velocity from the momentum
        nextState.recalc_secondary_props()

        # the derivative of the state at time (`t` + `dt`)
        output = Derivative()

        # rate of change of position is the velocity we just calculated in `recalc_secondary_props`
        output.dx = nextState.vel 
        # reset the total force acting on the particle
        self._total_force = 0.0
        self._forces = []

        # add all the forces for this timestep (have to be a function of current state and time)
        self.add_forces(nextState, t + dt)

        # recalculate the sum of all forces again
        self._total_force = sum(self._forces)

        # and this becomes the change in momentum for our output derivative
        output.dm = self._total_force

        return output
