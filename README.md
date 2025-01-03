# Journal_app


## Getting Started


### Tools / Architecture
- Clean Architecture with TDD (Test Driven Design) approach
- Bloc/Cubit - State Management
- Database - Hive
- Dependency injection - get_it
- analysis package - very_good_analysis
- Test - flutter_test, bloc_test, mocktail
- Animations - lottie
- Chart - syncfusion_flutter_charts
- feature based folder structure over project based approach


## Features 

- Splash Screen: with lottie animations.
- OnBoarding: 
  - Using Pageview with 3 visually engaging screens 
  - Fetches motivation from API and display in third slide
  - Full test coverage
- Journal:
    - Get and display Motivational message from API.
    - Get and display User steps from API
    - Save/View/Delete journals (Thoughts, mood and date);
- Visualization Dashboard:
  - Displays last 7 journals in a chart
  - Displays most positive entry
  - Displays total steps fetched from API
  

## Setup Instructions
1. Clone the Repository


    git clone https://github.com/jogapps/clean_architecture_journal_app
    cd clean_architecture_journal_app


2. Install Packages


    flutter pub get
    flutter pub run build_runner build


3. Start/Run Project


    run from android studio/visual studio code
    or use below command
    flutter run

<br/>
<img src="https://jogapps-public-assets.s3.eu-west-2.amazonaws.com/github/splash.png" alt="Splash Screen" width="200" height="400">

![OnBoarding Screen](https://jogapps-public-assets.s3.eu-west-2.amazonaws.com/github/onboarding.png)
<p>

<img src="https://jogapps-public-assets.s3.eu-west-2.amazonaws.com/github/journal.png" alt="Journal Screen" width="200" height="400">
<p>
<img src="https://jogapps-public-assets.s3.eu-west-2.amazonaws.com/github/chart.png" alt="Chart Screen" width="200" height="400">


