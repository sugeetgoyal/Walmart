# NASAPicOfTheDay

This is a single page application where 
1) User see NASA pic/video of the day in the home screen with title and its details based on date. 
2) User can watch the videos as well if there is a video available.

Below are the instructions to run the app -

- Clone this project
- Do Pod Update
- There is an API key located in BaseNetworkManager line number 12 under enum APIURL, you can replace with your key.
- Run the app in xcode simulator

****Important****
- If there is "multiple commands issue" while running, please use Legacy Build Systems from File -> Workspace Settings

****Improvements Areas****
- We can add Rechability Manager to manager network connection in a better way.
- We can add Error screen with Retry button, currently we are using Alert View to display the error messages.
- UnitTestCase should be written.
- 1&4 Acceptance criteria looks same, so need to understand and do the improvement if required.
