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
|     Main Purpose    |     Predicate (Parameters)              |
|---------------------|-----------------------------------------|
|     Build House     |     walls-build (?h – house)            |
|                     |     windows-fitted (?h - house)         |
|                     |     floor-built (?h - house)            |
|                     |     ceiling-built (?h - house)          |
|                     |     have-fundamental (?h - house)       |
|                     |     have-balcony (?h – house)           |
|                     |     house-build (?h - house)            |
|     Material        |     have (?p - person ?m - material)    |
|     Garden          |     have-plants (?h - house)            |
|                     |     have-fence (?h - house)             |
|                     |     have-lawn (?h - house)              |
|                     |     have-garden (?h - house)            |
|     Site            |     foundations-set (?s - site)         |
|                     |     build-building (?s - site)          |
|                     |     finish-building (?s - site)         |
|                     |     cable-building (?s - site)          |
|     Location        |     at-workshop (?p - person)           |
|                     |     at-wallmart (?p - person)           |
|                     |     at-site (?p - person)               |
|                     |     at-ikea (?p - person)               |
|                     |     at-nursery (?p - person)            |
|     Rooms           |     have-living-room (?h - house)       |
|                     |     have-bath-room (?h - house)         |
|                     |     have-bed-room (?h - house)          |
|                     |     have-rooms (?h - house)             |
|     House Type      |     is-garden-house (?h - house)        |
|                     |     is-penthouse (?h - house)           |
|                     |     is-regular-house (?h - house)       |
|     Location        |     at-workshop (?p - person)           |
|                     |     at-wallmart (?p - person)           |
|                     |     at-site (?p - person)               |
|                     |     at-ikea (?p - person)               |
|                     |     at-nursery (?p - person)            |

#### Actions
An action defines a transformation the state of the world. This transformation is typically an action which could be performed in the execution of the plan, such as picking up an object, constructing something or some other change.
##### Go to locations
Each location has different actions – <br>
•	Go-to-workshop<br>
•	Go-to-IKEA<br>
•	Go-to-Wallmart<br>
•	Go-to-Nursery<br>
<small>I didn’t had object for locations because there were to many objects for the planner, so I decided to minimize the locations types to predicates</small>
##### Buy Material
In each shop you can buy different material (2.2.1), these actions are critical for the planner, without the material  the fundamentals in the houses cannot be build. One of the goals of the planner is to minimize the amount of times we buy the material. The actions are:<br>
•	Buy-material-workshop<br>
•	Buy-material -IKEA<br>
•	Buy-material -Wallmart<br>
•	Buy-material -Nursery
##### Build House Fundamental
To show the best way the actions to build a house is with a pyramid. <br>
To check the house, have the foundations we have the action Check-House-Fundamental:<br>
Parameters - ?s -site ?h - house ?p - person<br>
Preconditions:<br>
(at-site ?p) ∩ (foundations-set ?s) ∩ (walls-built ?h) ∩ (windows-fitted ?h) ∩ (floor-built ?h) ∩ (ceiling-built ?h)<br>
:heavy_check_mark:	The person needs to be in the site to check the house<br>
:heavy_check_mark:	The site needs to have foundations set<br>
:heavy_check_mark:	The house has to have – walls, windows, floor and ceiling<br>
Effect - (have-fundamental ?h)
##### Rooms
There are 3 types of different rooms – Bedroom, living room and bath room.<br>
•	BUILD-BED-ROOM<br>
Parameters - ?s - site ?h - house ?p - person ?la - lamp ?be - bed ?cl – closet<br>
Precondition:<br>
(at-site ?p) ∩ (foundations-set ?s) ∩ (have-fundamental ?h) ∩ (have ?p ?la) ∩ (have ?p ?be) ∩ (have ?p ?cl)<br>
:heavy_check_mark:	The person needs to be in the site to build the bed room<br>
:heavy_check_mark:	The site needs to have foundations set<br>
:heavy_check_mark:	The house has to have – walls, windows, floor and ceiling (fundamental)<br>
:heavy_check_mark:	The person has to have the room material – lamp, bed and closet<br>
 Effect: <br>
 (have-bed-room ?h) ∩(not (have ?p ?la)) ∩ (not (have ?p ?be)) ∩ (not (have ?p ?cl))<br>
