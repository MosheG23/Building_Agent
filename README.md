# Building_Agent

The problem that the agent will try to solve is to build houses under all the restriction. He will also need to know to solve problem if certain type of house or rooms need to build. To get the material, he will have to buy them from 4 different shops, which each provide other materiel. <br>

The project was written in Vscode using PDDL extension. You can read the project book (PDF file) which explain the problem, agent etc.

## Defining The Problem
The problem that the agent will try to solve is to build houses under all the restriction. He will also need to know to solve problem if certain type of house or rooms need to build. To get the material, he will have to buy them from 4 different shops, which each provide other materiel.

### Types of shops

We have 4 different shops in the planner, in each you can buy different material:
|  Martial you can buy |         |           |           |            |            |           |           |           |           |           |           |            |           |            |           |           |
|------------------|----------------------------|-----------|-----------|------------|------------|-----------|-----------|-----------|-----------|-----------|-----------|------------|-----------|------------|-----------|-----------|
|     Shop Name    |     Br                     |     Fl    |     Wi    |     Bal    |     Cab    |     Fe    |     Cl    |     Be    |     Co    |     La    |     To    |     Bat    |     TV    |     Car    |     Pl    |     La    |
|     Workshop     |     V                      |     V     |     V     |     V      |     V      |     V     |           |           |           |           |           |            |           |            |           |           |
|     Ikea         |                            |           |           |            |            |           |     V     |     V     |     V     |     V     |     V     |     V      |           |            |           |           |
|     Walmart      |                            |           |           |            |            |           |           |           |           |           |           |            |     V     |     V      |           |           |
|     Nursery      |                            |           |           |            |            |           |           |           |           |           |           |            |           |            |     V     |     V     |

### House Fundamental

|     Martial you can buy    |           |           |           |            |            |           |           |           |           |           |           |            |           |            |           |           |
|----------------------------|-----------|-----------|-----------|------------|------------|-----------|-----------|-----------|-----------|-----------|-----------|------------|-----------|------------|-----------|-----------|
|     Shop Name              |     Br    |     Fl    |     Wi    |     Bal    |     Cab    |     Fe    |     Cl    |     Be    |     Co    |     La    |     To    |     Bat    |     TV    |     Car    |     Pl    |     La    |
|     Walls                  |     V     |           |           |            |            |           |           |           |           |           |           |            |           |            |           |           |
|     Floor                  |     V     |     V     |           |            |            |           |           |           |           |           |           |            |           |            |           |           |
|     Window                 |           |           |     V     |            |            |           |           |           |           |           |           |            |           |            |           |           |
|     Ceiling                |     V     |           |           |            |            |           |           |           |           |           |           |            |           |            |           |           |

### Type of Houses
There are 3 types of houses – <br>
•	“Regular” house<br>
•	Garden house, which has a garden that contain lawn & plants<br>
•	Penthouse, which must have all rooms type (bath, living and bed) and a balcony<br>

## The Domain
Here we define the objects, predicates and actions

### Initial Requirements

The planner will use ADL, “:adl” is a super requirement which adds the following requirements:<br>
•	STRIPS - Allows the usage of basic add and delete effects as specified in STRIPS. e.g.<br>
•	Typing - Allows the usage of typing for objects. Typing is similar to classes and sub-classes in Object-Oriented Programming<br>
•	Disjunctive Preconditions - Allows the usage of or in goals and preconditions<br>
•	Negative Preconditions - Allows the usage of not in goals and preconditions (which is missing in STRIPS)<br>
This requirement also adds equality, quantified-preconditions and condition-effects which we will not use.<br>

#### Objects
The objects in the plan can be split to 4 main objects – person, location, house and material.<br>
•	material house person - object<br>
•	bricks floortile cables windows balcony garden bathroomM bedroomM livingroomM - material<br>
•	plants fence lawn - garden<br>
•	bath toilet carpet - bathroomM<br>
•	lamp bed closet - bedroomM<br>
•	tv couch lamp - livingroomM<br>
•	site

#### Predicates
Predicates apply to a specific type of object, or to all objects. Predicates are either true or false at any point in a plan and when not declared are assumed to be false (except when the Open World Assumption is included as a requirement).<br>
The "meaning" of a predicate, in the sense of for what combinations of arguments it can be true and its relationship to other predicates, is determined by the effects that actions in the domain can have on the predicate, and by what instances of the predicate are listed as true in the initial state of the problem definition.

## Planner Implementation
This part will cover the implementation of the Domain and Problems using PDDL (Planning Domain Definition Language) which was inspired by STRIPS and ADL, also a brief explanation of the source code involving the Planning.Domains API (introduced in 1.2.6) using VSCode as I mention earlier.<br>
Planning.Domains is the definitive home of Artificial Intelligence Planning. The site features a wide variety of tools and resources to help you with AI Planning. Included in its toolset is a Planning as a Service (PaaS) API. An online editor for writing and testing domains and problem files.<br>
To show the problem and possible solution I will show problem file and the output from Planning.Domains.
### Problems

|                               |     Nodes   generated during search    |     Nodes expanded   during search    |     Plan found   with cost    |     Time      |
|-------------------------------|----------------------------------------|---------------------------------------|-------------------------------|---------------|
|     One Person, 2   Houses    |     404                                |     42                                |     41                        |     0.826     |
|     One Person, 4   Houses    |     20883                              |     1641                              |     125                       |     6.089     |
|     Two Person, 4   Houses    |     43734                              |     1898                              |     114                       |     3.686     |
|     Two Person, 5   Houses    |     90635                              |     2972                              |     138                       |     6.265     |
|     Two Person, 7   Houses    |                                        |                                       |                               |     10.722    |

#### Time 
We can see the difference how much time does the planner takes to plan with one person to two people, almost half the time for the same type and number of houses.<br>
We reached the limit for the planner when we tried to plan 7 houses with 2 people.

#### Plan
We have always 1 or 0 plans, that because of the heuristic of the plan. The solution is linear, which means there is always one plan to solve the problem  - There is only one way build a house based on the planner.

## Bibliography 
1.	PDDL Planning Wiki - https://planning.wiki/ <br>
2.	Artificial Intelligence: A Modern Approach (3rd Edition), Chapter 3-11 - http://aima.cs.berkeley.edu/ <br>
3.	Artificial Intelligence: Foundations of Computational Agents,  2nd Edition - https://artint.info/2e/html/ArtInt2e.html <br>
