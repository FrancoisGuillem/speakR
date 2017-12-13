HTMLWidgets.widget({

  name: 'voices',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance
    var synth = window.speechSynthesis;

    return {

      renderValue: function(x) {

        var voices = synth.getVoices();

        var htmlcontent = "<table><tr><th>Voice name</th><th>Lang</th></tr>";
        for (var i = 0; i < voices.length; i++) {
          htmlcontent += "<tr><td>" + voices[i].name + "</td><td>" + voices[i].lang + "</td></tr>";
        }

        htmlcontent += "</table>";
        el.innerHTML = htmlcontent;
        el.style.overflow = "auto";
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
