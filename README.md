# UnderstandFluxiOSProject

Learning and practicing Flux with iOS

## Resources used

https://medium.com/swlh/the-case-for-flux-379b7d1982c6

## Notes
You need flux if..
- If you want to see immediate UI changes in your app
- If different parts of your app use the same shared data (for exemple user profile)
- If you want to cache data in memory, but this data can change while cached (What if the user changes an item while on the detail page, and then goes back?)
- The very point of Flux is to make data changes easy to reason about
You may not need Flux if:
- You don’t want to see immediate UI changes in your app (for exemple it can wait until the next refresh )
Why?
- It’s used on some Eureka products ( Pairs X, Pairs global? ), so it will allows us to be better at understanding Eureka core code bases
- Some new ideas of pattern for future project

Existing observing patterns may not be a good fit depending on the project because: 

  - Delegate pattern is a 1 to 1 communication pattern
  - KVO or Notification create invisibles dependencies. In a large code base, it may create unexpected side effects since everyone can triggers notifications from everywhere..   

![](https://cdn-images-1.medium.com/max/1600/1*BtKHcOU1os5CbasqrMECbw.png)

![](http://blog.benjamin-encz.de/post/real-world-flux-ios/Flux_Original.png)

## Goal?

Understand by practicing 

## How?
- We think about a project with a lot of data changes ( RxSwift, Network or database, I don’t know )
- We start together designing the application architecture without using Flux ideas/design pattern
- We find the problems
- We start doing Pair coding ( 15 minutes me / 15 minutes you etc.. ) implementing Flux principle to resolve. those problems

Let’s define a simple application like:

- Theme: Personal Music app
- We can create artists and musics, and link both
- Screen: Music list, artist list, musicmusic edit, artist edit, etc.

If we change the data of artist ->> Music details. UI need to be updated as well
If we change music informations ( create, delete ), we need to change artist informations etc..
So maybe it’s an interesting project because there are a lot of data changes, which is maybe good for Flux
