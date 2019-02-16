// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs

//= require activestorage

//= require jquery
//= require bootstrap-sprockets
//= require_tree .
//= require cocoon


$(function(){
  $('.dropdown-menu a').click(function(){
    //反映先の要素名を取得
    var visibleTag = $(this).parents('ul').attr('visibleTag');
    var hiddenTag = $(this).parents('ul').attr('hiddenTag');
    //選択された内容でボタンの表示を変える
    $(visibleTag).html($(this).attr('value'));
    //選択された内容でhidden項目の値を変える
    $(hiddenTag).val($(this).attr('value'));
  })
})