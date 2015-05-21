$(window).load(function(){
  if($('.box_loader').length > 0){
    setTimeout(function() {
      location.reload();
    }, 4000)
  }
})