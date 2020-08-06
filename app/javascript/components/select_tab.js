const selectTab = () => {
  const tabLinks = document.querySelectorAll(".tab-underlined");
  const tabContents = document.querySelectorAll(".post-item");
  if(!tabLinks) && (!tabContent) {
    return
  }
  tabContents.forEach((tabContent) => {
    tabContent.style.display = "none"
  })
  tabLinks.forEach((tabLink) => {
    tabLink.addEventListener('click', (e) => {
      e.preventDefault();
      console.log(tabLink);
      console.log(e.currentTarget);
      tabLink.classList.toggle("active");
    });
  })
}

export { selectTab }


// function openCity(evt, cityName) {
//   // Declare all variables
//   var i, tabcontent, tablinks;

//   // Get all elements with class="tabcontent" and hide them
//   tabcontent = document.getElementsByClassName("tabcontent");
//   for (i = 0; i < tabcontent.length; i++) {
//     tabcontent[i].style.display = "none";
//   }

//   // Get all elements with class="tablinks" and remove the class "active"
//   tablinks = document.getElementsByClassName("tablinks");
//   for (i = 0; i < tablinks.length; i++) {
//     tablinks[i].className = tablinks[i].className.replace(" active", "");
//   }

//   // Show the current tab, and add an "active" class to the button that opened the tab
//   document.getElementById(cityName).style.display = "block";
//   evt.currentTarget.className += " active";
// }
