$(document).ready(function () {
  HealthIndicator = new ProgressBar.Circle("#HealthIndicator", {
    color: "#1cd97a",
    trailColor: "rgb(35, 36, 39)",
    strokeWidth: 5,
    trailWidth: 5,
    duration: 250,
    easing: "easeInOut",
  });

  ArmorIndicator = new ProgressBar.Circle("#ArmorIndicator", {
    color: "#2f3beb",
    trailColor: "rgb(35, 36, 39)",
    strokeWidth: 5,
    trailWidth: 5,
    duration: 250,
    easing: "easeInOut",
  });

  HungerIndicator = new ProgressBar.Circle("#HungerIndicator", {
    color: "#ffbe4d",
    trailColor: "rgb(35, 36, 39)",
    strokeWidth: 5,
    trailWidth: 5,
    duration: 250,
    easing: "easeInOut",
  });

  ThirstIndicator = new ProgressBar.Circle("#ThirstIndicator", {
    color: "#91e4ff",
    trailColor: "rgb(35, 36, 39)",
    strokeWidth: 5,
    trailWidth: 5,
    duration: 250,
    easing: "easeInOut",
  });


  OxygenIndicator = new ProgressBar.Circle("#OxygenIndicator", {
    color: "rgb(0, 140, 255)",
    trailColor: "rgb(35, 36, 39)",
    strokeWidth: 5,
    trailWidth: 5,
    duration: 250,
    easing: "easeInOut",
  });

  StaminaIndicator = new ProgressBar.Circle("#StaminaIndicator", {
    color: "#ff21de",
    trailColor: "rgb(35, 36, 39)",
    strokeWidth: 5,
    trailWidth: 5,
    duration: 250,
    easing: "easeInOut",
  });

  StressIndicator = new ProgressBar.Circle("#StressIndicator", {
    color: "#F03E3E",
    trailColor: "rgb(35, 36, 39)",
    strokeWidth: 5,
    trailWidth: 5,
    duration: 250,
    easing: "easeInOut",
  });

  Speedometer = new ProgressBar.Circle("#SpeedCircle", {
  });
  IndicatoreCintura = new ProgressBar.Circle("#CerchioCintura", {
  });
  IndicatoreCruise = new ProgressBar.Circle("#CerchioCruise", {
  });

  FuelIndicator = new ProgressBar.Circle("#FuelCircle", {
    color: "#6cf59c",
    trailColor: "rgb(35, 36, 39)",
    strokeWidth: 5,
    trailWidth: 5,
    duration: 100,
    easing: "easeInOut",
  });

  VoiceIndicator = new ProgressBar.Circle("#VoiceIndicator", {
    color: "#edff69",
    trailColor: "rgb(35, 36, 39)",
    strokeWidth: 5,
    trailWidth: 5,
    duration: 250,
    easing: "easeInOut",
  });
  VoiceIndicator.animate(0.66);
});

// Krs