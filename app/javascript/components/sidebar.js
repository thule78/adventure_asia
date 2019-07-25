const open = document.querySelector('#open');
open.addEventListener('click', function() {
  document.getElementById("mySidebar").style.width = "300px";
  document.getElementById("main").style.marginLeft = "300px";
});

const close = document.querySelector('#close');
close.addEventListener('click', function() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
});

export { open, close };
