import matplotlib.pyplot as plt
import matplotlib.transforms as transforms


class Plotter:


    def __init__(self):
        self._time_hist = list()
        self._altitude_hist = list()
        self._velocity_hist = list()
        self._accel_hist = list()
        self._mass_hist = list()


    def serialise(self, time_s, launch_vehicle):
        self._time_hist.append(time_s)
        self._altitude_hist.append(launch_vehicle.state.pos)
        self._velocity_hist.append(launch_vehicle.state.vel)
        self._accel_hist.append(launch_vehicle.state.accel)
        self._mass_hist.append(launch_vehicle.state.mass)


    def display_results(self, save=None):
        markers_on = [12, 17, 18, 19]

        fig, ((alt_plot, vel_plot), (accel_plot, mass_plot)) = plt.subplots(2, 2)

        alt_plot.set_title("Altitude vs Time")
        alt_plot.set_xlabel("Time (s)")
        alt_plot.set_ylabel("Altitude (m)")
        alt_plot.plot(self._time_hist, self._altitude_hist, '-gD', markevery=markers_on)
        alt_plot.axhline(color='r', y=3048, linestyle='--', alpha=0.5)
        trans = transforms.blended_transform_factory(alt_plot.get_yticklabels()[0].get_transform(), alt_plot.transData)
        alt_plot.text(0, 3048, "target", transform=trans, color="r", ha="right", va="center", bbox=dict(fc='white', lw=0))
        alt_plot.fill_between(self._time_hist, self._altitude_hist)
        alt_plot.grid(True)

        vel_plot.set_title("Velocity vs Time")
        vel_plot.set_xlabel("Time (s)")
        vel_plot.set_ylabel("Velocity (m/s)")
        vel_plot.plot(self._time_hist, self._velocity_hist, '-gD', markevery=markers_on)
        vel_plot.fill_between(self._time_hist, self._velocity_hist)
        vel_plot.grid(True)

        accel_plot.set_title("Acceleration vs Time")
        accel_plot.set_xlabel("Time (s)")
        accel_plot.set_ylabel("Acceleration (m/s^2)")
        accel_plot.plot(self._time_hist, self._accel_hist, '-gD', markevery=markers_on)
        accel_plot.fill_between(self._time_hist, self._accel_hist)
        accel_plot.grid(True)

        mass_plot.set_title("Mass vs Time")
        mass_plot.set_xlabel("Time (s)")
        mass_plot.set_ylabel("Mass (kg)")
        mass_plot.plot(self._time_hist, self._mass_hist, '-gD', markevery=markers_on)
        mass_plot.fill_between(self._time_hist, self._mass_hist)
        mass_plot.grid(True)

        fig.tight_layout()
        if save is not None:
            print("saving as:", save)
            plt.savefig(save+str(launch_vehicle.state.mass), orientation='landscape')
        plt.show()
