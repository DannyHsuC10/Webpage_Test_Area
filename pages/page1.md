---
layout: base
---

# Title

## Subtitle

One truss with two joint

$$F = ma$$

<section class="calculator" aria-labelledby="force-calculator-title">
  <h3 id="force-calculator-title">Force Calculator</h3>

  <div class="calculator-grid">
    <label>
      Mass, m
      <input id="mass-input" type="number" step="any" placeholder="kg">
    </label>

    <label>
      Acceleration, a
      <input id="acceleration-input" type="number" step="any" placeholder="m/s^2">
    </label>

    <label>
      Force, F
      <input id="force-output" type="text" readonly placeholder="N">
    </label>
  </div>

  <button id="calculate-force-button" type="button">Calculate</button>
  <p id="force-message" class="calculator-message" role="status"></p>
</section>

<script>
  const massInput = document.getElementById("mass-input");
  const accelerationInput = document.getElementById("acceleration-input");
  const forceOutput = document.getElementById("force-output");
  const message = document.getElementById("force-message");
  const calculateButton = document.getElementById("calculate-force-button");

  calculateButton.addEventListener("click", () => {
    const massText = massInput.value.trim();
    const accelerationText = accelerationInput.value.trim();

    if (massText === "" || accelerationText === "") {
      forceOutput.value = "";
      message.textContent = "Please enter both mass and acceleration.";
      return;
    }

    const mass = Number(massText);
    const acceleration = Number(accelerationText);

    if (!Number.isFinite(mass) || !Number.isFinite(acceleration)) {
      forceOutput.value = "";
      message.textContent = "Please enter both mass and acceleration.";
      return;
    }

    const force = mass * acceleration;
    forceOutput.value = `${force} N`;
    message.textContent = `F = ${mass} x ${acceleration} = ${force} N`;
  });
</script>

$x = 5\pi$