•	BUILD-LIVING-ROOM<br>
Parameters - ?s - site ?h - house ?p - person ?la - lamp ?tv - tv ?co - couch<br>
Precondition:             <br>
(at-site ?p) ∩ (foundations-set ?s) ∩ (have-fundamental ?h) ∩ (have ?p ?la) ∩ (have ?p ?tv) ∩ (have ?p ?co)<br>
:heavy_check_mark:	The person needs to be in the site to build the living room<br>
:heavy_check_mark:	The site needs to have foundations set<br>
:heavy_check_mark:	The house has to have – walls, windows, floor and ceiling (fundamental)<br>
:heavy_check_mark:	The person has to have the room material – lamp, tv and couch<br>
Effect :            <br>
(have-living-room ?h) ∩ (not (have ?p ?la)) ∩ (not (have ?p ?tv)) ∩ (not (have ?p ?co))<br>
•	BUILD-BATH-ROOM
Parameters - ?s - site ?h - house ?p - person ?ba - bath ?to - toilet ?ca - carpet<br>
Precondition:             <br>
(at-site ?p) ∩ (foundations-set ?s) ∩ (have-fundamental ?h) ∩ (have ?p ?ba) ∩ (have ?p ?to) ∩ (have ?p ?ca)<br>
:heavy_check_mark:	The person needs to be in the site to build the bath room<br>
:heavy_check_mark:	The site needs to have foundations set<br>
:heavy_check_mark:	The house has to have – walls, windows, floor and ceiling (fundamental)<br>
:heavy_check_mark:	The person has to have the room material – bath, toilet and carpet<br>
Effect :            <br>
(have-bath-room ?h) ∩ (not (have ?p ?ba)) ∩  (not (have ?p ?to)) ∩ (not (have ?p ?ca))<br>
##### Rooms Type
•	BUILD-ROOMS-TYPE-A<br>
Parameters - ?s - site ?h - house<br>
Precondition:             <br>
(have-balcony ?h) ∩ (have-bath-room ?h) ∩ (have-bed-room ?h)<br>
:heavy_check_mark:	The house has to have a balcony, bath room and bed room<br>
Effect :            <br>
(have-rooms ?h)<br>
•	BUILD-ROOMS-TYPE-B<br>
Parameters - ?s - site ?h - house<br>
Precondition:             <br>
(have- living-room ?h) ∩ (have-bath-room ?h) <br>
:heavy_check_mark:	The house has to have a living room and bath room<br>
Effect :            <br>
(have-rooms ?h)<br>
•	BUILD-ROOMS-TYPE-C<br>
Parameters - ?s - site ?h - house<br>
Precondition:             <br>
(have- bed-room ?h) ∩ (have-bath-room ?h) <br>
:heavy_check_mark:	The house has to have a bed room and bath room<br>
Effect :        <br>    
(have-rooms ?h)
##### Garden
•	PLANT-PLANTS<br>
Parameters - ?s - site ?h - house ?p - person ?pl – plants<br>
Precondition:<br>
(have ?p ?pl) ∩ (at-site ?p) ∩ (foundations-set ?s) ∩ (have-lawn ?h) ∩ (not (have-plants ?h))<br>
:heavy_check_mark:	The person needs to be in the site to plant the plants<br>
:heavy_check_mark:	The site needs to have foundations set<br>
:heavy_check_mark:	The house has to have a lawn<br>
:heavy_check_mark:	The person has to have the plants<br>
:x:	The house doesn’t have plants<br>
 Effect: <br>
 (have-plants ?h) ∩ (not (have ?p ?pl))<br>
