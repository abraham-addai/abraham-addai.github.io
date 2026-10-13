// Progressive enhancement only. The page works without JavaScript;
// this file adds the light/dark theme toggle.

(function () {
  var root = document.documentElement;
  var toggle = document.querySelector(".theme-toggle");
  if (!toggle) return;

  var media = window.matchMedia("(prefers-color-scheme: dark)");

  function currentTheme() {
    return root.dataset.theme || (media.matches ? "dark" : "light");
  }

  function updateButton() {
    var next = currentTheme() === "dark" ? "light" : "dark";
    toggle.setAttribute("aria-label", "Switch to " + next + " theme");
  }

  toggle.addEventListener("click", function () {
    var next = currentTheme() === "dark" ? "light" : "dark";
    root.dataset.theme = next;
    try {
      localStorage.setItem("theme", next);
    } catch (e) {}
    updateButton();
  });

  media.addEventListener("change", updateButton);
  updateButton();
})();
