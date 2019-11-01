# The Programtic Programmer reading notes

## Preface

## My understanding, mind mapping

most VIP word:

1. keep it simple stupid
2. decouple
3. make it small, grow it often(refactor, requirement changing, against software rot)

##  Chapter 1. A Pragmatic Philosophy

### Task Responsibility

make decision for a good reason

### Software Entropy

software is delicate soon, fix "broken windows"(bad designs, wrong decisions, or poor code) as soon as it is discovered. perople always think no one cares about "broken windows"

### Stone Soup and Boiled Frogs

talking about changing before you actually did it would met with 'budgets and delay'

change it then show it to others is best way.

remember the big picture , and constantly review what's happening around, not just what you personally doing.

### Good-Enough Software

The scope and quality of software you produce should be specified as requirements.

### Your Knowledge Portfolio

Your knowledge declines. Manage it .

Just keep learning.

Critical thinking, critically analyze what you hear and read

### Communicate !

Plan what you want say, prepare outline.

Choose moment you talk and style you talk.

Give back to people's message.

## A Pragmatic Approach

### The Evils of Duplication

Don't Repeat Yourself

### Orthogonality

Two or more things are orthogonal if changes in one do not affect any of the others

Gain Productivity: 1. Changes are localized,2 promotes reuse. 3. easy to combine

Reduce Risk:

orthogonal for 1. teams 2. design 3. coding 4. library 5. testing

### Reversibility

There are no final descisions

flexible architecture

### Tracer Bullets 

??? can't understand 

Tracer code is something like regression test?

Or some mock-system, not full functional but behavior like full functional?

### Prototypes and Post-it Notes

minimal prototype, and let it grow

how to build a prototype? what to focus ? what to overlook?

### Domain Languages

choose suitable language for your problem.

### Estimating

estimating work plan

estimating system design

## Chapter 3 The Basic Tools

### The  power of Plain Text

Human-readable

every tool in the computing universe can operate with plain text

### Shell Games

Use the Power of Command Shells

### Power Editing

use vim !! haha

Use a Single Editor Well, for better Productivity

### Source Code Control, 

just use git, this topic is old-fashion

### Debugging

calm down

Debugging Strategies:
1. draw diagram
2. tracing
3. Corrupt Variables? Check Their Neighborhood
4. explaining the problem to another person
5. Don't Assume It—Prove It

### Text Manipulation


### Code Generators

Write Code That Writes Code

## Chapter 4. Pragmatic Paranoia

You Can't Write Perfect Software

### Design by Contract

focus on interface of code

Assertions

### Dead Programs Tell No Lies

Crash Early 

### Assertive Programming

check arguments

If It Can't Happen, Use Assertions to Ensure That It Won't

### When to Use Exceptions

Use Exceptions for Exceptional Problemsskip this, old topic

### How to Balance Resources

routine or object that allocates a resource should be responsible for deallocating it

### Balancing and Exceptions

Languages that support exceptions can make resource deallocation tricky


## Chapter 5. Bend or Break

how to make reversible decisions, so your code can stay flexible and adaptable in the face of an uncertain world

### Decoupling and the Law of Demeter

### Metaprogramming

Configure, Don't Integrate

Put Abstractions in Code Details in Metadata

### Temporal Coupling

Analyze Workflow to Improve Concurrency

Always Design for Concurrency

### It's Just a View

Model-View-Controller

## Chapter 6. While You Are Coding

### Programming by Coincidence

Don't Program by Coincidence

Program Deliberately:
1. understand what you build
2. plan
3. Rely only on reliable things.
4. Document your assumptions. Design by Contract
5. Don't just test your code, but test your assumptions as well.
6. Spend time on the important aspects
7. Don't be a slave to history. Don't let existing code dictate future code

### Algorithm Speed

The O() Notation

### Refactoring

When Should You Refactor
1. Duplication.
2. Nonorthogonal design.
3. Outdated knowledge.
4. Performance.

Refactor Early, Refactor Often
have good tests before you begin refactoring

### Code That's Easy to Test

Unit Testing

Design to Test

### Evil Wizards

Don't Use Wizard Code You Don't Understand

## Chapter 7. Before the Project

### The Requirements Pit

Don't Gather Requirements—Dig for Them

Work with a User to Think Like a User

Abstractions Live Longer than Details

### Solving Impossible Puzzles

Sometimes you will find yourself working on a problem that seems much harder than you thought it should be. Maybe it feels like
you're going down the wrong path—that there must be an easier way than this!

### Not Until You're Ready

### The Specification Trap

### Circles and Arrows

## Chapter 8. Pragmatic Projects

### Pragmatic Teams

### Ubiquitous Automation

### Ruthless Testing

### It's All Writing

Treat English as Just Another Programming Language

Build Documentation In, Don't Bolt It On

### Great Expectations

### Pride and Prejudice