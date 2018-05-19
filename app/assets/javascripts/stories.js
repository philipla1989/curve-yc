// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function bindMultiForms(){
  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
}

function bindAccordion(){
  var UID = {
    _current: 0,
    getNew: function(){
      this._current++;
      return this._current;
    }
  };
  HTMLElement.prototype.pseudoStyle = function(element,prop,value){
    var _this = this;
    var _sheetId = "pseudoStyles";
    var _head = document.head || document.getElementsByTagName('head')[0];
    var _sheet = document.getElementById(_sheetId) || document.createElement('style');
    _sheet.id = _sheetId;
    var className = "pseudoStyle" + UID.getNew();
    
    _this.className +=  " "+className; 
    
    _sheet.innerHTML += " ."+className+":"+element+"{"+prop+":"+value+"}";
    _head.appendChild(_sheet);
    return this;
  };

  $('.collapse').on('show.bs.collapse', function () {    
    var button = $(this.parentElement.parentElement).children().children().children()[0]
    button.pseudoStyle("after","transform","rotate(135deg)");    
    
  });
  $('.collapse').on('hidden.bs.collapse', function () {    
    var button = $(this.parentElement.parentElement).children().children().children()[0]    
    button.pseudoStyle("after","transform","rotate(45deg)");    
  });
  $('.collapse').collapse();
}