$(document).ready(function(){
    // $('#all').click(function(){
    //   $('.accident').show();
    //   $('.road_hazard').show();
    //   $('.animal').show();
    // })

    $('.accident').click(function(){
      $('.accident').show();
      $('.road_hazard').hide();
      $('.animal').hide();
    })

    // $('#road_hazard').click(function(){
    //   $('.accident').hide();
    //   $('.road_hazard').show();
    // })

    // $('#animal').click(function(){
    //   $('.accident').hide();
    //   $('.road_hazard').show();
    // })

  });