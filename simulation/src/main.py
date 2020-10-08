from launch_vehicle import LaunchVehicle
from plotter import Plotter


def main():
    lv = LaunchVehicle()
    plotter = Plotter()

    # Initialise state
    time_s = 0.0
    dt = 0.0005

    # Run simulation
    print("Simulating flight...")
    while(time_s < 4.0 or lv.state.pos > 0.0):
        lv.update(time_s, dt)
        plotter.serialise(time_s, lv)
        time_s += dt

    # Show results
    print("Complete.")
    plotter.display_results(lv._motor.motor_name+".png")


if __name__ == '__main__':
    main()
