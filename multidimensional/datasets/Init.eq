dataset Earth {

    dimensions:{
        space
        time
        location
        latitude
        longitude
        altitude
        temperature
        pressure
        vibration
        humidity
        energy
        crust
    }

    entities {
        sensors
        satellites
        drones
        telescopes
    }

}

query {

    where
        location == "_"
        &&
        temperature > (*_*)
        &&
        vibration > threshold
        &&
        satellite == active

    predict earthquake;
}
