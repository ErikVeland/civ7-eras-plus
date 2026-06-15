// Eras+ pacing readout: makes the selected pacing profile visible in-game by
// extending the age-progress ring tooltip in the sub-system dock with the
// active profile and current age progression points. Read-only UI.

const READOUT_RETRY_MS = 1000;
const READOUT_MAX_RETRIES = 60;

const PROFILE_NAME_TAGS = Object.freeze({
  ERAS_PLUS_PROFILE_VANILLA: "LOC_MOD_ERAS_PLUS_PROFILE_VANILLA",
  ERAS_PLUS_PROFILE_BALANCED: "LOC_MOD_ERAS_PLUS_PROFILE_BALANCED",
  ERAS_PLUS_PROFILE_BALANCED_PLUS: "LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS",
  ERAS_PLUS_PROFILE_BALANCED_PLUS_MODERN_STRETCH: "LOC_MOD_ERAS_PLUS_PROFILE_BALANCED_PLUS_MODERN_STRETCH",
  ERAS_PLUS_PROFILE_MODERN_STRETCH: "LOC_MOD_ERAS_PLUS_PROFILE_MODERN_STRETCH",
  ERAS_PLUS_PROFILE_MP_PACE: "LOC_MOD_ERAS_PLUS_PROFILE_MP_PACE",
});

function compose(tag, ...args) {
  try {
    const text = Locale.compose(tag, ...args);
    return text && text !== tag ? text : "";
  } catch (_error) {
    return "";
  }
}

function getActiveProfileValue() {
  try {
    const value = Configuration.getGame()?.getValue?.("ErasPlusPacingProfile");
    return typeof value === "string" ? value : "";
  } catch (_error) {
    return "";
  }
}

function getAgeProgress() {
  try {
    const manager = Game?.AgeProgressManager;
    if (!manager || manager.isFinalAge) {
      return null;
    }
    const current = Number(manager.getCurrentAgeProgressionPoints?.());
    const max = Number(manager.getMaxAgeProgressionPoints?.());
    if (!Number.isFinite(current) || !Number.isFinite(max) || max <= 0) {
      return null;
    }
    const percent = Math.max(0, Math.min(100, Math.round((current / max) * 100)));
    return { current, max, percent };
  } catch (_error) {
    return null;
  }
}

function buildReadoutLine() {
  const profileValue = getActiveProfileValue();
  const profileTag = PROFILE_NAME_TAGS[profileValue];
  if (!profileTag) {
    return ""; // unknown or unset profile: stay silent rather than guess
  }

  const profileName = compose(profileTag) || profileValue;
  const progress = getAgeProgress();
  if (!progress) {
    return compose("LOC_MOD_ERAS_PLUS_READOUT_PROFILE_ONLY", profileName)
      || `Eras+: ${profileName}`;
  }
  const composed = compose("LOC_MOD_ERAS_PLUS_READOUT", profileName, progress.current, progress.max);
  if (composed) {
    return composed.includes("%") ? composed : `${composed} (${progress.percent}%)`;
  }
  return `Eras+: ${profileName} — ${progress.current} / ${progress.max} age progress (${progress.percent}%)`;
}

function updateAgeRingTooltip() {
  const ring = document.querySelector?.(".ring-age");
  if (!ring) {
    return false;
  }

  const line = buildReadoutLine();
  if (!line) {
    return true;
  }

  const base = compose("LOC_UI_VICTORY_PROGRESS") || "Victory Progress";
  const content = `${base}[N]${line}`;
  if (ring.getAttribute("data-tooltip-content") !== content) {
    ring.setAttribute("data-tooltip-content", content);
  }
  return true;
}

function scheduleInitialAttach(attempt = 0) {
  try {
    if (updateAgeRingTooltip()) {
      return;
    }
  } catch (error) {
    console.warn("Eras+: readout update failed", error);
    return;
  }
  if (attempt < READOUT_MAX_RETRIES) {
    setTimeout(() => scheduleInitialAttach(attempt + 1), READOUT_RETRY_MS);
  }
}

engine.whenReady.then(() => {
  try {
    const refresh = () => {
      try {
        updateAgeRingTooltip();
      } catch (_error) {
      }
    };
    for (const eventName of ["LocalPlayerTurnBegin", "AgeProgressionChanged"]) {
      try {
        engine.on(eventName, refresh);
      } catch (_error) {
      }
    }
    scheduleInitialAttach();
  } catch (error) {
    console.error("Eras+: readout init failed", error);
  }
});
