document.addEventListener('DOMContentLoaded', function() {



const tabs = document.querySelectorAll(".tabs li a");
const contents = document.querySelectorAll(".contents li");

console.log(tabs);
console.log(contents);



for (let i = 0; i < tabs.length; i++) {
tabs[i].addEventListener("click", function(e) {
  e.preventDefault();

  for (let j = 0; j < tabs.length; j++) {
    tabs[j].classList.remove("active");
  }
  for (let j = 0; j < contents.length; j++) {
    contents[j].classList.remove("active");
  }


  tabs[i].classList.add("active");
  contents[i].classList.add("active");
});
}




  
});
