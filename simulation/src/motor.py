import os
import pathlib

import numpy as np
import thrustcurve


class Motor:


    MOTOR_DATA_DIR = os.path.join(pathlib.Path(__file__).parent.absolute(), "../res/motor_files/")


    def __init__(self, motor_name):
        self._burn_data = None
        self._dry_mass = 0.0
        self._prop_mass = 0.0
        self._diameter = 0.0

        motor_data_file_path = os.path.join(Motor.MOTOR_DATA_DIR, motor_name) + ".rse"
        self._extract_data_from(motor_data_file_path)


    def _extract_data_from(self, rse_file_path):
        with open(rse_file_path, "r") as rse_file:
            file_contents = rse_file.read()

        motors = thrustcurve.loads(file_contents)
        print("motors: " + str(motors))
        m = motors[0]

        self._burn_data = m.data

        # takes the motor details and splits it into a list of useful details, tags on even numbers details on odd
        motor_details = file_contents[file_contents.find("<engine "):file_contents.find("<comments>")-1].replace("\n", "=").replace('"', "").replace(" ", "=").split("=")[2:]
        self._prop_mass = float(motor_details[13])/1000
        self._dry_mass = float(motor_details[11])/1000 - self._prop_mass
        self._diameter = float(motor_details[7])/1000
        self._length = float(motor_details[9])/1000


    def thrust_at(self, time_s):
        return float(np.interp([time_s], self._burn_data['time'], self._burn_data['force']))


    def prop_mass_at(self, time_s):
        mass_g = float(np.interp([time_s], self._burn_data['time'], self._burn_data['mass']))
        return mass_g / 1000.0


    @property
    def burn_data(self):
        return self._burn_data


    @property
    def dry_mass(self):
        return self._dry_mass


    @property
    def diameter(self):
        return self._diameter
