 # Weekly Assignment #4

<div id="header" align="center">
<h2>
  This weeks assignment will be Multi-Navigation Stacked App
</h2>
</div>

  
 <div align="center">
<img src = "https://github.com/SiGMobileUIUC/WeeklyAssignments/blob/main/pictures/weekly_assignment_4.gif?raw=true" width= "200"/>
</div>

<div align="left">

---

<div>
<img src = "https://raw.githubusercontent.com/devicons/devicon/master/icons/flutter/flutter-original.svg" width = "50px">
</div>
 
-:scroll: To begin the assignment you may want to keep up the meeting slides or the flutter documentation since there's a lot of different parts to this weekly assignment.

-:coin: After getting your debugger/emulator setup you will want to create 3 stateful widgets, one to hold each of the 3 major screens that we will use in this weekly assignment. The first being the main page that we will use to navigate to the other 2. The 2nd and 3rd widgets will be a screen for the bottom navigation bar and the other one being for the navigation rail.
 
-:mailbox: Now before we get into each of the screens we will want to create the routes to each screen inside the MyApp class, inside the Material App specifically. In this widget you will want to write routes: {}, which will contain a route name, context to pass in, and a destination for each route (In this case it's the bottom navigation bar and navigation rail screen)

-:e-mail: In the Home Page you will want to create a row for 2 buttons, one that will navigate you to the screen with bottom navigation bar. In this textButton you will want a text saying "Go to bottom navigation bar" with an onPressed function that calls Navigator.pushNamed(conext, '/routeForBottomNavigationBar')

-:pen: For the textButton to navigate to the navigation rail you will want to do a similar thing except have a text saying "Go to navigation rail" with an onPressed function that calls Navigator.pushNamed(conext, '/routeForNavigationRail') (You don't actually have to name the route that but it's just to explain what it does)
 
-:rocket: You should style these buttons so that they are easier to see for the user since the default background color is white.
 
-:mage: Inside the bottom navigation bar, you will want to do set up a scaffolding that will carry an IndexedStack to display the correct container. Below the body you will need to create a bottomNavigationBar that will hold a list of 3 items inside the items parameter.
 
-:battery: Inside the bottom navigation bar you will need to have a setState function inside the onTap parameter. You will want to update the private variable that keeps track of the index. 

-:bulb: Inside the navigation rail, you will want to have a similar structure that of the bottom navigation bar screen. You will want to have an indexedStack that holds a list of the containers that you will want to display.
 
-:books: The syntax is different for the navigation rail as it will need to have a destinations list instead of an items list and a onDestinationSelected parameter that is similar to the onTap in bottom Navigation bar.
 
-:label: Inside the destinations list you will want to create 3 destinations that correspond the containers that you will display on the screen next to it in the indexedStack.
 
-:unlock: In the onDestinationSelected parameter you will want to use the setState function to update the index like what we did with onTap in the bottom navigation bar
 
-✔️Lastly, make sure all the navigation features work and check the test cases before you submit a pull request.

---

Below is a video going over the process behind creating the solution to Multi-Navigation Stacked App!
<div align="center">

<a href="https://www.youtube.com/watch?v=b_sQ9bMltGU">
  <img src="https://img.youtube.com/vi/b_sQ9bMltGU/0.jpg" 
       alt="Tutorial Video" 
       width="240" 
       height="180" 
       border="10" />
</a>
</div>

---

<div align="left">
If you are stuck/confused by any of the steps click on the icon below to go to the slides which provide more detailed steps.
</div>

<div>
&nbsp;
</div>

<div align="left">
<a href="https://docs.google.com/presentation/d/1RpNfCpFAyltxYZmiZK_oPg7K6-4klazv8xU_ZNhX_Sk/edit?usp=sharing">
    <img src="https://img.shields.io/badge/Slides-yellow?style=for-the-badge&logo=google drive&logoColor=white" alt="Google Drive Badge"/>
    
</div>

---

 

<div align="center">
 <img src="https://media.giphy.com/media/13HgwGsXF0aiGY/giphy.gif" width="200"/>
</div>


