import * from universe;
import entities.*;
import future.*;
import telemetry.*;
import sensors.*;
import models.LMLM;

async init {

    discover entities(known | unknown);

    connect network;
    connect satellite;
    connect telemetry;
    connect vibration;
    connect thermal;
    connect telescope;

    matrix {
        energy.flow = dynamic;
        diversity = enabled;
        decision.engine = adaptive;
    }

    models {
        init LMLM;
        call all;
    }

    return main;
}
