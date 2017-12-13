HTMLWidgets.widget({

  name: 'say',

  type: 'output',

  factory: function(el, width, height) {

    var synth = window.speechSynthesis;

    return {

      renderValue: function(x) {

        var message = new SpeechSynthesisUtterance(x.message);

        if (x.voice) {
          voiceList = synth.getVoices();
          for (var i = 0; i < voiceList.length; i++) {
            if (voiceList[i].name == x.voice) {
              message.voice = voiceList[i];
            }
          }
        }
        synth.speak(message);
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
