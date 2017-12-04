## Test CS


Test CS is a demo app which presents the credit score of an individual given in https://s3.amazonaws.com/cdn.clearscore.com/native/interview_tes
t/creditReportInfo.json

### Getting started

Xcode 9 is needed to build and run the apps. The projects is built against iOS 11, targeting iOS 11.1 and uses Swift 4.


Architecture

1. Design pattern: I will implement MVVM (Model View View Model) to make more scalable and testable the app in a future.
2. I have implemented a data manager which handles generic types, making easier the implementation of other API calls.
2. Third party libraries
No third party libraries where used for this small app.


Further recommended developments
If I would have had more time I would have implemented this:
- For caching data we could use third party libraries like Realm.
- Dependency injection is a very good option to implement with this structure.
