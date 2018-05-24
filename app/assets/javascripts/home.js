function dynamicFilter(){
  $("#iniCareerSelect").on("change", function(){
    var career = this.value;
    var type = "ini_career"
    if($("#subCareerSelect option:selected").text() == "Anything"){
      makeCall(career, type)
    }
  });

  $("#subCareerSelect").on("change", function(){
    var career = this.value;
    var type = "sub_career"
    if($("#iniCareerSelect option:selected").text() == "Anything"){
      makeCall(career, type)
    }
  });

  function makeCall(career, type){
     var request = $.ajax({
      type: 'GET',
      url:  '/dynamic_filter',
      data: { career: career, type: type },
      dataType: 'JSON'
    });
    request.done(function (response) {
      var values = response[0];
      var type = response[1];
      var option = '<option value="Anything">' + "Anything" + '</option>';
      for (var i=0;i<values.length;i++){
        option += '<option value="'+ values[i] + '">' + values[i] + '</option>';
      }
      if(type == "ini_career"){
        $("select[name='sub_career_path']").html("");
        $("select[name='sub_career_path']").append(option);
      }
      else{
        $("select[name='ini_career_path']").html("");
        $("select[name='ini_career_path']").append(option);
      }
    });
  }
}

function browseFilter(){
  $("#browseExploreSelect").on("change", function(){    
    var career = this.value;
    var type = "explore"    
    makeCall(career, type)    
  });

  $("#browsePursueSelect").on("change", function(){
    var career = this.value;
    var type = "pursue"    
    makeCall(career, type)
  });

  function makeCall(career, type){
    if(career == ""){      
      window.location.href = "/browse/" + type;
    }else
    {
      var request = $.ajax({
        type: 'GET',
        url:  '/browse_by',
        data: { career: career, type: type },
        dataType: 'script'
      });
    }    
  }
}