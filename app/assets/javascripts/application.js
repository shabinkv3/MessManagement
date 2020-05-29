    


    async function createModal() {
      const modal = await modalController.create({
        component: 'modal-content',
        cssClass: 'addstaff'
      });

      await modal.present();
      currentModal = modal;
    }

    function createStaff()
    {
        var token = document.querySelector('meta[name="csrf-token"]').content;
        var xmlhttp, myObj;
        name=document.getElementById('staffname').value;
        phoneno=document.getElementById('staffno').value;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        myObj = JSON.parse(this.responseText);
        if(myObj.added)
        {
            dismissModal();
            getStaffs();
        }
        else
        {
            alert(myObj.errors);
        }
        }
};
xmlhttp.open("POST", "/createstaff", true);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader('X-CSRF-Token', token);
xmlhttp.send("staff[name]="+name+"&staff[phoneno]="+phoneno);

    }

    function dismissModal() {
      if (currentModal) {
        currentModal.dismiss().then(() => { currentModal = null; });
      }
    }








function viewOption(evt, option) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("side_tabs");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace("active", "");
  }
  evt.currentTarget.className += " active";
  document.getElementById(option).style.display = "block";  
  if (option=="student_list")
  {
    getStudents();
  }
  if (option=="staff_list")
  {
    getStaffs();
  }
}

function getStudents()
{
    var obj, dbParam, xmlhttp, myObj, x, txt = "";
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        myObj = JSON.parse(this.responseText);
        if(myObj.length==0)
        {
            txt+="<p style='text-align: center;'>There are no Students in this mess currently</p>"
            document.getElementById("search_section").innerHTML = txt;
        }
        else
        {
        txt += "<p id='noMatch' style='text-align:center;display:none;'>No matching students</p><ion-card id='students_card'><ion-list>"
        for (x in myObj) {
            txt += "<ion-item class='student_item' lines='none' detail='true' href='/accounts/login'><ion-icon name='person' style='color: #8f15f4;'></ion-icon><ion-grid><ion-row><ion-col size='6'><label class='student_name' style='padding-left: 15px; font-size: 17px; font-weight: 500;'>" + myObj[x].name + "</label></ion-col><ion-col size='4' offset='2'><label class='student_roll_no'>"+myObj[x].rollno+"</label></ion-col></ion-row></ion-item>";
        }
    txt += "</ion-list></ion-card></ion-grid>";  
    document.getElementById("list").innerHTML = txt;
}
  }
};
xmlhttp.open("GET", "/studentdata", true);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.send();

}


function getStaffs()
{
    document.getElementById("stafflist").innerHTML = '<ion-spinner style="position:relative; left: 50px; top:70px"></ion-spinner>';   
    var obj, dbParam, xmlhttp, myObj, x, txt = "";
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        myObj = JSON.parse(this.responseText);
        if(myObj.length==0)
        {
            txt+="<p style='text-align: center;'>There are no Staffs in this mess currently</p>"
            document.getElementById("stafflist").innerHTML = txt;
        }
        else
        {
        txt += "<p id='noMatch' style='text-align:center;display:none;'>No matching students</p><ion-card id='students_card'><ion-list>"
        for (x in myObj) {
            txt += "<ion-item class='student_item' lines='none' href=#><ion-icon name='person' style='color: #8f15f4;'></ion-icon><ion-grid><ion-row><ion-col size='6'><label class='student_name' style='padding-left: 15px; position:relative; top: 4px;font-size: 17px; font-weight: 500;'>" + myObj[x].name + "</label></ion-col><ion-col size='3.5' offset='1.3'  ><ion-icon style='position:relative; top: 4px;color: #8f15f4; font-size:23px;' name='call'></ion-icon><label style='padding-left: 7px;' class='student_roll_no'>"+myObj[x].phoneno+"</label></ion-col><ion-col size='1.2'><ion-buttons><ion-button onClick='deleteAlert("+myObj[x].id+")' slot='icon-only'><ion-icon name='trash' style='color:red;font-size: 25px;'></ion-icon></ion-button></ion-buttons></ion-col></ion-row></ion-item>";
        }
    txt += "</ion-list></ion-card></ion-grid>";  
    document.getElementById("stafflist").innerHTML = txt;
}
  }
};
xmlhttp.open("GET", "/staffdata", true);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.send();

}

async function deleteAlert(id) {
      const alert = await alertController.create({
        header: 'Are you sure to delete this staff?',
        buttons: [
        {
          text: 'Yes',
          cssClass: 'alertbuttonyes',
          handler: () => {
            deleteStaff(id);
          }
        }, {
          text: 'No',
          cssClass: 'alertbuttonno'
        }
      ]
      });

      await alert.present();
    }

function deleteStaff(id)
{
    var token = document.querySelector('meta[name="csrf-token"]').content;
    var obj, dbParam, xmlhttp, myObj, x, txt = "";
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        myObj = JSON.parse(this.responseText);
        if(myObj.deleted)
        {
            getStaffs();
        }
        
  }
};
xmlhttp.open("POST", "/deletestaff", true);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader('X-CSRF-Token', token);
xmlhttp.send("staff[id]="+id);

}



function filterStudentsByName() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("nameSearchBar");
    filter = input.value.toUpperCase();
    names = document.getElementsByClassName("student_name");
    items = document.getElementsByClassName("student_item");
    var count=0
    for (i = 0; i < names.length; i++) {
        txtValue = names[i].textContent || names[i].innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            items[i].style.display = "";
            document.getElementById("students_card").style.display="";
            document.getElementById("noMatch").style.display="none";
        } else {
            count+=1
            items[i].style.display = "none";
        }
    }
    if(count==names.length)
    {
        document.getElementById("noMatch").style.display="";
        document.getElementById("students_card").style.display="none";
    }
}

function filterStudentsByRollNo() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("rollSearchBar");
    filter = input.value.toUpperCase();
    rolls = document.getElementsByClassName("student_roll_no");
    items = document.getElementsByClassName("student_item");
    var count=0
    for (i = 0; i < rolls.length; i++) {
        txtValue = rolls[i].textContent || rolls[i].innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            items[i].style.display = "";
            document.getElementById("students_card").style.display="";
            document.getElementById("noMatch").style.display="none";
        } else {
            count+=1
            items[i].style.display = "none";
        }
    }
    if(count==names.length)
    {
        document.getElementById("noMatch").style.display="";
        document.getElementById("students_card").style.display="none";
    }
}
