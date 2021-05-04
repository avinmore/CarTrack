# CarTrack Application

For testing purposes please use below credentials. 

User name: "car@test.com"

Password: "cartrack"

This app has a simple login page with a nice CarTrack header and a basic animation.
Login has some basic validations on user credenatials and selected country. 
Login needs a valid email and a password with minimum 6 characters long and a country selected from the list of countries.
On Login failure app shows an error alert which user can dismiss and try again.
App internally pre-saving a user credentials in core data and using it for login validation.
After successful login app is fetching list of user from an API and showing in a list form.
This list shows balis information of a user like name, email and other contact details.
Contact details involves Geo location which app is showing on iOS given Apple map with annoations.

I have tried to make this assignment as simple as possible keeping SOLID principle in mind, hence used MVVM architecture.
Also added unit tests for every possible function of view models.

Screenshots:
<img width="563" alt="2" src="https://user-images.githubusercontent.com/3774232/117022575-ef4d8a00-ad2a-11eb-8d9a-b93028fa1bc9.png">
<img width="563" alt="1" src="https://user-images.githubusercontent.com/3774232/117022531-e65cb880-ad2a-11eb-85c6-25ea92e592b1.png">
<img width="563" alt="3" src="https://user-images.githubusercontent.com/3774232/117022633-f7a5c500-ad2a-11eb-8612-01c80fd5a662.png">
<img width="563" alt="4" src="https://user-images.githubusercontent.com/3774232/117022672-fffe0000-ad2a-11eb-9ecc-653bb27d60b3.png">

Thank you!

