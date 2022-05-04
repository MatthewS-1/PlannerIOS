# PlannerIOS
Planner app created using Storyboard and Core Data.
Here's a demo of what it can do

<img width="389" alt="Picture of app in home screen" src="https://user-images.githubusercontent.com/74331273/166742299-b89c504f-5b1d-4ebd-bb03-0b6b723553bf.png">
<video src="https://user-images.githubusercontent.com/74331273/166742790-04c15e19-d1ea-4230-b3c1-4a3f3d5f0d8e.mov"></video>

The app is split into two parts, a planner section and an analytics section. The planner section is a UITableView that supports adding, editing, and removing tasks using popups.
All tasks are saved into Core Data and will reappear if the app is closed and reopened. After completing the planner, the user can click the "Finished Planner" button, which saves the tasks under a planner that is created by the name the user enters. If the user doesn't enter a name, it will be defaulted to "planner " + number of planners.
In the analytics section, there is a combined chart that allows the user to click on a bar in the combined chart to preview a previous planner. If there are no previous planners, there will just be a message informing the user in place of the chart. The app only saves the last 15 planners with the most tasks to avoid too much storage.