•	BUILD-FENCE<br>
Parameters - ?s - site ?h - house ?p - person ?fe - fence<br>
Precondition:<br>
(have ?p ?fe) ∩ (at-site ?p) ∩ (foundations-set ?s) ∩ (not (have-fence ?h))<br>
:heavy_check_mark:	The person needs to be in the site to build the fence<br>
:heavy_check_mark:	The site needs to have foundations set<br>
:heavy_check_mark:	The person has to have the fence<br>
:x:	The house doesn’t have a fence<br>
 Effect: <br>
(have-fence ?h) ∩ (not (have ?p ?fe))<br>
•	BUILD-LAWN<br>
Parameters - ?s - site ?h - house ?p - person ?l - lawn<br>
Precondition:<br>
(have ?p ?l) ∩ (at-site ?p) ∩ (foundations-set ?s) ∩ (not (have-lawn ?h))<br>
:heavy_check_mark:	The person needs to be in the site to build lawn to the house<br>
:heavy_check_mark:	The site needs to have foundations set<br>
:heavy_check_mark:	The person has to have the lawn<br>
:x:	The house doesn’t have a lawn<br>
 Effect: <br>
(have-fence ?h) ∩ (not (have ?p ?l))<br>
•	BUILD- GARDEN<br>
Parameters - ?h - house ?pl - plants ?l - lawn ?f - fence ?p - person<br>
Precondition:<br>
(at-site ?p) ∩ (have-fence ?h) ∩ (have-lawn ?h) ∩ (have-plants ?h) ∩ (not (have-garden ?h))<br>
:heavy_check_mark:	The person needs to be in the site to build the garden<br>
:heavy_check_mark:	The house has to have – fence, lawn and plants<br>
:x:	The house doesn’t have a garden<br>
 Effect: <br>
(have-garden ?h)
##### Penthouse
•	BUILD- PENTHOUSE<br>
Parameters - ?s - site ?h - house ?p - person<br>
Precondition:<br>
(at-site ?p) ∩ (house-build ?h) ∩ (have-balcony ?h) ∩ (have-bath-room ?h) ∩ (have-bed-room ?h) ∩ (have-living-room ?h) ∩ (not (is-garden-house ?h)) ∩ (not (is-regular-house ?h))<br>
:heavy_check_mark:	The person needs to be in the site to check if the house is a penthouse<br>
:heavy_check_mark:	The house has to have – house foundations, balcony, bath room, bed room and living room<br>
:x:	The house isn’t a garden house or regular house already<br>
 Effect: <br>
(is-penthouse ?h) ∩ (finish-building ?s)<br>
##### Site
•	SET-FOUNDATIONS<br>
Parameters - ?s - site ?p - person<br>
Precondition:<br>
(at-site ?p)<br>
:heavy_check_mark:	The person needs to be in the site in order to set the foundations  <br>
Effect: <br>
(foundations-set ?s)<br>
•	CABLE-BUILDING<br>
Parameters - ?s - site ?p - person ?c - cables<br>
Precondition:<br>
(at-site ?p) ∩ (finish-building ?s) ∩ (have ?p ?c)<br>
:heavy_check_mark:	The person needs to be in the site to put cables around the building<br>
:heavy_check_mark:	All of the house in the building needs to be build<br>
:heavy_check_mark:	The person has to have cables<br>
Effect: <br>
(cable-building ?s) ∩ (not (have ?p ?c))<br>
•	BUILD-BUILDING<br>
Parameters - ?s - site ?h1 - house ?h2 - house ?h3 - house ?h4 – house ?p - person<br>
Precondition:<br>
(at-site ?p) ∩ (is-garden-house ?h1) ∩ (is-penthouse ?h2) ∩ (is-regular-house ?h3)<br>
:heavy_check_mark:	The person needs to be in the site to check the building<br>
:heavy_check_mark:	The house has to have three houses with 3 different types <br>
Effect: <br>
(have-building ?s)<br>

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
