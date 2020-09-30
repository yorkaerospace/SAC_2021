import math

from ambiance import Atmosphere

from motor import Motor
from physics_utils import Particle


class LaunchVehicle(Particle):


    def __init__(self):
        super().__init__()
        self._motor = Motor("Cesaroni_L395")
        # Other mass of the LV, excluding payload and motor
        self._misc_extra_mass = 4.5
        self._payload_mass = 4.0
        self._reached_apogee = False
        self._diameter = self._motor.diameter
        self._frontal_area = math.pi * (0.5 * self._diameter)**2.0
        # "A typical value for the drag coefficient of a model rocket is .75)
        # https://www.grc.nasa.gov/WWW/K-12/rocket/shaped.html
        self._drag_coefficient = 0.75


    def update(self, time_s, dt):
        self._reached_apogee = self._has_reached_apogee()
        self._update_total_mass(time_s)

        self.integrate(time_s, dt)

        self._keep_above_ground()


    def _has_reached_apogee(self):
        s = self.state

        if(self._reached_apogee):
            # Ensures this variable only changes once
            return True
        else:
            return s.pos > 10.0 and s.vel < 1.0 and s.accel < 0.0


    def _update_total_mass(self, time_s):
        total_mass = 0.0

        # Airframe, avionics etc. mass
        total_mass += self._misc_extra_mass

        # Motor and propellant mass
        total_mass += self._motor.dry_mass
        total_mass += self._motor.prop_mass_at(time_s)

        # Basic simulation of payload deployment
        if not self._reached_apogee:
            total_mass += self._payload_mass

        self.state.mass = total_mass


    def _keep_above_ground(self):
        s = self.state

        if(s.pos < 0.0):
            s.pos += s.pos * -1.0
            s.vel = 0.0
            s.accel = 0.0
            s.momentum = 0.0


    def add_forces(self, state, t):
        # Weight
        weight = -9.80665 * state.mass
        self._forces.append(weight)

        # Thrust
        thrust = self._motor.thrust_at(t)
        self._forces.append(thrust)

        # (Very) rough approximation of drag
        air_density = float(Atmosphere(state.pos).density)
        drag = 0.5 * self._frontal_area * air_density * -(state.vel**2.0) * self._drag_coefficient
        self._forces.append(drag)
