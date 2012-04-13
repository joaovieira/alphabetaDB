// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

$(function() {
    //Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
	$("h2.trigger").click(function(){
		$(this).toggleClass("active").next().toggle();
		return false; //Prevent the browser jump to the link anchor
	});

    $(".toggler").click(function(){
		$(this).toggleClass("closed").parent().next().slideToggle('fast');
		return false; //Prevent the browser jump to the link anchor
	});

    $("#chars th a, #scripts th a, #sounds th a, #glyphs th a").live("click", function() {
      $.getScript(this.href);
      return false;
    });

    $("#chars_search").submit(function() {
      $.get(this.action, $(this).serialize(), null, "script");
      return false;
    });

    $('.selector').qtip({
        content: function(){
             return $(this).next().clone();
        }
    });

    $("#jquery_jplayer_1").jPlayer({
        ready: function () {
          $(this).jPlayer("setMedia", {
            mp3: $('audio').attr('src')
          });
        },
        supplied: "mp3"
      });
});