

window.addEventListener("message", function (event) {
    let data = event.data;

    if (data.action == "update_hud") {
        document.getElementById("idKaros").innerHTML = data.id

        HealthIndicator.animate(data.health / 100);
        HungerIndicator.animate(data.hunger / 100);
        ThirstIndicator.animate(data.thirst / 100);
        ArmorIndicator.animate(data.armor / 100);
        OxygenIndicator.animate(data.oxygen / 100);
        StressIndicator.animate(data.stress / 100);
        StaminaIndicator.animate(data.stamina / 100);
    }

    // RANGE DEL VOCALE
    if (data.action == "voice_level") {
        switch (data.voicelevel) {
            case 1:
                data.voicelevel = 33;
                break;
            case 2:
                data.voicelevel = 66;
                break;
            case 3:
                data.voicelevel = 100;
                break;
            default:
                data.voicelevel = 33;
                break;
        }
        VoiceIndicator.animate(data.voicelevel / 100);
    }


    // VOCE DEL VOCALE
    if (data.talking == 1) {
        VoiceIndicator.path.setAttribute("stroke", "yellow");
        // console.log("Stai parlando!");
    } else if (data.talking == false) {
        VoiceIndicator.path.setAttribute("stroke", "darkgrey");
        // console.log("Non stai parlando.");
    }

    if (data.radio == true) {
        $("#VoiceIcon").removeClass("fa-solid fa-microphone-slash");
        $("#VoiceIcon").addClass("fa-solid fa-headset");
    } else if (data.radio == false) {
        $("#VoiceIcon").removeClass("fa-solid fa-headset"); 
        $("#VoiceIcon").addClass("fa-solid fa-microphone-slash");   
    }

    // STRESS DISABILITATO
    if (data.action == "disable_stress") {
        $("#StressIndicator").hide();
    }

    // VOCE DISABILITATA
    if (data.action == "disable_voice") {
        $("#VoiceIndicator").hide();
    }

    // OSSIGGENO
    if (data.showOxygen == true) {
        $("#OxygenIndicator").show();
    } else if (data.showOxygen == false) {
        $("#OxygenIndicator").hide();
    }
    // STAMINA
    if (data.stamina == true) {
        // console.log('sta correndo')
        $("#StaminaIndicator").show();

    } else if (data.stamina == false) {
        // console.log('Non sta correndo')
        $("#StaminaIndicator").hide();
    }
    // STRESS
    if (data.stress == 0) {
        $("#StressIndicator").fadeOut();
      } else if (data.stress > 0) {
        $("#StressIndicator").fadeIn();
      }

    // ARMATURA
    if (data.armor == 0) {
        $("#ArmorIndicator").fadeOut();
    } else if (data.armor > 0) {
        $("#ArmorIndicator").fadeIn();

    }

    // VITA
    if (data.health < 0) {
        HealthIndicator.animate(0);
        $("#hp-icon").removeClass("fa-solid fa-heart-pulse");
        $("#hp-icon").addClass("fa-solid fa-skull"); 
    } else if (data.health > 0) {
        $("#hp-icon").removeClass("fa-solid fa-skull");
        $("#hp-icon").addClass("fa-solid fa-heart-pulse");
    }
    // ACQUA
    if (data.thirst < 25) {
        $("#ThirstIcon").addClass("flash");
    }
    // CIBO
    if (data.hunger < 25) {
        $("#HungerIcon").addClass("flash");
    }

    // CONTACHILOMETRI
    if (data.speed > 0) {
        $("#SpeedIndicator").text(data.speed);
        let multiplier = data.maxspeed * 0.1;
        let SpeedoLimit = data.maxspeed + multiplier;
        Speedometer.animate(data.speed / SpeedoLimit);
        Speedometer.path.setAttribute("stroke", "none");

        if (data.speed >= 100) {
            $("#SpeedIndicator").css("color", "rgba(255, 255, 255)"); // colore rosso..
        } else {
            $("#SpeedIndicator").css("color", "rgba(255, 255, 255, 0.582)");
        }
    } else if (data.speed == 0) {
        $("#SpeedIndicator").text("0");
        $("#SpeedIndicator").css("color", "rgba(255, 255, 255, 0.582)");
        Speedometer.path.setAttribute("stroke", "none");
    }

    if (data.showSpeedo == true) {
        $("#VehicleContainer").fadeIn();
    } else if (data.showSpeedo == false) {
        $("#VehicleContainer").fadeOut();
    }
    // CINTURA
    if (data.action == "update_cintura") {
        if (data.cintura == false) {

            $("#IndicatoreCintura").removeClass("fa-compress-alt2");
            $("#IndicatoreCintura").addClass("fa-compress-alt");
            $("#IndicatoreCintura").css("color", "white");

        } else if (data.cintura == true) {

            $("#IndicatoreCintura").addClass("fa-compress-alt2");
            $("#IndicatoreCintura").css("color", "rgb(208, 255, 0)");
        }
    }
    // CRUISE CONTROL
    if (data.action == "update_cruise") {
        if (data.cruise == false) {

            $("#IndicatoreCruise").removeClass("fa-gauge-simple-high");
            $("#IndicatoreCruise").addClass("fa-gauge-simple-high");
            $("#IndicatoreCruise").css("color", "white");
        } else if (data.cruise == true) {

            $("#IndicatoreCruise").addClass("fa-gauge-simple-high");
            $("#IndicatoreCruise").css("color", "rgb(208, 255, 0)");
        }
    }
    // BENZINA
    if (data.action == "update_fuel") {
        let finalfuel = (data.fuel / 100) * 1;
        if (finalfuel > 0.9) {
            FuelIndicator.animate(1.0);
        } else if (finalfuel < 0.9) {
            FuelIndicator.animate(finalfuel);
        }
        if (finalfuel < 0.2) {
            FuelIndicator.path.setAttribute("stroke", "red");
        } else if (finalfuel > 0.2) {
            FuelIndicator.path.setAttribute("stroke", "white");
        }
    }

    if (data.showFuel == true) {
        $("#FuelCircle").show();
    } else if (data.showFuel == false) {
        $("#FuelCircle").hide();
    }

    // CONTENITORE HUD
    if (data.showUi == true) {
        $(".container").show();
    } else if (data.showUi == false) {
        $(".container").hide();
    }

    if (data.action == "toggle_hud") {
        $("body").fadeToggle()
    }

    // AUDIO DELLA CINTURA
    var audioPlayer = null;
    if (data.transactionType == "playSound") {

        if (audioPlayer != null) {
            audioPlayer.pause();
        }

        audioPlayer = new Audio("./sounds/" + data.transactionFile + ".ogg");
        audioPlayer.volume = data.transactionVolume;
        audioPlayer.play();
    }

});