sensor vibration;
sensor thermal;
sensor gps;
sensor camera;

on vibration.change {
    analyze();
    notify();
}
